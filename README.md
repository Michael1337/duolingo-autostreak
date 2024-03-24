# duolingo-autostreak
A dockerized node.js script to automatically keep your streak on Duolingo alive.

Shoutout to rfoel for writing the script: https://github.com/rfoel/duolingo/. He also explained how to easily get the JWT token.

Create a .env file and insert your token like:

```bash
DUOLINGO_JWT="your.JWT.token"
LESSONS=1
```

Notice the ">> /var/log/cron.log" in the cron job. That's to save the node.js console logs log file to review them later in case something doesn't work. The log file is cleared once a week.

If you use gotify (https://gotify.net/), you can uncomment the third line in the cron file and adjust the domain and token to get the last line of your logs messaged to you. That will usually include the timestamp of your latest correct answer, so you can easily see if it is still up-to-date.

To build the docker image:

```bash
docker build -t duolingo_streak .
```

And to run the container:

```bash
docker run -d --name=duolingo_streak --restart=unless-stopped duolingo_streak
```

In case you want to see the logs:

```bash
docker exec -it duolingo_streak bash
```

The logs are in /var/log/cron.log. You could also create a volume of course.

Obviously you don't have to use docker. In that case, just copy the contents of "cron" into your crontab file and adjust the paths to the .sh scripts according to where you place the files.
