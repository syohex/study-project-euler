(defun p6 (start end)
  (let ((lst (iota start end)))
   (- (square-of-sum lst) (sum-of-square lst))))

(defun iota (start end)
  (loop for i from start to end
        collect i))

(defun sum-of-square (lst)
  (reduce #'+ (mapcar (lambda (x) (* x x)) lst)))

(defun square-of-sum (lst)
  (let ((val (reduce #'+ lst)))
    (* val val)))
