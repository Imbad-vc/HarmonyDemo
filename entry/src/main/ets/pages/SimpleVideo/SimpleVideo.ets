
import { VideoModule } from './View/IndexMoudule'
import { SwiperVideo } from './View/IndexSwiper'

@Entry
@Preview
@Component
struct SimpleVideoIndex {
  build() {
    Column({ space: '24vp' }) {
      SwiperVideo()
      List() {
        ForEach(['最近播放', '为你推荐'], (item: string) => {
          ListItem() {
            VideoModule({ moduleName: item })
              .margin({ top:'12'})
          }
        }, (item: string) => JSON.stringify(item))
      }
      .listDirection(Axis.Vertical)
      .margin({ top:'18' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}