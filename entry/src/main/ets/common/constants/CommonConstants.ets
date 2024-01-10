import { HorizontalVideoItem } from '../../../viewModel/HorizontalVideoItem';
import { SwiperVideoItem } from '../../../viewModel/SwiperVideoItem';
/**
 * route for second page
 */
export default class CommonConstants {
    static readonly SECOND_PAGE: string = 'pages/SimpleVideoPlay'
    static readonly SWIPER_VIDEOS: SwiperVideoItem[] = [
        new SwiperVideoItem($r('app.media.banner1')),
        new SwiperVideoItem($r('app.media.banner2')),
        new SwiperVideoItem($r('app.media.banner3'))
    ]
    static readonly HORIZONTAL_VIDEOS: HorizontalVideoItem[] = [
        new HorizontalVideoItem(1, $r('app.media.video_list0'), '视频1'),
        new HorizontalVideoItem(2, $r('app.media.video_list1'), '视频2'),
        new HorizontalVideoItem(3, $r('app.media.video_list2'), '视频3')
    ];
    static readonly SOURCE: string = 'source';
    /**
     * video net address
     */
    static readonly NET: string = '网络视频地址*****';
    /**
     * toast message
     */
    static readonly MESSAGE: string = '请检查网络';

    /**
     * init time of string
     */
    static readonly START_TIME: string = '00:00';

    /**
     * video net address
     */
    static readonly ZERO_STR: string = '0';

    /**
     * time split
     */
    static readonly SPLIT: string = ':';

    /**
     * default opacity
     */
    static readonly DEFAULT_OPACITY: number = Number.parseFloat('0.2');

    /**
     * slider small track thick ness
     */
    static readonly SMALL_TRACK_THICK_NESS: number = 2;

    /**
     * slider big track thick ness
     */
    static readonly BIG_TRACK_THICK_NESS: number = 4;

    /**
     * the divide of single and double
     */
    static readonly COMMON_NUM_DOUBLE: number = 10;

    /**
     * the minute of one hour
     */
    static readonly COMMON_NUM_MINUTE: number = 60;

    /**
     * common font weight
     */
    static readonly COMMON_NUM_FONT_WEIGHT: number = 500;

    /**
     * toast duration
     */
    static readonly COMMON_NUM_DURATION: number = 5000;

    /**
     * module list
     */
    static readonly LIST: string[] = ['最近播放', '为你推荐'];

    /**
     * full percent
     */
    static readonly ALL_PERCENT: string = '100%';
    static readonly IMAGE_SIZE: number = 24;
}

export const enum STRING_PERCENT {
    SLIDE_WIT = '46.7%',
    NINETY_PERCENT = '88%',
    INDEX_COMPONENT_WITH_PERCENT = '93.3%',
    INDEX_SWIPER_HEIGHT_PERCENT = '24.1%',
    INDEX_MODULE_HEIGHT_PERCENT = '22.8%',
    INDEX_SWIPER_LEFT_RIGHT_MARGIN = '3.3%'
}

export const enum MARGIN_FONT_SIZE {
    FIRST_MARGIN = 12,
    SECOND_MARGIN = 16,
    THIRD_MARGIN = 18,
    FOURTH_MARGIN = 24,
    FIFTH_MARGIN = 50,
    SIXTH_MARGIN = 94,
    SEVENTH_MARGIN = 132
}

export const enum VIDEO_TYPE {
    INNER = 'inner',
    NET = 'net'
}

export const enum STACK_STYLE {
    IMAGE_Z_INDEX = 2,
    PROGRESS_VALUE = 0,
    PROGRESS_TOTAL = 100,
    PROGRESS_STROKE_WIDTH = 15,
    PROGRESS_SCALE_COUNT = 15,
    PROGRESS_SCALE_WIDTH = 5,
    PROGRESS_Z_INDEX = 1,
    PROGRESS_WIDTH = 80,
    PROGRESS_STEP = 10,
    MILLI_SECONDS = 100
}
