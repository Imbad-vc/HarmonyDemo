import router from '@ohos.router';
import media from '@ohos.multimedia.media';
@Entry
@Component
struct Second {
  @State message: string = '二级页面'
  private arr:number[] = [0,1,2,3,4,5]
  private controller: TabsController = new TabsController()

  build() {
    Column() {
      Row() {
            Text(this.message)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
              .margin({
              })

            Button() {
              Text('<')
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
            }
            .type(ButtonType.Circle)
            .margin({
              top: 20
            })
            .backgroundColor(Color.Gray)
            .width('40%')
            .height('5%')
            .onClick( () => {
              try {
                router.back()
              } catch (error) {
                console.error(`返回页面失败: ${error.code}`)
              }
            })
      }
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)
      .margin({
        bottom:20
      })
      .width('100%')
      List({space:10}) {
          ForEach(this.arr,(item:number) => {
            ListItem() {
              Text(`${item}`)
               .width('100%')
               .height(50)
                .fontSize(15)
                .fontColor(Color.White)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0x007DFF)
          }
        }, item => item)
      }.padding(12)
      Stack({ alignContent: Alignment.Start }) {
        Text('Test')
        .backgroundColor(Color.Blue)
        .width('20%')
        Grid() {
          ForEach(this.arr, (item: number) => {
            GridItem() {
              Text(`${ item }`)
                .fontSize(16)
                .fontColor(Color.White)
                .backgroundColor(0x007DFF)
                // .width('100%')
                // .height('100%')
                .textAlign(TextAlign.Center)
            }
          }, item => item)
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .height(200)
        // .padding({left:20,right:40})
        .backgroundColor(Color.Red)
        .width('80%')
      }
      .padding({left:20,right:20})
      .backgroundColor(Color.Orange)
      .width('100%')
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column(){
            Image($r('app.media.app_icon'))
              .width(50)
              .height(50)
          }
            .width('100%').height('100%').backgroundColor(Color.Green)
        }
        .tabBar('icon')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }
        .tabBar('蓝色')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar('黄色')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Pink)
        }
        .tabBar('粉色')
      }
      .backgroundColor(0xF5F5F5) // 设置Tabs组件背景颜色
    }
    .width('100%')
    .height('100%')
  }

  //   Row() {
  //     Text(this.message)
  //       .fontSize(50)
  //       .fontWeight(FontWeight.Bold)
  //       .margin({
  //         top:0
  //       })
  //     Button() {
  //       Text('<')
  //         .fontSize(25)
  //         .fontWeight(FontWeight.Bold)
  //         .fontColor(Color.White)
  //     }
  //     .type(ButtonType.Circle)
  //     .margin({
  //       top: 20
  //     })
  //     .backgroundColor(Color.Gray)
  //     .width('40%')
  //     .height('5%')
  //     .onClick( () => {
  //       try {
  //         router.back()
  //       } catch (error) {
  //         console.error(`返回页面失败: ${error.code}`)
  //       }
  //     })
  //   }
  //   Row() {
  //     Column() {
  //       List({space:10}) {
  //         ForEach(this.arr,(item:number) => {
  //           ListItem() {
  //             Text(`${item}`)
  //               .width('100%')
  //               .height(20)
  //               .fontSize(15)
  //               .fontColor(Color.White)
  //               .textAlign(TextAlign.Center)
  //               .borderRadius(10)
  //               .backgroundColor(0x007DFF)
  //           }
  //         }, item => item)
  //       }
  //     }
  //     .width('100%')
  //   }
  //   .height('100%')
}