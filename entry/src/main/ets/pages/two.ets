@Entry
@Component
struct two {
  @State totalTask: number = 0
  @State finishTask: number = 0
  @State task: Task[] = []

  build() {
    Column({ space: 10 }) {
      Row() {
        Text('任务进度')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Stack() {
          Progress({
            value: this.finishTask,
            total: this.totalTask,
            type: ProgressType.Ring
          })
            .width(100)
          Row() {
            Text(this.finishTask.toString())
              .fontSize(24)
              .fontColor('#36D')
            Text(' / ' + this.totalTask.toString())
              .fontSize(24)
          }
        }
      }
      .card()
      .margin({ top: 20, bottom: 10 })
      .justifyContent(FlexAlign.SpaceEvenly)

      Button('新增任务')
        .width(200)
        .onClick(() => {
          this.task.push(new Task())
          this.totalTask = this.task.length
          this.finishTask=this.task.filter(item=>item.finished).length
        })
      List({ space: 10 }) {
        ForEach(
          this.task,
          (item: Task,index) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(20)
                Checkbox()
                  .select(item.finished)
                  .onChange(val => {
                    item.finished = val
                    this.totalTask=this.task.length

                    this.finishTask = this.task.filter(item => item.finished).length
                  })

              }
              .card()
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .swipeAction({end:this.deletebuttom(index)})
          }
        )
      }
      .width('100%')
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
  @Builder deletebuttom(index:number){
    Button(){
      Image('删除')
        .width(20)
        .fillColor(Color.White)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(()=>{
      this.task.splice(index,1)
      this.totalTask=this.task.length
      this.finishTask=this.task.filter(item=>item.finished).length
    })
  }
}

class Task {
  static id: number = 1
  name: string = `任务${Task.id++}`
  finished: boolean = false
}

@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

@Extend(Text) function finishTask() {
  .decoration({ type: TextDecorationType.LineThrough })
  .fontColor('#B1B2B1')
}