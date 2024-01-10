import CommonConstants, { STRING_PERCENT } from '../ets/common/constants/CommonConstants';
import { changeSliderTime } from '../model/VideoControll'
import prompt from '@ohos.promptAction';
import { VideoSlider } from './VideoPlaySlider';


@Component
export default struct VideoPlayer {
    private source: string | Resource = '';
    private controller: VideoController = new VideoController();
    private previewUris: Resource = $r('app.media.preview');
    @Provide currentTime: number = 0;
    @Provide durationTime: number = 0;
    @Provide durationStringTime: string = CommonConstants.START_TIME;
    @Provide currentStringTime: string = CommonConstants.START_TIME;
    @Consume flag: boolean;
    @Consume isPlay: boolean;
    @Consume isOpacity: boolean;
    @Consume isLoading: boolean;
    @Consume progressVal: number;

    build() {
        Column() {
            Video({
                src: this.source,
                previewUri: this.previewUris,
                controller: this.controller
            })
                .width(CommonConstants.ALL_PERCENT)
                .height(STRING_PERCENT.NINETY_PERCENT)
                .controls(false)
                .autoPlay(false)
                .objectFit(ImageFit.Contain)
                .loop(false)
                .onUpdate((event) => {
                    if (event) {
                        this.currentTime = event.time;
                        this.currentStringTime = changeSliderTime(this.currentTime);
                    }
                })
                .onPrepared((event) => {
                    this.prepared(event?.duration);
                })
                .onFinish(() => {
                    this.finish();
                })
                .onError(() => {
                    prompt.showToast({
                        duration: CommonConstants.COMMON_NUM_DURATION,
                        message: CommonConstants.MESSAGE
                    });
                })
            VideoSlider({ controller: this.controller })

        }
    }

    prepared(duration: number) {
        this.durationTime = duration;
        let second: number = duration % CommonConstants.COMMON_NUM_MINUTE;
        let min: number = Number.parseInt((duration / CommonConstants.COMMON_NUM_MINUTE).toString());
        let head = min < CommonConstants.COMMON_NUM_DOUBLE ? `${CommonConstants.ZERO_STR}${min}` : min;
        let end = second < CommonConstants.COMMON_NUM_DOUBLE ? `${CommonConstants.ZERO_STR}${second}` : second;
        this.durationStringTime = `${head}${CommonConstants.SPLIT}${end}`;
        this.flag = true;
    }

    finish() {
        this.isPlay = false;
        this.isOpacity = false;
    }
}
