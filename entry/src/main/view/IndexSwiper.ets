import CommonConstants, { MARGIN_FONT_SIZE, STRING_PERCENT } from '../ets/common/constants/CommonConstants'
import { SwiperVideoItem } from '../viewModel/SwiperVideoItem'
import { ParamItem } from '../viewmodel/ParamItem';

@Component
export default struct IndexSwiper {
    build() {
        Column() {
            Swiper() {
                ForEach(CommonConstants.SWIPER_VIDEOS, (videoItem: SwiperVideoItem, index: number | undefined) => {
                    SwiperItem({ imageSrc: videoItem.image, source: $rawfile('videoTest.mp4') })
                }, (item: SwiperVideoItem) => JSON.stringify(item))
            }
            .autoPlay(true)
        }
        .height(STRING_PERCENT.INDEX_SWIPER_HEIGHT_PERCENT)
        .width(STRING_PERCENT.INDEX_COMPONENT_WITH_PERCENT)
        .backgroundColor($r('app.color.white'))
        .margin({
            left: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN,
            right: STRING_PERCENT.INDEX_SWIPER_LEFT_RIGHT_MARGIN,
            top: MARGIN_FONT_SIZE.FOURTH_MARGIN
        })
    }
}

@Component
struct SwiperItem {
    private imageSrc: Resource = $r('app.string.empty')
    private source: Resource = $r('app.string.empty')
    private paramItem: ParamItem = new ParamItem();

    aboutToAppear() {
        this.paramItem.source = this.source;
    }

    build() {
        Navigator({ target: CommonConstants.SECOND_PAGE, type: NavigationType.Push }) {
            Image(this.imageSrc)
                .borderRadius(MARGIN_FONT_SIZE.FIRST_MARGIN)
        }
        .params(this.paramItem)
    }
}