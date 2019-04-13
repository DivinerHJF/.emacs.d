(setq ring-bell-function 'ignore)
(setq make-backup-files nil)               ;;- disable backup file
(setq auto-save-default nil)               ;;- disable auto save

(global-auto-revert-mode 1)
(delete-selection-mode 1)                  ;;- input replaces the part of your selection

;;- define your abbrevs
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8di" "diviner")
					    ))

;;- enable recentf-mode
(require ' recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r"' recentf-open-files)

;;- UTF-8 as default encoding
(set-language-environment "UTF-8")


;; 设置垃圾回收，在Windows下，emacs25版本会频繁出发垃圾回收，所以需要设置
(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用 ;;
  (setq garbage-collection-messages t)) 

(provide 'init-better-defaults)
