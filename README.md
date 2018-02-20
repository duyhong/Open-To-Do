# Open To Do

 An externally usable API for a basic to-do list application. This API will allow users to modify user accounts and to-do items from the command line.

![Blocipedia Wikis](../master/screenshots/open-to-do.png)

## Use Case

Apps like [Todo.txt](http://todotxt.com/) go a long way towards solving this problem by creating a simple API that any programmer can easily navigate and extend. Like Todo.txt, this app will be easy to control from the command line.

The API allow you to change the same data from the command line or the browser. This API can support other platforms and allow programmers to build on your tool in new and exciting ways.

## Features
* Return JSON representations of users, lists, and items

* Authenticate user from the command line, using a username and password

* Create new users, lists, and items from the command line

* Remove users and lists from the command line

* Update list and item attributes from the command line

## Configuration
### Mac and Linux Users

Most tools related to Ruby on Rails (commonly referred to as "Rails") are optimized for Unix-based operating systems, like OS X and Linux. If you are using a Unix-based operating system, I advise you to create a local developer environment. This means you'll install software on your computer, and won't use a virtual machine or a cloud service.

Because many installation instructions are dependent on the version of your OS, I'll refer you to the instructions on [Install Rails](http://installrails.com/), which will provide you with customized installation steps. Follow the instructions, stopping at the section on Sublime Text.

### Windows Users

While it's possible to install Rails on a Windows computer, it is much more difficult. Installation bugs on Windows are highly unpredictable and can take many hours to fix - often incompletely. This is not the sort of frustration you want when you're just getting started.

As a consequence, I suggest using Cloud9, which is a browser-based development environment. You can quickly set up a free account with Cloud9. Cloud9 allows you to easily log in, edit, save, and collaborate on code. I strongly advise people on Windows computers to get started with Cloud9.

For now, go to [c9.io](https://c9.io/) and sign up for a free account to use Cloud9. Once logged in, follow these steps to create a new workspace:

  1. Click the "Create a new workspace" button.
  2. Name your project "open-to-do". Leave the Description field blank.
  3. Choose "Public" for the git repository options. Leave the Clone from Git or Mercurial URL field blank.
  4. Choose the "Rails/Ruby" template from the options below.
  5. Click the "Create workspace" button.

### Pull Down the Code

  Start by cloning the repository:

  ```
  $ git clone https://github.com/duyhong/Open-To-Do.git Open-To-Do
  ```

### Reset Git

   This will be your personal application. So all of the past commit history that I used to build this  app aren't needed. Also you will want to be able to push/pull code from your personal remote (Github) repository and NOT my remote (Github) repository.

   Remove the existing local Git repository:

   ```
   $ rm -r -f .git
   ```

### Update the Application

 You  must update the application with  `bundle install`

 ```
 $ bundle install
 ```
 This command installs everything specified in the Gemfile and ensures that all of the gems work harmoniously.

## Test the code

  * From the Rails console, confirm that  `puts JSON.pretty_generate(UserSerializer.new(User.first).as_json)` outputs the JSON representation of a `User`.

  ![](../master/screenshots/test_user.png)

  * From the Rails console, confirm that  `puts JSON.pretty_generate(ListSerializer.new(List.first).as_json)` outputs the JSON representation of a `List`.

  ![](../master/screenshots/test_list.png)

  * From the Rails console, confirm that  `puts JSON.pretty_generate(ItemSerializer.new(Item.first).as_json)` outputs the JSON representation of an `Item`.

  ![](../master/screenshots/test_item.png)

## Usage

  Start the Rails server from your command line:
  ```
  $ rails s
  ```
  The server will start up. To stop the server, press `ctrl + c`.

  Once the rails server started:

  * Create users via the Rails console.

  ![](../master/screenshots/create_user.png)

  * From the command line, retrieve all the users via a curl request.

  ![](../master/screenshots/retrieve_user.png)

  * Create `User`, `List`, `Item` from the command line:

    ```
    $ curl -u username:password -d "user[username]=Sterling" -d "user[password]=Archer" http://localhost:3000/api/users/
    ```
    ```
    $ curl -u username:password -d "list[name]=Things to do today" -d "list[permissions]=private" http://localhost:3000/api/users/1/lists
    ```
    ```
    $ curl -u username:password -d "item[description]=Dance if you want to" http://localhost:3000/api/lists/1/items
    ```

  * Delete `User` with `user_id = 1` from the command line:

    ```
    $ curl -u username:password -X DELETE http://localhost:3000/api/users/1/
    ```

  * Delete `List` with `list_id = 1` which belongs to `User` with `user_id = 2` from the command line:

    ```
    $ curl -u username:password -X DELETE http://localhost:3000/api/users/2/lists/1
    ```

  * Update list permission from `private = false` to `private = true` in command line:

    ```
    $ curl -X PUT -u username:password -d "list[private]=true" http://localhost:3000/api/lists/1
    ```

  * Update item permission from `completed = false` to `completed = true` in command line:

    ```
    $ curl -X PUT -u username:password -d "item[completed]=true" http://localhost:3000/api/items/1
    ```
