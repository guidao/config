package main

import (
	"fmt"
	"sort"
)

func main() {
	var a []int
	i := 987654321
	for {
		if i <= 1 {
			break
		}
		fmt.Println(i)
		a = append(a, i)
		if i%2 == 0 {
			i = i / 2
		} else {
			i = i/2 + 1
		}
	}

	sort.Ints(a)
	initPos := 1
	for _, m := range a[1:] {
		initPos = (floor(m)-initPos)*2 + 1
	}
	fmt.Println("result:", initPos)
}

func floor(a int) int {
	if a%2 == 0 {
		return a / 2
	} else {
		return a/2 + 1
	}
}
