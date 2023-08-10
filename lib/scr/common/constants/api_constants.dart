abstract final class ApiConst {
  static const baseUrl = String.fromEnvironment(
    "base_url",
    defaultValue: "...",
  );

  static const allPostPath = "/posts";
  static const searchPostsPath = "/posts/search";
  static const createNewPostPath = "/posts/add";

  static String getPostFromId(int id) => "/posts/$id";

  static String getUserPostsFromUserId(int id) => "/posts/user/$id";

  static String getPostComments(int id) => "/posts/$id/comments";

  static String updatePost(int id) => "/posts/$id";

  static String deletePost(int id) => "/posts/$id";

  static Map<String, List<String>> searchQuery(String searchText) => {
        "q": [searchText],
      };

  static Map<String, List<String>> paginationParams(int limit, int skip) => {
        "limit": ["$limit"],
        "skip": ["$skip"],
      };
}
