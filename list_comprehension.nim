import future

echo lc[x*2 | (x <- 1..10), int] #@[2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

echo lc[x*2 | (x <- 1..10, x mod 2==0), int] #@[4, 8, 12, 16, 20]

let words = ["Hello", "World!", "Ignore me"]
echo lc[word | (word <- words, word != "Ignore me"), string] #@[ Hello World! ]

echo lc[x*y | (x <- 1..2, y <- 2..3), int] #@[ 2, 3, 4, 5 ]
