# layerlab

Overview
This repository hosts the website for [Layerlab](https://layerlab.org/). If you're interested in contributing to the project, this guide will help you set up your environment, make changes, and see them live on your forked version before submitting a pull request (PR).

Getting Started
1. Fork the Repository
Navigate to the repository.
Click the Fork button in the upper right corner to create your own copy of the repository.
2. Clone Your Fork
Open your terminal or Git Bash.

Clone your fork to your local machine:

```
git clone https://github.com/your-username/repo.git
```
Navigate into the project directory:
```
cd repo
```

3. Set Upstream and Origin
Set the upstream remote to the original repository:

```
git remote add upstream https://github.com/username/repo.git
```


Verify the remotes:
```
git remote -v
```
You should see both origin (your fork) and upstream (the original repository).

4. Keep Your Fork in sync with original
Fetch the latest changes from the upstream repository:

```
git fetch upstream
```

5. Make Changes in the gh-pages Branch
Switch to the gh-pages branch:
```
git checkout gh-pages
```
Make your changes to the files.

Test your changes locally.

Add and commit your changes:

```
git add .
git commit -m "Description of the changes"
```

6. Push Changes to GitHub
Push your changes to your fork on GitHub:

```
git push -u origin gh-pages
```
The gh-pages branch in your fork will update with your changes, and you can see them live at https://your-username.github.io/repo/.

7. Create a Pull Request (PR) ->
Go to your forked repository on GitHub.
Click the Compare & pull request button(create PR in gh-pages branch).
Write a descriptive title and comment for your PR.
Submit the PR.

Conclusion
---
Thank you for contributing! Your help improves the project and ensures its long-term success. If you have any questions, feel free to open an issue.


