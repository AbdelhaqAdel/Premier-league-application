import 'package:flutter/material.dart';
Widget defaultButton({
  double width=double.infinity,
  bool isUPpercase=true,
  Color background= Colors.blue,
  double radius=3,
  required String text,

  required Function function,
})=> 
 Container(
              width: width,
              height: 50,
              color:Colors.blue,
              child: MaterialButton(onPressed:(){
                function();
              },
              child: Text(
                isUPpercase?text.toUpperCase():text,
               style: TextStyle(
                color:Colors.white,
               ),
              ),
              ),
   );
 
 Widget defaultTextButton({
  required Function function,
  required String text,
   required Color? Color,
   double? size,
 })=>TextButton(
  onPressed:(){
    function();
  },
  child: Text(text.toLowerCase(),
   style: TextStyle(
     color: Color,
     fontSize: size,
   ),
  ),
);
/*
 Widget BuildTaskItem(Map model,context) =>Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text('${model['time']}'),
          ),
          SizedBox(width: 25,),
         Expanded(
           child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model['title']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  Text('${model['date']}'),
                ],
              ),
         ),
          
          SizedBox(width: 25,),
           IconButton(onPressed: (){
            appcubit.get(context).updateData(status: 'done',id: model['id']);
           },
            icon:Icon( Icons.check_box,),
            color: Colors.green,
            ),
           IconButton(onPressed: (){
           appcubit.get(context).updateData(status: 'archive',id: model['id']);

           },
            icon:Icon( Icons.archive,),
            color: Colors.black45,
            )
        ],
        ),
    );
*/
Widget myDevider ()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child:   Container(
  
    height: 1,
  
    width: double.infinity,
  
    color:Colors.grey[500],
  
  ),
);
/*
Widget buildArticleItem(article,context)=>Padding(

      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                     child: Text('${article['title']}',
                    style:Theme.of(context).textTheme.bodyText1,
                     /*TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    
                    ),*/
                     maxLines: 3,
                     overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget ArticleBuilder(list,context)=>ConditionalBuilder(
    condition: list.length>0 ,
    builder: (context)=> ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context ,index)=>buildArticleItem(list[index],context), 
      separatorBuilder: (context, index) => myDevider(),
      itemCount: 10),
    fallback:(context) =>Center(child: CircularProgressIndicator()),);
*/
void navigateTo(context,Widget)=>
    Navigator.push(
  context, 
MaterialPageRoute(
  builder: (context)=>Widget,
),
 );


void navigateAndFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context, 
MaterialPageRoute(
  builder: (context)=>Widget,
),
 (route) => false
 );

Widget defaultformfeild(
  {
    required TextEditingController controller,
    required TextInputType type,
    required Function validate,
    Function ?onTap,
    Function ?onChange,
    Function ?onSubmit,
    bool isPaseword=false,
    required String label,
    required IconData prefix,
     Function? suffixpressed,
    bool isClickable=true,
    IconData? suffix,
  }

){

  return TextFormField(
                      controller: controller,
                      keyboardType: type,
                      obscureText: isPaseword,
                      enabled: isClickable,               
                      onFieldSubmitted: (value) {
                         onSubmit!(value);
                       },
                       onChanged: (value) {
                         onChange!(value);
                       },
                      onTap: () {
                        onTap!();
                      }, 
                      validator: (value)=> validate(value),
      
                      decoration: InputDecoration(
                        labelText:label,
                        prefixIcon:Icon(prefix),
                        suffixIcon: suffix!=null ? IconButton(onPressed: (){
                          suffixpressed!();
                        },
                         icon: Icon(suffix),
                         ):null,
                        border: const OutlineInputBorder(),
                      ),
                      
                   
 );
  /*void PrintFullText(String text){
    final pattern= RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) =>print(match.group(0)));
  }*/
}
                      

