;; ***************************
;; *   OCaml main config     *
;; * Étienne "maiste" Marais *
;; *    Version 20211021     *
;; ***************************


;; *** Setup ocamlformat for OCaml ***

(use-package ocamlformat
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save)
  )

;; *** Tuareg install ***

(use-package tuareg
  :mode
  (("\\.ml[ip]?\\'" . tuareg-mode)
     ("\\.mly\\'" . tuareg-menhir-mode)
     ("[./]opam_?\\'" . tuareg-opam-mode)
     ("\\(?:\\`\\|/\\)dune\\(?:\\.inc\\)?\\'" . tuareg-jbuild-mode))
    :custom
    (tuareg-match-patterns-aligned t)
    (tuareg-indent-align-with-first-arg t))

;; *** Merlin mode ***

(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
 (when (and opam-share (file-directory-p opam-share))
  (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)))

(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
(add-hook 'merlin-mode-hook 'company-mode)

;; *** Keybindings ***

(maiste/leader-key
  "lt" '(merlin-type-enclosing :which-key "merlin type")
  "ll" '(merlin-locate :which-key "merlin locate")
  )

;; *** Compile command hook ***
;; from https://github.com/CraigFe/dotfiles/blob/main/emacs/lib/languages/ocaml.el

(add-hook 'dune-mode-hook
          (lambda () (set (make-local-variable 'compile-command) "dune build @check")))

(add-hook 'tuareg-mode-hook
          (lambda () (set (make-local-variable 'compile-command) "dune build @check")))


;; *** Opam config ***

(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")


(provide 'maiste-ocaml)
