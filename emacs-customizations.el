
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(backup-directory-alist '(("" . "~/.emacs.d/backups")))
 '(beacon-color "#cc6666")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-backends
   '(company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev company-css))
 '(compilation-message-face 'default)
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(custom-enabled-themes '(monokai-alt))
 '(custom-safe-themes
   '("7f1407ef44a2f11f64d27987a8e7e6062bf8e00ed9357e2d7698c755aec64153" "b778946fa4dfd27fefbaf5d0bbc7ce3240df2e12b063f54fa4e17574c91f5ba3" "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" "46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "d1ede12c09296a84d007ef121cd72061c2c6722fcb02cb50a77d9eae4138a3ff" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(dired-dwim-target t)
 '(dired-listing-switches "-alh")
 '(fancy-splash-image "")
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(font-use-system-font t)
 '(frame-background-mode 'dark)
 '(global-display-line-numbers-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(ignored-local-variable-values '((encoding . binary)))
 '(inf-ruby-implementations
   '(("backupruby" . "irb --prompt default --noreadline -r irb/completion")
     ("ruby" . "irb --prompt custom_inf_ruby")
     ("jruby" . "jruby -S irb --prompt default --noreadline -r irb/completion")
     ("rubinius" . "rbx -r irb/completion")
     ("yarv" . "irb1.9 -r irb/completion")
     ("macruby" . "macirb -r irb/completion")
     ("pry" . "pry")))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(magit-gitflow-release-finish-arguments '("--push"))
 '(menu-bar-mode nil)
 '(minitest-use-rails t)
 '(package-archive-priorities '(("gnu" . 5) ("melpa" . 3)))
 '(package-selected-packages
   '(lsp-mode robe robe-mode flycheck dtrt-indent ledger-mode forge nix-mode pdf-tools direnv dart-mode rspec-mode enh-ruby-mode fish-mode tide nix-buffer go-mode terraform-mode rjsx-mode goto-gem aggressive-indent smart-tabs-mode company-tabnine company-nixos-options dired-rsync js2-mode php-mode company web-mode exec-path-from-shell restclient minitest ruby-end electric-pair flx-ido csharp-mode yaml-mode rails-log-mode projectile-rails highlight-indentation wgrep-ag goto-chg magit-gitflow buffer-move ag monokai-alt-theme monokai-theme use-package color-theme-sanityinc-tomorrow))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(truncate-lines t)
 '(use-dialog-box nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-log-types '((direnv)))
 '(warning-suppress-types '((direnv)))
 '(web-mode-auto-close-style 1)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-blue ((t (:background "royal blue" :foreground "royal blue"))))
 '(ansi-color-bright-green ((t (:background "green2" :foreground "green2"))))
 '(ansi-color-bright-red ((t (:background "red2" :foreground "red2"))))
 '(ansi-color-green ((t (:background "SpringGreen3" :foreground "SpringGreen3"))))
 '(ansi-color-red ((t (:background "firebrick3" :foreground "firebrick3")))))
