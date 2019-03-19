
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
  (ido-mode))
(use-package ido-better-flex :load-path "vendor/ido-better-flex")

(use-package ag :ensure t :bind
  ("C-c C-x C-f" . ag))
(use-package wgrep-ag :ensure t :defer t)

(use-package goto-chg :ensure t :bind
  ("C-." . goto-last-change)
  ("C-," . goto-last-change-reverse))

(use-package highlight-indentation :ensure t :defer t)

(use-package projectile :ensure t :defer t)
(use-package projectile-rails :ensure t :defer t)
(use-package rails-log-mode :ensure t :defer t)
(use-package yaml-mode :ensure t :defer t)
(use-package flycheck :ensure t :defer t)
(use-package goto-gem :ensure t :defer t)
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
