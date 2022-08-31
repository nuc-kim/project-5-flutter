class PageViewItemRepository {
  Future<List<Map<String, dynamic>>> listPageViewItem() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      {
        'id': 0,
        'imgPath': 'resources/images/idol_full000.png',
        'url': 'clicked idol_full000.png',
      },
      {
        'id': 1,
        'imgPath': 'resources/images/idol_full001.png',
        'url': 'clicked idol_full001.png',
      },
      {
        'id': 2,
        'imgPath': 'resources/images/idol_full002.png',
        'url': 'clicked idol_full002.png',
      },
      {
        'id': 3,
        'imgPath': 'resources/images/idol_full022.png',
        'url': 'clicked idol_full022.png',
      },
      {
        'id': 4,
        'imgPath': 'resources/images/idol_full036.png',
        'url': 'clicked idol_full036.png',
      },
    ];
  }
}