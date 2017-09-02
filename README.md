## Good Vibes

This platform is a private twitter-like social network

### Platform built with
```
Rails version: 5.1.2
Ruby version: 2.3.1 (x86_64-linux-gnu)
OS: Ubuntu 16.04.3 LTS
Kernel: 4.4.0-59-generic
```

<!-- TODO: ## License -->
### Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```

Next, migrate the database:
```
$ rails db:migrate
```

(optional) Seed the database:
```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```

### Production

#### Email
To get the mailing system working on Heroku please add Sendgrid as a resource (this will automatically set SENDGRID_USERNAME & SENDGRID_PASSWORD env vars)
```
$ heroku addons:create sendgrid:starter
```

#### Secret Pass
To allow people to register, a secret pass is required! You will need to set the following env var to some value:
* `SECRET_PASS`

#### DB Seed
To allow database seeding, a pre-defined password is required! You will need to set the following env var to some value:
* `SEED_PASSWORD`

#### (embedded) Google Image Search
To allow Google image search (via Google Custom Search Engine), you will need to set the following env var to your CSE parameters:
* `GOOGLE_API_KEY`
* `GOOGLE_SEARCH_CX`
