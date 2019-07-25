
(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;;
;; save autosave and backup directory
;;
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)

;;
;; custom variable path
;;
(setq custom-file "~/.emacs.d/custom-variables.el")
(load custom-file)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(if (display-graphic-p)
    (progn
      (use-package solarized-theme
        :config
        (load-theme 'solarized-dark t)))
      (use-package atom-one-dark-theme
        :config
        (load-theme 'atom-one-dark)))

;; 设置emacs 环境变量
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;将模块化后的几个文件加载到load-path中
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/custom")


(require 'setup-general)

(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)
(require 'init-keybindings)


(show-paren-mode t)
;;
;; Hide Block        C-c @ C-h
;; Show Block        C-c @ C-s
;; Hide All          C-c @ C-M-h
;; Show All          C-c @ C-M-s
;; Hide Level        C-c @ C-l
;; Toggle Hiding     C-c @ C-c
;;
(add-hook 'prog-mode-hook #'hs-minor-mode)

;;高亮当前行
(global-hl-line-mode 1)


;; 显示行号
(global-linum-mode 1)

;; 关闭文件滑动控件
(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)))

;;菜单隐藏
(menu-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


;;关闭声音
(setq ring-bell-function 'ignore)
