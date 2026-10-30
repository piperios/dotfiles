# /// script
# dependencies = ["fonttools"]
# ///
"""Build "Iosevka Term NoBold": a family whose Bold faces carry Regular glyphs.

Terminals that render bold text with the font's Bold face then draw it at
regular weight. A real Bold face is required: without one, the renderer
synthesizes bold by thickening the Regular glyphs.

Usage: uv run iosevka-term-nobold.py [SOURCE_TTC] [OUT_DIR]
"""

import sys
from pathlib import Path

from fontTools.ttLib import TTCollection, TTFont

FAMILY = "Iosevka Term NoBold"
PS_FAMILY = "IosevkaTermNoBold"

# (source PostScript name, output style, is_bold)
FACES = [
    ("Iosevka-Term", "Regular", False),
    ("Iosevka-Term", "Bold", True),
    ("Iosevka-Term-Italic", "Italic", False),
    ("Iosevka-Term-Italic", "Bold Italic", True),
]

FS_SELECTION_BOLD = 1 << 5
FS_SELECTION_REGULAR = 1 << 6
MAC_STYLE_BOLD = 1 << 0


def find_face_indices(ttc_path, ps_names):
    """Map each PostScript name to the index of its first face in the collection."""
    collection = TTCollection(str(ttc_path), lazy=True)
    indices = {}
    for i, font in enumerate(collection.fonts):
        ps = font["name"].getDebugName(6)
        if ps in ps_names and ps not in indices:
            indices[ps] = i
    missing = set(ps_names) - indices.keys()
    if missing:
        sys.exit(f"error: faces not found in {ttc_path}: {sorted(missing)}")
    return indices


def set_names(font, style):
    ps_style = style.replace(" ", "")
    ps_name = f"{PS_FAMILY}-{ps_style}"
    # Legacy family (1) stays the same across all four faces so that apps group
    # them as one Regular/Bold/Italic/Bold Italic family.
    names = {
        1: FAMILY,
        2: style,
        3: ps_name,
        4: FAMILY if style == "Regular" else f"{FAMILY} {style}",
        6: ps_name,
        16: FAMILY,
        17: style,
        21: FAMILY,
        22: style,
    }
    table = font["name"]
    for name_id, value in names.items():
        table.removeNames(nameID=name_id)
        table.setName(value, name_id, 3, 1, 0x409)
        table.setName(value, name_id, 1, 0, 0)
    return ps_name


def mark_bold(font):
    os2 = font["OS/2"]
    os2.usWeightClass = 700
    os2.fsSelection = (os2.fsSelection | FS_SELECTION_BOLD) & ~FS_SELECTION_REGULAR
    font["head"].macStyle |= MAC_STYLE_BOLD


def build_faces(ttc_path, out_dir):
    indices = find_face_indices(ttc_path, {ps for ps, _, _ in FACES})
    out_dir.mkdir(parents=True, exist_ok=True)
    for source_ps, style, is_bold in FACES:
        font = TTFont(str(ttc_path), fontNumber=indices[source_ps])
        ps_name = set_names(font, style)
        if is_bold:
            mark_bold(font)
        out_path = out_dir / f"{ps_name}.ttf"
        font.save(str(out_path))
        print(f"wrote {out_path}  (from {source_ps}, face {indices[source_ps]})")


if __name__ == "__main__":
    ttc = Path(sys.argv[1] if len(sys.argv) > 1 else "~/Library/Fonts/Iosevka.ttc").expanduser()
    out = Path(sys.argv[2] if len(sys.argv) > 2 else "~/Library/Fonts").expanduser()
    build_faces(ttc, out)
