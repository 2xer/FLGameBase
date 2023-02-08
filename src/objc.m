#import <AppKit/AppKit.h>

int checkScale();

int main(int argc, const char * argv[]) {
    printf("%d\n", checkScale());
    return 0;
}

int checkScale() {
	NSApp = [NSApplication sharedApplication];
    return (int)[[NSScreen mainScreen] backingScaleFactor];
}