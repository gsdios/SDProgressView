# SDProgressView
简便美观的进度指示器

此系列共有六种样式的进度指示器，现在以SDLoopProgressView为例简单介绍下用法：

1. 包含主头文件  "SDProgressView.h" 


2. 设置（仅需三步）

  SDLoopProgressView *loop = [SDLoopProgressView progressView];

  loop.frame = ;

  loop.progress = ; // 加载进度，当加载完成后会自动隐藏

---------------------------------------------------------------------------------------


// 如果需要直接退出
[loop dismiss];





![](http://cc.cocimg.com/bbs/attachment/Fid_19/19_441660_57ecfb07c257edf.gif)


