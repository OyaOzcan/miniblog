import 'package:miniblog/model/blog.dart';

abstract class ArticleState {}

class ArticlesInitial extends ArticleState {}

class ArticlesLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;

  ArticlesLoaded({required this.blogs});
}

class ArticlesError extends ArticleState {}

class ArticlesDetailLoading extends ArticleState {}

class ArticlesDetailLoaded extends ArticleState {
  final Blog blog;

  ArticlesDetailLoaded({required this.blog});
}

class ArticlesDetailError extends ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticleLoading extends ArticleState {}

final class ArticleError extends ArticleState {}
