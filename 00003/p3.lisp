(defun p3 (n)
  (find-if #'is-prime (factors n)))

(defun factors (n)
  (let ((limit (sqrt n))
        (lst (if (= (mod n 2) 0)
                 '(2)
                 '())))
    (factors1 n limit 3 lst)))

(defun factors1 (num limit n lst)
  (if (>= n limit)
      lst
      (if (= (mod num n) 0)
          (factors1 num limit (+ n 2) (cons n lst))
          (factors1 num limit (+ n 2) lst))))

(defun is-prime (n)
  (cond ((= n 2) t)
        ((= (mod n 2) 0) nil)
        (t
         (let ((limit (sqrt n)))
           (loop for i from 3 below limit by 2
                 finally (return t)
                 do
                 (if (= (mod n i) 0)
                     (return nil)))))))

(p3 13195)
(p3 600851475143)
