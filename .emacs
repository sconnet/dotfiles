; This file is deprecated. I used emacs for over a decade, nevertheless, I
; switched to vim over a decade ago. I keep this file just in case.

;(require 'erc)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(load-library "lldb.el")

;; Setup up package.el to work with MELPA
;(require 'package)
;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)

;; Download Evil
;(unless (package-installed-p 'evil)
;  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(display-time)
(setq default-directory "~/")
(setq initial-scratch-message "** Greetings User. Welcome to the Scratch buffer. **\n")

;(set-cursor-color "red")

(set-face-attribute 'default nil
                    :family "Inconsolata" :height 175 :weight 'normal)
;(set-face-attribute 'default nil
;                    :family "Source Code Pro" :height 145 :weight 'normal)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode -1)
 '(canlock-password "<redacted>")
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(default-frame-alist
    '((background-color . "Black")
      (foreground-color . "LightGray")))
 '(diff-switches "-u")
 '(fill-column 79)
 '(frame-title-format (concat "%b - emacs@" system-name) t)
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(next-line-add-newlines nil)
 '(package-selected-packages '(evil))
 '(query-replace-highlight t)
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(search-highlight t)
 '(send-mail-function 'sendmail-send-it)
 '(show-paren-mode 1)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(user-full-name "<redacted>")
 '(user-mail-address "<redacted>"))

; set incoming email
;(add-to-list 'gnus-secondary-select-methods '(nnml ""))
;(setq mail-sources '((pop :server "<redacted>"
;                          :user "<redacted>"
;                          :password "<redacted>")))

