;; ***************************
;; *  Default configuration  *
;; *     EMACS - 20210201    *
;; * Étienne (Maiste) Marais *
;; ***************************


;; **********
;; * DEFINE *
;; **********

;; ****** VARS ********

;; Font size
(defvar bk/default-font-size 100)
(defvar bk/default-variable-font-size 100)
(set-language-environment "UTF-8")


;; ****** PATH ********

;; Load scripts
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/lisp"))


;; ***********
;; * PACKAGE *
;; ***********

;; Add package repositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Refresh package list on launch
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install Use package for non-linux
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Activate Use package
(require 'use-package)
(setq use-package-always-ensure t)



;; **********
;; * BACKUP *
;; **********

;; No littering store files in .emacs.d/etc/
(use-package no-littering)

;; Set for backup-file
(setq make-backup-files nil)

;; Set for auto save files
(setq auto-save-file-name-transforms
  `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; Change custom file path
(setq custom-file (no-littering-expand-etc-file-name "custom.el"))



;; **********
;; * COMMON *
;; **********

;; Easier confirmation
(fset 'yes-or-no-p 'y-or-n-p)

;; Autoreaload files
(global-auto-revert-mode t)

;; Easier scroll
(setq mouse-wheel-progressive-speed nil)



;; ******
;; * UI *
;; ******

;; ******** DEFAULT ********

;; Remove start screen
(setq inhibit-startup-message t)

;; Disable visible scrollbar
(scroll-bar-mode -1)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable menu bar
(menu-bar-mode -1)

;; Disable tooltips
(tooltip-mode -1)

;; Breathing room
(set-fringe-mode 0)

;; Set up the visible bell
(setq visible-bell t)

;; Display line numbers
(column-number-mode)
(global-display-line-numbers-mode t)


;; Highlight current line
(global-hl-line-mode 1)

;; ******* THEME *********

;; Better icons
(use-package all-the-icons)

;; Define theme
(use-package doom-themes
  :config
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-visual-bell-config))

(defvar bk-light-theme 'doom-gruvbox-light)
(defvar bk-dark-theme 'doom-nord)

;; Load dark theme as default
(load-theme bk-dark-theme t)


;; Function to toggle light/dark theme
(defun bk-toggle-theme ()
  "Toggle between light and dark theme"
  (interactive)
  (if (custom-theme-enabled-p bk-dark-theme)
      (progn
        (disable-theme bk-dark-theme)
        (load-theme bk-light-theme t))
      (progn
        (disable-theme bk-light-theme)
        (load-theme bk-dark-theme t))))

;; Add doom-modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Ensure the line number color is the right one
(set-face-attribute 'line-number nil
  :foreground (face-attribute 'nobreak-space :foreground)
  :background (face-attribute 'default :background))
(set-face-attribute 'line-number-current-line nil
  :foreground (face-attribute 'default :foreground)
  :background (face-attribute 'default :background))


;; Set default font
(set-face-attribute 'default nil :font "Fira Code Retina" :height bk/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height bk/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height bk/default-variable-font-size :weight 'regular)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Show parentheses as rainbow color
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))



;; ***************
;; * KEYBINDINGS *
;; ***************

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Activate evil-mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; Setup escape key
(use-package evil-escape
  :init
  (setq-default evil-escape-key-sequence "kj")
  (setq-default evil-escape-delay 0.2)
  :config
  (evil-escape-mode 1))

;; Act like surround.vim
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Collection of evil configuration
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Setup special key
(use-package general
  :config
  (general-create-definer bk/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (bk/leader-keys
    "tt"  '(bk-toggle-theme :which-key "toggle theme")
    "bl"  '(counsel-switch-buffer :which-key "switch buffer")))

;; Invert comments
(use-package evil-nerd-commenter
  :bind ("C-c i" . evilnc-comment-or-uncomment-lines))



;; **********
;; * HELPER *
;; **********

;; Display possible keys
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




;; ******************
;; * AUTOCOMPLETION *
;; ******************

;; Autocompletion with IVY
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

;; Improve completion for counsel
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; Find file
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

;; Install hydra
(use-package hydra)

;; Define an hydra function
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "increase")
  ("k" text-scale-decrease "decrease")
  ("f" nil "finished" :exit t))

;; Add hydra to general
(bk/leader-keys
  "st" '(hydra-text-scale/body :which-key "scale text "))

;; TODO define more hydra keys for LSP / treemacs / buffers / projectile



;; *******
;; * LSP *
;; *******

;; LSP-Client
;; TODO add lsp with hydra
(defun bk/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l") 
  :config
  (lsp-enable-which-key-integration t))


;; Lsp doc provider
;; TODO configure lsp-ui to fit my needs
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))


;; Treemacs with lsp integration
;; TODO imporve treemacs option
(use-package lsp-treemacs
  :after lsp)

;; Set F1 as open treemacs
(global-set-key (kbd "<f7>") 'treemacs)

;; Use ivy in lsp searches
(use-package lsp-ivy)



;; **************
;; * COMPLETION *
;; **************

;; Autocompletion for emacs
 (use-package company
    :after lsp-mode
    :hook (lsp-mode . company-mode)
    :bind (:map company-active-map
           ;;("<tab>" . company-complete-selection)
          ("<tab>" . company-complete-common-or-cycle)) ;; This line was the key
          (:map lsp-mode-map
           ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))


;; **************
;; * PROJECTILE *
;; **************

;; Install projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Git")
    (setq projectile-project-search-path '("~/Git")))
  (setq projectile-switch-project-action #'projectile-dired))

;; Use counsel in projectile
(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; Use treemacs with projectile
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)


;; *********
;; * MAGIT *
;; *********

;; The incredible magit package for git
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package git-timemachine
  :ensure t)

;; Add to magit call to general
(bk/leader-keys
  "gs" '(magit-status :which-key "call magit"))




;; *****************
;; * SPECIFIC CONF *
;; *****************

(require 'bk-python)

