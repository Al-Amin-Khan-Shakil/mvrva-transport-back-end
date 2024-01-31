<a name="readme-top"></a>

<div align="center">

  <h3><b>mvrva-transport</b></h3>

</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 mvrva-transport ](#-mvrva-transport-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
    - [🚀 Live Demo](#live-demo) 
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [API Documentation](#documentation)
    - [Run tests](#run-tests)
  - [👥 Author ](#-author-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 mvrva-transport <a name="about-project"></a>

This app is a desktop and mobile web application where a user can request for moving services by making a reservation for a particular service. The app has an admin section where the admin can add, edit and delete services. The app also has a user section where the user can view the services, make a reservation and delete that reservation.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org">React</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- Users can sign up and login.
- Services page after login.
- Details page for a particular service.
- A user can reserve a certain service
- Admin and user functionality for the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

N/A

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

Clone this repository to your desired folder:

```
git clone git@github.com:Al-Amin-Khan-Shakil/mvrva-transport-back-end.git
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Prerequisites

In order to run this project you need:

- Link to front end part of the site [FrontEnd](https://github.com/Al-Amin-Khan-Shakil/mvrva-transport-front-end/)
- Ruby 3.3.0
- Browser (Google Chrome, Mozilla Firefox, Safari or any other browser)
- Run `Rails Server`

### Setup

Clone this repository to your dist folder:

```
git clone git@github.com:Al-Amin-Khan-Shakil/mvrva-transport-back-end.git
cd mvrva-transport-back-end
```

### Install

Install this project with:
bundle install

Delete the credentials.yml.enc and master.key(if present) file
Create new master key and credential.yml.enc file by running the following command in the terminal:
Git Bash command: `EDITOR="code --wait", rails credentials:edit`
Save and close the credentials.yml.enc file and the master.key file will be created automatically.

Create Database:
Git Bash Commands
- rails db:create
- rails db:migrate

Make sure that server is running =
rails s

### Usage

Use this project in the browsers of desktops and mobile devices

### API Documentation

`New User Registration` user_registration  POST   http://127.0.0.1:4000/users/

`New User Session`  GET http://127.0.0.1:4000/users/sign_in     

`Logout User` DELETE      http://127.0.0.1:4000/users/sign_out  

`API Services` 
- `Get all service list` GET    http://127.0.0.1:4000/api/v1/services   
- `Create a new service` POST   http://127.0.0.1:4000/api/v1/services  

`API Individual Service`
- `Get specific service through id` GET    http://127.0.0.1:4000/api/v1/services/:id    
- `Delete specific service through id` DELETE http://127.0.0.1:4000/api/v1/services/:id  

`API Reservations` 
- `Get all reservation list` GET    http://127.0.0.1:4000/api/v1/reservations    
- `Create a new reservation` POST   http://127.0.0.1:4000/api/v1/reservations   

`API Individual Reservation`
- `Get specific reservation through id` GET    http://127.0.0.1:4000/api/v1/reservations/:id    
- `Delete specific reservation through id` DELETE http://127.0.0.1:4000/api/v1/reservations/:id     

[**Note:** some browser do not support (http://127.0.0.1:4000), in that case you should use (http://localhost:4000)]


## 👥 Authors <a name="authors"></a>

👤 **Victor Kanyi**

- GitHub: [@jkanyi-web](https://github.com/jkanyi-web)
- Twitter: [@V_Kanyi](https://twitter.com/V_Kanyi)
- LinkedIn: [LinkedIn](https://linkedin.com/in/victor-kanyi)

👤 **Vangelis**

- [@github](https://github.com/vangelif)
- [@twitter](https://twitter.com/vangfot)
- [@linkedin](https://www.linkedin.com/in/vangfot/)

👤 **Robert Kanyoro**

- GitHub: [@Kanyorok](https://github.com/Kanyorok)
- Twitter: [@CarlosMbugua](https://twitter.com/CarlosMbugua)
- LinkedIn: [Robert Mbugua](https://www.linkedin.com/in/robert-mbugua-kanyoro/)

👤 **Md Mahadi Hasan Rifat**

- GitHub: (https://github.com/Rifat8080)
- Twitter: (https://twitter.com/mdmahadirifat98)
- LinkedIn: (https://www.linkedin.com/in/md-mahadi-hasan-rifat-8b7851265/)

👤 **Al Amin Khan Shakil**

- GitHub: [Al Amin Khan Shakil](https://github.com/Al-Amin-Khan-Shakil)
- Twitter: [Al Amin Khan Shakil](https://twitter.com/AlAminKhan85004)
- LinkedIn: [Al Amin Khan Shakil](https://www.linkedin.com/in/al-amin-khan-shakil/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>
- Add user notifications feature.
- Add user settings feature.
- Add user account deletion feature.
- Add user account activation feature.
- Add user account deactivation feature.
- Add user email verification feature.
- Add user profile picture upload feature.
- Add user profile picture delete feature.
- Add more styling to the app.
- Add payment feature.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Al-Amin-Khan-Shakil/mvrva-transport-back-end/issues).

## ⭐️ Show your support <a name="support"></a>

If you like this project, please let me know and we can improve it further. You are welcome to support this project by giving suggestions for improvement and leaving a star on the project.

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Acknowledgements and suggestions for improvement are always welcome

- https://stackoverflow.com/questions/53510040/carrierwave-argument-error-nil-location-provided-cant-build-uri-for-an-image

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
