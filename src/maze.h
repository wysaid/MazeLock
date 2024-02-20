#ifndef _MAZE_H_
#define _MAZE_H_

#define SHOW_CONSOLE 1

#include "graphics.h"

#include <commdlg.h>
#include <cstring>
#include <ctime>
#include <fstream>
#include <windows.h>

#define SCR_WIDTH 800
#define SCR_HEIGHT 600
#define MAX_CAPACITY 1000
#define BUFFER_SIZE 1000
#define BLOCK_NUM 11

typedef struct Elem
{
    int x, y;
} Elem;

typedef class Stack //为方便使用，自己实现了一个简单的栈结构
{
public:
    Stack();

    void push(const Elem& elem);
    int pop(Elem& elem);

    ~Stack();

private:
    Elem* point;
    int size, capacity;
} Stack;

class Map
{
public:
    Map() :
        m_width(0), m_height(0) {}

    bool initMap(const char* filename);
    void printMap();
    void genMask();
    void showMask();
    bool solveIt(Stack&);
    bool showResult();
    int getMaskWitdh() { return 3 * m_width; }
    int getMaskHeight() { return 3 * m_height; }
    int* getMask() { return m_mapMask; }
    void initStartPoint(int n) { m_mapMask[n] = -1; }

private:
    int m_width, m_height;
    char m_map[10 * BUFFER_SIZE];
    int m_mapMask[100 * BUFFER_SIZE];
};

bool getFileNameDlg(HWND hwnd, LPSTR pfilename);
char reflect(const char*);
char reflect(wchar_t); //无用
#endif