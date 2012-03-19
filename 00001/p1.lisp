(defun p1 (&optional (n 1000))
  (let ((lst (loop for i from 1 below n collect i)))
    (apply #'+ (remove-if-not (lambda (x)
                                (or (= (mod x 3) 0) (= (mod x 5) 0)))
                              lst))))

(p1 10)
(p1 1000)
