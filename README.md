#Ice Cube Scheduler With Recurring Select

##About

This is a simple application meant to test the [ice cube](https://github.com/seejohnrun/ice_cube "ice cube") gem with [ recurring select](https://github.com/GetJobber/recurring_select "recurring_select") to create a recurring schedule within a model. In my case I wanted to create recurring payments for a given account. Meant to try it out before applying it to the main application I'm working on.


##Details
So I have it set up in a way where you can store the schedules withing a model or store rules connected to an account on another table. I will end up using just the field in the main table without reference table but it's good to see both solutions.

## Starting it up.

Install the gems

    bundle install

Migrate data

    rake db:migrate

Load data

    rake db:seed

#####Note
The application contains certain comments that may help you understand what is going on.

###ENJOY!
