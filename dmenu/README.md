# Czaplicki's dmenu

My "rice" of dmenu.

![demo image](demo.png?raw=true)

### Alterations
center patch

linehight path

scroll patch

vertfull patch (custom)

password patch (custom)

dimming patch (custom)

new default config

### Requirements
In order to build dmenu you need the Xlib header files.

### Installation
Clone the repository.
```
git clone https://github.com/Czaplicki/dmenu.git
```
Edit config.mk to match your local setup.

(dmenu is installed into the /usr/local namespace by default).

Afterwards enter the following command to build and install dmenu.
```
sudo make clean install
```

### Running dmenu
See the man page for details.
