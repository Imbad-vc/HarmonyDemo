import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
           Text('中钧科技')
             .fontSize(30)
             .fontWeight(FontWeight.Bold)
             .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top:20
        })
        .backgroundColor('#EF4033')
        .width('40%')
        .height('5%')
        .onClick( () => {
          console.info('成功点击按钮')
          this.message = 'State Change'
          router.pushUrl({url:'pages/Second'}).then(() => {
            console.info('成功跳转二级页面')
          }).catch((error) => {
            console.error(`跳转二级页面失败: ${error.message}`)
          })
        })
        Button() {
          Text('代办列表')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top:20
        })
        .backgroundColor('#EF4033')
        .width('40%')
        .height('5%')
        .onClick( () => {
          console.info('成功点击按钮')
          router.pushUrl({url:'pages/ToDoList/ToDoListPage'}).then(() => {
            console.info('成功跳转二级页面')
          }).catch((error) => {
            console.error(`跳转二级页面失败: ${error.message}`)
          })
        })
        Button() {
          Text('任务管理')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .type(ButtonType.Capsule)
        .margin({
          top:20
        })
        .backgroundColor('#EF4033')
        .width('40%')
        .height('5%')
        .onClick( () => {
          console.info('成功点击按钮')
          router.pushUrl({url:'pages/TargetManagement/TargetManagement'}).then(() => {
            console.info('成功跳转二级页面')
          }).catch((error) => {
            console.error(`跳转二级页面失败: ${error.message}`)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }


}

//当一个函数没有返回值时，你通常会见到其返回值类型是 void
function typescriptExample():void {
  //boolean
  let isDone: boolean = false

  //number
  let decLiteral: number = 2024
  let binaryLiteral: number = 0b11111100111
  let octalLiteral: number = 0o3747
  let hexLiteral: number = 0x7e7

  //string
  let name: string = "中钧科技"
  name = "123"
  name = 'abc'

  //array
  let list: number[] = [1, 2, 3]
  //泛型
  let list2: Array<number> = [1, 2, 3]

  //元组
  let x: [string, number]
  x = ['hello', 10]
  //错误示范
  // x = [10, 'hello'];

  //枚举
  enum UserType {Company, Group, Person}
  let c: UserType = UserType.Person

  //unknow(类似option)
  let notSure: unknown = 1
  notSure = '可能是个字符串'
  notSure = false

  //null & undefine
  let u: undefined = undefined
  let n: null = null

  ///条件语句

  //TypeScript if 语句由一个布尔表达式后跟一个或多个语句组成。
  var num:number = 1
  if (num > 0) {
    console.log('数字是正数')
  }

  var grade:string = 'A';
  switch(grade) {
    case 'A': {
      console.log('优');
      break;
    }
    case 'B': {
      console.log('良');
      break;
    }
    case 'C': {
      console.log('及格');
      break;
    }
    case 'D': {
      console.log('不及格');
      break;
    }
    default: {
      console.log('非法输入');
      break;
    }
  }

  let result = addMore(1,2,3,4,5,6)

  let person = new Person('张三',20)
  person.getPersonInfo()

  let person2 = new Employee('李四', 28, '中钧');
  person2.getPersonInfo();
  person2.getEmployeeInfo();
}
// 有名函数：给变量设置为number类型
function add(x: number, y: number): number {

  return x + y;
}

// 可选类型:y
function add2(x: number, y?: number): number {
  if (y) {
    return x + y;
  } else {
    return x;
  }
}

//剩余参数会被当做个数不限的可选参数。 可以一个都没有，同样也可以有任意个。 可以使用省略号（ ...）进行定义：
function addMore(firstNumber: number, ...restOfNumber: number[]) {
  let restResult = 0
  restOfNumber.forEach(restNumber => {
    restResult += restNumber
  })
  return restResult
}

// 匿名函数
let myAdd = function (x, y) {
  return x + y;
};


//任何声明（比如变量，函数，类，类型别名或接口）都能够通过添加export关键字来导出
//import { Person } from  '../pages/Index';
export class Person {
  private name: string
  private age: number

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  public getPersonInfo(): string {
    return `名字 ${this.name} 年龄 ${this.age}`;
  }
}

//继承 extends
class Employee extends Person {
  private department: string

  constructor(name: string, age: number, department: string) {
    super(name, age);
    this.department = department;
  }

  public getEmployeeInfo(): string {
    return this.getPersonInfo() + ` 工作部门 ${this.department}`;
  }
}