{
  Object.defineProperty(document, 'visibilityState', {
    get() {
      return 'hidden';
    }
  });
}
