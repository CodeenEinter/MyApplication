@Entry
@Component
struct Index {
  @State imagewith: number = 50

  build() {
    Row() {
      Column() {
        Image($r('app.media.icon'))
          .width(this.imagewith)
          .interpolation(ImageInterpolation.High)
        Text($r('app.string.lable_with'))
          .fontSize(50)
          .textAlign(TextAlign.End)
        TextInput({text:this.imagewith.toFixed(0)})
          .type(InputType.Password)
          .width(200)
          .height(50)
          .backgroundColor('#abcd')
          .onChange(value => {
            this.imagewith = parseInt(value)
          })
        Button('缩小')
          .width(80)
          .type(ButtonType.Circle)
          .onClick(()=>{
            if(this.imagewith>=10){
              this.imagewith-=10
            }
          })

        Button('放大')
          .width(80)
          .type(ButtonType.Circle)
          .onClick(()=> {
            if (this.imagewith < 400) {
            this.imagewith += 10
          }
          })
        Slider({
          min:10,
          max:300,
          value:this.imagewith,
          step:5,
          style:SliderStyle.OutSet,
          direction:Axis.Horizontal,
          reverse:false
        })
          .height(200)
          .showTips(true)
          .blockColor('#bba')
          .trackThickness(10)
          .onChange(value=>{
            this.imagewith=value
          })
          List({space:10}){
            ForEach([1,2,3,4],item=>{
              ListItem(){
                // @ts-ignore
                Text("逛街")
              }
            })
          }
        .width(100)
      }
      .width('100%')
    }
    .height('100%')

  }
  // 局部函数
  @Builder Text(){

  }
}
//继承样式
@Extend(Text) function text(){

}
//自定组件
@Component
struct header{
  build(){

  }
}
//全局样式
@Styles function Text1(){

}
//全局函数
@Builder function Text(){

}