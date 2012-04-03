(defun p21 (num)
  (let ((lst (remove-duplicates (amicable-number num) :test #'equal)))
    (loop for (val1 val2) in lst
          summing (+ val1 val2))))

(defun amicable-number (num)
  (let ((lst (range-divisor 2 num)))
    (loop for (key1 val1) in lst
          appending
          (loop for (key2 val2) in lst
                when (and (not (= key1 key2)) (= val1 key2) (= val2 key1))
                  collect (sort (list key1 key2) #'<)))))

(defun range-divisor (start end)
  (loop for i from start to end
        for divs = (divisors i)
        collect (list i (reduce #'+ divs))))

(defun divisors (num)
  (loop for i from 1 below num
        when (zerop (mod num i))
          collect i))