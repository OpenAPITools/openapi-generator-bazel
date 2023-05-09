package main

import (
	"log"
	sw "petstore"
)

func main() {
	log.Printf("Server started")
	router := sw.NewRouter()
	log.Fatal(router.Run(":8080"))
}
