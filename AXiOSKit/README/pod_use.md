## 消除CocoaPods所有警告,也可以指定,另外的命令
inhibit_all_warnings!

def pod_use


# *********在用*********

## 网络请求
pod 'AFNetworking'

## 图片加载
 pod 'SDWebImage'

## 约束
pod 'Masonry'

## 键盘动画
### UIViewController + UITableView 的使用方式的支持都有问题。 UITableView + UISearchController 会偏移 使用约束=NO解决
pod 'IQKeyboardManager'

## tableview 上下刷新
pod 'MJRefresh'

## 服务器返回json空,安全解析
pod 'NullSafe'


## json 解析
pod 'MJExtension'

## Facebook kvo 自己封装下
pod 'KVOController'

## UIWebView WKWebView 与JS 交互
pod 'WebViewJavascriptBridge'

## tableview 空集合
pod 'DZNEmptyDataSet'

## 提示框
pod 'MBProgressHUD'

## aop 拦截 替换 类 实例 方法
pod 'Aspects'

## UITableViewCell高度计算
pod 'UITableView+FDTemplateLayoutCell'

## 安全集合
pod 'AvoidCrash'

## 保护App
pod 'JJException'



