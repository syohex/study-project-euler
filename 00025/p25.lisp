(defun p25 (digits)
  (loop for i from 1
        when (>= (number-digits (fib i)) digits)
          return i))

(defun fib (n)
  (cond ((or (= n 1) (= n 2)) 1)
        (t
         (fib-1 (- n 2) 1 1))))

(defun fib-1 (n a b)
  (if (= n 1)
      (+ a b)
      (fib-1 (- n 1) b (+ a b))))

(defun number-digits (num)
  (if (< num 10)
      1
      (+ 1 (number-digits (floor (/ num 10))))))

(p25 3)
(p25 1000)
