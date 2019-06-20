;; +---------+------------------------+
;; | Author  | Maiste <dev@maiste.fr> |
;; +---------+------------------------+
;; | Version | 20230116               |
;; +---------+------------------------+

;; === Packages ===

;; Repositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Package mode
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Prepare use-package for non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Init use package
(require 'use-package)
(setq use-package-always-ensure t) ; Treat every package with use package as :ensure is set



;; === Keep emacs clean ===

(use-package no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))) ; Save auto-save in ~/.emacs.d/var/auto-save
(setq custom-file (no-littering-expand-etc-file-name "custom.el")) ; Custom setting save in ~/.emacs.d/etc/custom.el
(setq create-lockfiles nil) ; Disable lockfile e.g .#something


;; === Variables ===

(setq inhibit-startup-message t) ; Disable startup message
(scroll-bar-mode -1) ; Disable scroll bar
(menu-bar-mode -1)   ; Disable menu bar
(tool-bar-mode -1)   ; Disable tool bar
(tooltip-mode -1)    ; Disable tooltip 
(setq visible-bell t) ; Set the bell to visible

(column-number-mode) ; Add line number mode
(global-display-line-numbers-mode t) ; Show line number

(setq mouse-wheel-progressive-speed nil) ; Constant progression for mouse wheel

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Use escape to exit the prompt
(global-auto-revert-mode t) ; Auto reload files
(defalias 'yes-or-no-p 'y-or-n-p) ; Smaller message for validation

(set-language-environment "utf-8") ; Fix the text as utf-8

;; Deactivate keys for various mode
(dolist (mode '(org-mode-hook
								term-mode-hook
								eshell-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode 0))))


;; === Default values ===

(setq-default tab-width 2) ; Default tab width


; === Basic ===

(electric-pair-mode t)

;; === Per package specs ===

;; Ivy mode
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

(use-package ivy-rich
  :after counsel
  :init (ivy-rich-mode 1))


;; Counsel
(use-package counsel
	:diminish
  :config (counsel-mode 1))

;; Rainbow mode
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Which key is used
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; Helpful package
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; General package aka leader key
(use-package general
	:after evil
  :config
  (general-evil-setup t)
  (general-create-definer maiste/leader-key
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "C-SPC")

  (maiste/leader-key
    "tt" '(custom/toggle-theme :which-key "toggle theme")

    "bl" '(counsel-switch-buffer :which-key "list buffers")
    "bn" '(next-buffer :which-key "next buffer")
    "bp" '(previous-buffer :which-key "previous buffer")

    "ci" '(evilnc-comment-or-uncomment-lines :which-key "invert comments")))

;; Evil mode

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-tree)
  :config
	(evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
	(define-key evil-visual-state-map (kbd "TAB") 'indent-for-tab-command)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line) ; Visual motion line outside of visual-line-mode
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line) ; Same
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Evil-mode keybindings collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Escape with the jk sequence
(use-package evil-escape
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2)
  :config
  (evil-escape-mode 1))

;; Nerd commenter mode
(use-package evil-nerd-commenter)

;; Vim surround like mode
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


;; *** Setup undo system for evil ***
(use-package undo-tree
  :init
  (global-undo-tree-mode 1))

;; Hydra
(use-package hydra)

;; Change text size
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "increase")
  ("k" text-scale-decrease "decrease")
  ("f" nil "finished" :exit t))

;; Register to general
(maiste/leader-key
  "st" '(hydra-text-scale/body :which-key "scale text"))

;; Projectile
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

(maiste/leader-key
  "p" '(projectile-command-map :which-key "projectile"))

;; *** Use counsel in projectile ***
(use-package counsel-projectile
  :config (counsel-projectile-mode))


;; Magit mode
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Add to magit call to general
(maiste/leader-key
  "g"  '(:ignore t :which-key "git")
  "gs" '(magit-status :which-key "magit status")
	"gb" 'magit-branch
  "gl"   '(:ignore t :which-key "log")
	"glc" 'magit-log-current
  "glf" 'magit-log-buffer-file)

;; Forge TODO, require more setup here: https://magit.vc/manual/forge/Getting-Started.html
;; (use-package forge)


;; === ORG Mode ===
(defun maiste/org-mode-setup ()
	(org-indent-mode)
	(visual-line-mode 1)
	(setq evil-auto-indent nil))

(use-package org
  :defer t
  :hook (org-mode . maiste/org-mode-setup)
	:config
	(setq org-ellipsis " ▾"                    ; Show a symbole on ellipsis
				org-hide-emphasis-markers t           ; Remove markers in org mode
				org-agenda-start-with-log-mode t      ; Give a resume on org-agenda
				org-log-done 'time                    ; Add the time when was done
				org-log-into-drawer t                 ; Make the resume log foldable
				org-agenda-files '("~/tmp/OrgFiles/Tasks.org")
				org-todo-keywords '((sequence "TODO(t)" "WORKING(w)" "|" "DONE(d!)"))))

;; === Theme ===

;; Define Theme
(defvar custom-light-theme 'doom-nord-light)
(defvar custom-dark-theme 'doom-nord)
(set-face-attribute 'default nil :font "Fira Code") ; Use Fira Code font


(use-package doom-themes)

(load-theme custom-dark-theme t) ; By default, load dark mode

(defun custom/toggle-theme ()
  "Toggle between light and dark theme"
  (interactive)
  (if (custom-theme-enabled-p custom-dark-theme)
      (progn
				(disable-theme custom-dark-theme)
				(load-theme custom-light-theme t))
		(disable-theme custom-light-theme)
		(load-theme custom-dark-theme t)))

(use-package all-the-icons)

(use-package doom-modeline
	:ensure t
	:init (doom-modeline-mode 1)
	:custom
	(doom-modeline-height 20)
	(doom-modeline-lsp t)
	(doom-mode-line-minor-modes t)
	(doom-mode-line-buffer-file-name-style 'truncate-except-projectyy))
