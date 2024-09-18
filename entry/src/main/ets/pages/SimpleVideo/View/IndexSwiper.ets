
import { ParamItem } from '../ViewModel/ParamItem'
import { SwiperVideoItem } from '../ViewModel/SwiperVideoItem'
import { SWIPER_VIDEOS } from '../ViewModel/VideoData'
@Component
export struct SwiperVideo {
  build() {
    Column() {
      Swiper() {
        ForEach(SWIPER_VIDEOS, (item: SwiperVideoItem) => {
          SwiperItem({ imageSrc: item.image, source: $rawfile('videoTest.mp4') })
        }, (item: SwiperVideoItem) => JSON.stringify(item))
      }
      .autoPlay(true)
    }
    .height('24%')
    .width('93%')
    .backgroundColor(Color.White)
    .margin({
      left: '3.3%',
      right: '3.3%',
      top: '24vp'
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
    Navigator({ target: 'pages/SimpleVideoPlay', type: NavigationType.Push }) {
      Image(this.imageSrc)
        .borderRadius('12vp')
    }
    .params(this.paramItem)
  }
}