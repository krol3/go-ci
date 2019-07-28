package main

import "testing"

func TestCalculatePow(t *testing.T) {
	if calculatePow(2, 5) != 32 {
		t.Fatal("Wrong calculated !!!")
	}
}
