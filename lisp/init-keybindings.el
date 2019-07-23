;;因为M-w与我的一个软件AutoInto相冲突了，所以把复制键就变成了C-z
(global-set-key (kbd "C-z") 'kill-ring-save) 


;;这个是buffer窗口的切换
(global-set-key (kbd "M-K") 'windmove-up)
(global-set-key (kbd "M-J") 'windmove-down)
(global-set-key (kbd "M-L") 'windmove-right)
(global-set-key (kbd "M-H") 'windmove-left)

;;这个是buffer窗口的大小调整
(global-set-key (kbd "M-S") 'enlarge-window-horizontally)
(global-set-key (kbd "M-D") 'enlarge-window)
(global-set-key (kbd "M-F") 'shrink-window-horizontally)


(provide 'init-keybindings)

