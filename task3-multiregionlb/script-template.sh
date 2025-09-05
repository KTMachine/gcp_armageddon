Script Template.sh

#!/bin/bash
# Update and install Apache2
apt update
apt install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# Use curl to fetch instance metadata
local_ipv4=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/network-interfaces/0/ip")
zone=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/zone")
project_id=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/project/project-id")
network_tags=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/tags")

# Create a simple HTML page and include instance details
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Armageddon Task 3</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <style>
    body,h1,h3 {font-family: "Raleway", sans-serif}
    body, html {height: 100%}
    .bgimg {
      background-image: url('https://img.freepik.com/free-photo/photo-stone-texture-pattern_58702-16052.jpg?semt=ais_incoming&w=740&q=80');
      min-height: 100%;
      background-position: center;
      background-size: cover;
    }
    .w3-display-middle {
      background-color: rgba(0, 0, 0, 0.466);
      padding: 20px;
      border-radius: 10px;
    }
    .transparent-background {
      background-color: rgba(0, 0, 0, 0.575);
      padding: 20px;
      border-radius: 10px;
    }
    .rounded-image {
      border-radius: 25px;
    }
  </style>
</head>
<body>
  <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
    <div class="w3-display-topleft w3-padding-large w3-xlarge"></div>
    <div class="w3-display-middle w3-center">
      <iframe src="https://64.media.tumblr.com/7384bc1ba0139b2029ce924a7e4a2b09/b349d4f5d9d9b809-d1/s540x810/7bee92fef0a65b6ffc4e50dcbf41008d034dc70d.jpg"
              width="600"
              height="491"
              align="center"
              valign="middle"
              style="border-radius:10px;"
              frameBorder="0"
              class="giphy-embed"
              allowFullScreen>
      </iframe>
      <hr class="w3-border-grey" style="margin:auto;width:40%;margin-top:15px;">
    </div>
    <div class="w3-display-bottomleft w3-padding-small transparent-background outlined-text">
      <h1>Armageddon Task 3</h1>
      <h3>"I, Invictus, will make 160,000 per year thanks to Theo and Obsidian"</h3>
      <p><b>Instance Name:</b> $hostname_output</p>
      <p><b>Instance Private IP Address:</b> $local_ipv4</p>
      <p><b>Zone:</b> $zone</p>
      <p><b>Project ID:</b> $project_id</p>
      <p><b>Network Tags:</b> $network_tags</p>
    </div>
  </div>
</body>
</html>
EOF