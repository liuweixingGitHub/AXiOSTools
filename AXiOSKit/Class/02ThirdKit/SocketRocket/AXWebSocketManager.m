//
//  AXWebSocketManager.m
//  AXiOSKit
//
//  Created by AXing on 2019/3/29.
//  Copyright © 2019 liu.weixing. All rights reserved.
//

#import "AXWebSocketManager.h"
//#if __has_include(<SocketRocket/SocketRocket.h>)
//
//#import "AFNetworkReachabilityManager.h"
//
//#ifndef dispatch_queue_async_safe
//#define dispatch_queue_async_safe(queue, block)\
//if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(queue)) {\
//block();\
//} else {\
//dispatch_async(queue, block);\
//}
//#endif
//
//#ifndef dispatch_main_async_safe
//#define dispatch_main_async_safe(block) dispatch_queue_async_safe(dispatch_get_main_queue(), block)
//#endif
//
//@interface AXWebSocketManager ()<SRWebSocketDelegate>
//
//@property (nonatomic, strong) NSTimer *heartBeatTimer; //心跳定时器
//@property (nonatomic, strong) NSTimer *netWorkTestingTimer; //没有网络的时候检测网络定时器
//@property (nonatomic, assign) NSTimeInterval reConnectTime; //重连时间
//@property (nonatomic, assign) BOOL isActivelyClose;    //用于判断是否主动关闭长连接，如果是主动断开连接，连接失败的代理中，就不用执行 重新连接方法
//
//@end
//@implementation WebSocketManager
//
//+(instancetype)shared{
//    static WebSocketManager *_instance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [[self alloc]init];
//    });
//    return _instance;
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if(self){
//        self.reConnectTime = 0;
//        self.isActivelyClose = NO;
//    }
//    return self;
//}
//
////建立长连接
//- (void)connectServer{
//    self.isActivelyClose = NO;
//    
//    self.webSocket.delegate = nil;
//    [self.webSocket close];
//    _webSocket = nil;
//    //    self.webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"https://dev-im-gateway.runxsports.com/ws/token=88888888"]];
//    //    self.webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"ws://chat.workerman.net:7272"]];
//    
//    self.webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"ws://localhost:8080/chat"]];
//    
//    self.webSocket.delegate = self;
//    [self.webSocket open];
//}
//
//- (void)sendPing:(id)sender{
//    [self.webSocket sendPing:nil];
//    
//}
//- (void)RMWebSocketClose {
//    
//    self.isActivelyClose = NO;
//    self.webSocket.delegate = nil;
//    [self.webSocket close];
//}
//#pragma mark --------------------------------------------------
//#pragma mark - socket delegate
/////开始连接
//-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
//    
//    NSLog(@"socket 开始连接");
//    self.isConnect = YES;
//    self.connectType = WebSocketConnect;
//    [self initHeartBeat];///开始心跳
//}
//
/////连接失败
//-(void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
//    NSLog(@"连接失败 %@",error);
//    
//    
//    self.isConnect = NO;
//    self.connectType = WebSocketDisconnect;
//    
//    NSLog(@"连接失败，这里可以实现掉线自动重连，要注意以下几点");
//    NSLog(@"1.判断当前网络环境，如果断网了就不要连了，等待网络到来，在发起重连");
//    NSLog(@"2.连接次数限制，如果连接失败了，重试10次左右就可以了");
//    
//    //判断网络环境
//    if (AFNetworkReachabilityManager.sharedManager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){ //没有网络
//        
//        [self noNetWorkStartTestingTimer];//开启网络检测定时器
//    }else{ //有网络
//        
//        [self reConnectServer];//连接失败就重连
//    }
//}
//
//- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
//    NSLog(@"接受message数据--> %@",message);
//    if (self.didReceiveMessage) {
//        self.didReceiveMessage(message);
//    }
//}
//
/////关闭连接
//-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
//    
//    self.isConnect = NO;
//    
//    if(self.isActivelyClose){
//        self.connectType = WebSocketDefault;
//        return;
//    }else{
//        self.connectType = WebSocketDisconnect;
//    }
//    
//    NSLog(@"被关闭连接，code:%ld,reason:%@,wasClean:%d",code,reason,wasClean);
//    
//    [self destoryHeartBeat]; //断开连接时销毁心跳
//    
//    //判断网络环境
//    if (AFNetworkReachabilityManager.sharedManager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){ //没有网络
//        [self noNetWorkStartTestingTimer];//开启网络检测
//    }else{ //有网络
//        NSLog(@"关闭连接");
//        _webSocket = nil;
//        [self reConnectServer];//连接失败就重连
//    }
//}
//
/////ping
//-(void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongData{
//    NSString *pong = [[NSString alloc] initWithData:pongData encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"接受pong数据--> %@",pong);
//}
//
//
//#pragma mark - NSTimer
//
////初始化心跳
//- (void)initHeartBeat{
//    //心跳没有被关闭
//    if(self.heartBeatTimer) {
//        return;
//    }
//    [self destoryHeartBeat];
//    
//    dispatch_main_async_safe(^{
//        
//        self.heartBeatTimer  = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(senderheartBeat) userInfo:nil repeats:true];
//        [[NSRunLoop currentRunLoop]addTimer:self.heartBeatTimer forMode:NSRunLoopCommonModes];
//    });
//    
//    
//}
////重新连接
//- (void)reConnectServer{
//    if(self.webSocket.readyState == SR_OPEN){
//        return;
//    }
//    
//    if(self.reConnectTime > 1024){  //重连10次 2^10 = 1024
//        self.reConnectTime = 0;
//        return;
//    }
//    
//    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.reConnectTime *NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        if(weakSelf.webSocket.readyState == SR_OPEN && weakSelf.webSocket.readyState ==  SR_CONNECTING) {
//            return;
//        }
//        
//        [weakSelf connectServer];
//        //        CTHLog(@"正在重连......");
//        
//        if(weakSelf.reConnectTime == 0){  //重连时间2的指数级增长
//            weakSelf.reConnectTime = 2;
//        }else{
//            weakSelf.reConnectTime *= 2;
//        }
//    });
//    
//}
//
////发送心跳
//- (void)senderheartBeat{
//    //和服务端约定好发送什么作为心跳标识，尽可能的减小心跳包大小
//    __weak typeof(self) weakSelf = self;
//    dispatch_main_async_safe(^{
//        if(weakSelf.webSocket.readyState ==  SR_OPEN){
//            [weakSelf sendPing:nil];
//        }
//    });
//}
//
////没有网络的时候开始定时 -- 用于网络检测
//- (void)noNetWorkStartTestingTimer{
//    __weak typeof(self) weakSelf = self;
//    dispatch_main_async_safe(^{
//        weakSelf.netWorkTestingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(noNetWorkStartTesting) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:weakSelf.netWorkTestingTimer forMode:NSDefaultRunLoopMode];
//    });
//}
////定时检测网络
//- (void)noNetWorkStartTesting{
//    //有网络
//    if(AFNetworkReachabilityManager.sharedManager.networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable)
//    {
//        //关闭网络检测定时器
//        [self destoryNetWorkStartTesting];
//        //开始重连
//        [self reConnectServer];
//    }
//}
//
////取消网络检测
//- (void)destoryNetWorkStartTesting{
//    __weak typeof(self) weakSelf = self;
//    dispatch_main_async_safe(^{
//        if(weakSelf.netWorkTestingTimer)
//        {
//            [weakSelf.netWorkTestingTimer invalidate];
//            weakSelf.netWorkTestingTimer = nil;
//        }
//    });
//}
//
//
////取消心跳
//- (void)destoryHeartBeat{
//    __weak typeof(self) weakSelf = self;
//    dispatch_main_async_safe(^{
//        if(weakSelf.heartBeatTimer)
//        {
//            [weakSelf.heartBeatTimer invalidate];
//            weakSelf.heartBeatTimer = nil;
//        }
//    });
//}
//
//
////关闭长连接
//- (void)SRWebSocketClose{
//    self.isActivelyClose = YES;
//    self.isConnect = NO;
//    self.connectType = WebSocketDefault;
//    if(self.webSocket)
//    {
//        [self.webSocket close];
//        _webSocket = nil;
//    }
//    
//    //关闭心跳定时器
//    [self destoryHeartBeat];
//    
//    //关闭网络检测定时器
//    [self destoryNetWorkStartTesting];
//}
//
//
////发送数据给服务器
//- (void)sendDataToServer:(NSString *)data{
//    //没有网络
//    if (AFNetworkReachabilityManager.sharedManager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable)
//    {
//        //开启网络检测定时器
//        [self noNetWorkStartTestingTimer];
//    }
//    else //有网络
//    {
//        if(self.webSocket != nil)
//        {
//            // 只有长连接OPEN开启状态才能调 send 方法，不然会Crash
//            if(self.webSocket.readyState ==  SR_OPEN)
//            {
//                [self.webSocket send:data]; //发送数据
//            }
//            else if (self.webSocket.readyState ==  SR_CONNECTING) //正在连接
//            {
//                NSLog(@"正在连接中，重连后会去自动同步数据");
//            }
//            else if (self.webSocket.readyState ==  SR_CLOSING || self.webSocket.readyState ==  SR_CLOSED) //断开连接
//            {
//                //调用 reConnectServer 方法重连,连接成功后 继续发送数据
//                [self reConnectServer];
//            }
//        }
//        else
//        {
//            [self connectServer]; //连接服务器
//        }
//    }
//}
//
//@end
//
//#endif
