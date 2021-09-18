/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2021 Christopher Leggett <chris@leggett.dev>
 */

namespace Leapod {
	
	public errordomain LeapodLibraryError {
	    ADD_ERROR, IMPORT_ERROR, MISSING_URI;
	}
	
	public class Library {
		public Gee.ArrayList<Podcast> podcasts;
		
		public Library () {
		    podcasts = new Gee.ArrayList<Podcast> ();
    
            podcasts.add (new FeedParser ().get_podcast_from_file ("https://latenightlinux.com/feed/mp3"));
            podcasts.add (new FeedParser ().get_podcast_from_file ("https://feeds.fireside.fm/linuxunplugged/rss"));
            podcasts.add (new FeedParser ().get_podcast_from_file ("https://feeds.fireside.fm/coder/rss"));
		}
	}
}
