Zomato is a leading online food delivery service that connects users with various restaurants and cuisines, allowing them to browse menus, place orders, and get meals delivered to their doorsteps.

Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions, each item's order was swapped with the item in the subsequent row. As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.

If the last item has an odd order ID, it should remain as the last item in the corrected data. For example, if the last item is Order ID 7 Tandoori Chicken, then it should remain as Order ID 7 in the corrected data.

In the results, return the correct pairs of order IDs and items.


<img width="884" alt="image" src="https://github.com/compBiophyMete/SQL-Challanges/assets/135632077/08695ec1-2758-4b3e-8bed-3c0981910a80">


Here's a sample of the initial incorrect data:

<img width="884" alt="image" src="https://github.com/compBiophyMete/SQL-Challanges/assets/135632077/7e797fdc-7f1f-4eb5-89f3-39c08649b84a">


The corrected data should look like this:

<img width="884" alt="image" src="https://github.com/compBiophyMete/SQL-Challanges/assets/135632077/e3cd8d3f-9315-4e7f-bf41-b99c981ffcd4">

Order ID 1 is now associated with Pizza and Order ID 2 is paired with Chow Mein. This adjustment ensures that each order is correctly aligned with its respective item, addressing the initial swapping error.

Order ID 7 remains unchanged and is still associated with Tandoori Chicken. This preserves the order sequence ensuring that the last odd order ID remains unaltered.

The dataset you are querying against may have different input & output - this is just an example!
