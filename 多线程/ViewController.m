//
//  ViewController.m
//  多线程
//
//  Created by XJL on 2018/9/20.
//  Copyright © 2018年 XJL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
//  [self serialSyn];
//  [self serialAsyn];
  
//  [self concurrenSyn];
//  [self concurrenAsyn];
  
//  [self syncMain];
//  [self asyncMain];
  
//  [self globalSyn];
  [self globalAsyn];
  
}
/**
 *串行队列+同步任务
 *会开启新线程，任务同步执行
*/
-(void)serialSyn{
  dispatch_queue_t queue=dispatch_queue_create("serialSyn", DISPATCH_QUEUE_SERIAL);
  dispatch_sync(queue, ^{
    NSLog(@"串行队列+同步任务1:%@",[NSThread currentThread]);
    
  });
  dispatch_sync(queue, ^{
    NSLog(@"串行队列+同步任务2:%@",[NSThread currentThread]);
    
  });
  dispatch_sync(queue, ^{
    NSLog(@"串行队列+同步任务3:%@",[NSThread currentThread]);
    
  });
  
  
}
/*
 *串行队列+异步任务
 *不会开新线程，任务逐步执行
 */
-(void)serialAsyn{
  dispatch_queue_t queue=dispatch_queue_create("serialAsyn", DISPATCH_QUEUE_SERIAL);
  dispatch_async(queue, ^{
    NSLog(@"串行队列+异步任务1:%@",[NSThread currentThread]);
  });
  
  dispatch_async(queue, ^{
    NSLog(@"串行队列+异步任务2:%@",[NSThread currentThread]);
  });
  
  dispatch_async(queue, ^{
    NSLog(@"串行队列+异步任务3:%@",[NSThread currentThread]);
  });
  
  
}
/*
 *并发队列+同步任务
 *不会开启新线程，任务逐步执行
 */
-(void)concurrenSyn{
  dispatch_queue_t queue=dispatch_queue_create("concurrenSyn", DISPATCH_QUEUE_CONCURRENT);
  dispatch_sync(queue, ^{
    NSLog(@"并发队列+同步任务1:%@",[NSThread currentThread]);
    
  });
  dispatch_sync(queue, ^{
    NSLog(@"并发队列+同步任务2:%@",[NSThread currentThread]);
    
  });
  dispatch_sync(queue, ^{
    NSLog(@"并发队列+同步任务3:%@",[NSThread currentThread]);
    
  });
  
}
/*
 *并发队列+异步任务
 *
 */
-(void)concurrenAsyn{
   dispatch_queue_t queue=dispatch_queue_create("concurrenAsyn", DISPATCH_QUEUE_CONCURRENT);
  dispatch_async(queue, ^{
    NSLog(@"并发队列+异步任务1:%@",[NSThread currentThread]);
  });
  
  dispatch_async(queue, ^{
    NSLog(@"并发队列+异步任务2:%@",[NSThread currentThread]);
  });
  
  dispatch_async(queue, ^{
    NSLog(@"并发队列+异步任务3:%@",[NSThread currentThread]);
  });
}
/*
 *主队列+同步任务
 *不会开启新线程，会产生死锁，程序会崩
 */
-(void)syncMain{
  dispatch_queue_t queue=dispatch_get_main_queue();
  dispatch_sync(queue, ^{
    NSLog(@"主队列+同步任务1:%@",[NSThread currentThread]);
  });
  
  dispatch_sync(queue, ^{
    NSLog(@"主队列+同步任务2:%@",[NSThread currentThread]);
  });
  
  dispatch_sync(queue, ^{
    NSLog(@"主队列+同步任务3:%@",[NSThread currentThread]);
  });
  
}
/*
 *主队列+异步任务
 *不会开启新线程，任务逐步执行
 */
-(void)asyncMain{
  dispatch_queue_t queue=dispatch_get_main_queue();
  dispatch_async(queue, ^{
    NSLog(@"主队列+异步任务1:%@",[NSThread currentThread]);
  });
  
  dispatch_async(queue, ^{
    NSLog(@"主队列+异步任务2:%@",[NSThread currentThread]);
  });
  
  dispatch_async(queue, ^{
    NSLog(@"主队列+异步任务3:%@",[NSThread currentThread]);
  });
  
}
/*
 *全局队列+同步任务
 *不会开启新线程，任务逐步完成
 */
-(void)globalSyn{
  
  dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_sync(queue, ^{
    NSLog(@"主队列+同步任务1:%@",[NSThread currentThread]);
  });
  dispatch_sync(queue, ^{
    NSLog(@"主队列+同步任务2:%@",[NSThread currentThread]);
  });
  dispatch_sync(queue, ^{
    NSLog(@"主队列+同步任务3:%@",[NSThread currentThread]);
  });
  
}
/*
 *全局队列+异步任务
 *会开启新线程，任务同步完成
 */
-(void)globalAsyn{
  
  dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_async(queue, ^{
    NSLog(@"主队列+异步任务1:%@",[NSThread currentThread]);
  });
  dispatch_async(queue, ^{
    NSLog(@"主队列+异步任务2:%@",[NSThread currentThread]);
  });
  dispatch_async(queue, ^{
    NSLog(@"主队列+异步任务3:%@",[NSThread currentThread]);
  });
  
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
