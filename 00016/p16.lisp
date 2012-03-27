(defun p16 (power)
  (let ((num (expt 2 power)))
    (reduce #'+ (digits-list num))))

(defun digits-list (num)
  (digits-list-1 num '()))

(defun digits-list-1 (num lst)
  (if (zerop num)
      lst
      (digits-list-1 (floor (/ num 10)) (cons (mod num 10) lst))))
