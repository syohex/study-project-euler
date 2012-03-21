(defun p5 (start end)
  (reduce #'my-lcm (loop for i from start to end
                         collect i)))

(defun my-gcd (a b)
  (let ((remainder (mod a b)))
    (if (= remainder 0)
        b
        (my-gcd b remainder))))

(defun my-lcm (a b)
  (/ (* a b) (my-gcd a b)))
