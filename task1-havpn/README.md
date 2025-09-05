Diagram:
# Armageddon Task 1 - VPN Connection between Two GCP Projects
![VPN Connection](Photos/15-Diagram.png)

Project:
This task connects Balerica Inc. and Invictus Inc. for VPN connection. The connection is made via a VPN tunnel using Cloud Router and BGP to dynamically exchange routes between the two networks.
The project uses Terraform to automate the deployment of the necessary resources, including VPC networks, subnets, VPN gateways, Cloud Routers, and VPN tunnels.

Uses:
- Two of my own GCP Projects, in one account.
- Balerica Inc: "service-p1-462917" Project
- Invictus Inc: "invictus-65" Project

Structure:
![Structure](Photos/1-Project%20Structure.png)

Deployment:
1. ![Initialize Terraform](Photos/2-Terraform%20Init.png)
2. ![Terraform Format and Validate](Photos/3-Terraform%20fmt%20and%20validate.png)
3. ![Terrform Plan](Photos/4-Terraform%20Plan.png)
4. ![Terraform Apply](Photos/5-Terraform%20Apply.png)

Completion:
1. ![Balerica Inc. Cloud VPN Tunnels](Photos/6-Balerica1.png)
2. ![Balerica Inc. Cloud VPN GW's](Photos/7-Balerica2.png)
3. ![Balerica Inc. Hub](Photos/8-Balerica3.png)
4. ![Balerica Inc. Spokes](Photos/9-Balerica4.png)
5. ![Invictus Inc. Cloud VPN Tunnels](Photos/10-Invictus1.png)
6. ![Invictus Inc. Cloud VPN GW's](Photos/11-Invictsu2.png)
7. ![Invictus Inc. Hub](Photos/12-Invictus3.png)
8. ![Invictus Inc. Spokes](Photos/13-Invictus4.png)

Teardown:
1.![Terraform Destroy](Photos/14-Terraform%20Destroy.png)

Resources Used:
1. Visual Studio Code
2. Lucid Chart
3. github.com