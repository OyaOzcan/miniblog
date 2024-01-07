import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/model/blog.dart';
import 'package:miniblog/view/blog_details.dart'; 

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog, required this.onBack});
  final void Function() onBack;
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state is! ArticlesInitial) {
              context.read<ArticleBloc>().add(ResetEvent());
            }
             Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => BlogDetail(id: blog.id!)));
          },
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                     children: [
                      CircleAvatar(backgroundImage: NetworkImage(blog.thumbnail!),
                      radius: 50,),
                      SizedBox(width: 25),
                            Column(
                              children: [
                                Text(blog.title!, style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(blog.author!),
                              ],
                            ),
                        ],
                       ),
              ),
          ),
        );
      },
    );
  }
}