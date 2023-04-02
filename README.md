# Widget Displayer

用于演示预览一些小功能
@启用了状态保存

## 使用方法
1.为展示的文件建立一个独立的文件
2.创建StateLessWidget,返回DisplayPage
```dart
final String title;       // 页面标题，即appBar的标题
final String? description; // 组件描述
final Widget? other;      // 其他
final Widget child;       // 要展示的组件
```

如果设置description为null，会显示title
other为可选项

3.添加页面到main的PageView children中
