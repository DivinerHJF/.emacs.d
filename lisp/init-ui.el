(tool-bar-mode -1)         ;;- turn off tool-bar
(scroll-bar-mode -1)       ;;- turn off scroll-bar
(global-linum-mode 1)      ;;- show linum-mode
(global-hl-line-mode 1)    ;;- Highlight the current line
(show-paren-mode 1)        ;;- Display parentheses pairing
(menu-bar-mode -1)         ;;- hide the meun bar

(setq inhibit-splash-screen 1)             ;;- turn off splash screen
(setq initial-frame-alist
      (quote ((fullscreen . maximized))))  ;;- fullscreen

(setq-default cursor-type 'bar)            ;;- make cursor style to bar

(set-face-attribute 'default nil :font "Courier New-11")  ;; Setting English Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
  charset (font-spec :family "Microsoft Yahei" :size 16)))


(provide 'init-ui)
