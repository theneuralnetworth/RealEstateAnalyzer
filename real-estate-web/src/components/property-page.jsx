import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Box,
  Button,
  Chip,
  styled,
  Typography,
} from "@mui/material";
import ArrowBack from "@mui/icons-material/ArrowBack";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ImageCarousel from "./image-carousel";
import { useEffect } from "react";

const PropertyPage = ({
  property,
  setSelectedProperty,
  preferences,
  selectedRoute,
  theme,
}) => {
  useEffect(() => {
    console.log("Selected property -> ", property);
  }, [property, theme]);

  const getValueForCharacteristic = (property, preference) => {
    if (!property || !preference) return "Invalid";

    const matchCharacteristicsToPreferences = {
      comfort: "overallComfort",
      energy_efficiency: "energyEfficiency",
      view_quality: "viewQualityLevel",
      sun_exposure: "sunExposure",
      parking: "overallParking",
      state: "buildState",
      services: "serviceLevel",
      potential_appreciation: "potentialAppreciation",
    };

    return matchCharacteristicsToPreferences[preference]
      ? property[matchCharacteristicsToPreferences[preference]]
      : property[preference];
  };

  const Content = styled("div")({
    display: "flex",
    flexDirection: "row",
    width: "100%",
    background: theme.palette.background.paper,
    padding: "16px",
    borderRadius: "8px",
    gap: "16px",
  });

  const renderJustifications = () =>
    selectedRoute.name === "ENGCIA"
      ? Object.keys(preferences).map((preference, i) => (
          <Accordion key={`accordion-${preference}`}>
            <AccordionSummary
              expandIcon={<ExpandMoreIcon />}
              aria-controls="panel1-content"
              id={`panel-header-${i}`}
            >
              <Box display="flex" flex={1} alignItems="center">
                <Typography
                  display="flex"
                  flex={1}
                  sx={{ textTransform: "capitalize" }}
                >
                  {preference.replace("_", " ")}
                </Typography>
                <Chip
                  label={getValueForCharacteristic(property, preference)}
                  variant="filled"
                  sx={{ color: "white" }}
                  color={
                    getValueForCharacteristic(property, preference) === "low"
                      ? "error"
                      : getValueForCharacteristic(property, preference) ===
                        "medium"
                      ? "warning"
                      : "success"
                  }
                />
              </Box>
            </AccordionSummary>
            <AccordionDetails>
              <ul>
                {property.justifications[preference].map((justification) => (
                  <li>{justification.split(";")[1].trim()}</li>
                ))}
              </ul>
            </AccordionDetails>
          </Accordion>
        ))
      : property.categories?.map((category, i) => (
          <Accordion key={`accordion-${category.name}`}>
            <AccordionSummary
              expandIcon={<ExpandMoreIcon />}
              aria-controls="panel1-content"
              id={`panel-header-${i}`}
            >
              <Box
                display="flex"
                flex={1}
                alignItems="center"
                marginRight={"12px !important"}
              >
                <Typography display="flex" flex={1}>
                  {category.name.split("_").length > 1
                    ? category.name.split("_")[0] +
                      " " +
                      category.name.split("_")[1]
                    : category.name}
                </Typography>
                <Chip
                  label={category.value}
                  variant="filled"
                  sx={{ color: "white" }}
                  color={
                    category.value === "low"
                      ? "error"
                      : category.value === "medium"
                      ? "warning"
                      : "success"
                  }
                />
              </Box>
            </AccordionSummary>
            <AccordionDetails>
              {category?.justifications?.map((justification) => (
                <Typography>{justification}</Typography>
              ))}
            </AccordionDetails>
          </Accordion>
        ));

  return (
    <Box
      display="flex"
      flexDirection="column"
      container="true"
      spacing={2}
      gap={2}
      sx={{ padding: 2, width: "100%" }}
    >
      <Box>
        <Button
          startIcon={<ArrowBack />}
          size="small"
          color="secondary"
          onClick={() => {
            setSelectedProperty(null);
          }}
        >
          Back to list
        </Button>
      </Box>
      <Content>
        <ImageCarousel realEstate={property} />
        <Box
          sx={{
            padding: "10px",
            display: "flex",
            flexDirection: "column",
            alignItems: "flex-start",
            justifyContent: "space-between",
            margin: "auto 0",
            height: "100%",
          }}
        >
          <Typography
            variant="body2"
            color="text.secondary"
            marginBottom={"30px"}
            sx={{ textTransform: "capitalize" }}
          >
            {property.title}
          </Typography>
          <div>
            <Typography
              gutterBottom
              variant="h4"
              fontWeight="bold"
              component="div"
            >
              Price: {property.price} €
            </Typography>
            <Typography
              variant="body1"
              color="text.secondary"
              sx={{ textTransform: "capitalize" }}
              gutterBottom
            >
              Location: {property.location.name}
            </Typography>
          </div>
          <Typography
            variant="h4"
            color="text.secondary"
            gutterBottom
            marginTop={"30px"}
            fontWeight={"bold"}
            sx={{
              color:
                Math.round(property.totalScore) > 60
                  ? "green"
                  : Math.round(property.totalScore) < 40
                  ? "red"
                  : "yellow",
            }}
          >
            Score: {Math.round(property.totalScore)} / 100
          </Typography>
        </Box>
      </Content>
      <Box>
        <Typography gutterBottom variant="h6" fontWeight="bold" component="div">
          How did it got that score?
        </Typography>
        {renderJustifications()}
      </Box>
    </Box>
  );
};

export default PropertyPage;
