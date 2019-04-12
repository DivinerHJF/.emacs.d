;;- Make source code fancy in the org file
(require ' org)
(setq org-src-fontify-natively t)

;;- schedule items
(setq org-agenda-files '("~/org-document/schedule"))
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
