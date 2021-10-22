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
(setq create-lockfiles nil)
(setq custom-file (no-littering-expand-etc-file-name "custom.el"))
(setq make-backup-files nil)
(setq auto-save-file-name-tranforms
      `((".*", (no-littering-expand-var-file-name "auto-save/") t)))

(push "~/.emacs.d/config" load-path)


;; *** Theme ***

(defvar maiste-light-theme 'doom-solarized-light)
(defvar maiste-dark-theme 'doom-molokai)



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

;; *** Tab management ***

(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)
(setq-default indent-tabs-mode nil)

;; *** Remove trailing ***

(add-hook 'before-save-hook
          'delete-trailing-whitespace)



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

;; *** Unicode font ***

(use-package unicode-fonts)

;; *** Highlight matching braces

(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))



;; ***********************
;; * General Keybindings *
;; ***********************

;; *** Escape on all ***

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



;; *************
;; * Evil mode *
;; *************


;; *** Setup undo system for evil ***

(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

;; Setup evil ***

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1))

;; *** Setup escape key ***

(use-package evil-escape
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  :config
  (evil-escape-mode 1))

;; *** Use surround vim like ***

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; *** Evil collection of keybindings ***

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; *** Nerd commenter like for emacs ***

(use-package evil-nerd-commenter)



;; *******************
;; * Helper packages *
;; *******************

;; *** See help when using keys ***

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; Describe function
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))



;; ***************
;; * General key *
;; ***************

;; *** Map leader key on space ***

(use-package general
  :config
  (general-evil-setup t)
  (general-create-definer maiste/leader-key
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "C-SPC")

  (maiste/leader-key
    "tt" '(maiste-toggle-theme :which-key "toggle theme")

    "bl" '(counsel-switch-buffer :which-key "list buffers")
    "bn" '(next-buffer :which-key "next buffer")
    "bp" '(previous-buffer :which-key "previous buffer")

    "ci" '(evilnc-comment-or-uncomment-lines :which-key "invert comments")))



;; ************
;; * Ivy mode *
;; ************

;; *** Search with Ivy ***

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; *** Improve completion for ivy ***

(use-package ivy-rich
  :after counsel
  :init (ivy-rich-mode 1))

;; *** Find file with counsel ***

(use-package counsel
  :bind (:map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))



;; **********
;; *  HYDRA *
;; **********

;; *** Install hydra ***

(use-package hydra)

;; *** Define an hydra function ***

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "increase")
  ("k" text-scale-decrease "decrease")
  ("f" nil "finished" :exit t))

;; *** Add hydra to general ***

(maiste/leader-key
  "st" '(hydra-text-scale/body :which-key "scale text"))



;; ***************
;; * Easy moving *
;; ***************

;; *** Ace window for easier moving ***

(use-package ace-window
  :ensure ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-dispatch-always t))

;; *** Map to leader key ***

(maiste/leader-key
  "w" '(ace-window :which-key "wm"))



;; **************
;; * COMPLETION *
;; **************

;; *** Lsp mode ***

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

;; *** Treemacs with lsp integration ***

(use-package lsp-treemacs
  :after lsp)

;; *** Set F7 as open treemacs **

(global-set-key (kbd "<f7>") 'treemacs)

;; *** Use ivy in lsp searches ***

(use-package lsp-ivy)

;; *** Autocompletion for emacs ***

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.2)
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last)))



;; **************
;; * PROJECTILE *
;; **************

;; *** Install projectile ***

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Documents/")
    (setq projectile-project-search-path '(("~/Documents/" . 2))))
  (setq projectile-switch-project-action #'projectile-dired))

;; *** Bind leader key ***

(maiste/leader-key
  "p" '(projectile-command-map :which-key "projectile"))

;; *** Use counsel in projectile ***

(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; *** Use treemacs with projectile ***

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)


;; *********
; * MAGIT *
;; *********

;; The incredible magit package for git
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Add to magit call to general
(maiste/leader-key
  "gs" '(magit-status :which-key "magit status"))



;; *************
;; * Languages *
;; *************


;; *** OCaml ***

(require 'maiste-ocaml)

;; *** Markdown ***

(require 'maiste-md)
