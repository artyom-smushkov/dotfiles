;; -*- lexical-binding: t -*-

(when (file-exists-p "~/.emacs.d/secrets.el")
  (load "~/.emacs.d/secrets.el"))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(undecorated . t))

(set-face-attribute 'default nil :family "IosevkaTerm Nerd Font" :height 120)
(set-face-attribute 'fixed-pitch nil :family "IosevkaTerm Nerd Font" :height 120)
(set-face-attribute 'variable-pitch nil :family "Ubuntu" :height 125 :weight 'regular)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(dolist (mode '(org-mode-hook
                org-agenda-mode-hook
                term-mode-hook
                vterm-mode-hook
                eat-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq-default cursor-type 'bar)

(setq scroll-conservatively 50)
(setq scroll-margin 15)
(setq frame-resize-pixelwise t)

(setq scroll-preserve-screen-position nil)
(setq scroll-step 1)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(use-package dired
  :straight nil
  :custom ((dired-listing-switches "-agho --color=auto --group-directories-first")))
(use-package dired-single)
(use-package diredfl
  :hook (dired-mode . diredfl-mode))
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package general
  :config
  (general-create-definer my-leader-def
    :prefix "SPC"
    :keymaps 'override)

  (my-leader-def
    :states '(normal visual motion)
    "f" '(:ignore t :which-key "files")
    "ff" '(find-file :which-key "find file")
    "fs" '(save-buffer :which-key "save file")
    "fd" '(dired :which-key "dired")
    "e" '(:ignore t :which-key "eshell/evaluate")
    "en" '(ars/create-eshell :which-key "create new eshell")
    "eh" '(eshell-syntax-highlighting-mode :which-key "toggle syntax highlighting")
    "ec" '(ars/fix-remote-dockers :which-key "clear tramp proxies list")
    "ee" '(eval-region :which-key "eval region (emacs lisp)")
    "c" '(:ignore t :which-key "consult")
    "co" '(consult-outline :which-key "outline")
    "cg" '(consult-git-grep :which-key "grep")
    "cr" '(consult-ripgrep :which-key "ripgrep")
    "ci" '(consult-imenu :which-key "imenu")
    "ch" '(consult-history :which-key "history")
    "o" '(:ignore t :which-key "org")
    "oa" '(org-agenda :which-key "agenda")
    "oc" '(org-capture :which-key "capture")
    "oq" '(org-ql-find-in-org-directory :which-key "query")
    "u" '(universal-argument :which-key "universal argument")
    "w" 'evil-window-map
    "p" project-prefix-map
    "h" help-map
    "." '(evil-avy-goto-char-2 :which-key "avy goto char 2")
    "g" '(magit-status :which-key "magit")
    "l" '(:ignore t :which-key "LLM")
    "ln" '(gptel :which-key "gptel")
    "ls" '(gptel-send :which-key "send prompt")
    "lm" '(gptel-menu :which-key "menu")
    "b" '(:ignore t :which-key "buffers")
    "bb" '(consult-buffer :which-key "switch buffer")
    "bk" '(kill-buffer :which-key "kill buffer")))

(use-package emacs
  :init
  (setq tab-always-indent 'complete)
  (setq warning-minimum-level :error)
  (setq vc-follow-symlinks nil)
  (setq native-comp-deferred-compilation t)
  (setq make-backup-files nil)
  (setq eat-term-name "xterm-256color")
  (setq split-height-threshold nil)
  (setq split-width-threshold 80)
  (setq help-window-select t)
  
  (global-auto-revert-mode 1)
  (setq auto-revert-remote-files t))
(use-package gcmh
  :config (gcmh-mode 1))

(use-package tramp
  :straight nil
  :config
  (setq tramp-allow-unsafe-temporary-files t)
  (setq tramp-show-ad-hoc-proxies t)
  (setq tramp-save-ad-hoc-proxies nil))
  (add-to-list 'tramp-remote-path "/home/linuxbrew/.linuxbrew/bin/")

(defun ars/fix-remote-dockers ()
  (interactive)
  (setq tramp-default-proxies-alist nil))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package nerd-icons)
(use-package doom-modeline
  :init (doom-modeline-mode 1))
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-lsp-icon t)
(setq doom-modeline-lsp t)

(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))
(add-to-list 'default-frame-alist '(undecorated t))
(setq split-height-threshold 1000)

;; (use-package catppuccin-theme
;;   :config
;;   (load-theme 'catppuccin :no-confirm)
;;   (setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;;   (catppuccin-reload))
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-dracula t)

  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(setq ring-bell-function 'ignore)

(use-package avy
  :config
  (avy-setup-default)
  :bind
  ("C-." . avy-goto-char-timer))

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-cycle t))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-font-lock-level 4)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package autopair
  :hook
  (prog-mode . autopair-mode))

(use-package eglot
  :hook ((python-ts-mode) . eglot-ensure))
(use-package eglot-booster
  :straight (eglot-booster :type git :host github :repo "jdtsmith/eglot-booster")
  :after eglot
  :config (eglot-booster-mode))

(use-package vue-mode
  :hook (vue-mode . egot-ensure))
(use-package dockerfile-mode)
(use-package docker-compose-mode)

(use-package corfu
  :hook (prog-mode . corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-popupinfo-mode)
  :init
  (global-corfu-mode))

(use-package nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package magit
  :after evil-collection
  :config
  (evil-collection-define-key 'normal 'magit-mode-map
    (kbd "SPC") nil
    "j" 'magit-section-forward
    "k" 'magit-section-backward
    "C-j" 'evil-next-visual-line
    "C-k" 'evil-previous-visual-line))

;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("C-s" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"
  )

(use-package eat
  :config
  (eat-eshell-mode))

(use-package eshell
  :ensure nil
  :hook ((eshell-mode . (lambda ()
                          (setq-local corfu-count 7)
                          (setq-local corfu-auto nil)
                          (setq-local corfu-preview-current nil)
                          (setq-local completion-at-point-functions '(pcomplete-completions-at-point cape-file)))))
  :custom
  (eshell-history-size 1024)
  (eshell-pushd-dunique t)
  (eshell-last-dir-unique t)
  (eshell-last-dir-ring-size 128)
  (eshell-scroll-to-bottom-on-input t)
  :config
  (setq eshell-visual-commands nil)
  :init
  (add-to-list 'exec-path "/home/linuxbrew/.linuxbrew/bin")
  (add-to-list 'exec-path "/home/linuxbrew/.linuxbrew/sbin")
  (add-to-list 'exec-path "~/.local/bin")
  (setenv "PATH" (concat (getenv "PATH") ":/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:~/.local/bin"))
  (defun eshell/cat-with-syntax-highlighting (filename)
    "Like cat(1) but with syntax highlighting.
Stole from aweshell"
    (let ((existing-buffer (get-file-buffer filename))
          (buffer (find-file-noselect filename)))
      (eshell-print
       (with-current-buffer buffer
         (if (fboundp 'font-lock-ensure)
             (font-lock-ensure)
           (with-no-warnings
             (font-lock-fontify-buffer)))
         (let ((contents (buffer-string)))
           (remove-text-properties 0 (length contents) '(read-only nil) contents)
           contents)))
      (unless existing-buffer
        (kill-buffer buffer))
      nil))
  (advice-add 'eshell/cat :override #'eshell/cat-with-syntax-highlighting))

(use-package eshell-syntax-highlighting
  :ensure t
  :config
  (eshell-syntax-highlighting-global-mode +1)
  (setq eshell-syntax-highlighting-highlight-in-remote-dirs t)
  :init
  (defface eshell-syntax-highlighting-invalid-face
    '((t :inherit diff-error))
    "Face used for invalid Eshell commands."
    :group 'eshell-syntax-highlighting))

(use-package eshell-up)

(defun ars/create-eshell (&optional use-old-frame)
  "creates a shell with a given name or swithes to it if it already exists"
  (interactive)
  (let* ((shell-name (read-string "shell name: " nil))
	   (use-old-frame (or use-old-frame nil))
	   (buffer-name (concat "*" shell-name " eshell*")))
    (if (get-buffer buffer-name)
	  (switch-to-buffer buffer-name)
	  (let ((frame (if use-old-frame (selected-frame) (make-frame))))
		(progn
		(select-frame-set-input-focus frame)
		(eshell)
		(rename-buffer buffer-name))))))

;; (use-package eshell-prompt-extras
;; :config
;; (with-eval-after-load "esh-opt"
;; (autoload 'epe-theme-lambda "eshell-prompt-extras")
;; (setq eshell-highlight-prompt nil
;;       eshell-prompt-function 'epe-theme-multiline-with-status)))

(defun piiq-local ()
  (cd "~/Development/piiq-dev-containers")
  (if (string= "" (shell-command-to-string "docker compose ps | grep Up"))
     (shell-command "docker compose up -d"))
  (cd "/docker:piiq:/home/piiq/piiq-media/"))

(use-package gptel
  :config
  (setq gptel-api-key OPENAI_KEY)
  (setq gptel-default-mode 'org-mode)
  (setq gptel-model "gpt-4o"))

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.4)
                  (org-level-2 . 1.3)
                  (org-level-3 . 1.2)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Fira Sans" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 150
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package org
  :after evil
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-refile-targets '((nil . (:maxlevel 4))))
  (setq org-goto-interface 'outline-path-completion)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-goto-max-level 4)
  (setq org-refile-use-outline-path t)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-files (directory-files-recursively "~/Documents/Org" "\\.org$"))
  (setq org-agenda-align-tags-to-column 90)
  (setq org-agenda-prefix-format
    '((agenda . " %i %?-12t% s")
     (todo . " %i")
     (tags . " %i")
     (search . " %i")))
  (setq org-directory "~/Documents/Org")
  (efs/org-font-setup)
  (require 'org-tempo)
  :bind
  (("C-c c" . org-capture)
   ("C-c a" . org-agenda)))

(use-package visual-fill-column
  :hook
  (org-mode . efs/org-mode-visual-fill))

(use-package org-modern
  :hook
  (org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda)
  :config
  (setq org-pretty-entities t)
  (setq org-modern-fold-stars
	'(("◉" . "◉")
	  ("○" . "○")
	  ("●" . "●")
	  ("○" . "○")
	  ("●" . "●")
	  ("○" . "○")
	  ("●" . "●")))
  (setq org-modern-checkbox
	'((88 . "󰱒")
	  (45 . "󱋭")
	  (32 . "󰄱"))))

(defun my-prompt-knowledge-areas ()
  (let* ((base-dir "~/Documents/Org/")
         (subdirs (mapcar 'file-name-nondirectory
                          (seq-filter 'file-directory-p
                                      (directory-files base-dir t "^[^.]" t))))
         (selection (completing-read "Choose a knowledge area: " subdirs nil nil)))
    (let ((full-path (expand-file-name selection base-dir)))
      (unless (file-directory-p full-path)
        (make-directory full-path))
      full-path)))

(defun my-prompt-knowledge-subjects (directory)
  (let* ((files (seq-filter
                 (lambda (file)
                   (and (file-regular-p file)
                        (string-equal (file-name-extension file) "org")))
                 (directory-files directory t "^[^.]" t)))
         (file-names (mapcar (lambda (file)
                               (file-name-sans-extension (file-name-nondirectory file)))
                             files))
         (selection (completing-read "Choose a subject: " file-names nil nil)))
    (let ((full-path (expand-file-name (concat selection ".org") directory)))
      (unless (file-exists-p full-path)
        (write-region "" nil full-path))
      full-path)))

(defun my-org-goto-or-insert ()
  (if (save-excursion
        (goto-char (point-min))
        (re-search-forward org-heading-regexp nil t))
      (org-goto)
    (goto-char (point-min))))

(setq org-capture-templates
      '(("j" "Journal entry"
         entry (file+olp+datetree "~/Documents/Org/Journal.org")
         "* %?"
         :empty-lines 0)
	("k" "Knowledge entry")
	("ka" "Add subheading"
	 entry (file+function (lambda () (my-prompt-knowledge-subjects (my-prompt-knowledge-areas))) my-org-goto-or-insert)
	 "* %?"
         :empty-lines 1)
	("kn" "New top level heading"
	entry (file (lambda () (my-prompt-knowledge-subjects (my-prompt-knowledge-areas))))
	"* %?"
	:empty-lines 0)))

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)

(defun efs/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/Documents/Org/Emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

(use-package org-ql
  :bind
  ("C-c q" . org-ql-find-in-org-directory))

(use-package git-auto-commit-mode
  :init
  (setq gac-automatically-push-p t))

(provide '.emacs)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
