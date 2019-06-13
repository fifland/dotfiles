(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("controllers" (filename . "app/controllers/"))
         ("models" (filename . "app/models/"))
         ("views" (filename . "app/views/"))
         ("emacs" (mode . emacs-lisp-mode))
         )))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")
             ))
