//
//  GDPFollowButton.h
//  GDPMultistateButton
//
//  Created by ule on 2020/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

enum {
    GDPControlStateFollowed = UIControlStateSelected,
    GDPControlStateMutual   = 1 << 16 | UIControlStateSelected,
    GDPControlStateLoading  = 1 << 17 | UIControlStateDisabled,
};

@interface GDPLoadingButton : UIButton

@property (nonatomic, getter=isLoading) BOOL    loading;
@property (nonatomic) UIActivityIndicatorView   *spinnerView;

@end

@interface GDPFollowButton : GDPLoadingButton

@property (nonatomic, getter=isMutual) BOOL     mutual;
//关注 文字颜色
@property (nonatomic, strong) UIColor           *normalTitleColor;
//已关注/互相关注 文字颜色
@property (nonatomic, strong) UIColor           *followOrMutualTitleColor;

@end

NS_ASSUME_NONNULL_END
