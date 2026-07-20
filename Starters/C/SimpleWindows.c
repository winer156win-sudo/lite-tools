#include <stdio.h>
#include <windows.h>

// Window configuration variables
const char* WINDOW_TITLE = "Simple Window";
const char* CLASS_NAME = "SimpleWindowClass";
const int WINDOW_WIDTH = 800;
const int WINDOW_HEIGHT = 600;

// Forward declarations
LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam);

int main() {
    create_window();
    return 0;
}

int create_window() {
    declare_window_class();
    create_window_instance();
    show_window();
    return 0;
}

void declare_window_class() {
    WNDCLASS wc = {0};
    wc.lpfnWndProc = WindowProc;
    wc.hInstance = GetModuleHandle(NULL);
    wc.lpszClassName = CLASS_NAME;
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    
    RegisterClass(&wc);
}

HWND ghwnd = NULL;

void create_window_instance() {
    ghwnd = CreateWindowEx(
        0,
        CLASS_NAME,
        WINDOW_TITLE,
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, CW_USEDEFAULT,
        WINDOW_WIDTH, WINDOW_HEIGHT,
        NULL, NULL,
        GetModuleHandle(NULL),
        NULL
    );
}

void show_window() {
    if (!ghwnd) return;
    
    ShowWindow(ghwnd, SW_SHOW);
    UpdateWindow(ghwnd);
    
    // Message loop
    MSG msg = {0};
    while (GetMessage(&msg, NULL, 0, 0)) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
}

LRESULT CALLBACK WindowProc(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
    switch (uMsg) {
        case WM_CLOSE:
            DestroyWindow(hwnd);
            break;
        case WM_DESTROY:
            PostQuitMessage(0);
            break;
        default:
            return DefWindowProc(hwnd, uMsg, wParam, lParam);
    }
    return 0;
}