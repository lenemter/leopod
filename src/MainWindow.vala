/*
 * SPDX-License-Identifier: MIT
 * SPDX-FileCopyrightText: 2021 Christopher Leggett <chris@leggett.dev>
 */

 public class MainWindow : Gtk.Window {
     public MainWindow (Gtk.Application application) {
         Object (
             application: application,
             default_height: 600,
             default_width: 1000,
             icon_name: "com.github.leggettc18.leapod",
             title: _("Leapod")

         );
     }

     construct {
        int width, height;
        var soup_client = new SoupClient ();
        var pixbuf = new Gdk.Pixbuf.from_stream (soup_client.request (HttpMethod.GET, "https://chrisleggett.me/me.jpg"));
        pixbuf = pixbuf.scale_simple (170, 170, Gdk.InterpType.BILINEAR);
        var flowbox = new Gtk.FlowBox () {
            column_spacing = 20,
            row_spacing = 20,
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.START,
            orientation = Gtk.Orientation.HORIZONTAL,
            height_request = height,
            width_request = width,
            margin = 20
        };
        var label = new Gtk.Label ("Hello World!");
        var image = new Gtk.Image.from_pixbuf (pixbuf);
        var button = new Gtk.Button () {
            image = image
        };
        flowbox.add (label);
        flowbox.add (button);
        var scrolled_window = new Gtk.ScrolledWindow (null, null);
        scrolled_window.add(flowbox);
        
        add (scrolled_window);
        
        size_allocate.connect ((allocation) => {
            flowbox.set_size_request (allocation.width - 40, allocation.height - 40);
        });
        
        button.clicked.connect (() => {
            label.set_text("Image pressed");
        });
     }
 }
