---
title: Fibonacci Sequence
date: 2020-02-15
type: converted-post
---

> Originally published: 2020-02-15


{% include mathjax.html %}

- [Fibonacci Sequence](#fibonacci-sequence)
	- [Some properties of Fibonacci numbers](#some-properties-of-fibonacci-numbers)
		- [Golden ratio (φ)](#golden-ratio-%cf%86)
		- [Every nth number if multiple of fib(n)](#every-nth-number-if-multiple-of-fibn)
		- [Exact divisibility of fib(n)](#exact-divisibility-of-fibn)
	- [Finding Nth term of a Fibonacci sequence](#finding-nth-term-of-a-fibonacci-sequence)
		- [Using golden ratio](#using-golden-ratio)
		- [Using matrix](#using-matrix)
		- [Code](#code)
	- [References](#references)

# Fibonacci Sequence

Fibonacci sequence is a series of numbers, where each number is the sum of previous 2 numbers.

$$Ex: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 \ldots$$

## Some properties of Fibonacci numbers

### Golden ratio (φ)

The ratio of the fibonacci numbers are close to the golden ratio. $φ = 1.618…$

$$
3/2  = 1.5 \\
5/3  = 1.666 \\
8/5  = 1.6 \\
13/8 = 1.625 \\
\ldots \\
233/144 = 1.618055\ldots \\
377/233 = 1.618025\ldots \\
$$

### Every nth number if multiple of fib(n)

| n=     | 0  | 1  |2  |3  |4  |5  |6  |7  |8  |9  |10 |11 |
|--------|----|----|---|---|---|---|---|---|---|---|---|---|
| $$Fib_n$$  |  0 | 1  |1  |2  |3  |5  |8  |13 |21 |34 |55 |89 |

- $$3^{rd}$$ fibonacci number is 2 and every $$3^{rd}$$ number is a multiple of 2
- $$4^{th}$$ fibonacci number is 3 and every $$4^{th}$$ number is a multiple of 3
- $$5^{th}$$ fibonacci number is 5 and every $$5^{th}$$ number is a multiple of 5

### Exact divisibility of fib(n)

Two fibonacci numbers are exactly divisible if and only of their indices are exactly divisible

$$
\frac {fib_{n}} {fib_{m}} = 0
\text{ If and only if }
\frac{n}{m} == 0
$$

## Finding Nth term of a Fibonacci sequence

### Using golden ratio

Phi(φ), golden ratio is a special number.

$$
φ = \frac{(1+ \sqrt{5})}{2} = 1.618034….
$$

We can calculate $$n^{th}$$ term of a fibonacci sequence using a formula,

$$
fib(n) =  \frac{( φ^n - (1-φ)^n)}{\sqrt{5}} \\ \\
\text{ } \\
fib(6) = (1.61803^6 -  ( -0.61803) ^6) /√5 = 8.000000000000002≃ 8
$$

### Using matrix

$$
\begin{bmatrix}
 1 && 1 \\
 1 && 0
\end{bmatrix}
$$

Multiplying the above matrix n times my itself, will result in a matrix, whose (0, 1) or (1, 0) element would be the nth fibonacci number.

Base rule of Fibonacci numbers is $$f(n) = f(n-1) + f(n-2)$$

$$
\begin{bmatrix}
 f_n \\
 f_{n-1}
\end{bmatrix} =

\begin{bmatrix}
 f_{n-1} + f_{n-2} \\
 f_{n-1}
\end{bmatrix}
$$

Above could be represented as,

$$
\begin{bmatrix}
 f_n \\
 f_{n-1}
\end{bmatrix} =

\begin{bmatrix}
 1 && 1 \\
 1 && 0
\end{bmatrix}

*

\begin{bmatrix}
 f_{n-1} \\
 f_{n-2}
\end{bmatrix}
$$

if we represent the matrix as below,

$$
F_n = \begin{bmatrix}
 f_n \\
 f_{n-1}
\end{bmatrix}
$$

then the above can be represented as $$F_n = C *  F_{n-1}$$

And now with recurrence, we can see how we can find the nth fibonacci number by matrix multiplication.

$$
F_1  = C * F_0  \text{ (Base case, n = 1}) \\
F_2  = C * F_1 = C * ( C * F_0) = C^2 * F_0 \\
F_3  = C * F_2 = C^2 * ( C * F_0) = C^3 * F_0 \\
\vdots  \\
F_n  = C^n * F_0 \\

\text { } \\ \text { } \\
\text {Substituting F back }
\text { } \\ \text { } \\

F_n =

\begin{bmatrix}
 1 && 1 \\
 1 && 0
\end{bmatrix} ^ n
$$

### Code
[Code for finding nth term in fibonacci series](https://github.com/naren-m/programming_practice/blob/master/general/fibonacci.py)

## References

- [Math world](http://mathworld.wolfram.com/FibonacciNumber.html)
- [Wikipedia](https://en.wikipedia.org/wiki/Fibonacci_number)
- [Math survey UK](http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fib.html)
- [Maths is fun](https://www.mathsisfun.com/numbers/fibonacci-sequence.html)
- [Fibonacci Mystery - Numberphile
](https://www.youtube.com/watch?v=Nu-lW-Ifyec)
- [Mathjax quick reference](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)
- [LaTeX Basics](https://en.wikibooks.org/wiki/LaTeX/Basics)