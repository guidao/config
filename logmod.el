(setq log-hightlights
      '(("^.+\[E\].+" . font-lock-warning-face)))

(define-derived-mode log-mode nil 
  (setq font-lock-defaults '(log-hightlights)))

(provide 'log-mode)
