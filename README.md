# Zomato_food_delivery_SQL_Analysis

This project analyzes a food delivery sessions dataset to understand user ordering behavior, restaurant performance, and delivery trends. The analysis is performed using SQL to extract meaningful business insights from the data.

The goal of this project is to demonstrate practical SQL skills used in real-world data analysis, including data exploration, aggregation, ranking, and conditional analysis.

# Tools Used
- SQL
- MySQL

# Dataset Description

The dataset contains user session and restaurant information from a food delivery platform. 
Important fields include:

- User ID
- Restaurant ID
- Restaurant Name
- Restaurant City
- Restaurant Rating
- Restaurant Type
- Weather Condition
- Delivery Time
- Online Order Availability
- Cart Items
- Session Information

The dataset contains 57 columns in total, capturing detailed information about user sessions, restaurant characteristics, and ordering behavior.

# Key Analysis Performed

# Data Exploration

- Total number of users
- Total number of restaurants
- Total sessions recorded
  
# Order Behavior Analysis

- Number of orders placed
- Number of sessions without orders
- Order distribution across cities
  
# Restaurant Performance Analysis

- Top 5 restaurants with highest orders
- Lowest performing restaurants
- Most popular restaurant types
  
# Rating Analysis

- Classification of restaurants based on rating using CASE statements
    - Restaurants categorized as:
        - Excellent
        - Medium
        - Low
          
# City-Level Ranking

- Ranking restaurants within each city based on rating using window functions
  
# Advanced SQL Techniques

- Subqueries
- Window functions (RANK)
- CTE (Common Table Expressions)
- Conditional logic using CASE
  
# SQL Concepts Demonstrated

  - This project demonstrates the following SQL concepts:

    - SELECT statements
    - WHERE filtering
    - GROUP BY
    - ORDER BY
    - Aggregate functions (COUNT, AVG, MIN, MAX)
    - CASE statements
    - HAVING clause
    - Window functions
    - CTE
    - Subqueries

# Example Business Insights

- Some insights that can be derived from this analysis include:
    - Highly rated restaurants tend to receive more orders.
    - Certain restaurant types are more popular among users.
    - Order activity varies significantly across cities.
    - Weather conditions may influence ordering behavior.
    - Delivery time varies depending on location.

- All SQL queries used in this analysis can be found in:
  "zomato_sql_analysis.sql".
  
# Future Improvements

This project will be extended by creating an interactive dashboard using Power BI to visualize the insights and make the analysis more interactive.



