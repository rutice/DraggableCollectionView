//
//  Copyright (c) 2013 Luke Scott
//  https://github.com/lukescott/DraggableCollectionView
//  Distributed under MIT license
//

#import "UICollectionView+Draggable.h"
#import "LSCollectionViewHelper.h"
#import <objc/runtime.h>

static const char * LSCollectionViewHelperObjectKey = "LSCollectionViewHelper";

@implementation UICollectionView (Draggable)

- (void)draggableCleanup
{
    LSCollectionViewHelper *helper = objc_getAssociatedObject(self, LSCollectionViewHelperObjectKey);
    if(helper != nil) {
		[helper unbindFromCollectionView:self];
		objc_setAssociatedObject(self, LSCollectionViewHelperObjectKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
}

- (LSCollectionViewHelper *)getHelper
{
    LSCollectionViewHelper *helper = objc_getAssociatedObject(self, LSCollectionViewHelperObjectKey);
    if(helper == nil) {
        helper = [[LSCollectionViewHelper alloc] initWithCollectionView:self];
        objc_setAssociatedObject(self, LSCollectionViewHelperObjectKey, helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return helper;
}

- (BOOL)beginDragAt:(NSIndexPath*)indexPath
{
    return [[self getHelper] beginDragAt:indexPath];
}

- (void)endDrag
{
    [[self getHelper] endDrag];
}

- (BOOL)draggable
{
    return [self getHelper].enabled;
}

- (void)setDraggable:(BOOL)draggable
{
    [self getHelper].enabled = draggable;
}

- (BOOL)dragOnTouch
{
    return [self getHelper].dragOnTouch;
}

- (void)setDragOnTouch:(BOOL)dragOnTouch
{
    [self getHelper].dragOnTouch = dragOnTouch;
}

- (UIEdgeInsets)scrollingEdgeInsets
{
    return [self getHelper].scrollingEdgeInsets;
}

- (void)setScrollingEdgeInsets:(UIEdgeInsets)scrollingEdgeInsets
{
    [self getHelper].scrollingEdgeInsets = scrollingEdgeInsets;
}

- (CGFloat)scrollingSpeed
{
    return [self getHelper].scrollingSpeed;
}

- (void)setScrollingSpeed:(CGFloat)scrollingSpeed
{
    [self getHelper].scrollingSpeed = scrollingSpeed;
}

- (BOOL)stickyHeaders
{
    return [self getHelper].stickyHeaders;
}

- (void)setStickyHeaders:(BOOL)stickyHeaders
{
    [self getHelper].stickyHeaders = stickyHeaders;
}

- (NSIndexPath *) indexPathForItemClosestToPoint:(CGPoint)point
{
    return [[self getHelper] indexPathForItemClosestToPoint:point];
}

- (NSIndexPath *)indexPathForItemClosestToPoint:(CGPoint)point mustBeValidMoveTarget:(BOOL)mustBeValidMoveTarget
{
    return [[self getHelper] indexPathForItemClosestToPoint:point mustBeValidMoveTarget:mustBeValidMoveTarget];
}

@end
