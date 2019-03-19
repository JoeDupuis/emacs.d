;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)




;; Set up 'custom' system
(setq custom-file "~/.emacs.d/emacs-customizations.el")
(load custom-file)




(eval-when-compile

  (require 'use-package))

(fset 'yes-or-no-p 'y-or-n-p)


(use-package magit :ensure t :defer t :bind ("C-x g" . magit))
(use-package color-theme-sanityinc-tomorrow :ensure t)
(use-package monokai-theme :ensure t)
(use-package monokai-alt-theme :ensure t)
(use-package ido :config
  (setq ido-everywhere t)
  (setq ido-virtual-buffers t)
  (ido-mode))
(use-package ido-better-flex :load-path "vendor/ido-better-flex")

(use-package ag :ensure t)
