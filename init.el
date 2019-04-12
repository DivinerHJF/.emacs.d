(add-to-list 'load-path "~/.emacs.d/lisp/")


;;--------------------------------------------------------------------------

;; Package Management
(require 'init-packages)


;; ivy-mode
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
(setq auto-save-default nil)               ;;- disable auto save
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


;;- define your abbrevs
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8di" "diviner")
					    ))



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
