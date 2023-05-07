calculateNumberWidgetOnGrid(cs, width) {
  return (cs.maxWidth / width).floor() < 1
      ? 1
      : (cs.maxWidth / width) > 1.50
          ? 2
          : (cs.maxWidth / width).floor();
}