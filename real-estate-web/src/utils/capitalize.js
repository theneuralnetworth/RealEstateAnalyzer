export const capitalizeAndRemoveUnderscores = (value) => {
  // eslint-disable-next-line use-isnan
  if (typeof value !== "string" || Number(value.charAt(0)) === NaN)
    return value;
  return (
    value.charAt(0).toUpperCase() + String(value).slice(1).replace("_", " ")
  );
};