; set outgoing mail
;(setq send-mail-function 'smtpmail-send-it)
;(setq message-send-mail-function 'smtpmail-send-it)
;(setq smtpmail-default-smtp-server "smtp.west.cox.net")
;(setq smtpmail-auth-credentials '(("hostname" "port" "username" "password")))
;(setq smtpmail-starttls-credentials '(("hostname" "port" nil nil)))

;; this is a good font, very readable
;; (font . "-misc-fixed-bold-r-normal--16-160-72-72-c-0-iso8859-15")
;; (font . "-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso8859-1")
;; (font . "-misc-fixed-*-*-*-*-*-*-100-100-*-100-*-*")

(add-hook 'text-mode-hook
          'turn-on-auto-fill)

;; turn off echoing if entering passwords
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(define-key function-key-map [delete] [deletechar])
(setq-default indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; turn off a bunch of helper keystrokes (CUA type stuff) since we are now
;; using EVIL mode

;(global-set-key "\C-h" 'delete-backward-char)

;(global-set-key [delete] 'delete-char)
;(global-set-key [kp-delete] 'delete-char)
(global-set-key [f4] 'next-error)
(global-set-key [C-f4] 'kill-buffer)
(global-set-key [f5] 'gud-cont)
(global-set-key [f7] 'compile)
(global-set-key [f8] 'gud-step)
(global-set-key [f9] 'gud-break)
(global-set-key [C-f9] 'gud-remove)
(global-set-key [S-f9] 'gud-print)
(global-set-key [f10] 'gud-next)
;(global-set-key [C-home] 'beginning-of-buffer)
;(global-set-key [C-end] 'end-of-buffer)
;(global-set-key [home] 'beginning-of-line)
;(global-set-key [end] 'end-of-line)
;(global-set-key [C-left] 'backward-syntax-word)
;(global-set-key [C-right] 'forward-syntax-word)
;(global-set-key '[(meta g)] 'goto-line)

;(define-key global-map [home] `beginning-of-line)
;(define-key global-map [end] `end-of-line)

; these work when logged in to linux box
;(global-set-key [C-kp-add] 'enlarge-window)
;(global-set-key [C-kp-subtract] 'shrink-window)
;(global-set-key [C-kp-divide] 'previous-multiframe-window)
;(global-set-key [C-kp-multiply] 'next-multiframe-window)
;(global-set-key [S-kp-add] 'enlarge-window-horizontally)
;(global-set-key [S-kp-subtract] 'shrink-window-horizontally)
; these work when logged in through SSH
;(global-set-key '[(meta *)] 'next-multiframe-window)
;(global-set-key '[(meta /)] 'previous-multiframe-window)
;(global-set-key '[(meta +)] 'enlarge-window)
;(global-set-key '[(meta -)] 'shrink-window)

;(set-face-foreground 'bold "#E0E0E0")
;(set-face-foreground 'bold-italic "#B0B0E0")
;(set-face-foreground 'modeline "#F0FAFF")
;(set-face-background 'modeline "#473C8B")
;(set-face-foreground 'region "#A0CAEF")
;(set-face-background 'region "#15486F")
;(set-face-foreground 'highlight "#F0FAFF")
;(set-face-background 'highlight "#B22222")

;; useful in most all modes
(global-set-key (kbd "RET") 'newline-and-indent)
(define-key text-mode-map (kbd "RET") 'newline)

;C/C++ SECTION
;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  (setq indent-tabs-mode nil)
  (setq c-auto-newline nil)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label 2)
  (c-set-offset 'class-open 0)
  (c-set-offset 'class-close 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'inline-close 0)
  (c-set-offset 'member-init-intro 2)
  (c-set-offset 'member-init-cont 0)
  (c-set-offset 'access-label -2)

  ;; make the ENTER key indent next line properly
  (local-set-key "\C-m" 'newline-and-indent))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(cond ((fboundp 'global-font-lock-mode)
       (require 'font-lock)
       (setq font-lock-maximum-decoration t)
       (global-font-lock-mode t)))

(defun now ()
  "Insert string for the current time formatted like '07/30/14 4:37 PM'"
  (interactive)                 ; permit invocation in minibuffer
;  (insert (format-time-string "%D %-I:%M %p")))
  (insert (format-time-string "%e %b %Y, %a, %-I:%M %p")))

(defun today ()
  "Insert string for today's date nicely formatted in American style,
e.g. Wednesday, July 30, 2014."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%a %e %b %Y")))
 ;  (insert (format-time-string "%A, %B %e, %Y")))

;; Conventional selection/deletion
(setq org-support-shift-select t)


; thanks to PT (org-mode list)
;(defun my-org-mode-stuff ()
;  "define selection by keyboard similar to Mac and Windows"
;  (require 'pc-select)
;  (local-set-key (kbd "C-S-<right>") 'forward-word-mark)
;  (local-set-key (kbd "C-S-<left>") 'backward-word-mark)
;  (local-set-key (kbd "S-<right>") 'forward-char-mark)
;  (local-set-key (kbd "S-<left>") 'backward-char-mark)
;  (local-set-key (kbd "S-<up>") 'previous-line-mark)
;  (local-set-key (kbd "S-<down>") 'next-line-mark))

;(add-hook 'org-mode-hook 'my-org-mode-stuff)


;;; Emacs/W3 Configuration
;(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
;(condition-case () (require 'w3-auto "w3-auto") (error nil))
;(autoload 'w3-preview-this-buffer "w3" "WWW Previewer" t)
;(autoload 'w3-follow-url-at-point "w3" "Find document at pt" t)
;(autoload 'w3 "w3" "WWW Browser" t)
;(autoload 'w3-open-local "w3" "Open local file for WWW browsing" t)
;(autoload 'w3-fetch "w3" "Open remote file for WWW browsing" t)
;(autoload 'w3-use-hostlist "w3" "Use shortcuts to view WWW docs" t)
;(autoload 'gopher-dispatch-object "gopher" "Fetch gopher dir" t)
;(setq w3-default-homepage "http://www.google.com")
;;(setq browse-url-browser-function 'browse-url-w3)
;(setq browse-url-browser-function 'browse-url-lynx-xterm)


;;; Commands added by calc-private-autoloads on Sat Mar 24 19:40:46 2001.
;(autoload 'calc-dispatch	   "calc" "Calculator Options" t)
;(autoload 'full-calc		   "calc" "Full-screen Calculator" t)
;(autoload 'full-calc-keypad	   "calc" "Full-screen X Calculator" t)
;(autoload 'calc-eval		   "calc" "Use Calculator from Lisp")
;(autoload 'defmath		   "calc" nil t t)
;(autoload 'calc			   "calc" "Calculator Mode" t)
;(autoload 'quick-calc		   "calc" "Quick Calculator" t)
;(autoload 'calc-keypad		   "calc" "X windows Calculator" t)
;(autoload 'calc-embedded	   "calc" "Use Calc inside any buffer" t)
;(autoload 'calc-embedded-activate  "calc" "Activate =>'s in buffer" t)
;(autoload 'calc-grab-region	   "calc" "Grab region of Calc data" t)
;(autoload 'calc-grab-rectangle	   "calc" "Grab rectangle of data" t)
;(setq load-path (nconc load-path (list "~/calc-2.02f")))
;(global-set-key "\e#" 'calc-dispatch)
;;; End of Calc autoloads.


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
