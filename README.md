# Zemus

Zemus is a ruby gem that translates URLs into embedable code you can insert on a page.  It does its magic by simply inspecting and hacking up the URL itself, it makes no external requests to a webservice.

It currently translates the following URLs to embedabble HTML in standard mode:

* images
* mp3s
* youtube
* vimeo
* vine
* kickstarter
* soundcloud

For embeddable elements that require flash, we have implemented a "dirty mode" that will allow these objects for browsers that can display them, and show a message about the lack of compatibility on browsers that don't support flash, such as mobile devices. For flash embeds, there are two hidden div classes, .zemusflashembed and .zemusnoflash, and some lightweight javascript will detect flash capability and display the proper one.

In dirty mode, embedding the following URLs is also supported:

* twitch

## Installation

Add this line to your application's Gemfile:

    gem 'zemus'

And then execute:

    $ bundle
	
**If you only want to use standard mode and embed HTML5 widgets only, you're done. Skip to usage below.**

To enable dirty mode, enter the following command:

    $ rails g zemus:install
	
This will install the necessary javascript and css files to your project's app/assets directory. At runtime, Zemus will check for the existence of these files to determine whether to embed the supported flash or to fall back to normal mode and return a truncated link.

Be sure to precompile your assets before going live to ensure the zemus.js and zemus.css files get included.

    $ rake assets:precompile
	

## Usage

    Zemus.embed("http://i.imgur.com/r8JB38S.jpg")

    Zemus.embed("http://www.youtube.com/watch?v=bjAcMDGJcHI")

    Zemus.embed("http://www.kickstarter.com/projects/sleepninja/monsters-ate-my-birthday-cake")

    Zemus.embed("http://www.podtrac.com/pts/redirect.mp3/content.duckfeed.tv/bsc/bsc_E001.mp3")

    Zemus.embed("https://soundcloud.com/destructoid/super-mario-world-by-video")

    Zemus.embed("http://vimeo.com/21929292")

    Zemus.embed("https://vine.co/v/bFPjjheVnau/embed/simple")

If Zemus can't automagically transfigure the URL it just returns it as a truncated link.

## Styling

Zemus will output different embedded URLs with different classes, depending on the needs of the particular service. Check the generated HTML output in your project to find what to style.

## TODO / Contributions

When we output HTML for images and other URLs we tack on some HTML and classes some people may not need.  For instance, to get the images we embed to be responsive we tack on the Bootstrap 3 "img-responsive img-thumbnail" classes.  We also put a link under the Kickstarter embed to take the person to the page itself.  I totally get some people may not want that so feel free to submit a patch to fix this.

If there is another URL you want to embed, submit the patch.  As long as you can create the embed from the URL itself, we will consider the patch.  Also, we currently want to keep the things we embed to HTML5 widgets.

## They That Created The Greatness

Zemus was extracted from and is running in production at http://cheerfulghost.com by Jon Dodson and Mark Tabler.

Contributions from:

Travis Newman @travisnewman

## Even more

Zemus was named after the antagonist of Final Fantasy IV.

http://finalfantasy.wikia.com/wiki/Zemus