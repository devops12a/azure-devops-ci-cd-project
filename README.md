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
•	In your Microsoft Azure, launch the Azure cloud Shell environment (by clicking on the icon shown in the image below).
  


•	Create a folder .ssh_project by running mkdir .ssh_project 
This folder will contain the ssh-keys that you will soon create.
•	Create the ssh-keys, run:
•	ssh-keygen -t rsa -b 4096 -C <your-Azure-account-email>
•	copy your public-key from the folder .ssh_project after yuo run: cat id_rsa.pub
•	To upload the key to your GitHub account, into your GitHub account: settings/SSH and GPG keys/new SSH key - set a title, paste your key and click on Add SSH key
•	Now, back to your Azure cloud shell and run: git clone git@github.com:<your-username>/<your-repo>. git to clone your project into Azure Cloud Shell.
You should get it like this:






	My repo















2.	Create Project Scaffolding
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
•	python3 -m venv ~/.<your-repo>
•	then, run: source ~/.<your-repo>/bin/activate
•	Azure cloud shell becomes:
(.<your-repo>) dev@Azure:~/ <your-repo>/$
•	Create the script file (hello.py) and test file (test_hello.py):
•	touch hello.py
•	vim hello.py
•	git add test_hello.py hello.py
•	git commit -m "adding the project script file and the test file"
•	git push

3.	Local Test
Now running make all, a command from Makefile will install lint and test code. This step ensure that we are not going to push a wrong code to GitHub.
After running make all, you should get a passing test like this:

















4.	Configure GitHub Actions
The GitHub Actions from GitHub will help to perform the Continuous Integration remotely by testing the project upon change events. To configure GitHub Actions, follow these steps:
•	Into your repo, click on: go to Actions and set up an action
•	Click on set up a workflow yourself (looks like Hello world based action)
•	Replace the main.yml with pythonapp.yml (see my repo)
•	So, go ahead and Start commit, and Commit new file
•	Now it’s going to do a build and look at the configuration file and run the commands on every single change your repo.
•	The build of GitHub Actions should pass and looks like this:










		




5.	Verify Remote Tests pass
•	Lint and test steps pass:










•	And the GitHub Actions badge: 
https://github.com/devops12a/azure-devops-ci-cd-project/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg

6.	Continuous Delivery on Azure
This will involve setting up Azure Pipelines to deploy the Flask starter code to Azure App Services.
How to make this final step? - follow these steps:

•	Get the Flask starter code and add it to tour project
•	From your Azure Cloud Shell, move into your repo-folder:
(.<your-repo>) dev@Azure:~/<your-repo>$
•	make install to install Flask, pandas and scikit-learn (see requirements.txt)
Flask can create a REST API, so you can send data and receive a prediction as a response.
•	Create an app service and initially deploy it using cloud Shell, through:
1.	Create a resource-group:
az group create -l your-region -n your-r-grp
2.	Confirm that you are logged in in your work Azure account (just to be sure!)
az account set -s <subscription-id>
3.	az webapp up -l your-region -n app-name -g your-r-grp --sku F1
after a while, you can launch the app at https://app-name.azurewebsites.net
From the Cloud shell. I can look the name of this application and if I open the link in a new browser, I can see that it’s actually a running service and also available via a predict API (see make_predict_azure_app.sh)
Put your app name in make_predict_azure_app.sh (last line)
•	To verify that the server is serving the traffic correctly, you have to run the file make_predict_azure_app.sh and you should get a value of the prediction.
1.	Change the permission of make_predict_azure_app.sh, run:
chmod 744 make_predict_azure_app.sh
2.	Then go ahead, and run the file:
./make_predict_azure_app.sh
3.	You should get a value of the prediction:





•	Make Continuous Delivery
1.	To deploy to Azure App Service from Azure Pipelines, you need to establish a service connection between the two services.
2.	Go to  dev.azure.com and Sign in to Azure DevOps (To simplify the service connection, use the same email address for Azure DevOps as you use for Azure)
3.	Create a new project
Set a name and a description.
4.	From the new project page, select Project settings from the left navigation or manage your services.
5.	On the Project Settings page, select Pipelines > Service connections, then select Create service connection, and then select Azure Resource Manager from the dropdown.
6.	Next Service principal (automatic), so Subscription in Scope level.
7.	Give the connection a name and a description (Make note of the name to use later in the pipeline).
Then, save
And voilà, your service-connection-name connection of type Azure Resource Manager is ready for azure Pipelines to use from the project.
8.	Now, we enable a continuous deployment with Azure Pipelines which allow us to have a deep integration with deploying code automatically.
•	Go to Azure DevOps, then your project (which you set in pkt. 3)
•	From your project page left navigation, select Pipelines
•	Then, click on Create Pipeline
•	On the Where is your code? screen, select GitHub
•	On the Select a repository screen, select the repository that contains your app
•	You may be prompted to enter your GitHub password again as a confirmation, and then GitHub prompts you to install the Azure Pipelines extension
•	On the Configure your pipeline screen, select Python to Linux Web App on Azure, your new pipeline appears. When prompted, select the Azure subscription in which you created your Web App
•	Select Continue, then:
•	Select the Web App name
•	Select Validate and configure
This will be commit it directly into your GitHub repo, and it will run like GitHub Actions.
•	Azure Pipelines creates an azure-pipelines.yml that defines your CI/CD pipeline as a series of stages, jobs, and steps (same as GitHub Actions), where each step contains the details for different tasks and scripts.

•	And you run your pipeline, you should get a successful run of the project (even if there have been changes), like this:



