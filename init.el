;; Use Melpa As the Source of Plug-ins

(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
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



;;--------------------------------------------------------------------------


;;- config for company
(global-company-mode 1)

;;- config for hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;- config for swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;- config for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;;- config for monokai-theme
(load-theme 'monokai t)


;;-------------------------------------------------------------------------


;; Major Mode Settings

(setq auto-mode-alist
  (append
   ;; File name (within directory) starts with a dot.
   '(("\\.js\\'" . js2-mode)
     ("\\`/tmp/fol/" . text-mode)
     ("\\.texinfo\\'" . texinfo-mode)
     ("\\.texi\\'" . texinfo-mode)
     ("\\.el\\'" . emacs-lisp-mode)
     ;; File name has no dot.
     ("/[^\\./]*\\'" . fundamental-mode)
     ;; File name ends in ‘.C’.
     ("\\.C\\'" . c++-mode))
   auto-mode-alist))


;;- config for org-mode
(require ' org)
(setq org-src-fontify-natively t)          ;;- Make source code fancy in the org file

(setq org-agenda-files '("~/org-document/schedule"))
(global-set-key (kbd "C-c a") 'org-agenda) ;;- schedule items


;;-------------------------------------------------------------------------


;; Minor Mode Settings

(tool-bar-mode -1)         ;;- turn off tool-bar
(scroll-bar-mode -1)       ;;- turn off scroll-bar
(global-linum-mode 1)      ;;- show linum-mode
(global-hl-line-mode 1)    ;;- Highlight the current line
(delete-selection-mode 1)  ;;- input replaces the part of your selection
(show-paren-mode 1)        ;;- Display parentheses pairing
(menu-bar-mode -1)         ;;- hide the meun bar

;;-------------------------------------------------------------------------


;; System Variable Settings

(setq make-backup-files nil)               ;;- disable backup file
(setq inhibit-splash-screen 1)             ;;- turn off splash screen
(setq initial-frame-alist
      (quote ((fullscreen . maximized))))  ;;- fullscreen

(setq-default cursor-type 'bar)            ;;- make cursor style to bar


;;-------------------------------------------------------------------------


;; Keyboard Shortcut Settings

;;- define a function to quickly open your config file.
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;;- enable recentf-mode
(require ' recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r"' recentf-open-files)









;;-------------------------------------------------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
