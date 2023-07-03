AWS intro






How to launch an EC2 instance?

1. Make an AWS account by following all the steps on the AWS.

![Alt text](image.png)

2. Go to search bar and type in EC2. Make sure to choose your region. 

![Alt text](image-1.png)

3. Go to instances and name your VM, Choose an OS image, Instance type, key pair and Security group.
   
 ![Alt text](image-2.png)

![Alt text](image-4.png)

![Alt text](image-3.png)

![Alt text](image-5.png)

![Alt text](image-6.png)

![
](image-7.png)


![Alt text](image-8.png)

Make sure that the instance state shows 2/2 checks passed. Click on connect then.
![Alt text](image-9.png)
Follow these steps for DB_VM

Go to SSH Client. and select the path at the bottem of the page.

![Alt text](image-11.png)

Open your Git Bash and add ssh -i "~/.ssh/<key name>"  

Go to nano.provision.sh and paste this script.



![Alt text](image-18.png)
  If the commands have successfully run, you'll see this page.

  ](image-12.png)
  ![Alt text](image-13.png)


    After you have entered APP_VM_Ip:3000 in the browser, this front page of sparta_app is visible.

  ![Alt text](image-15.png)


  Connect to the App_VM using the same steps. But, run the app script.
  In the env variable, change MongoDb ip to your DB_VM_public Ip

  ![Alt text](image-16.png)

  In your browser paste, your app_vm_ip:3000/posts

  ![Alt text](image-17.png)


