# Superstore Sales Analysis Using SQL

## Project Overview

Supermarkets generate vast amounts of transactional data daily, covering sales, customer demographics, purchasing behavior, and product performance. However, without structured analysis, valuable insights remain hidden. This project leverages SQL to analyze supermarket sales data, uncover key trends, and provide actionable recommendations to optimize revenue, improve customer retention, and enhance inventory management.

## Dataset Information

- **File Name**: `sales.csv`
- **Key Attributes**:
  - `Branch`: Store location identifier
  - `City`: City where the branch is located
  - `Customer Type`: Member or Normal
  - `Gender`: Male or Female
  - `Product Name`: Item purchased
  - `Product Category`: Category of the purchased item
  - `Quantity`: Number of units purchased
  - `Total Price`: Revenue from the transaction
  - `Reward Points`: Points earned from purchases

## Analysis Process

### 1. Sales and Revenue Optimization

**Objective**: Identify top-performing branches and cities to guide strategic investments and marketing efforts.

- **Which branch had the most high-value sales?**
  - Branch A had the most high-value sales. However, it is spread across two cities: New York and Chicago.
- **Which branch has the highest total sales?**
  - Branch A recorded the highest total sales.
- **Which cities generate the highest revenue?**
  - Chicago, New York, and Los Angeles ranked as the top three revenue-generating cities respectively.
- **What is the distribution of customer types?**
  - Out of 1,000 customers, 516 were Members, and 484 were Normal customers.
- **What is the average sale value per branch and customer type?**
  - **Branch A**: Members - \$127, Normal - \$117
  - **Branch B**: Members - \$111, Normal - \$108

### 2. Customer Retention and Behavior Insights

**Objective**: Understand customer preferences and behaviors to improve retention and loyalty programs.

- **Which customer type purchases the highest average quantity per transaction?**
  - Both customer types purchase an average of 10 units per transaction.
- **How does the average transaction price differ by gender and branch?**
  - **Branch A**: Female - \$122, Male - \$123
  - **Branch B**: Female - \$99, Male - \$118
- **Which products earned the highest reward points and sales?**
  - **Top 3 products**: Shampoo (\$27,041), Notebook (\$24,792), Apple (\$19,614)
- **Total revenue per customer type across branches**
  - **Branch A**: Members - \$45,288, Normal - \$37,522
  - **Branch B**: Members - \$17,924, Normal - \$17,847

### 3. Product Performance and Inventory Optimization

**Objective**: Optimize inventory by identifying best-selling and least-selling products.

- **Which product categories contribute most to sales?**
  - Personal Care (\$27,050) and Stationery (\$20,737) are the highest revenue contributors.
- **Best-selling and least-selling products per branch**
  - **Branch A**: Best - Shampoo (1,579 units), Least - Apple (1,300 units)
  - **Branch B**: Best - Orange Juice (853 units), Least - Apple (441 units)
- **Most frequently purchased products by customer type**
  - **Members**: Shampoo (119 purchases)
  - **Normal**: Orange Juice (106 purchases)
- **Which product categories perform best in each branch?**
  - **Branch A**: Fruits
  - **Branch B**: Personal Care

### 4. Business Strategy and Optimization

**Objective**: Identify opportunities for revenue growth and customer retention.

- **Customer retention rate based on revenue contribution**
  - Members contribute significantly more revenue (\$632,139) than Normal customers (\$55,370).
- **Branch with the highest concentration of high-spending customers**
  - Branch A.
- **Branch with the highest total reward points redeemed**
  - Branch A.

## Business Recommendations

Based on the SQL analysis, the following strategic recommendations are proposed:

1. **Expand operations in top-performing cities (Chicago, New York, Los Angeles)** to maximize revenue growth.
2. **Enhance membership programs** as members generate more revenue and contribute to higher retention rates.
3. **Target personalized promotions** for female customers in Branch B to increase transaction value.
4. **Optimize inventory planning** by prioritizing high-demand products such as Shampoo and Notebook.
5. **Reevaluate pricing strategies for low-performing products** like Apple in Branch B to improve sales.

## How to Use This Repository

### Prerequisites

- SQL-compatible database software (e.g., MySQL, PostgreSQL, SQL Server)
- Dataset (`sales.csv`)

### Steps to Reproduce Analysis

1. Import the dataset into your database.
2. Execute the provided SQL queries to extract insights.
3. Modify queries if needed to explore additional insights.

## Conclusion

This project demonstrates the power of SQL in deriving actionable insights from supermarket sales data. By analyzing transaction patterns, customer behaviors, and product performance, businesses can make informed decisions that drive revenue growth, improve customer loyalty, and enhance operational efficiency.

---

For any inquiries or contributions, feel free to connect with me on [GitHub](https://github.com/Chikeobigwe).


