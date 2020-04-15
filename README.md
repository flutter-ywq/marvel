# marvel

flutter mvp project framework

## Packages

### mvp - MVP结构相关
- stateful - 继承自StatefulWidget的抽象类。规范了页面展示顺序，必要的方法过程，提供一些常用方法
- model - 规范model层必需的方法
- view - 规范view层必需的方法，如：toast(...)、showMsg(...) ...
- presenter - 规范presenter层必需的方法

### utils - 常用工具类
- encrypt - 加密相关
- json - json操作相关
- logger - 一个自定义的日志打印器，可控制是否打印开关，以及打印堆栈信息
- shared_preferences - share preferences读写操作
- string 字符串常用方法和常量 如：Empty、nullOrEmpty(...)

### widgets - 常用组件
- loading_dialog - 加载对话框
- message_dialog - 消息对话框，提供positive和negative选项和事件

### common - 公共内容
- marvel_cupertino_localizations - cupertino（库比蒂诺,苹果电脑的全球总公司所在地，位于美国旧金山,简单理解: iOS效果）所需要的自定义设置，当你需要用到Cupertino相关效果时，需要在main里设置
- page - 针对page页面层做的一些常用方法的封装，他们是顶级方法，也可以在其他地方使用
- screen - 屏幕尺寸相关的一些方法
