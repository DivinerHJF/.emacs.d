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


;;- quickly open your config file.
(global-set-key (kbd "<f8>") 'open-init-file)


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


(provide 'init-keybindings)
