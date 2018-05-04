(menu-bar-mode -1)
(setq global-hl-line-mode nil)

;; Encode
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)

;; other window
(global-set-key (kbd "C-t") 'other-window)

;; BackSpace
(keyboard-translate ?\C-h ?\C-?)

;; clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;;; company-mode
(prelude-require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay .2
      company-minimum-prefix-length 2
      company-selection-wrap-around t)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
