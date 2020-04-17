# www-stevenhancock
Repository for www.stevenhancock.ca


Site created using Hugo

See for some options https://gohugo.io/getting-started/quick-start/

Hugo Theme from https://themes.gohugo.io/theme/minimal/


## Common Commands
Start Hugo Server
`hugo server -D`

Create a new article
`hugo new articles/article-name.md`

Create public files for adding to GCP Cloud Storage
`hugo`

## GCP Static Website Using Cloud Storage

See: https://cloud.google.com/storage/docs/hosting-static-website & https://cloud.google.com/storage/docs/best-practices & https://cloud.google.com/load-balancing/docs/https/adding-backend-buckets-to-load-balancers


`gsutil -m cp -r public/* gs://[project-id]-test/`

`gsutil web set -m index.html -e 404.html gs://www.example.com`


## Cloud Build
`cloudbuild.yaml`

### Secrets
To be able to interact with cloud storage from the container that cloud build creates you'll need to credentials. Use [secrets](https://cloud.google.com/cloud-build/docs/securing-builds/use-encrypted-secrets-credentials) to get these credentials.