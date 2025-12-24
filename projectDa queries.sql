select * from customer limit 20

ALTER TABLE customer RENAME COLUMN "Customer ID" TO customer_id;
ALTER TABLE customer RENAME COLUMN "Age" TO age;
ALTER TABLE customer RENAME COLUMN "Gender" TO gender;
ALTER TABLE customer RENAME COLUMN "Location" TO location;
ALTER TABLE customer RENAME COLUMN "Category" TO category;
ALTER TABLE customer RENAME COLUMN "Item Purchased" TO item_purchased;
ALTER TABLE customer RENAME COLUMN "Size" TO size;
ALTER TABLE customer RENAME COLUMN "Color" TO color;
ALTER TABLE customer RENAME COLUMN "Season" TO season;
ALTER TABLE customer RENAME COLUMN "Subscription Status" TO subscription_status;
ALTER TABLE customer RENAME COLUMN "Payment Method" TO payment_method;
ALTER TABLE customer RENAME COLUMN "Shipping Type" TO shipping_type;
ALTER TABLE customer RENAME COLUMN "Discount Applied" TO discount_applied;
ALTER TABLE customer RENAME COLUMN "Promo Code Used" TO promo_code_used;
ALTER TABLE customer RENAME COLUMN "Frequency of Purchases" TO frequency_of_purchases;
ALTER TABLE customer RENAME COLUMN "Previous Purchases" TO previous_purchases;
ALTER TABLE customer RENAME COLUMN "Review Rating" TO review_rating;
ALTER TABLE customer RENAME COLUMN "Purchase Amount (USD)" TO purchase_amount_usd;

select gender, SUM(purchase_amount_usd) as revenue
from customer
group by gender

SELECT customer_id, purchase_amount_usd
FROM customer
WHERE discount_applied = 'Yes'
  AND purchase_amount_usd >= (
        SELECT AVG(purchase_amount_usd)
        FROM customer
      );

select item_purchased, AVG(review_rating::numeric,2) as "Average Product rating"
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5;