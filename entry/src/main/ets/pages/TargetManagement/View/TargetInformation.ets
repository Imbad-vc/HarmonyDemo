
import { TMConstant } from '../Common/TMConstant'

@Preview
@Component
export default struct TargetInformation {
  @Prop latestUpdateDate: string = ''
  @Prop totalTasksNumber: number = 0
  @Prop completedTasksNumber: number = 0

  @Builder
  TargetItem() {
    Row() {
      Image($r("app.media.ic_main"))
        .width('96vp')
        .height('96vp')
        .objectFit(ImageFit.Fill)
        .borderRadius(TMConstant.IMAGE_BORDER_RADIUS)
      Column() {
        Text('第一季度运营目标')
          .fontSize('18fp')
          .fontWeight(TMConstant.FONT_WEIGHT_LARGE)
          .width(TMConstant.TITLE_WIDTH)
        Text('实现用户量与活跃度提升。')
          .opacityTextStyle()
          .fontSize('15fp')
          .margin({ top: '16vp' })
      }
      .margin({ left: TMConstant.TARGET_MARGIN_LEFT })
      .alignItems(HorizontalAlign.Start)
    }
    .width(TMConstant.FULL_WIDTH)
  }

  @Builder
  OverallProgress() {
    Row() {
      Column() {
        Text('整体精度')
          .fontSize('16fp')
          .fontColor('#182431')
          .fontWeight(TMConstant.FONT_WEIGHT)
        Row() {
          Text('更新时间：')
            .opacityTextStyle()
          Text(this.latestUpdateDate)
            .opacityTextStyle()
        }
        .margin({ top: '2vp' })
      }
      .alignItems(HorizontalAlign.Start)

      Blank()
      Stack() {
        Row() {
          Text(this.completedTasksNumber.toString())
            .fontSize('14fp')
            .fontWeight(TMConstant.FONT_WEIGHT)
            .fontColor('#007DFF')
          Text(`/${this.totalTasksNumber}`)
            .fontSize('14fp')
            .fontWeight(TMConstant.FONT_WEIGHT)
        }

        Progress({
          value: this.completedTasksNumber,
          total: this.totalTasksNumber,
          type: ProgressType.Ring
        })
          .color('#007DFF')
          .style({
            strokeWidth: TMConstant.STROKE_WIDTH
          })
          .width('48p')
          .height('48vp')
      }
    }
    .width(TMConstant.FULL_WIDTH)
    .height('48vp')
    .margin({ top: '15vp' })
  }

  build() {
    Column() {
      this.TargetItem()
      this.OverallProgress()
    }
    .padding('16vp')
    .width(TMConstant.MAIN_BOARD_WIDTH)
    // .height('187vp')
    .backgroundColor(Color.White)
    .borderRadius(TMConstant.TARGET_BORDER_RADIUS)
  }
}

@Extend(Text) function opacityTextStyle() {
  .fontSize('12fp')
  .fontColor('#182431')
  .opacity(TMConstant.OPACITY)
  .fontWeight(TMConstant.FONT_WEIGHT)
}

