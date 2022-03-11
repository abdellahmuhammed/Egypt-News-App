import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/webview/webview.dart';


Widget BuilderItem(article, context) => InkWell(
      onTap: () {
        NavigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image:  DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    maxLines: 3,
                  ),
                  // Text(
                  //   '${article['description']}',
                  //   style: Theme.of(context).textTheme.bodyText2,
                  //   textDirection: TextDirection.rtl,
                  // ),
                  Text(
                    '${article['publishedAt']}',
                    style: Theme.of(context).textTheme.bodyText2,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget ArticalItemBuilder(list , {isSearch})=>ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (BuildContext context)=>ListView.separated(
    itemBuilder: (BuildContext context, int index)=> BuilderItem(list[index] , context),
    separatorBuilder: (BuildContext context, int index)=>MyDivider(),
    itemCount: list.length,
  ),
  fallback:(BuildContext context)=> isSearch ? Container():const Center(child:  CircularProgressIndicator(
    color: Colors.brown,
  )) ,

);

Widget MyDivider() => Container(
      color: Colors.grey,
      width: double.infinity,
      height: 2.0,
    );

void NavigateTo (context ,Widget) => Navigator.push(
    context, MaterialPageRoute(builder: (context)=> Widget),
);


Widget defultTextFormFiled({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData prefixIcon,
  IconData suffixIcon,
  @required Function validate,
  bool isPassword = false,
  double radius = 0,
  int maxLength,
  int maxLines = 1,
  int minLines = 1,
  Function suffixPressed,
  Function onchange,
}) => TextFormField(
      controller: controller,
      keyboardType: type,
      onChanged: onchange,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        label: Text(label),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon))
            : null,
      ),
      validator: validate,
      obscureText: isPassword,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
    );


Widget defuiltTextBotton(){

}


