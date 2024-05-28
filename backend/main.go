package main

import (
	"context"
	"database/sql"
	_ "embed"
	"fmt"
	"log"

	"backend/products"

	_ "github.com/mattn/go-sqlite3"
)

//go:embed schema.sql
var ddl string

func run() error {
	ctx := context.Background()

	// Open the SQLite database
	db, err := sql.Open("sqlite3", "database/olist.sqlite")
	if err != nil {
		return err
	}
	defer db.Close()

	// Execute the schema to create tables if they don't exist
	if _, err := db.Exec(ddl); err != nil {
		return err
	}

	queries := products.New(db)

	// Fetch the product with id 732
	productList, err := queries.GetProduct(ctx, 732)
	if err != nil {
		return err
	}

	fmt.Println(productList)
	return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}
