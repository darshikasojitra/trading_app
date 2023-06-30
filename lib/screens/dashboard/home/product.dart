import 'dart:ui';

class Product {
  final String? title;
  final String? subtitle;
  final String? image;
  final String? chart;
  final String? amount;
  final String? subammount;
  final Color? color;
  final String? percentage;

  Product(
      {this.title,
      this.subtitle,
      this.image,
      this.chart,
      this.amount,
      this.subammount,
      this.color,
      this.percentage});
}

List<Product> allProducts = [
  Product(
      title: 'FB',
      subtitle: 'Facebook, Inc',
      image: 'asset/images/facebook.svg',
      chart: 'asset/images/spotifychart.svg',
      amount: '\$365.51',
      subammount: '+\$2.16',
      color: Color(0xffF61C7A),
      percentage: '0.59%'),
  Product(
      title: 'AAPL',
      subtitle: 'Apple',
      image: 'asset/images/apple.svg',
      chart: 'asset/images/microsoftchart.svg',
      amount: '\$149.62',
      subammount: '-\$0.090',
      color: Color(0xff1ED760),
      percentage: '0.59%'),
  Product(
    title: 'TWTR',
    subtitle: 'Twitter Inc.',
    image: 'asset/images/twiterlogo.svg',
    chart: 'asset/images/twiterchart.svg',
    amount: '\$63.98',
    color: Color(0xff1D82CC),
    percentage: '0.23%',
  ),
  Product(
    image: 'asset/images/google.svg',
    title: 'GOOGL',
    subtitle: 'Alphabet Inc.',
    chart: 'asset/images/googlechart.svg',
    amount: '\$2.84k',
    percentage: '0.58%',
    color: Color(0xff1DCC98),
  ),
  Product(
    image: 'asset/images/microsoft.svg',
    title: 'MSFT',
    subtitle: 'Microsoft',
    chart: 'asset/images/microsoftchart.svg',
    amount: '\$302.1',
    percentage: '0.23%',
    color: Color(0xff4CAF50),
  ),
  Product(
    image: 'asset/images/nike.svg',
    title: 'NIKE',
    subtitle: 'Nike, Inc.',
    chart: 'asset/images/nikechart.svg',
    amount: '\$169.8',
    percentage: '0.082%',
    color: Color(0xffFFC107),
  ),
  Product(
    image: 'asset/images/spotify.svg',
    title: 'SPOT',
    subtitle: 'Spotify',
    chart: 'asset/images/spotifychart.svg',
    amount: '\$226,9',
    percentage: '0,90%',
    color: Color(0xff1ED760),
  ),
];
