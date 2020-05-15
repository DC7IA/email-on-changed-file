This is a simple script notifying me when a file on the web changes.

It specifically notifies me when the PDF containing the next amateur radio exams in Germany changed.

It's absolute crap and I know there are ways to do it more efficiently, but so far I couldn't be bothered.

I do not recommend using it. But it works for the problem I wanted to solve. :D

----

## Usage

I recommend you don't use this.
Please don't complain about the terrible quality of the script.
It solves one specific problem for me. However, please do make suggestions on how I can improve it. :)


Just `mv email-on-changed-file.vars.example email-on-changed-file.vars` and set the varibles.

Make it a cronjob and set the variable file as an argument: `./email-on-changed-file.sh email-on-changed-file.vars`

It will compare the md5sum of the downloaded file with that of the previous run.

This script needs the `mail` command to be present. I wrote the script using mailx 12.5 7/5/10, I don't know whether or not it will work with the other versions.
