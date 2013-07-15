#lang scribble/lp

Fizzbuzz is a simple program that counts from 1 to 100 replacing multiples
of 3 with "Fizz", multiples of 5 with "Buzz" and multiples of both 3 and 5 with
"FizzBuzz".

Essentially, we want to map over the numbers from 1 to 100, applying a function
that converts the multiples of 3 and 5 to the correct word, and then print the
result.

@chunk[<loop>
       (for ([i (stream-map fb (in-range 1 101))])
         (printf "~a\n" i))]

The function @racket[fb] is used to transform numbers into the correct
string, e.g. @racket["1"], @racket["2"], @racket["Fizz"] ...


Inside @racket[fb] we have a local function definition; @racket[divides],
returns true if the second argument divides into the first.

@chunk[<fb>
       (define (fb n)
         (local [(define (divides n m) (= 0 (modulo n m)))]
           <fb-cond>))]

The main body of the function is a single conditional. If the argument is
divisible by both 3 we return @racket["Fizz"] and if it is divisible by 5 we
return @racket["Buzz"]. If it is divisible by both 3 and 5 (equivalent to being
divisible by 15) we return @racket["FizzBuzz"]. If the number is not divisible
by 3 or 5 then we simply convert the number into a string.

@chunk[<fb-cond>
       (cond [(divides n 15) "FizzBuzz"]
             [(divides n 5) "Buzz"]
             [(divides n 3) "Fizz"]
             [else (number->string n)])]


@racket[scribble-lp] uses @racket[racket/base] rather
than @racket[racket], so we need to include the modules for the @racket[local]
and @racket[stream-map] functions.

@chunk[<require>
       (require racket/local)
       (require racket/stream)]

The @racket[<*>] chunk is then used to pull all the parts of the program together.

@chunk[<*>
       <require>
       <fb>
       <loop>]
