import { Box, Button, Typography } from "@mui/material";
import SearchOffIcon from "@mui/icons-material/SearchOff";
import HomeWorkIcon from "@mui/icons-material/HomeWork";
import FilterAltOffIcon from "@mui/icons-material/FilterAltOff";

const EmptyList = ({ isFiltered = true }) => {
  const content = isFiltered
    ? {
        icon: (
          <FilterAltOffIcon
            sx={{ fontSize: 120, opacity: 0.8, color: "primary.main" }}
          />
        ),
        title: "No matches found",
        message: "No properties match your current filters.",
        buttonText: null,
        buttonAction: null,
      }
    : {
        icon: (
          <HomeWorkIcon
            sx={{ fontSize: 120, opacity: 0.8, color: "primary.main" }}
          />
        ),
        title: "No properties available",
        message:
          "There are no properties listed at the moment. Please check back later.",
        buttonText: null,
        buttonAction: null,
      };

  return (
    <Box
      sx={{
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
        minHeight: "60vh",
        gap: 3,
        textAlign: "center",
        padding: 2,
      }}
    >
      {content.icon}

      <Box>
        <Typography
          variant="h4"
          gutterBottom
          fontWeight="bold"
          color="text.primary"
        >
          {content.title}
        </Typography>
        <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
          {content.message}
        </Typography>
      </Box>

      {content.buttonText && (
        <Button
          variant="contained"
          startIcon={<SearchOffIcon />}
          onClick={content.buttonAction}
          size="large"
          sx={{
            px: 4,
            py: 1.5,
            borderRadius: 2,
            textTransform: "none",
            fontSize: "1.1rem",
            "&:hover": {
              transform: "scale(1.02)",
              transition: "transform 0.2s ease-in-out",
            },
          }}
        >
          {content.buttonText}
        </Button>
      )}
    </Box>
  );
};

export default EmptyList;
