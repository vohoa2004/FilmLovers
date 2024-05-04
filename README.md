# 🎬 Film Lovers

#### Notice: This is a re-up repository of a project that I worked with my teammates in subject PRJ301 at FPT University, I re-up this project because the original repository was set "private" by my teacher.

## Project Document:

## Mẫu giáo tập code - Group members:
- Nguyễn Thị Bích Duyên - SE183629
- Trương Quang Hiếu Trung - SE183255
- Nguyễn Gia Bảo Anh - SE183425
- Võ Thị Mai Hoa - SE183659

## 1. Requirement: 
### Target users: Film viewers who want to hold the latest information, ratings and reviews of films, tv series, movies...

## Description

- An online web application for viewing latest film information (summaries, trivia, quotes, images..), as well as contributing data, reviews and ratings.   
- This website is focused on creating good users experience in finding/filtering shows and movies, also providing a visually appealing and user-friendly interface for displaying useful information.   
- Accounts are divided into two roles: **Admin** and **User**. If the viewer doesn't login, they are identified as **Guest**.   

### Features

#### Guest:   
- Register for User account: Google account, Facebook account, Register manually (username, email, password)   
- View shows and movies list, information and reviews from Users   
- Change language on page (EN, VI)   
- Change website theme (Dark mode, Light mode)   
- Search for shows and movies by Name   
- Filter the shows and movies by Type, Genre, Country, Release year, Ratings   
- Sort the list in Alphabetical order, Release year order, Ratings order   

#### Subscriber:
- Login: Google account, manually   
- All Guest's features   
- Can see '**View History**': a list of 20 films that user viewed recently    
- Create different **Watchlists** then add, view and remove shows and movies from them   
- Give ratings for shows and movies    
- Leave comments, edit and delete their own comments   
- Like and dislike, report comments of others
- **Contribute** shows and movies based on given form   
- Log out   

#### Admin:
- Login: Google account, manually   
- All Guest's features   
- Create or delete shows and movies, add and update their descriptions, information   
- View users' accounts' details, change account status (able/disable)   
- Approve or disapprove Users' edit suggestions   
- Get the list of comments that are reported by Users, can choose to delete or keep them
- Log out   

## 2.GUI
<details>
  <summary>Click me</summary><br>
  
  ### 2.1. Common Pages
  
#### a. Sign in & Sign up:
![1 2](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/84dc7fc6-44d0-46f5-b1f9-4b82a8670fa3)

#### b. Home page
![0cb14e1e-e1ea-41a2-9cfa-d1757e08560d-0005](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/3f34f246-b4a4-4ee4-a3d5-c49f182daeb7)


#### c. Trending films 
![2](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/25da3684-5e71-4f30-ba98-e724ed6884ea)

#### d. Film details and Reviews
![3](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/ed63f208-5cde-448a-9b49-b278d14bdaec)

#### e. Film cast details
![4](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/e874c34f-f6ac-4326-99f4-916d2dee4178)


### 2.2. Admin Pages

#### a. Login
![5](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/dcdbfb8c-7090-427e-b333-066669267930)

#### b. Dashboard
![6](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/a919a4cf-8940-44f7-8c9c-cd17f2484587)

#### c. Movie Database
![7](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/c23c73d0-75f2-401c-b922-ef3d9590c12f)

#### d. Add new movie
![8](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/b2c9f238-1a76-4b26-a6b3-6b8e2396263b)

#### e. Manage users
![9](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/5fb2f929-236c-4ff6-ac83-a0ae45ca7e01)

#### f. Manage comments
![10](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/a6d3762c-c7fa-4d52-b8c1-50ea4f7cbc59)
</details>


## 3. Database Design
<details>
  <summary>Click me</summary><br>
![FilmLovers-ERD](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/4cfecb5d-8b3b-4fb6-accb-2b9c67b1729c)
![FilmLovers-RS](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/2d2cb4c7-fb24-4898-9161-3db557b28665)
</details>

## 4. System Design
### a. Project Structure:

![system_design](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/98ba0418-4988-441d-abf2-c84a2105cd72)

### b. Flow chart:

![FilmLovers-Flowchart drawio](https://github.com/dunghuynh-teaching/prj301-se1867-06/assets/133933281/8b699f31-6976-42b2-ad31-269e608cf046)

## 5. Conclusion
With the team effort, we have delivered some features of the website:

- Manage multiple models with CRUD functions: Film, Genre, Actor, Video, Photo, Rating, Contribution,...

- Account:
    + Create, view, update, delete user account;
    + Implement Password Hashing function for better security.
      
- Film:
    + Create, view, update, delete, search and filter Films by multiple conditions;
    + Implement Pagination from database for better performance when searching/viewing
    + Use Firebase Cloud storage for data storing (film's photo, user's photo).

- Watchlist:
    + Create many playlist to watch laterr
    + Add favourite films to the playlist
 
- Contribution:
    + Allow users to contribute new films or contribute videos, genres and photos to a existed film
    + Admin check the contribution after user submitted to publish the contribution to the website or reject it

During the coding time, we also spent much time to provide good UI for the functions above.

However, due to our lack of time and skill, we have yet hit the threshold of a smoothly well functioning website:
- Haven't organized the project structure carefully from the start, which leads to inefficient coding process, difficulties in developing and maintaining in the future.
- Many flaws in user flow (Example: only annouce to user but not sending email for them after admin checking contribution)
- Unfinished views (Example: WatchList view in the Landing Page)
- Some unstable methods (Example: Edit Profile View)

And now that we have submitted our assignment, we can reflect on our progress. 
Throughout this project, we learned and strengthened our knowledge not only in tools like Figma, Git, Github, but also in coding techniques and mindset, both front-end and back-end. Looking further, it was all thanks to the advice and feedback of our lecturer that we could see the problems more clearly and figure out the solutions. We are deeply grateful for his help in this tough semester. This is a valuable experience that help us to further our careers in this field. 

