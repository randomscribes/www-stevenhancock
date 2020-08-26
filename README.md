# www-stevenhancock
Repository for www.stevenhancock.ca


Site created using Hugo

See for some options https://gohugo.io/getting-started/quick-start/

Hugo Theme from https://themes.gohugo.io/theme/minimal/

# Adding Content
1. Create a new article inside `content/articles` by either using the command `hugo new articles/article-name.md` or copying and editing an existing article.
2. Commit to git branch.
3. Wait. Cloud build should automatically pick up what was pushed to Master and deploy to cloudstorage. See `cloudbuild.yaml` and `Dockerfile` for the finer details. Worth noting that commits to the Master branch will show up at www.stevenhancock.ca while commits to all other branches will be deployed to test.stevenhancock.ca/

## Common Commands
Start Hugo Server
`hugo server -D`

Create a new article
`hugo new articles/article-name.md`

Create public files for adding to GCP Cloud Storage
`hugo`

## GCP Static Website Using Cloud Storage

See: https://cloud.google.com/storage/docs/hosting-static-website & https://cloud.google.com/storage/docs/best-practices & https://cloud.google.com/load-balancing/docs/https/adding-backend-buckets-to-load-balancers


`gsutil -m cp -r public/* gs://test.stevenhancock.ca/`

`gsutil web set -m index.html -e 404.html gs://www.example.com`


## Cloud Build
`cloudbuild.yaml`

### Secrets
To be able to interact with cloud storage from the container that cloud build creates you'll need to credentials. Use [secrets](https://cloud.google.com/cloud-build/docs/securing-builds/use-encrypted-secrets-credentials) to get these credentials.

### GitHub Triggers
Using [GitHub Triggers](https://cloud.google.com/cloud-build/docs/automating-builds/create-github-app-triggers) we can automate cloud build on git commits.

## SSL Setup

I'm using a load balancer to enable https for the site.

Some usefull links that helped to get SSL setup for static cloud hosting:
* https://cloud.google.com/storage/docs/troubleshooting#https
* https://cloud.google.com/load-balancing/docs/https/adding-backend-buckets-to-load-balancers
