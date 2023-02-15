#include <iostream>
#include <string>
#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Tabs.H>
#include <FL/Fl_Input.H>
#include <FL/Fl_Secret_Input.H>
#include <FL/Fl_Button.H>

int main(int argc, char **argv) {
    Fl::scheme("gtk+");
    int x,y,w,h;
    Fl::screen_work_area(x,y,w,h);
    Fl_Window *window = new Fl_Window(x,y,w,h,"FLGUI"); window->size_range(1210, 810);
    x=y=w=h=0;

    x=10; y=10;
    Fl_Tabs *tabs1 = new Fl_Tabs(x,y,1200,800); tabs1->selection_color(FL_DARK2); tabs1->box(FL_THIN_UP_BOX);{
        y+=50;
        Fl_Group *main = new Fl_Group(x,y,1200,750,"Main"); main->box(FL_THIN_UP_BOX); main->labelsize(20); main->labelfont(FL_BOLD);{
            Fl_Box *statusLogin = new Fl_Box(x,y,400,25,"Status: ${PLACEHOLDER}"); statusLogin->box(FL_THIN_UP_BOX); statusLogin->labelsize(18); statusLogin->align(FL_ALIGN_LEFT | FL_ALIGN_TOP | FL_ALIGN_INSIDE); x+=80; y+=40;
            Fl_Input *username = new Fl_Input(x,y,100,30,"Username: "); y+=40;
            Fl_Secret_Input *password = new Fl_Secret_Input(x,y,100,30,"Password: "); x-=80; y+=40;
            Fl_Button *login = new Fl_Button(x,y,90,30,"Login"); login->down_box(FL_THIN_DOWN_BOX); x+=110;
            Fl_Button *signup = new Fl_Button(x,y,90,30,"Sign Up"); signup->down_box(FL_THIN_DOWN_BOX);
        } main->end();


        Fl_Group *group2 = new Fl_Group(10,60,1200,800,"Settings"); group2->box(FL_THIN_UP_BOX); group2->labelsize(18); {
            Fl_Box *box1 = new Fl_Box(1400,60,100,100,"Box21"); box1->box(FL_THIN_UP_BOX); box1->labelsize(18);
            Fl_Box *box2 = new Fl_Box(110,60,100,100,"Box22"); box2->box(FL_THIN_UP_BOX); box2->labelsize(18);
        } group2->end();

    } tabs1->end();
    window->end();
    window->show(argc, argv);
    return Fl::run();
}