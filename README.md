# PSEmptyView
一行代码解决空视图需求。
### 介绍
PSEmptyView 是一个 drop-in 的组件，监控 UITableview 和 UICollectionView 的数据源，自动添加/删除空视图。
用面向切面的方式实现，无需继承子类，对原有代码无侵入性。支持「Set once, run every where」。
### 预览图
![](https://raw.githubusercontent.com/DeveloperPans/PSEmptyView/master/images/preview.png)
### 导入
##### `推荐`使用CocoaPods导入
在你的podfile文件中加入:

```ruby
pod 'PSEmptyView'
```

##### 下载并手动导入
下载zip，解压并把`PSEmptyView`文件夹以及里面的文件添加到你的工程。

### 使用方法
#### 为所有 UITableView 设置统一的空视图：
写个 Xib , 然后用 appearance 设置。

```objc
// just one line, set all table view's empty view.
[UITableView appearance].ps_emptyView = [[[NSBundle mainBundle] loadNibNamed:@"EmptyView" owner:nil options:nil]    firstObject];
```
#### 为单独的某个 UITableview 或者 UICollectionView 设置空视图
举个🌰，这个空视图比较特别，有个点击刷新的按钮。我们在 Xib 上画好界面，配置好 Target-Action，然后复制即可。

```objc
    ActionEmptyView *emptyView = [[[NSBundle mainBundle] loadNibNamed:@"ActionEmptyView"
                                                                   owner:nil
                                                                 options:nil]
                                     firstObject];
    emptyView.delegate = self;
    self.tableView.ps_emptyView = emptyView;
```
#### Tips
`ps_emptyView` 的 frame 同宿主 view（比如说 UITableView）的 frame 是一致的。你可以在这个基础上任意布局。
### 更多
详情请参阅Demo

