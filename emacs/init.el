(setq gc-cons-threshold 402653184
      gc-ocns-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1))

(add-hook 'emacs-statup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (custom_dark)))
 '(custom-safe-themes
   (quote
    ("2bae36470ecd21f43a12ebca13fb33f586231e9c8d8c2a09eda3597b48ee63aa" default)))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages (quote (haskell-mode))))
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq default-frame-alist
      '(
        (top . 50)
        (left . 100)
        (width . 195)
        (height . 55)
        (font . "Consolas-16")
       ))

(setq inhibit-startup-message t) 
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defun kill-curent-buffer ()
  "Kills current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

(require 'cc-mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-electric-flag nil)
(setq c-basic-offset 4)
