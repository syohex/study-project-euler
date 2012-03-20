(use srfi-1)

(define (p1 n)
  (let ((lst (iota (- n 1) 1)))
    (p1-1 n 1 0)))

(define (p1-1 limit n sum)
  (if (>= n limit)
      sum
      (if (or (= 0 (mod n 3)) (= 0 (mod n 5)))
          (p1-1 limit (+ n 1) (+ sum n))
          (p1-1 limit (+ n 1) sum))))

(p1 10)
(p1 1000)
