package main

import (
  "fmt"
  "github.com/go-errors/errors"
)

func main() {
  fmt.Println("Hello world!")
  fmt.Println(errors.Errorf("oh dear"))
}
