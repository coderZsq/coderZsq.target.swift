//
//  SQVideoCoverView.m
//  App
//
//  Created by 朱双泉 on 2021/1/17.
//

#import "SQVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface SQVideoCoverView ()

@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;

@end

@implementation SQVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50, 50)];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

#pragma mark - public method

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"videoPlay.png"];
    _videoUrl = videoUrl;
}

#pragma mark - private method

- (void)_tapToPlay {
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    
//    AVAsset *asset = [AVAsset assetWithURL:videoURL];
//
//    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    AVPlayer *avPlayer = [AVPlayer playerWithURL:videoURL];
    avPlayer.automaticallyWaitsToMinimizeStalling = NO;

    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
    playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:playerLayer];


    [avPlayer play];
    
    NSLog(@"");
}

@end
