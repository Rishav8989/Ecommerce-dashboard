package main

import (
	"context"
	"database/sql"
	"log"
	"net/http"

	"github.com/Rishav8989/Ecommerce-dashboard/dataset"
	"github.com/gin-gonic/gin"
	_ "github.com/mattn/go-sqlite3"
)

func main() {
	router := gin.Default()

	// Connect to the SQLite database
	db, err := sql.Open("sqlite3", "olist.sqlite")
	if err != nil {
		log.Fatalf("failed to connect to the database: %v", err)
	}
	defer db.Close()

	queries := dataset.New(db)

	router.GET("/order-items/:id", func(c *gin.Context) {
		ctx := context.Background()
		orderID := c.Param("id")
		nullStringID := sql.NullString{String: orderID, Valid: true}

		productList, err := queries.SearchOrderItemsByOrderID(ctx, nullStringID)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		c.JSON(http.StatusOK, productList)
	})

	router.Run(":8080") // Run on port 8080
}
