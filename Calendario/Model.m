//
//  Model.m
//  Calendario
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import "Model.h"
#import "CalendarioViewController.h"
@interface Model()
@property (readonly, strong, nonatomic) NSArray * pagedata;
@end

@implementation Model

-(id) init{
    self = [super init];
    if (self) {
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        
        _pagedata = [[dateFormatter monthSymbols] copy];
    }
    
    return self;

}

-(CalendarioViewController*) viewControllerAtIndex: (NSInteger)index storyboard: (UIStoryboard*)storyboard{
    if ((index >= [_pagedata count]) || ([_pagedata count] == 0)) {
        return nil;
    }
    
    //CREAR UN NUEVO VIEW CONTROLLER
    
    CalendarioViewController * dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"CalendarioViewController"];
    
    dataViewController.dataObject = [_pagedata objectAtIndex:index];
    
    return dataViewController;

}

-(NSUInteger)indexOfViewController: (CalendarioViewController*) viewController{
    return [_pagedata indexOfObject:viewController.dataObject];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:(CalendarioViewController *)viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index --;
    
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
    
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSUInteger index = [self indexOfViewController:(CalendarioViewController *)viewController];
    if (index == NSNotFound || index == ([_pagedata count]-1)) {
        return nil;
    }
    
    index++;
    
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
    

}




@end
