ProblemTwo
==========

Write a program for managing locker reservations at a hotel concierge  desk. Customers leave bags with the concierge, 
who then uses your program  to determine in which locker to place the bag. The program tells the concierge  
the number of the locker in which to place the bag, and prints a ticket to give  to the customer. Upon return, 
the customer provides the ticket, and the  concierge uses that to look up the corresponding locker, retrieve the bag, 
and  return it to the customer. 
  
There are 1000 small lockers, 1000 medium-­‐sized lockers, and 1000 large  lockers (it’s a big Vegas hotel). 
You can assume that all checked bags fit into  one of these three sizes. The program should always assign the smallest  
available locker that fits the bag.	


Solution
========

To execute the app from the console run: ruby concierge_desk.rb
Ctrl+c exits the application

Valid bag sizes are small, medium, and large
The locker room is setup for 1000 of each size.
Inputting the ticket number redeems the ticket and retrieves the bag.

Additional Notes
================
LockerRoom and TicketService were originally not intended to be singletons. The intent was to make them true services with a service locator. I did not continue down that route due to time. I also wanted to add a yml file to configure the locker room so that it could accept bag sizes and number of lockers for each size as well as rules for which bags could fit in which lockers. 