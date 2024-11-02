const formatNumber = (number) => {
  // Handle null, undefined or invalid input
  if (!number && number !== 0) return "";

  // Convert to number if string is passed
  const num = typeof number === "string" ? parseFloat(number) : number;

  // Format the number with locale-specific separators
  return num.toLocaleString("en-US", {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0,
  });
};

export default formatNumber;
