(defun p24 (index)
  (let ((lst (selector (- index 1) 10)))
    (loop with elems = (itoa 0 9)
          for i in lst
          collect (let ((head (take i elems))
                        (tail (drop i elems)))
                    (setq elems (append head (cdr tail)))
                    (format t "~S ~%" elems)
                    (car tail)))))

(defun take (n lst)
  (if (= n 0)
      '()
      (cons (car lst) (take (- n 1) (cdr lst)))))

(defun drop (n lst)
  (if (= n 0)
      lst
      (drop (- n 1) (cdr lst))))

(defun extract-index (index lst)
  (if (= index 0)
      (car lst)
      (extract-index (- index 1) (cdr lst))))

(defun selector (index n)
  (if (= n 0)
      '()
      (cons (floor (/ index (fact (1- n))))
            (selector (mod index (fact (1- n))) (1- n)))))

(defun itoa (start end)
  (loop for i from start to end
        collect i))

(defun fact (n)
  (reduce #'* (itoa 1 n)))

(p24 1000000)
