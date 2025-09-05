## Armageddon Task 2 (Electric Boogaloo) - Cloud Run

## Task
The Dev team wants to explore using Cloud Run to deploy their applications.
Complete "Be a Man #10", but now splitting traffic across four applications with the following distribution:

Version 1 → 40%
Version 2 → 40%
Version 3 → 10%
Version 4 → 10%

## Overview
In this task, we will deploy four different versions of a simple web application to Google Cloud Run and configure traffic splitting according to the specified distribution. A Python-based web application will be deployed to Google Cloud Run, which will include a Flask app, which will hold a template (index.html), and the environment configuration through .env

## Project Structure

## Environment Configurations

# Version 1
HEADER_TEXT=Out of the night that covers me, Black as the Pit from pole to pole
BOTTOM_TEXT=I thank whatever God may be, For my unconquerable soul
FLASK_DEBUG=false
IMAGE_URL=https://64.media.tumblr.com/20eb7effb409dfcc82dbfa9905dd6012/b349d4f5d9d9b809-ba/s540x810/cba7f27457e60c87739c78589728f16cc4731c86.jpg
BACKGROUND_IMAGE=https://cliply.co/wp-content/uploads/2019/12/401912580_BLACK_LIQUID_400px.gif

# Version 2
HEADER_TEXT=In the fell clutch of circumstance, I have not winced nor cried aloud
BOTTOM_TEXT=Under the bludgeonings of chance, My head is bloody but unbowed
FLASK_DEBUG=false
IMAGE_URL=hhttps://64.media.tumblr.com/7384bc1ba0139b2029ce924a7e4a2b09/b349d4f5d9d9b809-d1/s540x810/7bee92fef0a65b6ffc4e50dcbf41008d034dc70d.jpg
BACKGROUND_IMAGE=https://cliply.co/wp-content/uploads/2019/12/401912580_BLACK_LIQUID_400px.gif

# Version 3
HEADER_TEXT=Beyond this place of wrath and tears, Looms but the Horror of the shade
BOTTOM_TEXT=And yet the menace of the years, You shall find me unafraid
FLASK_DEBUG=false
IMAGE_URL=https://64.media.tumblr.com/ba0d5f564468c0f0d04fde354d8877f9/b349d4f5d9d9b809-00/s540x810/a7b8a583639907ba312b8ab0169cf32261570cb0.jpg
BACKGROUND_IMAGE=https://cliply.co/wp-content/uploads/2019/12/401912580_BLACK_LIQUID_400px.gif

# Version 4
HEADER_TEXT=It matters not how strait the gate, How charge with punishments the scroll
BOTTOM_TEXT=I am the master of my fate, I am the captain of my soul
FLASK_DEBUG=false
IMAGE_URL=hhttps://64.media.tumblr.com/fba8ee03fb164ad51c150a7fe15b7e48/b349d4f5d9d9b809-44/s540x810/0d73e35034146eb5267351c1e492bf5da00aad29.jpg
BACKGROUND_IMAGE=https://cliply.co/wp-content/uploads/2019/12/401912580_BLACK_LIQUID_400px.gif



## Deployment Steps

# Step 1: Cloud Run
- Open your GCP page
- Choose your desired project
- Go to Cloud Run


# Step 2: Create Service
 - On Cloud Run, Click “create service”
- Click the GitHub Icon
- Click “Set up with Cloud Build”
- Source Repository: (First link your GitHub account to GCP)
- Authorize it, once GitHub is Authorized in GCP, Click next
- Build Configuration: your main branch
![Cloud Run 1](photos/Cloud%20Run%201.png)

![Cloud Run 2](photos/Cloud%20Run%202.png)


# Step 3
- Next
- Build Type: Click Node.js, Python, Java, etc.
- Leave all of the other stuff blank
- Click Save
![Cloud Run 3](photos/Cloud%20Run%203.png)


# Step 4: Configure
- Create Name: “invictus-task-2”
- Choose Region: asia-northeast1 Tokyo
- Authentication: Allow Public access
- Billing: Leave Alone
- Service Scaling: Auto scaling - (min: 0, max: 10 or 20)
![Cloud Run 4](photos/Cloud%20Run%204.png)


# Step 5: Variables
- Expand Containers, Volumes, Networking, Security
- Scroll down to Variables & Secrets. Then click it
- First variable: Copy and Paste version 1 flask (from txt file)
![Cloud Run 5](photos/Cloud%20Run%205.png)

![Cloud Run 6](photos/Cloud%20Run%206.png)

- Click Create


# Step 6: Wait for Build
- Go to Build history in Cloud Build
- Check the current build
- Go to Triggers
- Check to see what is happening there as well
- Check to see if the cloud run is built
- Go to GitHub, in the repo, go to commit, to see the commits
- In GCP, CloudRun deployed, click the URL to see your app running
![Cloud Run 7](photos/Cloud%20Run%207.png)

![Cloud Run 8](photos/Cloud%20Run%208.png)


# Step 7: The Split 1
- Click “Edit & deploy new revision” at the top of the screen
- Go back to variables and secrets
- Delete the old variables
- Copy and paste #2. Rinse and Repeat for #3 and #4
![Cloud Run 9](photos/Cloud%20Run%209.png)

![Cloud Run 10](photos/Cloud%20Run%2010.png)

![Cloud Run 11](photos/Cloud%20Run%2011.png)



# Step 8: Create Revision Tags
- Back to main page
- Tag the revisions 
![Cloud Run 12](photos/Cloud%20Run%2012.png)

![Cloud Run 13](photos/Cloud%20Run%2013.png)



# Step 9: The Split 2
- Click Manage Traffic
- Click Add Revision
- Add what you need, in this case 4
- On the right side of the screen where it says traffic, place the percentages needed. 40/40/10/10
- Click Save
![Cloud Run 14](photos/Cloud%20Run%2014.png)

![Cloud Run 15](photos/Cloud%20Run%2015.png)



# Step 10: Look at the URL and Check Cloud Build
- Click the URL to see the app running
- Reload Screen until you view all 4 (2 out of 4 photos actually popped up, lol!)
![Cloud Run 16](photos/Cloud%20Run%2016.png)

![Cloud Run 17](photos/Cloud%20Run%2017.png)

![Cloud Run 18](photos/Cloud%20Run%2018.png)

![Cloud Run 19](photos/Cloud%20Run%2019.png)

![Cloud Run 20](photos/Cloud%20Run%2020.png)


# Step 11: Teardown
- Go back to Cloud Run Page
- Click the Service
- Click Delete
- Then go to the Trigger
- Find the 3 dots on the right… Click delete
- You are Finished
![Cloud Run 21](photos/Cloud%20Run%2021.png)

![Cloud Run 22](photos/Cloud%20Run%2022.png)

![Cloud Run 23](photos/Cloud%20Run%2023.png)

![Cloud Run 24](photos/Cloud%20Run%2024.png)