#tongwen-emacs 

emacs plugin to convert the file between simple chinese and traditional chinese

##Installation:
git clone https://github.com/monkey413/tongwen-emacs.git
add below two lines in .emacs
 
    (add-to-list 'load-path "/path/to/folder/")  ;; need to be modified
    (require 'hanconvert)

##Instruction: 
    M-x hanconvert-to

##Require
python2.7 (necessary) 

unicad.el (if you want to save in another encoding)(optional)  

##Reference 
Thanks:

新同文堂 https://code.google.com/p/tongwen-python/

Ye Wenbin http://ar.newsmth.net/thread-4a8b74d0dda3c3.html

