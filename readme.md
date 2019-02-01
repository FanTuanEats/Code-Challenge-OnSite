# Context

Consider there is a group of restaurants. These restaurants can be ordered and delivered together:

* Each restaurant has one or more business hours on each day of week (11am-9pm, or 10am-2pm + 5pm-10pm, and etc.).
* A restaurant can have different hours on each day of week - assumption about any recurring pattern may be risky.
* Assume all restaurants are in the same time zone.

Model the restaurant hours.

# Challenges

1. Given an arbitrary timestamp, define a method that returns whether all restaurants are open.
2. Given an arbitrary timestamp, define a method that returns all time intervals in the next 48 hours during which all restaurants are open.
3. Assuming all orders can be fulfilled in 30 minutes, and that selectable delivery times are 1-hour apart, define a method that returns all available delivery time between an arbitrary timestamp and the end of day. For example, if a restaurant opens between 5pm-8pm, and the provided timestamp is 5pm today, then available delivery times may be 5:30pm, 6:30pm, 7:30pm, or 8:30pm today.

