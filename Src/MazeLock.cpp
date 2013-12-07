#include "wysaid.h"

char g_filename[MAX_PATH];
clock_t g_time;

int main()
{
	initgraph(SCR_WIDTH, SCR_HEIGHT);
	setrendermode(RENDER_AUTO);
	setcaption("请在弹出对话框内选择地图文本文件!");
	cleardevice();
	if(getFileNameDlg(getHWnd(), g_filename))
	{
		setcaption("EGE之无聊专门解炮姐的迷宫小应用开始运转~~");
		if(!mazeLock())
		{
			cleardevice();
			outtextxy(20, 200, "你这迷宫不科学啊! 为毛我走不粗去!坑爹呢!");
			outtextxy(10, 300, "迷宫要在http://blog.misakamm.org/p/404生成啊亲!");
			outtextxy(20, 400, "按下Enter键吧，我把你送过去~~不然就不跟你玩了~~");
			if(getch() == '\r')
				ShellExecuteA(getHWnd(), "open", "http://blog.misakamm.org/p/404", NULL, NULL, SW_SHOWMAXIMIZED);
		}
	}
	else
	{
		outtextxy(100, 100,"您取消了文本选择对话框。如果不知道地图文本在哪，请参考: ");
		outtextxy(100, 120, "http://tieba.baidu.com/p/1966519660");	
		outtextxy(20, 150, "按Enter键吾将帮你自动打开此页面然后本程序自动关闭，按其他键直接关闭...");
		if(getch() == '\r')
			ShellExecuteA(getHWnd(), "open", "http://tieba.baidu.com/p/1966519660", NULL, NULL, SW_SHOWMAXIMIZED);
	}
	closegraph();
	return 0;
}

bool mazeLock()
{
	Stack stk;
	Map map;
	Elem elem = {0, 2};  //转换为掩码以后的入口
	int width, height;
	if(!map.initMap(g_filename)) return false;
	map.printMap();
	getch();
	outtextxy(20, 200, "正在艰难地识别这个地图~~");
	g_time = clock();
	map.genMask();
	width = map.getMaskWitdh();
	height = map.getMaskHeight();
	map.initStartPoint(2 * width); //产生掩码以后，把初始位置设置为-1.
	map.initStartPoint(3 * width); //每次开始应该向右走，虽然不要这句也无所谓。
	stk.push(elem);
	if(!map.fuckit(stk)) return false;
	g_time = clock() - g_time;
	xyprintf(20, 300, "我表示用了 %d ms 之后终于算完了.", g_time);
	xyprintf(20, 400, "3秒钟后给你演示，不想等的话按任意键马上开始!");
	g_time = 3000;
	while(!kbhit() && (g_time -= 100)) Sleep(100);
	cleardevice();
	map.showMask();
	if(!map.showResult())
	{
		MessageBoxA(getHWnd(), "似乎出了什么问题，按理说应该解得出来的\r\n但是，挂掉了，重新启动试试？", "求解超过10步，自动停止", MB_OK);
	}
	return true;
}
