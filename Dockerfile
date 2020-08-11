# use small node image
FROM node:alpine

# install jq for JSON parsing
RUN apk add --update --no-cache jq gettext xmlstarlet

# install latest sfdx from npm
RUN npm install sfdx-cli --global
RUN sfdx --version
RUN sfdx plugins --core
COPY Jenkinsfile /user/bin

# revert to low privilege user
USER node
