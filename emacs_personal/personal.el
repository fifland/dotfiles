(prelude-require-package 'neotree)
(prelude-require-package 'rainbow-delimiters)
(prelude-require-package 'yasnippet)
(prelude-require-package 'yasnippet-snippets)
(prelude-require-package 'rbenv)
(prelude-require-package 'robe)
(prelude-require-package 'doom-themes)
(prelude-require-package 'multiple-cursors)
(prelude-require-package 'company)
(prelude-require-package 'racer)
(prelude-require-package 'company-racer)

;; initial window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))

(set-default-font "Hack-10")

                                       ; font size
(if (string= system-type "darwin")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 100))

(setq
 prelude-guru nil
 prelude-whitespace nil
 prelude-use-smooth-scrolling t
 auto-save-default nil
 make-backup-files nil
 ensime-startup-notification nil
 smartparens-global-strict-mode nil
 ispell-dictionary "deutsch8")

(global-rbenv-mode 1)
(global-company-mode 1)
(global-linum-mode 1)
(menu-bar-mode 1)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scala-mode-hook 'rainbow-delimiters-mode)
(add-hook 'typescript-mode-hook 'rainbow-delimiters-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook 'robe-mode)
;(eval-after-load 'robe-mode
;  '(push 'company-robe company-backends))

(eval-after-load 'company
  '(push 'company-robe company-backends))
