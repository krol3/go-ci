package main

import (
	"fmt"
	"math"
)

func calculatePow(x float64, y float64) float64 {
	return math.Pow(x, y)
}

func main() {
	fmt.Println("Go CI Pipeline Demo")
	fmt.Println(calculatePow(2, 5))
}
