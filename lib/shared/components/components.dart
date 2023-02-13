import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/layout/news/news_cubit.dart';
import 'package:flutter_news_app/modules/webview/web_view.dart';

Widget defaultButton({
  required double width,
  required Color background,
  required String btnText,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          '${btnText}',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  Function? Function(String? value)? onChange,
  required String? validate(String? value),
  bool isPassword = false,
  VoidCallback? onFormTap,
  IconData? sufficIcon,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validate,
        obscureText: isPassword,
        onChanged: onChange,
        onTap: onFormTap,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            prefixIcon: Icon(prefix),
            suffixIcon: IconButton(
              icon: Icon(sufficIcon),
              onPressed: suffixPressed,
            )));

Widget buildArticleItem(article, context, index) => Container(
      color: NewsCubit.get(context).businessSelectedItem == index
          ? Colors.grey[200]
          : null,
      child: InkWell(
        onTap: () {
//  navigateTo(context, WebViewScreen(article['url']));
          NewsCubit.get(context).selectedBusinessItem(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage('${article['urlToImage']}'),
                        fit: BoxFit.cover)),
                width: 120,
                height: 100,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${article['publishedAt']}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget articleDivider() => Container(
      height: 2.00,
      color: Colors.grey[200],
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
