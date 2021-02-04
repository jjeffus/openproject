# Custom Version of OpenProject

This is a guide for setting up and deploying a custom version of
OpenProject.  Juniour developer knowledge and experience. Ruby Rails experience is required.

## Clone source

If the code is not yet downloaded then please clone it. IT IS in
~/openproject on the release server.

For contributing source code, please follow the git workflow below:

- **Fork** OpenProject on GitHub
- Clone your fork to your development machine:

```
git clone git@github.com/<username>/openproject
```

- Optional: Add the original OpenProject repository as a remote, so you can fetch changes:

```
git remote add upstream git@github.com:opf/openproject
```

- Make sure you're on the right branch. The main development branch is `dev`, release/11.1 is latest.

```
git checkout dev
```

- Create a feature branch:

```
git checkout -b feature/<short description of your feature>
```

- Make your changes, then push the branch into your ***own*** repository:

```
git push origin <your feature branch>
```

- Create a pull request against a branch of of the <opf/openproject> repository, containing a ***clear description*** of what the pull request attempts to change and/or fix.

If your pull request **does not contain a description** for what it does and what it's intentions are,
we will reject it.
If you are working on a specific work package from the [list](https://community.openproject.com/projects/openproject/work_packages),
you may include a link to that work package in the description, so we can track your work.

The core contributor team will then review your pull request according to our [code review guideline](https://www.openproject.org/open-source/development-free-project-management-software/code-review-guideliness/).
Please note that you can add commits after the pull request has been created by pushing
to the branch in your fork.

## Build Debian/Ubuntu Version

First make whatver changes are needed. When the release is prepapred.

```
cd ~/openproject
./make_release.sh
```

This process will First run:
```
pkgr package --debug /home/ubuntu/openproject
```

This will produce a version that is named like
`openproject_10.5-20210204092935_amd64.deb`

It will be copied into /var/www/html/openproject-latest.deb

## Testing

Please add tests to your code to verify functionality, especially if it is a new feature.

Pull requests will be verified by TravisCI as well,
but please run them locally as well and make sure they are green before creating your pull request.
We have a lot of pull requests coming in and it takes some time to run the complete suite for each one.

If you push to your branch in quick succession, please consider stopping the associated Travis builds, as Travis will run for each commit. This is especially true if you force push to the branch.

Please also use `[ci skip]` in your commit message to suppress builds which are not necessary
(e.g. after fixing a typo in the `README`).

## Upstream issue tracking and coordination

We need to stay in track with security updates and changes.
Please have a look at the following pages:

- [Development timeline](https://community.openproject.com/projects/openproject/timelines/36)
- [Product roadmap and release planning](https://community.openproject.com/projects/openproject/roadmap)
- [Wish list](https://community.openproject.com/versions/26)
- [Bug backlog](https://community.openproject.com/versions/136)
- [Report a bug](https://www.openproject.org/development/report-a-bug/)
- [Submit a feature idea](https://www.openproject.org/development/submit-feature-idea/)


## Bugs and hotfixes

Bugfixes for one of the actively supported versions of OpenProject should be issued against the respective branch.
A fix for the current version (called "Hotfix" and the branch ideally being named `hotfix/XYZ`)
should target `release/*` and a fix for the former version
(called "Backport" and the branch ideally being named `backport/XYZ`)
should target `backport/*`. We will try to merge hotfixes into dev branch
but if that is no trivial task, we might ask you to create another PR for that.

## Inactive pull requests

We want to keep the Pull request list as cleaned up as possible - we will aim close pull requests
after an **inactivity period of 30 days** (no comments, no further pushes)
which are not labelled as `work in progress` by us.

## Security

If you notice a security issue in OpenProject, please send us a gpg encrypted email to security@openproject.com and describe the issue you found. Download our public gpg key [here](https://pgp.mit.edu/pks/lookup?op=get&search=0x7D669C6D47533958).

Please include a description on how to reproduce the issue if possible. Our security team will get your email and will attempt to reproduce and fix the issue as soon as possible.
