enum CacheKey {
  darkMode('darkMode'),
  loggedIn('loggedIn'),
  showOnBoarding('showOnBoarding'),
  language('language'),
  userName('userName'),
  userImage('userImage'),
  userId('userId'),
  userNumberId('userNumberId'),
  email('email'),
  token('token'),
  phoneNumber('phoneNumber'),
  countryCode('countryCode');

  const CacheKey(this.key);
  final String key;
}
