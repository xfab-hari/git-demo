/*
Copyright © 2022 NAME HERE <EMAIL ADDRESS>
*/
package main

import (
	"fmt"
	"os"
	"strconv"
)

// Calculator struct to hold the calculator state
type Calculator struct {
	result float64
}

// NewCalculator creates a new calculator instance
func NewCalculator() *Calculator {
	return &Calculator{result: 0}
}

// Add performs addition
func (c *Calculator) Add(x float64) {
	c.result += x
}

// Subtract performs subtraction
func (c *Calculator) Subtract(x float64) {
	c.result -= x
}

// Multiply performs multiplication
func (c *Calculator) Multiply(x float64) {
	c.result *= x
}

// Divide performs division
func (c *Calculator) Divide(x float64) error {
	if x == 0 {
		return fmt.Errorf("division by zero")
	}
	c.result /= x
	return nil
}

// GetResult returns the current result
func (c *Calculator) GetResult() float64 {
	return c.result
}

func main() {
	calc := NewCalculator()

	if len(os.Args) < 4 {
		fmt.Println("Usage: calculator <number1> <operation> <number2>")
		fmt.Println("Operations: +, -, *, /")
		return
	}

	num1, err := strconv.ParseFloat(os.Args[1], 64)
	if err != nil {
		fmt.Printf("Error parsing first number: %v\n", err)
		return
	}

	num2, err := strconv.ParseFloat(os.Args[3], 64)
	if err != nil {
		fmt.Printf("Error parsing second number: %v\n", err)
		return
	}

	calc.result = num1

	switch os.Args[2] {
	case "+":
		calc.Add(num2)
	case "-":
		calc.Subtract(num2)
	case "*":
		calc.Multiply(num2)
	case "/":
		if err := calc.Divide(num2); err != nil {
			fmt.Printf("Error: %v\n", err)
			return
		}
	default:
		fmt.Println("Invalid operation. Use: +, -, *, /")
		return
	}

	fmt.Printf("Result: %.2f\n", calc.GetResult())
}
