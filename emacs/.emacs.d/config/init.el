(set-language-environment "UTF-8")
(setq custom-file "~/.emacs.d/config/custom.el")
(setq shell-file-name "/bin/zsh")

(setq inhibit-startup-message t)
(load custom-file)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(setq make-backup-files nil)

(electric-pair-mode t)

(use-package nord-theme
  :ensure t
  :config
  (if window-system
      (load-theme 'nord t)
    (load-theme 'wombat t)))


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode t)
(global-display-line-numbers-mode t)

(use-package git-timemachine
  :ensure t
  )

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq org-agenda-files '("~/Documents/todo.org"))

(setq org-agenda-window-setup
      (quote current-window))

(setq org-agenda-sorting-strategy
      (quote
       ((agenda deadline-up priority-down)
	(todo priority-down category-keep)
	(tags priority-down category-keep)
	(search category-keep))))

(setq org-support-shift-select t)

(setq org-agenda-span (quote fortnight))
(setq org-deadline-warning-days 7)
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-log-done 'time)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

(setq org-priority-faces
      '((?A . (:foreground "#F0DFAF" :weight bold))
	(?B . (:foreground "LightSteelBlue"))
	(?C . (:foreground "OliveDrab"))))

(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(
	("t" "todo" entry (file+headline "~/Documents/todo.org" "Tasks")
	 "* TODO [#A] %?")
	("d" "todo" entry (file+headline "~/Documents/todo.org" "Tasks")
	"* TODO [#A] %?\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")
	("s" "todo" entry (file+headline "~/Documents/todo.org" "Tasks")
	 "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")))

(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
