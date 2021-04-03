## Team:
* (Ben Podawiltz)[https://github.com/benpodawiltz]
* (Jamie Giannini)[https://github.com/JGiannini]
* (Ray Caoagdan)[https://github.com/rcaoagdan]

## Project Description:
We are a "Managed Service Provider" (MSP) selected as one of the top companies to be contracted as Flyhomes sole IT support. We are tasked with setting Flyhomes up with its own Linux-based file server to store sensitive information that should only be accessible to the executive team. Each member of the executive team also needs a Windows 10 system hosted on the same network as the file server and it must be remotely accessible by the MSP. Their Windows 10 systems also require Gmail accounts associated with locally-installed Mozilla Thunderbird clients. Flyhomes also needs a Microsoft Windows Server 2016 Base with Containers instance deployed to AWS EC2 for special projects. Each executive's user profile must also be automatically backed up on a nightly basis, in addition to weekly OS-level backups. 

Lastly, each Windows 10 endpoint and the Linux file server must be deployed to a shared LAN. Only the Windows 10 endpoint should be remotely accessible to the executives. Both systems should be remotely accessible to the MSP. 

In order to simulate this scenario, our team decided to handle all instances and networking within AWS, specifically utilizing EC2 and S3 as well as VPCs to act as our networks and AMIs to act as our user systems. Given the power, scalability, and rising popularity of AWS, we felt it would provide worthwhile experience for us to complete all necessary steps in AWS. 
