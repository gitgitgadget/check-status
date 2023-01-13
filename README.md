<!-- start title -->

# gitgitgadget Action: check-status

<!-- end title -->
<!-- start description -->

This is a GitHub action to perform various scheduled actions with projects using gitgitgadget to submit changes. It is used as a scheduled action running in a separate repo or the repo it is acting upon. The use case is for repos that will not allow complex GitHub actions in the codebase when the GitHub repo is a clone that is used to submit updates to a non-GitHub maintained repo.

<!-- end description -->
<!-- start contents -->
<!-- end contents -->

## Usage

<!-- start usage -->

```yaml
- uses: gitgitgadget/gitgitgadget-action-check-status@v0.5.0
  with:
    # The action to be performed. It must be one of the following: "update-open-prs",
    # "update-commit-mappings", "handle-open-prs", "handle-new-mails".
    action: ""

    # Repository owner.
    repo-owner: ""

    # Repository name.
    repo-name: ""

    # A repo scoped GitHub Personal Access Token.
    token: ""

    # The location of the repository.
    repository-dir: ""

    # The location of the repository with gitgitgadget configuration information. This
    # would be used in place of the `config` parameter for the `git` repository. This
    # is normally the gitgitgadget repo with any needed configuration settings. Most
    # users will specify a `config`.
    config-repository-dir: ""

    # JSON configuration for commands.
    config: ""
```

<!-- end usage -->

## Inputs

<!-- start inputs -->

| **Input**                   | **Description**                                                                                                                                                                                                                                                                | **Default** | **Required** |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- | ------------ |
| **`action`**                | The action to be performed. It must be one of the following: "update-open-prs", "update-commit-mappings", "handle-open-prs", "handle-new-mails".                                                                                                                               |             | **true**     |
| **`repo-owner`**            | Repository owner.                                                                                                                                                                                                                                                              |             | **true**     |
| **`repo-name`**             | Repository name.                                                                                                                                                                                                                                                               |             | **true**     |
| **`token`**                 | A repo scoped GitHub Personal Access Token.                                                                                                                                                                                                                                    |             | **true**     |
| **`repository-dir`**        | The location of the repository.                                                                                                                                                                                                                                                |             | **true**     |
| **`config-repository-dir`** | The location of the repository with gitgitgadget configuration information. This would be used in place of the `config` parameter for the `git` repository. This is normally the gitgitgadget repo with any needed configuration settings. Most users will specify a `config`. |             | **false**    |
| **`config`**                | JSON configuration for commands.                                                                                                                                                                                                                                               |             | **true**     |

<!-- end inputs -->
<!-- start outputs -->
<!-- end outputs -->
<!-- start [.github/ghdocs/examples/] -->
<!-- end [.github/ghdocs/examples/] -->

## Contributing
The current tests are Windows based.

### Using a local `gitgitgadget`
This action is a thin layer that uses [gitgitgadget](https://github.com/gitgitgadget/gitgitgadget)
for most of the processing.  If you have local changes to `gitgitgadget` that need to be
tested:
1. In the `gitgitgadget` project run `npm pack` to generate an installable package.  By default,
the package will be located in the root directory of the project.  This can be changed by
specifying `--pack-destination=` on the command.
2. Change the `package.json` to point to the `tgz` packaage file and run `npm install gitgitgadget`.

### action.yml changes
Changes to `action.yml` require regenerating the `README.md`. This is done using `docker`.  If it
is not available it should be installed.  The `README.md` is updated using `npm run build:readme`.
**Note**: markup is very limited in the `action.yml`.

### Source Changes
The action is built using `npm run build`.  This builds a standalone runnable at `dist/index.js`.

### Testing
The action supports four different checks. The checks and associated npm commands are:

- update-open-prs (test:upr)
- update-commit-mappings (test:ucm)
- handle-open-prs (test:hop)
- handle-new-mails (test:hnm)

A windows command is provided for testing. It requires:

1. A test repo set up to be monitored. A GitHub PAT must already be set as
   the INPUT_TOKEN environment variable or indentifed in a `.secret` file in
   the repo. The format of the `.secret` file is `INPUT_TOKEN=<pat>`.
2. A config describing the test repo.
3. For testing mail checks, a mail repo must be available with valid email.

The test is run using the command:

```
npm run <test-name> <test-repo-owner> <test-repo-name> <config-location> <email-repo-location>
```
### Make a pull request
First, if there are related `gitgitgadget` changes, that pull request should be done first.  A fresh
install, build and test should be done using the unmodified `package.json`.

`npm version` may need to be done based on the level of change.  If this is done, make sure the
tags get pushed to GitHub.

The patch series will need to include the `dist/index.js`.

## TODO
A separate action will be developed to rebuild the `dist/index.js` as needed when updates to
`gitgitgadget` have been made.
