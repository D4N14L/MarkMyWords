using Gtk;

class Toolbar : Gtk.HeaderBar {
    private Button new_button;
    private Button open_button;
    private Button save_button;

    private MenuButton export_button;
    private Gtk.MenuItem export_pdf;
    private Gtk.MenuItem export_html;

    public signal void new_clicked ();
    public signal void open_clicked ();
    public signal void save_clicked ();
    public signal void export_html_clicked ();
    public signal void export_pdf_clicked ();

    public Toolbar () {
        this.show_close_button = true;
        setup_ui ();
        setup_events ();
    }

    private void setup_ui () {
        new_button = new Button.from_icon_name ("document-new",
                                                IconSize.LARGE_TOOLBAR);
        new_button.set_tooltip_text (_("New file"));

        open_button = new Button.from_icon_name ("document-open",
                                                 IconSize.LARGE_TOOLBAR);
        open_button.set_tooltip_text (_("Open file"));

        save_button = new Button.from_icon_name ("document-save",
                                                 IconSize.LARGE_TOOLBAR);
        save_button.set_tooltip_text (_("Save file"));

        export_button = new MenuButton ();
        export_button.image = new Image.from_icon_name ("document-export",
                                                        IconSize.LARGE_TOOLBAR);
        var menu = new Gtk.Menu ();
        export_pdf = new Gtk.MenuItem.with_label (_("Export PDF"));

        export_html = new Gtk.MenuItem.with_label (_("Export HTML"));

        menu.add (export_html);
        menu.add (export_pdf);
        menu.show_all ();

        export_button.set_popup (menu);

        pack_start (new_button);
        pack_start (open_button);
        pack_start (save_button);

        pack_end (export_button);
    }

    private void setup_events () {
        new_button.clicked.connect (() => {
            new_clicked ();
        });

        open_button.clicked.connect (() => {
            open_clicked ();
        });

        save_button.clicked.connect (() => {
            save_clicked ();
        });

        export_pdf.activate.connect (() => {
            export_pdf_clicked ();
        });

        export_html.activate.connect (() => {
            export_html_clicked ();
        });

    }
}