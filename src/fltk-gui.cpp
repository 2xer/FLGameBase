#include <iostream>
#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Box.H>
#include <string>

// Used to store get_centered_xy() results
struct { int x; int y; } centered_xy;

void show_info();
// Returns the x and y coordinates needed to center a window accurately with the specific width and height
void get_centered_xy(int width, int height);

int main(int argc, char **argv) {
//    show_info();
 //   get_centered_xy(200, 200);
//    std::cout << "Centered (200 width) x: " << centered_xy.x << "\nCentered (200 height) y: " << centered_xy.y << std::endl;
    Fl_Window *window = new Fl_Window(400,400,"FLGUI");
    Fl_Box *box = new Fl_Box(20,40,300,100,"Box");
    box->box(FL_THIN_UP_BOX);
    box->labelfont(FL_BOLD+FL_ITALIC);
    box->labelsize(36);
    box->labeltype(FL_SHADOW_LABEL);
    window->end();
    window->show(argc, argv);
    return Fl::run();
}

void show_info() {
    int w,h;
    w = Fl::w();
    h = Fl::h();
    std::cout << std::string(10, '=') << "Screen" << std::string(10, '=') << std::endl;
    std::cout << "Width\tHeight" << std::endl;
    std::cout << w << '\t' << h << std::endl;
    std::cout << "OS: ";
}
void get_centered_xy(int width, int height) {
    centered_xy.x = (Fl::w() - width) / 2;
    centered_xy.y = (Fl::y() - height) / 2;
}
