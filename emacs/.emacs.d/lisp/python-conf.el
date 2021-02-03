;; ***************************
;; *  Python  configuration  *
;; *     EMACS - 20210201    *
;; * Étienne (Maiste) Marais *
;; ***************************

;; Launch python lsp mode
(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred))
