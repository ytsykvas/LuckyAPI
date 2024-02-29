# LuckyAPI

### Description
Created an API with React as a frontend part with requirements in a letter. I also decided to present the second part of the task on a template.

Not gitignore some data that would be sensitive on a real project, but for ease of testing the project I left it public.
For example, the API key to find out currency rates is not hidden, so that the reviewer does not need to create his own key.

I implemented the coverage of the application with tests. I covered the templates with cucumber tests.
The functional part is covered by Rspec tests.

[Full text of current task](https://drive.google.com/file/d/1_dnemjYG7A0wgVmVDthFR5v-2wzo2M4i/view?usp=drive_link)

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
yarn dev
```

Make sure you have Node and npm.

Your RoR app will be available at http://localhost:3000
Your Vite+React app will be available at http://localhost:5173/

## Testing

Rpec + Cucumber

### Run for testing:
``` 
bundle exec rspec
```
bundle exec cucumber
```