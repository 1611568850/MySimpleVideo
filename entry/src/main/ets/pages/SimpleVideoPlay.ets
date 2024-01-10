import router from '@ohos.router';
import VideoPlayer from '../../view/VideoPlayer';
import CommonConstants, { MARGIN_FONT_SIZE, STACK_STYLE } from '../common/constants/CommonConstants';

@Entry
@Component
struct SimpleVideoPlay {
    private startIconResource: Resource = $r('app.media.ic_public_play');
    private backIconResource: Resource = $r('app.media.ic_back');
    private source: string = (router.getParams() as Record<string, Object>).source as string;
    @Provide isPlay: boolean = false;
    @Provide isLoading: boolean = false;
    controller: VideoController = new VideoController();
    @Provide isOpacity: boolean = false;
    @Provide progressVal: number = 0;
    @Provide flag: boolean = false;

    aboutToAppear() {
        this.source;
    }

    onPageHide() {
        this.controller.pause();
    }

    build() {
        Column() {
            Row() {
                Image(this.backIconResource)
                    .width(MARGIN_FONT_SIZE.FOURTH_MARGIN)
                    .height(MARGIN_FONT_SIZE.FOURTH_MARGIN)
                    .margin({ left: MARGIN_FONT_SIZE.FOURTH_MARGIN })
                    .onClick(() => {
                        router.back();
                    })
                Text($r('app.string.back'))
                    .fontColor(Color.White)
                    .fontSize(MARGIN_FONT_SIZE.FOURTH_MARGIN)
                    .fontWeight(CommonConstants.COMMON_NUM_FONT_WEIGHT)
                    .margin({ left: MARGIN_FONT_SIZE.FIRST_MARGIN })
            }
            .width(CommonConstants.ALL_PERCENT)
            .margin({
                left: MARGIN_FONT_SIZE.FIRST_MARGIN,
                top: MARGIN_FONT_SIZE.FIRST_MARGIN
            })
            .justifyContent(FlexAlign.Start)

            Stack() {
                if (!this.isPlay && !this.isLoading) {
                    Image(this.startIconResource)
                        .width(MARGIN_FONT_SIZE.FIFTH_MARGIN)
                        .height(MARGIN_FONT_SIZE.FIFTH_MARGIN)
                        .zIndex(STACK_STYLE.IMAGE_Z_INDEX)
                }
                if (this.isLoading) {
                    Progress({
                        value: STACK_STYLE.PROGRESS_VALUE,
                        total: STACK_STYLE.PROGRESS_TOTAL,
                        type: ProgressType.ScaleRing
                    })
                        .color(Color.Grey)
                        .value(this.progressVal)
                        .width(STACK_STYLE.PROGRESS_WIDTH)
                        .style({
                            strokeWidth: STACK_STYLE.PROGRESS_STROKE_WIDTH,
                            scaleCount: STACK_STYLE.PROGRESS_SCALE_COUNT,
                            scaleWidth: STACK_STYLE.PROGRESS_SCALE_WIDTH
                        })
                        .zIndex(STACK_STYLE.PROGRESS_Z_INDEX)
                }
                VideoPlayer({
                    source: this.source,
                    controller: this.controller
                })
                    .zIndex(0)
            }
        }
        .height(CommonConstants.ALL_PERCENT)
        .backgroundColor(Color.Black)
    }
}