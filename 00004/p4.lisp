(defun p4 (digits)
  (let* ((start (expt 10 (- digits 1)))
         (end (expt 10 digits))
         (pairs (append (combination (iota start end) 2)
                        (same-number-list start end)))
         (candidates (remove-if-not (lambda (x)
                                      (palindromic-number-p (pair-mul x)))
                                    pairs)))
    (car (sort candidates (lambda (a b)
                            (> (pair-mul a) (pair-mul b)))))))

(defun same-number-list (start end)
  (loop for i from start below end
        collect (list i i)))

(defun iota (start end)
  (loop for i from start below end
        collect i))

(defun pair-mul (pair)
  (* (car pair) (cadr pair)))

(defun combination (lst n)
  (cond ((null lst) nil)
        ((or (> n (length lst)) (= n 0)) nil)
        ((= n 1) (mapcar #'list lst))
        ((= n (length lst)) (list lst))
        (t
         (let ((head (car lst))
               (tail (cdr lst)))
          (append (mapcar (lambda (x) (cons head x)) (combination tail (- n 1)))
                  (combination tail n))))))

(defun palindromic-number-p (num)
  (let ((str (princ-to-string num)))
    (string= str (reverse str))))
