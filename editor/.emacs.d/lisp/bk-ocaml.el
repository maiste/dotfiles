;; ***************************
;; *  OCaml   configuration  *
;; *     EMACS - 20210201    *
;; * Étienne (Maiste) Marais *
;; ***************************


(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection "ocamllsp")
  :major-modes '(tuareg-mode)
  :server-id 'ocaml-lsp))

(use-package tuareg
  :after (lsp)
  :hook (tuareg-mode . lsp)
  :mode
  (("\\.ml[ip]?\\'" . tuareg-mode)
     ("\\.mly\\'" . tuareg-menhir-mode)
     ("[./]opam_?\\'" . tuareg-opam-mode)
     ("\\(?:\\`\\|/\\)dune\\(?:\\.inc\\)?\\'" . tuareg-jbuild-mode))
    :custom
    (tuareg-match-patterns-aligned t)
    (tuareg-indent-align-with-first-arg t)
    (lsp))

(add-hook 'tuareg-mode #'lsp)

(provide 'bk-ocaml)
