package main

import (
	"context"
	"database/sql"
	_ "embed"
	"fmt"
	"log"

	"github.com/Rishav8989/Ecommerce-dashboard/dataset"
	_ "github.com/mattn/go-sqlite3"
)

//go:embed schema.sql
var ddl string

func run() error {
	ctx := context.Background()

	// Open the SQLite database
	db, err := sql.Open("sqlite3", "olist.sqlite")
	if err != nil {
		return err
	}
	defer db.Close()

	// // Execute the schema to create tables if they don't exist
	// if _, err := db.Exec(ddl); err != nil {
	// 	return err
	// }

	queries := dataset.New(db)

	uniqueID := sql.NullString{String: "e481f51cbdc54678b7cc49136f2d6af7", Valid: true}
	productList, err := queries.SearchOrderItemsByOrderID(ctx, uniqueID)
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
