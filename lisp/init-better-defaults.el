(setq ring-bell-function 'ignore)
(setq make-backup-files nil)               ;;- disable backup file
(setq auto-save-default nil)               ;;- disable auto save

(delete-selection-mode 1)                  ;;- input replaces the part of your selection

;;- define your abbrevs
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8di" "diviner")
					    ))

;;- enable recentf-mode
(require ' recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r"' recentf-open-files)

(provide 'init-better-defaults)
