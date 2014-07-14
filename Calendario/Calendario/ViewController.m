//
//  ViewController.m
//  Calendario
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "CalendarioViewController.h"

@interface ViewController ()
@property (readonly, strong, nonatomic) Model * modelController;
@end

@implementation ViewController
@synthesize modelController = _modelController;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    _pageViewController.delegate = self;
    CalendarioViewController * startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray * viewControllers = [NSArray arrayWithObject:startingViewController];
    [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    _pageViewController.dataSource = self.modelController;
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    CGRect pageViewRect = self.view.bounds;
    _pageViewController.view.frame = pageViewRect;
    [_pageViewController didMoveToParentViewController:self];
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}
-(Model *)modelController{
    if(!_modelController){
        _modelController = [[Model alloc] init];
    }
    return _modelController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
