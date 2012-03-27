(defun p10 (limit)
  (let ((lst (itoa 2 limit)))
    (reduce #'+ (remove-if-not #'prime-p lst))))

(defun itoa (start end)
  (loop for i from start to end
        collect i))

(defun prime-p (num)
  (prime-p1 num 2))

(defun prime-p1 (num div)
  (if (> div (sqrt num))
      t
      (if (zerop (mod num div))
          nil
          (prime-p1 num (if (= div 2) 3 (+ div 2))))))

(p10 10)
(p10 100000)
