<a name="readme-top"></a>

<div align="center">
  <h3><b>Nexu Challenge</b></h3>
  <h4>
   <a href="https://www.linkedin.com/in/erik-sanchez-beltran/">
    Erik Stoupignan Sánchez Beltrán
   </a>
  </h4>
  
</div>

# 📗 Table of Contents

- [📖 Instructions](#about-project)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Testing](#testing)
- [🔭 ScreenShots](#screen-shots)
  - [Routes](#routes)
  - [Testing Controllers](#testing-controllers)
  - [Validations](#validations)

<!-- PROJECT DESCRIPTION -->

# 📖 Nexu Coding Challenge <a id="about-project" name="about-project"></a>
Our goal is to give you a small coding challenge that gives you a chance to show off your skills while giving you an idea of some of the problems that you may encounter at Nexu. We know you're busy with life, so we hope that you can spend around 2 hours working through this exercise. We don't expect you to finish in 2 hours, so don't worry if you can't. Submit what you have along with some notes on your thoughts and how you would proceed if you had more time. Most importantly, try to have some fun with it!

## Overview
You just got hired to join the *cool* engineering team at *Nexu*! The first story in your sprint backlog is to build a backend application for an already existing frontend. The frontend needs the next routes:


```
                              GET    /brands
                              GET    /brands/:id/models
                              POST   /brands
                              POST   /brands/:id/models
                              PUT    /models/:id
                              GET    /models
```

#### GET /brands

List all brands 
```json
[
  {"id": 1, "nombre": "Acura", "average_price": 702109},
  {"id": 2, "nombre": "Audi", "average_price": 630759},
  {"id": 3, "nombre": "Bentley", "average_price": 3342575},
  {"id": 4, "nombre": "BMW", "average_price": 858702},
  {"id": 5, "nombre": "Buick", "average_price": 290371},
  "..."
]
```
The average price of each brand is the average of its models average prices

#### GET /brands/:id/models

List all models of the brand
```json
[
  {"id": 1, "name": "ILX", "average_price": 303176},
  {"id": 2, "name": "MDX", "average_price": 448193},
  {"id": 1264, "name": "NSX", "average_price": 3818225},
  {"id": 3, "name": "RDX", "average_price": 395753},
  {"id": 354, "name": "RL", "average_price": 239050}
]
```

#### POST /brands

You may add new brands. A brand name must be unique.

```json
{"name": "Toyota"}
```

If a brand name is already in use return a response code and error message reflecting it.


#### POST /brands/:id/models

You may add new models to a brand. A model name must be unique inside a brand.

```json
{"name": "Prius", "average_price": 406400}
```
If the brand id doesn't exist return a response code and error message reflecting it.

If the model name already exists for that brand return a response code and error message reflecting it.

Average price is optional, if supply it must be greater than 100,000.


#### PUT /models/:id

You may edit the average price of a model.

```json
{"average_price": 406400}
```
The average_price must be greater then 100,000.

#### GET /models?greater=&lower=

List all models. 
If greater param is included show all models with average_price greater than the param
If lower param is included show all models with average_price lower than the param
```
# /models?greater=380000&lower=400000
```
```json
[
  {"id": 1264, "name": "NSX", "average_price": 3818225},
  {"id": 3, "name": "RDX", "average_price": 395753}
]
```

- Code all the endpoints and the logic needed

- Create a database to store this information

- Populate the database from the json included in this repository

## Requirements
- your code should be linted
- your code should include at least a couple of tests
- your code should include a `README.md` file in the root with instructions for building, running, and testing. It can also include notes on your thought process and any issues you may have run into.

## Submission
Please upload this repository to Github and submit to @remigioamc when complete. Also, we would love your feedback, so feel free to share your thoughts on the exercise!

## Bonus
Deploy your application so we can test it against our frontend. Share the URL.


# 💻 Getting Started <a id="getting-started" name="getting-started"></a>


To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

Make sure you have installed locally:

```sh
Ruby (v. 3.1.3)
```

### Setup

Clone this repository to your desired folder: 

```sh
git clone https://github.com/ErikStoupignan/Challenge_nexu_backend.git
```

Execute on console making sure you are in the correct directory:
```sh
bundle install
figaro install
```

Figaro created a file named 'application.yml' under config folder. Inside paste the following variables:
```sh
USER_NAME = “xxx” (xxx replace with your Postgres user name)
PASSWORD = “xxx” (xxx replace with your Postgres password)
```

To create, migrate and load the example information (seed), use the following commands
```sh
rails db:create
rails db:migrate
rails db:seed
```

 Use the following command to start the server.
```sh
rails s
```

## Testing
To run the tests, use the following command: 
```sh
rails test
```

# 💻 ScreenShots <a id="screen-shots" name="screen-shots"></a>

## Routes

### GET /brands
<img src="public\assets\get_brands.png">

### POST /brands
<img src="public\assets\post_brands.png">

### GET /brands/id/models
<img src="public\assets\get_brands_id_models.png">

### POST /brands/id/models
<img src="public\assets\post_brands_id_models_error.png">

### PUT /models/id
<img src="public\assets\put_models_id.png">

### GET /models
<img src="public\assets\get_models.png">

## Testing Controllers

<img src="public\assets\Testing_controllers.png">

## Validations

### Put /Model error
<img src="public\assets\put_models_id_error.png">

### Post /Model error
<img src="public\assets\post_brands_id_models_error.png">
