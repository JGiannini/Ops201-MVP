## Team:
* [Ben Podawiltz](https://github.com/benpodawiltz)
* [Jamie Giannini](https://github.com/JGiannini)
* [Ray Caoagdan](https://github.com/rcaoagdan)

## Project Description:
We are a "Managed Service Provider" (MSP) selected as one of the top companies to be contracted as Flyhomes sole IT support. We are tasked with setting Flyhomes up with its own Linux-based file server to store sensitive information that should only be accessible to the executive team. Each member of the executive team also needs a Windows 10 system hosted on the same network as the file server and it must be remotely accessible by the MSP. Their Windows 10 systems also require Gmail accounts associated with locally-installed Mozilla Thunderbird clients. Flyhomes also needs a Microsoft Windows Server 2016 Base with Containers instance deployed to AWS EC2 for special projects. Each executive's user profile must also be automatically backed up on a nightly basis, in addition to weekly OS-level backups. 

Lastly, each Windows 10 endpoint and the Linux file server must be deployed to a shared LAN. Only the Windows 10 endpoint should be remotely accessible to the executives. Both systems should be remotely accessible to the MSP. 

In order to simulate this scenario, our team decided to handle all instances and networking within AWS, specifically utilizing EC2 and S3 as well as VPCs to act as our networks and AMIs to act as our user systems. Given the power, scalability, and rising popularity of AWS, we felt it would provide worthwhile experience for us to complete all necessary steps in AWS.

## Documentation:
* [Statement of Work and SOPS](https://docs.google.com/document/d/1mZdO2vRkZy8hxwWiL_pVDoiAzJsEjf3Y8kdbJY6s8OU/edit?usp=sharing)
* [AWS Network Configuration and S3 to EC2 OVA Import](https://docs.google.com/document/d/1bdQWQwTo7sG_6oQg0SHU88PjvG1E25GkAkqQB5RNbO0/edit#heading=h.v4hmhhyopoai)
* [Linux File Server Setup and Backup](https://docs.google.com/document/d/1gImYM5J1oS3ANc2rCKISZBPM2WuyEqOXrERz58wsvuI/)
* [Network Topology and AD Diagram](https://drive.google.com/file/d/1xr_CqljbbI2NYOyGu0TB4AQd1Iut5UJ1/view?usp=sharing)
