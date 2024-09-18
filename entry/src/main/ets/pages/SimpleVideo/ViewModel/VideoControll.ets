
/**
 * 获取视频当前时间字符串
 * @param 当前时间Number
 * @return 当前时间字符串
 */
export function changeSliderTime(value: number): string {
  let second: number = value % 60
  let min: number = Number.parseInt((value / 60).toString())
  let head = min < 10 ? `0${min}` : min
  let end = second < 10 ? `0${second}` : second
  let nowTime = `${head}:${end}`
  return nowTime
}