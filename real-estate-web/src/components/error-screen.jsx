import { Box, Button, Typography } from "@mui/material";
import ErrorIcon from "@mui/icons-material/Error";
import RefreshIcon from "@mui/icons-material/Refresh";

const ErrorScreen = ({ onRetry }) => {
  return (
    <Box
      sx={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
        minHeight: "80vh",
        gap: 3,
        textAlign: "center",
        padding: 2,
      }}
    >
      <ErrorIcon
        sx={{
          fontSize: 120,
          color: "error.main",
          opacity: 0.8,
        }}
      />

      <Box>
        <Typography variant="h4" gutterBottom fontWeight="bold">
          Oops! Something went wrong
        </Typography>
        <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
          We couldn't fetch the properties list. Please try again.
        </Typography>
      </Box>

      <Button
        variant="contained"
        startIcon={<RefreshIcon />}
        onClick={onRetry}
        size="large"
        sx={{
          px: 4,
          py: 1.5,
          borderRadius: 2,
          textTransform: "none",
          fontSize: "1.1rem",
        }}
      >
        Try Again
      </Button>
    </Box>
  );
};

export default ErrorScreen;
