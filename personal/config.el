;;; appearance
(menu-bar-mode -1)
(setq global-hl-line-mode nil)

;;; encoding
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)

;;; other window
(global-set-key (kbd "C-t") 'other-window)

;;; backspace
(keyboard-translate ?\C-h ?\C-?)

;;; clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

