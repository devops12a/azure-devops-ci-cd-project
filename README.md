# Building a CI/CD Pipeline

## Introduction
In this project, you will build a GitHub repository from a scratch and create a system that will guide you to perform both Continuous Integration and Continuous Delivery.

### Getting Started
Before you even get ready to build the code:
	1.	Make a plan or a task tracking
	2.	To have a Trello board is very helpful

#### Dependencies
To do before you run the code:
	1.	Create a GitHub repository
	2.	Create a Microsoft Azure account

##### Instructions
Before you begin, you can take a look to my workflow through the Trello board; https://trello.com/b/PPw1kZqG/building-ci-cd-pipeline . I have split my work into several phases and it helped me to complete the project Building a CI/CD Pipeline.
In addition to this, I have created a quarterly and yearly spreadsheet (see my repo: “project2_Q4_2020.xlsx” and “project2_yearly_20_21”) to help me focusing on each ticket that represent a distinct task to be completed in a specified block of time.
In the quarterly spreadsheet, my goal was to make this dream-example-project “Build a Machine Learning with Python and Flask using React”. The frontend is developed in React and I thought it include a single page with a form to submit inputs. On the other hand, the backend is developed in Flask (written in Python). This quarterly spreadsheet is an example of how effective the spreadsheet can be to organize you work and achieve your goal. You may not be following it exactly; however, it is an important tool in Agile planning.
Same for the yearly spreadsheet, I have split it into four quarters and I just implemented the fourth quarter with the example-project form my quarterly spreadsheet. The rest of the quarters can be implemented as the fourth.
The yearly spreadsheet has helped me to make a plan for the future, up to a year. Especially if I have multiple projects to manage.  
Now back to our project Building a CI/CD Pipeline, after you have collected your dependencies, you start the project first by making your local continuous integration step using these steps:
	1.	Create the Cloud-Based Development Environment
		•	In your Microsoft Azure, launch the Azure cloud Shell environment (by clicking on the icon shown in the image).
  		![alt text](https://github.com/devops12a/azure-devops-ci-cd-project/blob/main/images/azure_cloud_shell.png)
		•	Create a folder .ssh_project by running mkdir .ssh_project 
		This folder will contain the ssh-keys that you will soon create.
		•	Create the ssh-keys, run:
		•	ssh-keygen -t rsa -b 4096 -C <your-Azure-account-email>
		•	copy your public-key from the folder .ssh_project after yuo run: cat id_rsa.pub
		•	To upload the key to your GitHub account, into your GitHub account: settings/SSH and GPG keys/new SSH key - set a title, paste your key and click on Add 			 SSH key
		•	Now, back to your Azure cloud shell and run: git clone git@github.com:your-username/your-repo.git to clone your project into Azure Cloud Shell.
		You should get it like this:
		![alt text](https://github.com/devops12a/azure-devops-ci-cd-project/blob/main/images/project_cloning.png)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	2. Create Project Scaffolding
You will create a Makefile file, requirements.txt, the Python virtual Environment, a script file and a test file. Follow these steps:
•	Into your Azure cloud shell, and into your repo; cd <your-repo>
•	touch Makefile - create file named Makefile
•	vim Makefile - edit the file
•	touch requirements.txt
•	vim requirements.txt
•	Then; git add Makefile requirements.txt
•	git commit -m "adding Makefile and requirements.txt"
•	git push
•	Create Python virtual Environment, run: 
•	python3 -m venv ~/.your-repo
•	then, run: source ~/.<your-repo>/bin/activate
•	Azure cloud shell becomes:
(.your-repo) dev@Azure:~/your-repo/$
•	Create the script file (hello.py) and test file (test_hello.py):
•	touch hello.py
•	vim hello.py
•	git add test_hello.py hello.py
•	git commit -m "adding the project script file and the test file"
•	git push


