# LuckyAPI

![Screenshot from 2024-02-29 19-35-25](https://github.com/ytsykvas/LuckyAPI/assets/102487287/45b52854-4348-44da-97ca-cb3170f55414)

### Description
Created an API with React as a frontend part with requirements in a letter. I also decided to present the second part of the task on a template.

Not gitignore some data that would be sensitive on a real project, but for ease of testing the project I left it public.
For example, the API key to find out currency rates is not hidden, so that the reviewer does not need to create his own key.

I implemented the coverage of the application with tests. I covered the templates with cucumber tests.
The functional part is covered by Rspec tests.

[Full text of current task](https://drive.google.com/file/d/1_dnemjYG7A0wgVmVDthFR5v-2wzo2M4i/view?usp=drive_link)

## Realization

I covered both tasks with tests. Cucumber tests make us press buttons and other elements, checking the functionality. Rspec tests check the functionality of Ruby classes.

### 1) Display current time for selected cities

We can set the checkboxes on the cities whose time we want to know and get the time and the current UTC time.
We take parameters with a list of required cities, process them using the built-in Time class. The controller returns JSON with the necessary information, after which we process the JSON to display on the page for the user. By default, this task was for the backend, but I decided to display it on the page for clarity.

### 2) SPA for currency conversion

We have exchange rates received from the API in relation to UAH. We can calculate the exchange rate of another currency for hryvnia without reloading the page and without making a request to the server.
Implemented an API call daily at 12:00 on the CRON schedule using Sidekiq to find out the exchange rate of 5 currencies. In order to avoid using a database, which will be slower than simply accessing a hash with several keys, I write the result of the request to a JS file (metaprogramming). And I display the result of the call to the API and the result of calculating the received data on the React component.

### Prerequisites
Ruby 3.2.2,  Rails 7.1.3, Node v18.16.1, npm 9.5.1, yarn 1.22.21, Rspec + Cucumber for test coverage, Puma 5.0, Postman app for manual testing of requests.
### Installation
Clone the repository:
```
git clone git@github.com:ytsykvas/LuckyAPI.git
```
Install dependencies:
```
bundle install
```
Start the server:
```
rails server
```
```
yarn dev
```

Make sure you have Node and npm.

Your RoR app will be available at http://localhost:3000. 
Your Vite+React app will be available at http://localhost:5173/

## Testing

Rpec for form objects in RoR app.
Cucumber for React templates.


### Run for testing:
``` 
bundle exec rspec
```
```
bundle exec cucumber
```
