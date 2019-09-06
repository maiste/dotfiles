;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;       Emacs configuration      ;;
;;================================;;
;;     Étienne (Maiste) MARAIS    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;***********Fichier de configuration .emacs*********;;


;;Change custom-file
;;(setq custom-file "~/.emacs.d/config/custom.el")
;;(load custom-file)

;; ********* Archives de packages ********

;; ajout de melpa aux packages 
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(package-initialize)

;;******* Ajout fonctionnel*********

(setq inhibit-startup-screen t)         ;; enleve l'écran de démarrage
(setq make-backup-files nil)            ;; supprime les fichiers de sauvegardes autonomes
(setq auto-save-default nil)            ;; empeche la création de fichiers d'autosave
(show-paren-mode 1)                     ;; Parenthèse
(setq show-paren-delay 0)               ;; Parenthèse


(line-number-mode 1)                    ;; Affiche les ligne au dessus du buffer
(column-number-mode 1)                  ;; Affiche le nombre de colonne
(global-linum-mode 1)                   ;; Affiche les numéros de ligne sur le coté
;;(setq linum-format "%4d \u2502")      ;; Organisation de la colonne où il y a des numéros de lignes mais en cas de non séparation visuel
(setq linum-format "%4d ")
;;(global-hl-line-mode 1)               ;; Surligne la ligne actuelle
(setq-default word-wrap t)              ;; Word wrap
(load-library "iso-transl")             ;; Dead circumflex


(setq-default indent-tabs-mode nil)     ;; Mode d'indentation avec tab
(setq tab-width 2)                      ;; taille des tabulations en espaces

(electric-indent-mode 1)                ;; auto indentation
(scroll-bar-mode -1)                    ;; Efface la barre de defilement
(tool-bar-mode -1)                      ;; Efface le menu
(electric-pair-mode 1)                  ;; Permet d'avoir deux parenthèses ()
(menu-bar-mode -1)                      ;; enlever le menu en haut
(ac-config-default)                     ;; mode autocomplétion avec TAB

(powerline-default-theme)               ;; Powerline default mode

;; emacs nw great colors
;;(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))


;; **** Loading ****

;; Keybinding
(setq key-file "~/.emacs.d/config/key.el")
(load key-file)

;; Python
(add-hook 'python-mode
     (lambda()
       (setq python-file "~/.emacs.d/config/python.el")
       (load python-file)
       )
     )

;; OCaml
(add-hook 'tuareg-mode
     (lambda()
       (setq ocaml-file "~/.emacs.d/config/ocaml.el")
       (load ocaml-file)
       )
     )




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"))
 '(beacon-color "#dc322f")
 '(custom-enabled-themes (quote (gruvbox-light-hard)))
 '(custom-safe-themes
   (quote
    ("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "bf5bdab33a008333648512df0d2b9d9710bdfba12f6a768c7d2c438e1092b633" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" "fd3c7bd752f48dcb7efa5f852ef858c425b1c397b73851ff8816c0580eab92f1" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "6cd8802e31b8d5c169a8043f953d34b9972ee69241678a46970140c644960c7b" default)))
 '(fci-rule-color "#eee8d5")
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
    (haskell-mode powerline gruvbox-theme color-theme-sanityinc-solarized web-mode tuareg neotree git-gutter auto-complete)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#282828")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
