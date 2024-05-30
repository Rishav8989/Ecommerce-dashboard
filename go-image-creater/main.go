package main

import (
	"encoding/json"
	"fmt"
	charts "go-pdf/modules"
	"io"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	// Initialize the Gin router
	r := gin.Default()

	// Define a route to fetch JSON data and generate a chart
	r.GET("/generate-chart", generateChartHandler)

	// Run the server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8081"
	}
	err := r.Run(":" + port)
	if err != nil {
		fmt.Printf("Error starting server: %v", err)
	}
}

func generateChartHandler(c *gin.Context) {
	// Fetch JSON data from the endpoint
	data, err := fetchData("http://localhost:8080/GetSalesByCategory")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch data"})
		return
	}

	// Parse the JSON data into a slice of SalesData structs
	var salesData []charts.SalesData
	if err := json.Unmarshal(data, &salesData); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to parse JSON data"})
		return
	}

	// Generate a chart based on the sales data
	img, err := charts.GenerateChart(salesData)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate chart"})
		return
	}

	// Return the generated chart as a response
	c.Data(http.StatusOK, "image/png", img)
}

func fetchData(url string) ([]byte, error) {
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	return io.ReadAll(resp.Body)
}
