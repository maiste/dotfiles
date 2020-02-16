;; *-------------------------*
;; | GNU Emacs Configuration |
;; | Etienne "maiste  Marais |
;; *-------------------------*


;; Define package archives
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Use package install
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(org-babel-load-file (expand-file-name "~/.emacs.d/config/init.org")) 
