package charts

import (
	"bytes"
	"encoding/json"
	"fmt"

	"github.com/wcharczuk/go-chart"
)

// SalesData represents the JSON structure of sales data for each product category.
type SalesData struct {
	ProductCategoryNameEnglish struct {
		String string `json:"String"`
		Valid  bool   `json:"Valid"`
	} `json:"ProductCategoryNameEnglish"`
	TotalSales struct {
		Float64 float64 `json:"Float64"`
		Valid   bool    `json:"Valid"`
	} `json:"TotalSales"`
}

// GenerateChart generates a bar chart based on the sales data from the GetSalesByCategory endpoint.
func GenerateChart(data []SalesData) ([]byte, error) {
	var bars []chart.Value
	for _, dp := range data {
		if dp.ProductCategoryNameEnglish.Valid && dp.TotalSales.Valid {
			// Use ProductCategoryNameEnglish.String as the label and TotalSales.Float64 as the value
			bars = append(bars, chart.Value{
				Label: dp.ProductCategoryNameEnglish.String,
				Value: dp.TotalSales.Float64,
			})
		}
	}

	graph := chart.BarChart{
		Title:    "Sales by Product Category",
		Height:   512,
		BarWidth: 60,
		Bars:     bars,
		XAxis: chart.Style{
			Show: true, // Show x-axis
		},
		YAxis: chart.YAxis{
			ValueFormatter: chart.FloatValueFormatter,
			Style:          chart.StyleShow(), // Show y-axis
		},
	}

	buffer := bytes.NewBuffer([]byte{})
	err := graph.Render(chart.PNG, buffer)
	if err != nil {
		return nil, err
	}

	return buffer.Bytes(), nil
}

// ParseJSON parses JSON data into a slice of SalesData.
func ParseJSON(jsonData []byte) ([]SalesData, error) {
	var salesData []SalesData
	err := json.Unmarshal(jsonData, &salesData)
	if err != nil {
		return nil, fmt.Errorf("failed to unmarshal JSON data: %v", err)
	}
	return salesData, nil
}
