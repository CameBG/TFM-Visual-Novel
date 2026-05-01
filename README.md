## Ink Visual Novel Lite Template

A simple visual novel template for web-based Ink games!

• Create scenes with individual backgrounds.
• Add characters with multiple sprites and move them around.
• Add sound effects to scenes.
• Adjust how character dialogue is formatted with HTML.
• Click through dialogue one line at a time, either with mouse or keyboard.
• Flip to dark mode for easier reading.
• Save and load game progress.
• View dialogue history.


## To Start...

To use this template, you'll need a program called Inky to script in Ink:

https://www.inklestudios.com/ink/

Here's a beginner's tutorial for how to use Ink:

https://www.inklestudios.com/ink/web-tutorial/

To put your story into the template, use File > Export story.js only in Inky, and replace the `story.js` file in the template.

If you get an error about the Ink versions not matching, it means Inky has updated and I haven't noticed. If this happens, you should be able to do the full File > Export for web (put it in a different directory) and copy its `ink.js` file into the template.


## Writing Dialogue

Write your choices in square brackets so the VN runner can distinguish the player's lines from the NPCs' lines:


```
* [Yeah, sure.]
* [No way!]

or

+ [Yeah, sure.]
+ [No way!]

```


## Images

The image command is a tag.

`#img id: filename x y width`

`id` is the name of this sprite, so you can later move or remove it.

`x` and `y` are the image's placement as a percentage of the camera size, starting with `0 0` at the top-left. So `50 100` is bottom center, `100 100` is bottom right.

`width` is the size of the image as a percentage of the camera width.

Note that only the filename is case-sensitive. You can capitalize the `#IMG` and `ID:` parts however you like (though it's probably good to get into the habit of being consistent).

-----

So you could say `#img bro: bro-happy.png 50 100 25` to put a happy bro at the bottom center.

And then `#img sis: lady-angry.png 80 100 25` and `#img bro: bro-sad.png 25 100` to have his angry sister show up on the right while he moves to the left. Note that we can leave off the width on bro the second time: he'll stay the same size.

Finally he could leave (`#img bro:`) while she moves nearer the center (`#img sis: lady-sad.png 60 100`).

-----

To change the background, you can use `#img bg: background-evening.png`. The background doesn't take any sizing or placement parameters: it just covers the screen.


## Speaker Tags

Start a line with `Fred:` or `Gertrude:` or whatever to set the current speaker tag for the transcript.

If the same person is speaking multiple consecutive lines, you can leave out the tag on the later ones and it'll be automatically added. But you probably want to put a speaker tag at the start of each named knot or stitch, in case the player comes to it from a place where someone different is speaking.

By default, speaker tags will be shown for the NPCs but not for the player choices. Set `VAR strip_speaker_tags = true` to strip these entirely. Use `false` to show them everywhere (even in player choices), or `"player"` for the default behavior.


## Styling

Hopefully the CSS isn't too hard to follow. I have at least put all the basic colors for both dark and light modes in variables at the top of the file so they're all in one place.


## Other Ink Commands (tags)

Again, note that none of the tags are case-sensitive: you can capitalize them however you want. And you can put spaces between the `#` and the command name if you want. You *will* have to get the capitalization correct for filenames though.

* `#audio audio/my-audio-file.mp3` will play a sound effect. This is extremely simple and limited: you can only play one sound file at a time.

* `#restart` will restart the game

* Since the game this template was made for, Fix Your Mother's Printer, was styled as a video call app, we added the option to turn off the “video” and display the choices as buttons in a pop-up box. I don't know what you'd use this for, but I didn't see any reason to tear it out. So turn it on with `#alert` and go back to normal character dialogue with `#dialogue`.

