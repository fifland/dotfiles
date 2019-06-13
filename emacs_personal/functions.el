
(defun personal-translucent-window ()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(70 50)))
