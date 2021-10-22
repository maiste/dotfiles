;; ***************************
;; *    Markdown  config     *
;; * Étienne "maiste" Marais *
;; *    Version 20211021     *
;; ***************************

;; Markdown mode

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

;; Use grip to preview markdown

(use-package grip-mode
  :ensure t
  :init
  (setq grip-preview-use-webkit t)
  (setq grip-url-browser "firefox")
  (setq grip-update-after-change nil))

(maiste/leader-key
  "mp" '(grip-mode :which-key "preview markdown"))

(provide 'maiste-md)
