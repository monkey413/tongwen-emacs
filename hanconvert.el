;; hanconvert.el -*- coding: utf-8; -*-
;; Copyright (C) 2010-2013 Hoyude <monkey413@gmail.com>
;;
;; Autho: Hoyude <monkey413@gmail.com> 
;; Created: 7 Aug 2013
;; Version: hanconvert.el v0.0
;; Keywords: hanconvert
;; URL: http://monkey413.blogspot.tw/2013/08/emacs.html

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;; Commentary:

;; Install:
;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'hanconvert)
;;
;; you need to install "tongwen-python" and unicad.el with this file  

;; Package-Requires: ((unicad "1.1.4"))

;; Reference: 
;; Copyright 2006 Ye Wenbin
;; Author: wenbinye@163.com
;; URL: http://ar.newsmth.net/att/bb440d0dda3c3/hanconvert.el

;;; Code:

(eval-when-compile
  (require 'cl))

(defun hanconvert-to (type) 
  "Use tongwen to convert the file to traditon chinese or simple chinese" 
  (interactive (list (let ((type (completing-read "Type(default tradition): "
						  '("simple" "trandition"))))
                       (if (string< "" type)
                           (intern type)
                         'tradition))))
  (if (eq type 'tradition)
      (setf type "zht") 
    (setf type "zhs"))
  
  (message type) 
  
  (let ((str "")
	 (dir ""))
     (setf dir (file-name-directory (locate-library "hanconvert.el")))  
     (setf str (concat str "python " dir "tongwen_conv.py -t " type  " < " (buffer-file-name))) 
     (erase-buffer)
     (setf str (shell-command-to-string str))
     (insert str) 
   ))

(provide 'hanconvert)
;;; hanconvert.el ends here

