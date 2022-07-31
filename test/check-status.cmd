    @echo off

    rem Command file to run a basic test of the action.  The specific command
    rem is one of the various test command flavours in package.json.  User
    rem setup is needed to create a specific test case.
    rem
    rem Generally the user specified options on the test command are:
    rem
    rem 1. function to perform
    rem 2. repo owner
    rem 3. repo name (located at the same directory tree level)
    rem 4. location of config file describing this project
    rem 5. optional email repo location - it is expected this will have been
    rem set up by the developer for the test situation needed.

    set func=%1
    set owner=%2
    set repo=%3
    set config=%4
    set email=%5

    for /f "tokens=2 delims==" %%i in (..\%repo%\.secret) do set INPUT_TOKEN=%%i

    set INPUT_ACTION=%func%
    set INPUT_REPOSITORY-DIR=../%repo%
    set INPUT_CONFIG=%config%
    set INPUT_REPO-OWNER=%owner%
    set INPUT_REPO-BASEOWNER=%owner%
    set INPUT_REPO-NAME=%repo%
    set GITGITGADGET_LOREGITDIR=%email%

    ncc run ./dist/index.js
