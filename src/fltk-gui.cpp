#include <iostream>
#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Tabs.H>
#include <string>

// Used to store get_centered_xy() results
struct { int x; int y; } centered_xy;

void show_info();
// Returns the x and y coordinates needed to center a window accurately with the specific width and height
void get_centered_xy(int width, int height);

int main(int argc, char **argv) {
    int x, y, w, h;
    Fl::screen_work_area(x, y, w, h);
//    show_info();
 //   get_centered_xy(200, 200);
//    std::cout << "Centered (200 width) x: " << centered_xy.x << "\nCentered (200 height) y: " << centered_xy.y << std::endl;
    Fl_Window *window = new Fl_Window(0,0,1000,600,"FLGUI");
    Fl_Tabs *tabs1 = new Fl_Tabs(10,10,400,40); tabs1->selection_color(FL_DARK3);

    Fl_Group *group1 = new Fl_Group(10,60,200,200,"Group1"); group1->box(FL_THIN_UP_BOX); group1->labelsize(18); {
    Fl_Box *box11 = new Fl_Box(10,60,100,100,"Box11"); box11->box(FL_THIN_UP_BOX); box11->labelsize(18);
    Fl_Box *box12 = new Fl_Box(110,60,100,100,"Box12"); box12->box(FL_THIN_UP_BOX); box12->labelsize(18);
    } group1->end();

    Fl_Group *group2 = new Fl_Group(10,60,200,200,"Group2"); group2->box(FL_THIN_UP_BOX); group2->labelsize(18); {
    Fl_Box *box21 = new Fl_Box(10,60,100,100,"Box21"); box21->box(FL_THIN_UP_BOX); box21->labelsize(18);
    Fl_Box *box22 = new Fl_Box(110,60,100,100,"Box22"); box22->box(FL_THIN_UP_BOX); box22->labelsize(18);
    } group1->end();

    tabs1->end();
    window->resizable();
    window->size_range(100, 100);
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

 void tabs1Callback(Fl_Widget *w, void*) {
     Fl_Tabs *tabs = (Fl_Tabs*)w;
     tabs->selection_color( (tabs->value())->color() );
 }