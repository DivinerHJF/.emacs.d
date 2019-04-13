;;- Make source code fancy in the org file
(require ' org)
(setq org-src-fontify-natively t)


;; org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)


;;- schedule items
(setq org-agenda-files '("~/org-document/schedule/"))
(global-set-key (kbd "C-c a") 'org-agenda)


;; org-capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates nil)
;; Task management
(add-to-list 'org-capture-templates '("t" "待办清单"))
(add-to-list 'org-capture-templates
             '("tr" "藏书阁" entry
               (file+headline "~/org-document/schedule/task.org" "待阅书籍")
               "* TODO %^{书名}\n%u\n%a\n" :empty-lines 1))
(add-to-list 'org-capture-templates
             '("tw" "任务表" entry
               (file+headline "~/org-document/schedule/task.org" "待办事项")
               "* TODO %^{任务名}\n%u\n%a\n" :empty-lines 1))
;; journal record
(add-to-list 'org-capture-templates
             '("j" "日志记录" entry
               (file+datetree "~/org-document/schedule/journal.org")
	       "* %?\n" :empty-lines 1))
;; password management
(defun random-alphanum ()
  (let* ((charset "abcdefghijklmnopqrstuvwxyz0123456789")
         (x (random 36)))
    (char-to-string (elt charset x))))
(defun create-password ()
  (let ((value ""))
    (dotimes (number 16 value)
      (setq value (concat value (random-alphanum))))))
(defun get-or-create-password ()
  (setq password (read-string "Password: "))
  (if (string= password "")
      (create-password)
    password))
(add-to-list 'org-capture-templates
             '("p" "密码管理" entry (file "~/org-document/schedule/passwords.org.cpt")
               "* %U - %^{title} %^G\n\n  - 用户名: %^{用户名}\n  - 密码: %(get-or-create-password)"
               :empty-lines 1 :kill-buffer t))




(provide 'init-org)
