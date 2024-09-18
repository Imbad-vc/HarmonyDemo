import ToDoListConstant from '../Constant/ToDoListConstant';
@Preview
@Component
export default struct ToDoListItem {
  private content?: string;
  @State isComplete: boolean = false

  @Builder labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width('20vp')
      .height('28vp')
      .margin('20vp')
  }

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'))
      } else {
        this.labelIcon($r('app.media.ic_default'))
      }

      Text(this.content)
        .fontSize('20fp')
        .fontWeight(ToDoListConstant.FONT_WEIGHT)
        .opacity(this.isComplete ? ToDoListConstant.OPACITY_COMPLETED :ToDoListConstant.OPACITY_DEFAULT)
        .decoration({ type:this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(ToDoListConstant.BORDER_RADIUS)
    .backgroundColor('#FFFFFF')
    .width(ToDoListConstant.LIST_DEFAULT_WIDTH)
    .height('64vp')
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}