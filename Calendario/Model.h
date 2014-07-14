//
//  Model.h
//  Calendario
//
//  Created by Developer Cymetria on 12/07/14.
//  Copyright (c) 2014 Empresa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalendarioViewController;

@interface Model : NSObject <UIPageViewControllerDataSource>

///Metodo que retorna el calendario
-(CalendarioViewController*) viewControllerAtIndex: (NSInteger)index storyboard: (UIStoryboard*)storyboard;


///Metodo que calcule el indice
-(NSUInteger)indexOfViewController: (CalendarioViewController*) viewController;

@end
