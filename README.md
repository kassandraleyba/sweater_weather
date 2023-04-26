<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
<!-- PROJECT LOGO -->
<br>

<h3 align="center">Sweater Weather</h3>

  <p align="center">
    service-oriented weather application
    <br />
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Sweater Weather is a web application that tracks current weather, a 5-day forecast, and hourly weather. 

This project is the backend side of Sweater Weather and uses the following technology stack:

- Ruby 3.1.1
- Rails 7.0.4
- PostgreSQL as the database for Active Record
- Puma web server
- bcrypt for password security
- Faraday for making HTTP requests
- Bootsnap for caching to reduce boot times
- Figaro for managing application configuration
- JSON API Serializer for generating JSON responses

Additionally, the project uses several gems for development and testing, such as Capybara, RSpec, and Shoulda Matchers.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Rails]][Rails-url]
* [![Circle-CI]][Circle-url]
* [![PostgreSQL]][PostgreSQL-url]
* [![Puma]][Puma-url]
* [![bcrypt]][bcrypt-url]
* [![Faraday]][Faraday-url]
* [![Figaro]][Figaro-url]
* [![JSON-Serializer]][JSON-Serializer-url]
* [![Capybara]][Capybara-url]
* [![RSpec]][RSpec-url]
* [![Shoulda-Matchers]][Shoulda-Matchers-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
You must have the following software installed on your system:

* [Ruby](https://www.ruby-lang.org/en/downloads/)
* [Bundler](https://bundler.io/)
* [PostgreSQL](https://www.postgresql.org/download/)


### Installation

1. Clone the repo
   ```sh
   git clone github.com/kassandraleyba/sweater_weather
   ```
2. Install dependencies
   ```sh
   bundle install
   ```
3. Configure the database by running rails db:setup:
   ```js
   rails db:setup
   ```
4. Start the server by running rails server:
   ```js
   rails server
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Database Tables
Users:
![image](Screenshot 2023-04-26 at 8.56.40 AM.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<div align="center">
  <img src="https://avatars.githubusercontent.com/u/114712752?v=4" alt="Profile" width="80" height="80">
  <p align="center">
    Kassandra Leyba<br>
    <a href="https://github.com/kassandraleyba">Github: kassandraleyba</a>
     <p><a href="https://www.linkedin.com/in/kassandra-leyba/">LinkedIn: kassandraleyba</a></p>
  </p>
</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- PROJECT MANAGER -->
## Project Managers

* Abdul Redd
* Mike Dao

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GEMS -->
## Gems

* [Ruby 3.1.1](https://www.ruby-lang.org/en/)
* [Ruby on Rails 7.0.4](https://rubyonrails.org/)
* [PostgreSQL 1.1](https://www.postgresql.org/)
* [Puma 5.0](https://github.com/puma/puma)
* [bcrypt 3.1.7](https://github.com/codahale/bcrypt-ruby)
* [Faraday](https://github.com/lostisland/faraday)
* [Figaro](https://github.com/laserlemon/figaro)
* [JSONAPI::Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
* [RSpec](https://rspec.info/) (testing framework)
* [Capybara](https://github.com/teamcapybara/capybara) (acceptance testing framework)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) (testing library)
* [SimpleCov](https://github.com/simplecov-ruby/simplecov) (code coverage analysis tool)
* [WebMock](https://github.com/bblimke/webmock) (library for stubbing HTTP requests)
* [Bootsnap](https://github.com/Shopify/bootsnap) (speeds up boot time)
* [TZInfo-Data](https://github.com/tzinfo/tzinfo-data) (timezone library)



<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/wise-app-team/wise-app-be.svg?style=for-the-badge
[contributors-url]: https://github.com/wise-app-team/wise-app-be/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/wise-app-team/wise-app-be.svg?style=for-the-badge
[forks-url]: https://github.com/wise-app-team/wise-app-be/network/members

[stars-shield]: https://img.shields.io/github/stars/wise-app-team/wise-app-be.svg?style=for-the-badge
[stars-url]: https://github.com/wise-app-team/wise-app-be/stargazers

[issues-shield]: https://img.shields.io/github/issues/wise-app-team/wise-app-be.svg?style=for-the-badge
[issues-url]: https://github.com/wise-app-team/wise-app-be/issues

[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username

[product-screenshot]: images/screenshot.png


[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 

[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 

[Circle-CI]: https://img.shields.io/circleci/build/github/wise-app-team/wise-app-be/main
[Circle-url]: https://app.circleci.com/

[PostgreSQL]: https://img.shields.io/badge/-PostgreSQL-4169E1?logo=postgresql&logoColor=white&style=for-the-badge
[PostgreSQL-url]: https://www.postgresql.org/

[Puma]: https://img.shields.io/badge/-Puma-FFD43B?logo=puma&logoColor=black&style=for-the-badge
[Puma-url]: https://github.com/puma/puma

[bcrypt]: https://img.shields.io/badge/-bcrypt-00599C?logo=gnu-privacy-guard&logoColor=white&style=for-the-badge
[bcrypt-url]: https://github.com/codahale/bcrypt-ruby

[Faraday]: https://img.shields.io/badge/-Faraday-3E3E3E?logo=ruby&logoColor=white&style=for-the-badge
[Faraday-url]: https://github.com/lostisland/faraday

[Figaro]: https://img.shields.io/badge/-Figaro-FF4136?logo=rubygems&logoColor=white&style=for-the-badge
[Figaro-url]: https://github.com/laserlemon/figaro

[JSON-Serializer]: https://img.shields.io/badge/-JSON%20API%20Serializer-1E90FF?logo=json&logoColor=white&style=for-the-badge
[JSON-Serializer-url]: https://github.com/jsonapi-serializer/jsonapi-serializer

[Capybara]: https://img.shields.io/badge/-Capybara-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[Capybara-url]: https://github.com/teamcapybara/capybara

[RSpec]: https://img.shields.io/badge/-RSpec-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[RSpec-url]: https://github.com/rspec/rspec

[Faker]: https://img.shields.io/badge/-Faker-FF69B4?logo=rubygems&logoColor=white&style=for-the-badge
[Faker-url]: https://github.com/faker-ruby/faker

[Shoulda-Matchers]: https://img.shields.io/badge/-Shoulda%20Matchers-5B5B5B?logo=rubygems&logoColor=white&style=for-the-badge
[Shoulda-Matchers-url]: https://github.com/thoughtbot/shoulda-matchers
