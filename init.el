
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

; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


(when (eq system-type 'darwin)
  (setq
   ns-command-modifier 'control
   ns-option-modifier 'meta
   ns-control-modifier 'super
   ns-function-modifier 'hyper))


;; Set up 'custom' system
(setq custom-file "~/.emacs.d/emacs-customizations.el")
(load custom-file)

(savehist-mode 1)



(eval-when-compile

(require 'use-package))

(fset 'yes-or-no-p 'y-or-n-p)

(use-package exec-path-from-shell :ensure t

)
(use-package fish-mode :ensure t)

(use-package pdf-tools :ensure t)
(use-package dired-rsync :ensure t
  :config
  (bind-key "C-c C-r" 'dired-rsync dired-mode-map))

;; (exec-path-from-shell-initialize)
;; (exec-path-from-shell-copy-env "XDG_CONFIG_HOME")
;; (exec-path-from-shell-copy-env "XDG_DATA_HOME")
(use-package nix-mode :ensure t :defer t
	:config
	(add-hook 'nix-mode-hook
						'(lambda () (set (make-local-variable 'company-backends) '((company-dabbrev-code company-nixos-options)))

							 )))


(use-package magit-popup :ensure t :demand t )
(use-package magit :ensure t :defer t :bind ("C-x g" . magit))
(use-package magit-gitflow  :ensure t :hook  (magit-mode . turn-on-magit-gitflow))
(use-package color-theme-sanityinc-tomorrow :defer t :ensure t)
(use-package monokai-theme :defer t :ensure t)
(use-package monokai-alt-theme :defer t :ensure t
:config
(set-face-attribute 'mode-line           nil :foreground "black" :background "dark orange")
(set-face-attribute 'mode-line-buffer-id           nil :foreground "black")
(set-face-attribute 'mode-line-inactive           nil :foreground "orange" :background "#363631")
)
(use-package ido :config
(setq ido-everywhere t)
(setq ido-virtual-buffers t)
(put 'dired-do-copy 'ido 'dired-do-copy)
(put 'dired-do-rename 'ido 'dired-do-rename)
(setq ido-default-buffer-method 'samewindow)
(ido-mode))


;use-package ido-better-flex :load-path "vendor/ido-better-flex")
(use-package flx-ido :ensure t)

(use-package ag :ensure t :bind
("C-c C-x C-f" . ag))
(use-package wgrep-ag :ensure t :defer t)

(use-package goto-chg :ensure t :bind
("C-." . goto-last-change)
("C-," . goto-last-change-reverse))


(use-package js2-mode :defer t :ensure t)
(use-package terraform-mode :defer t :ensure t)

(use-package highlight-indentation :ensure t :defer t)
(use-package php-mode :ensure t :defer t)
(use-package csharp-mode :ensure t :defer t)
(use-package ledger-mode :ensure t :defer t :mode "\\.ledger\\'")
(use-package web-mode :ensure t :defer t :mode "\\.erb\\'" :config
  (setq web-mode-markup-indent-offset 2)
  (setq-default indent-tabs-mode nil)

  )
(use-package markdown-mode :ensure t :defer t)

(use-package projectile
  :ensure t
  :init
					;  (setq projectile-completion-system 'ivy)
;  (setq projectile-project-search-path '("~/Documents/"))

  :config
  (use-package projectile-rails :ensure t :config
		(define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))
  (projectile-rails-global-mode)

(use-package smart-tabs-mode :ensure t )

(use-package company :ensure t   :init (global-company-mode)
	:bind
	("<C-tab>" . company-complete)
	:config
	(add-to-list 'company-backends #'company-tabnine)
	(setq company-idle-delay 0)
	(setq company-show-numbers t)
	)

(use-package company-tabnine :ensure t)
(use-package company-nixos-options :ensure t)
(use-package inf-ruby :ensure t)

(electric-pair-mode 1)
(use-package restclient :ensure t)
(use-package ruby-end :ensure t :hook (ruby-mode . minitest-mode)
  :bind (
	 ("C-c C-c" . minitest-verify-single)
	 ("C-c C-t" . minitest-verify)
	 ("C-x C-t" . minitest-verify-all)
	 ))
(use-package minitest :ensure t)
(use-package aggressive-indent :ensure t)
(use-package dtrt-indent :ensure t)
(use-package rails-log-mode :ensure t :defer t)
(use-package yaml-mode :ensure t :defer t :mode "\\.sls\\'")
(use-package flycheck :ensure t :defer t)
;(use-package goto-gem :ensure t :defer t)
(use-package windmove
  ;; :defer 4
  :config
  ;; use command key on Mac
  (windmove-default-keybindings)
  ;; wrap around at edges
  (setq windmove-wrap-around t))

(use-package buffer-move :ensure :bind
  (("<C-S-up>" . buf-move-up)
   ("<C-S-down>" . buf-move-down)
   ("<C-S-left>" . buf-move-left)
   ("<C-S-right>" . buf-move-right))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x RET") 'calc)


(global-set-key (kbd "<f8>") 'whitespace-mode)
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

(global-set-key (kbd "C-+") 'goto-line)


(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;transpose lines emacs
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-region-up)
(global-set-key (kbd "M-<down>") 'move-region-down)

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yank file path

(defun jd-copy-path()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
	  (x-set-selection nil filename)
      (message filename))))

(global-set-key (kbd "C-x t p") 'jd-copy-path)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;duplicate line
(defun duplicate-line()
  (interactive)
  ;; (move-beginning-of-line 1)
  (set-mark-command nil)
  (move-end-of-line nil)
  (kill-ring-save (region-beginning) (region-end))
)
(global-set-key (kbd "M-k") 'duplicate-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Delete current buffer file
(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
