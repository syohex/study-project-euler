(defun p19 (start_y start_m end_y end_m)
  (loop for (year month) in (year-month-pairs start_y start_m end_y end_m)
        counting (= 0 (zeller year month))))

(defun year-month-pairs (start_y start_m end_y end_m)
  (loop for y from start_y to end_y appending
        (loop for m from (if (= y start_y) start_m 1)
                    to   (if (= y end_y)   end_m 12)
              collect (list y m))))

;; Zeller's congruence
;; w = (y + [y/4] - [y/100] + [y/400] + [(26*m + 16)/10] + d) mod 7
(defun zeller (year month)
  (let ((y year) (m month))
    (if (or (= m 1) (= m 2))
        (setq y (1- year) m (+ m 12)))
    (floor (mod (+ y (div y 4.0) (- (div y 100.0)) (div y 400.0) (div (+ (* 26 m) 16) 10.0) 1) 7))))

(defun div (a b)
  (floor (/ a b)))

(p19 1901 1 2000 12)
