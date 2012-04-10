(defun p29 (a-limit b-limit)
  (length (remove-duplicates (powered-num a-limit b-limit))))

(defun powered-num (a-limit b-limit)
  (loop for a in (itoa 2 a-limit)
        appending
        (loop for b in (itoa 2 b-limit)
              collect (expt a b))))

(defun itoa (start end)
  (loop for i from start to end collect i))

(p29 100 100)