(global-set-key (kbd "C-f") 'isearch-forward) ;;search using C-F
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

(global-set-key (kbd "C-#") 'comment-line)
(global-set-key (kbd "C-O") 'find-file)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-right)
(global-set-key (kbd "C-S") 'save-buffer)
(global-set-key (kbd "C-S-d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-P") 'projectile-find-file)
(global-set-key (kbd "C-Z") 'undo)

(global-set-key (kbd "C-<") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;(define-key yas-minor-mode-map (kbd "TAB") yas-maybe-expand)
