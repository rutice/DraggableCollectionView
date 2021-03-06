//
//  Copyright (c) 2013 Luke Scott
//  https://github.com/lukescott/DraggableCollectionView
//  Distributed under MIT license
//

#import <UIKit/UIKit.h>
#import "UICollectionViewDataSource_DraggableWithExternalTarget.h"

@interface UICollectionView (Draggable)

@property (nonatomic, assign) BOOL draggable;
@property (nonatomic, assign) BOOL dragOnTouch;
@property (nonatomic, assign) UIEdgeInsets scrollingEdgeInsets;
@property (nonatomic, assign) CGFloat scrollingSpeed;
@property (nonatomic, assign) BOOL stickyHeaders;

- (NSIndexPath *)indexPathForItemClosestToPoint:(CGPoint)point;
- (NSIndexPath *)indexPathForItemClosestToPoint:(CGPoint)point mustBeValidMoveTarget:(BOOL)mustBeValidMoveTarget;
- (void)draggableCleanup;

- (BOOL)beginDragAt:(NSIndexPath*)indexPath;
- (void)endDrag;

@end
