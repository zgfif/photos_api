This app is used to redirect and cache requests to external API endpoint.

You should have ruby 3.0.1, rails 6.1 and properly configured PostgreSQL database.

To deploy the app perform:
  
  - run in terminal `git clone https://github.com/zgfif/photos_api`
  
  - run `bundle`
  
  - update credentials `EDITOR=nano rails credentials:edit`
  
  - run `rails db:reset` and set attributes:
       - agile_url
       - api_key
  
  The app has rspec tests, run `rspec`

  The app has endpoints:
     - `/auth` this endpoint is used to generate and retrieve a new access token.
     - `/images/` returns the paginated list of pictures. To get this list you should add a newly generated access token to Header as 
               
               "Authorization: Bearer <your recently generated token from /auth endpoint>"
     
     - `/images?page=N` returns the paginated list of pictures(where N - number of page, for example page=2 etc). You should also add the token for authorization.
      