;; ***************************
;; *   Emacs main config     *
;; * Étienne "maiste" Marais *
;; *    Version 20211021     *
;; ***************************



;; ************
;; * Packages *
;; ************

;; *** Package repos ***

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; *** Init package ***

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; *** Import use-package ***

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


 
;; **********
;; * Define *
;; **********

;; *** Variables ***

(set-language-environment "utf-8")

;; *** Paths ***

(use-package no-littering)

(setq custom-file (no-littering-expand-etc-file-name "custom.el"))
(setq make-backup-files nil)
(setq auto-save-file-name-tranforms
      `((".*", (no-littering-expand-var-file-name "auto-save/") t)))

(push "~/.emacs.d/lisp" load-path)


;; *** Theme ***

(defvar maiste-light-theme 'doom-gruvbox-light)
(defvar maiste-dark-theme 'doom-nord)



;; *********
;; * Basic *
;; *********

;; *** Easier confirmation ***

(fset 'yes-or-no-p 'y-or-n-p)

;; *** Auto reload files ***

(global-auto-revert-mode t)

;; *** Linear scroll ***

(setq mouse-wheel-progressive-speed nil)

;; *** Pair symbols ***

(electric-pair-mode t)




;; ******
;; * UX *
;; ******

;; *** Remove start screen ***

(setq inhibit-startup-message t)

;; *** Add visual bell ***

(setq visible-bell t)

;; *** Disable stuffs ***

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

;; *** Tweag stuff ***

(set-fringe-mode 0)
(column-number-mode)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)



;; ******
;; * UI *
;; ******

;; *** Better icons set ***

(use-package all-the-icons)

;; **** Load doom-emacs theme ***

(use-package doom-themes
  :config
  (setq doom-theme-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-visual-bell-config))

(load-theme maiste-dark-theme t)

(defun maiste-toggle-theme ()
  "Toggle between light and dark theme"
  (interactive)
  (if (custom-theme-enabled-p maiste-dark-theme)
      (progn
	(disable-theme maiste-dark-theme)
	(load-theme maiste-light-theme t)
	(progn
	  (disable-theme maiste-light-theme)
	  (load-theme maiste-dark-theme)))))

;; *** Add doom line ***

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 15)
  (doom-modeline-lsp t)
  (doom-mode-line-minor-modes t)
  (doom-mode-line-buffer-file-name-style 'truncate-except-project))


;; ***************
;; * Keybindings *
;; ***************

;; Escape on all

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
