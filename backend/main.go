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

	router.GET("/GetSalesByCategory", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetSalesByCategory(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetCustomerDistributionByState", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetCustomerDistributionByState(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetTopSellersBySales", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetTopSellersBySales(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetReviewScoreDistribution", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetReviewScoreDistribution(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetAverageReviewScoreOverTime", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetAverageReviewScoreOverTime(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetPaymentMethodsDistribution", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetPaymentMethodsDistribution(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetInstallmentsUsage", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetInstallmentsUsage(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.GET("/GetTotalSalesOverTime", func(c *gin.Context) {
		ctx := context.Background()
		data, err := queries.GetTotalSalesOverTime(ctx)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, data)
	})

	router.Run(":8080") // Run on port 8080
}
