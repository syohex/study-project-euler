(defun fib (n)
  (cond ((= n 1) 1)
        ((= n 2) 2)
        (t
         (fib1 (- n 2) 1 2))))

(defun fib1 (n a b)
  (if (= n 1)
      (+ a b)
      (fib1 (- n 1) b (+ a b))))

(defun fib-list (limit)
  (fib-list1 limit '() 1))

(defun fib-list1 (limit lst n)
  (let ((val (fib n)))
    (if (>= val limit)
        lst
        (if (evenp val)
            (fib-list1 limit (cons val lst) (+ n 1))
            (fib-list1 limit lst (+ n 1))))))

(defun p2 (&optional (limit 4000000))
  (reduce #'+ (fib-list limit)))
