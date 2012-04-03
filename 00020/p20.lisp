(defun p20 (num)
  (let ((n (fact num)))
    (sum-of-each-digits n)))

(defun sum-of-each-digits (num)
  (sum-of-each-digits-1 num 0))

(defun sum-of-each-digits-1 (num acc)
  (let ((d (floor (/ num 10)))
        (r (mod num 10)))
    (if (< num 10)
        (+ acc r)
        (sum-of-each-digits-1 d (+ acc r)))))

(defun fact (num)
  (fact-1 num 1))

(defun fact-1 (num acc)
  (if (= num 1)
      acc
      (fact-1 (- num 1) (* acc num))))

(p20 10)
(p20 100)
