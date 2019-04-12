;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)      ;; Use Melpa As the Source of Plug-ins
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			     ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)  ;; cl - Common Lisp Extension

;; Add Packages
(defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;-----------------------------------------------------------------------------


;;- config for company
(global-company-mode 1)

;;- config for hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;- config for swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


;;- config for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;- config for monokai-theme
(load-theme 'monokai t)



;;-------------------------------------------------------------------------------

(provide 'init-packages)
