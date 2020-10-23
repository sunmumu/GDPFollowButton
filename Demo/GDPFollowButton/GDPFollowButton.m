//
//  GDPFollowButton.m
//  GDPMultistateButton
//
//  Created by ule on 2020/10/22.
//

#import "GDPFollowButton.h"

@implementation GDPLoadingButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI:frame];
    }
    return self;
}

// MARK: - SetupUI
- (void)setupUI:(CGRect)frame {
    self.spinnerView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
    [self addSubview:self.spinnerView];
}

// MARK: - Setter -
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.spinnerView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
}

- (void)setEnabled:(BOOL)enabled {
    super.enabled = !_loading && enabled;
}

- (void)setLoading:(BOOL)loading {
    if (_loading != loading) {
        _loading = loading;
        
        super.enabled = !loading;
        
        if (loading) {
            [self.spinnerView startAnimating];
        } else {
            [self.spinnerView stopAnimating];
        }
        [self setNeedsLayout];
        [self invalidateIntrinsicContentSize];
    }
}

// MARK: - Getter -
- (UIControlState)state {
    UIControlState state = [super state];
    if (self.isLoading) {
        state |= GDPControlStateLoading;
    }
    return state;
}

- (UIActivityIndicatorView *)spinnerView {
    if (!_spinnerView) {
        if (@available(iOS 13.0, *)) {
            _spinnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        } else {
            _spinnerView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        }
    }
    return _spinnerView;
}

@end

@implementation GDPFollowButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@"关注" forState:UIControlStateNormal];
        [self setTitle:@"已关注" forState:UIControlStateSelected];
        [self setTitle:@"已关注" forState:UIControlStateSelected | UIControlStateHighlighted];
        [self setTitle:@"互相关注" forState:GDPControlStateMutual];
        [self setTitle:@"互相关注" forState:GDPControlStateMutual |UIControlStateHighlighted];
        [self setTitle:@"" forState:GDPControlStateLoading];
        [self setTitle:@"" forState:GDPControlStateLoading | UIControlStateSelected];
        [self setTitle:@"" forState:GDPControlStateMutual | GDPControlStateLoading];
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected | UIControlStateHighlighted];
        [self setTitleColor:[UIColor lightGrayColor] forState:GDPControlStateMutual];
        [self setTitleColor:[UIColor lightGrayColor] forState:GDPControlStateMutual |UIControlStateHighlighted];
        [self setTitleColor:[UIColor whiteColor] forState:GDPControlStateLoading];
        [self setTitleColor:[UIColor whiteColor] forState:GDPControlStateLoading | UIControlStateSelected];
        [self setTitleColor:[UIColor whiteColor] forState:GDPControlStateMutual | GDPControlStateLoading];
    }
    return self;
}

- (void)setMutual:(BOOL)mutual {
    if (_mutual != mutual) {
        _mutual = mutual;
        if (mutual) {
            self.selected = YES;
            self.loading = NO;
        }
        [self setNeedsLayout];
        [self invalidateIntrinsicContentSize];
    }
}

- (void)setLoading:(BOOL)loading {
    [super setLoading:loading];
    if (loading) {
        self.mutual = NO;
    }
}

- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    if (!selected) {
        self.mutual = NO;
    }
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    _normalTitleColor = normalTitleColor;
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [self setTitleColor:normalTitleColor forState:GDPControlStateLoading];
    [self setTitleColor:normalTitleColor forState:GDPControlStateLoading | UIControlStateSelected];
    [self setTitleColor:normalTitleColor forState:GDPControlStateMutual | GDPControlStateLoading];
}

- (void)setFollowOrMutualTitleColor:(UIColor *)followOrMutualTitleColor {
    _followOrMutualTitleColor = followOrMutualTitleColor;
    [self setTitleColor:followOrMutualTitleColor forState:UIControlStateSelected];
    [self setTitleColor:followOrMutualTitleColor forState:UIControlStateSelected | UIControlStateHighlighted];
    [self setTitleColor:followOrMutualTitleColor forState:GDPControlStateMutual];
    [self setTitleColor:followOrMutualTitleColor forState:GDPControlStateMutual |UIControlStateHighlighted];
}

// MARK: - Getter -
- (UIControlState)state {
    UIControlState state = [super state];
    if (self.isMutual) {
        state |= GDPControlStateMutual;
    }
    return state;
}


@end
