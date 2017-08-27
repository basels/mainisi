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

Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```
