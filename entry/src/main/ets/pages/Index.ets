import IndexModule from '../../view/IndexModule'
import IndexSwiper from '../../view/IndexSwiper'
import CommonConstants, { MARGIN_FONT_SIZE } from '../common/constants/CommonConstants'

@Entry
@Component
struct Index {
    build() {
        Column() {
            IndexSwiper()
            List() {
                ForEach(CommonConstants.LIST, (listItem: string) => {
                    ListItem() {
                        IndexModule({
                            moduleName: listItem
                        })
                            .margin({ top: MARGIN_FONT_SIZE.FIRST_MARGIN })

                    }
                }, (item: string) => JSON.stringify(item))
            }
            .margin({ top: MARGIN_FONT_SIZE.THIRD_MARGIN })
        }
        .width(CommonConstants.ALL_PERCENT)
        .height(CommonConstants.ALL_PERCENT)
        .backgroundColor($r("app.color.index_backgroundColor"))
    }
}