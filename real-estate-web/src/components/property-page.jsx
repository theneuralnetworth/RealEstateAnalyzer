import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Box,
  Button,
  Chip,
  styled,
  Typography,
  Grid,
} from "@mui/material";
import ArrowBack from "@mui/icons-material/ArrowBack";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ImageCarousel from "./image-carousel";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import SquareFootIcon from "@mui/icons-material/SquareFoot";

const PropertyPage = ({
  property,
  setSelectedProperty,
  preferences,
  selectedRoute,
  theme,
}) => {
  console.log("Selected property -> ", property);

  const propertyTotalScore = Math.round(property.totalScore / 10);
  const isEngciaData = selectedRoute.name === "ENGCIA";

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
    alignItems: "center",
    width: "100%",
    background: theme.palette.content.main,
    padding: "16px",
    borderRadius: "8px",
    gap: "16px",
  });

  const capitalizeAndRemoveUnderscores = (value) => {
    // eslint-disable-next-line use-isnan
    if (typeof value !== "string" || Number(value.charAt(0)) === NaN)
      return value;
    return (
      value.charAt(0).toUpperCase() + String(value).slice(1).replace("_", " ")
    );
  };

  const formatPrologJustifications = (category) => {
    const justifications = category.justifications;

    if (!(justifications && justifications.length > 0))
      return "No justifications found.";

    const filtered = justifications.filter((j) => !j.startsWith("*" || "by"));

    let because = [...new Set(filtered.filter((v) => v.startsWith("Fact")))];

    because = because.map((v) => v.split(">")[1]);
    because = because.map((v) => v.split("("));
    because = because.map((v) => v.join());
    because = because.map((v) => v.split(")")[0]);
    console.log("midterm", because);
    because = because
      .map((v) => v.split(","))
      .map((arr) => {
        if (arr.length === 3) return [arr[0], arr[2]];
        if (arr.length === 4) return [arr[0], arr[3]];
        if (arr.length === 8) return [arr[0], arr[7]];
        return arr[1];
      });

    function buildJustificationText(because) {
      const categoryName = because[0].trim();
      const categoryValue = because[1];
      const categoryMapper = {
        last_5_years_increased:
          "in the last five years, the property's location increased by ",
        energy_rating: "this property's energy rating is ",
        year_construction: "this property was built in ",
        elevator: "in this property, elevator is ",
        ramps: "in this property, ramps are ",
        garage: "in this property, garage is ",
        swimming_pool: "in this property, swimming pool is ",
        garden: "in this property, garden is ",
        parking: "the parking level in this property's location is ",
        location_property: "this property is located in ",
        location_crime_rate: "the crime rate of this location is ",
        security_system: "in this property, security system is ",
        optical_fiber: "in this property, optical fiber is ",
        smart_appliances: "in this property, smart appliances are ",
        forest: "a forest near this location is ",
        beach: "a beach near this location is ",
        property_type: "the type of this property is ",
        floor_level: "this property's floor number is ",
        sun_orientation: "this property is oriented to ",
        area_per_room: "this property has an average size per room of ",
        acoustic_insulation:
          "this property has an acoustic insulation level of ",
        airport: "airport near this location is ",
        busy_traffic: "Busy traffic near this property is ",
        thermal_comfort: "the thermal comfort of this property is ",
        nearby_schools: "this property is nearby schools",
        nearby_public_transport: "this property is nearby public transport",
      };

      function getValueText(value) {
        if (categoryName === "area_per_room") return `${value} m2`;
        if (categoryName === "last_5_years_increased") return `${value}%`;
        return value;
      }

      return (
        <Typography
          style={{
            maxWidth: "100%",
            wordBreak: "break-word",
            wordWrap: "break-word",
            textTransform: "",
          }}
        >
          <span>
            {capitalizeAndRemoveUnderscores(categoryMapper[categoryName])}
          </span>{" "}
          <span style={{ fontWeight: "bold" }}>
            {capitalizeAndRemoveUnderscores(getValueText(categoryValue))}
          </span>
        </Typography>
      );
    }

    return (
      <ul>
        {because.map((reason) => (
          <li>{buildJustificationText(reason)}</li>
        ))}
      </ul>
    );
  };

  const renderJustifications = () =>
    isEngciaData ? (
      <Grid container spacing={2}>
        {Object.keys(preferences).map((preference, i) => (
          <Grid item xs={12} sm={6} md={4} key={`grid-${preference}`}>
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
                    <li
                      style={{
                        maxWidth: "100%",
                        wordBreak: "break-word",
                        wordWrap: "break-word",
                      }}
                    >
                      {justification.split(";")[1].trim()}
                    </li>
                  ))}
                </ul>
              </AccordionDetails>
            </Accordion>
          </Grid>
        ))}
      </Grid>
    ) : (
      <Grid container spacing={2}>
        {property.categories?.map((category, i) => (
          <Grid item xs={12} sm={6} md={4} key={`grid-${category.name}`}>
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
                  <Typography
                    display="flex"
                    flex={1}
                    textTransform={"capitalize"}
                  >
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
                {formatPrologJustifications(category)}
              </AccordionDetails>
            </Accordion>
          </Grid>
        ))}
      </Grid>
    );

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
        <Content style={{ justifyContent: "space-between" }}>
          <Button
            startIcon={<ArrowBack />}
            size="medium"
            color="secondary"
            variant="outlined"
            sx={{ minWidth: "160px" }}
            onClick={() => {
              setSelectedProperty(null);
            }}
          >
            Back to list
          </Button>
          <Typography variant="body2">
            {property.title.split("•")[0]}
          </Typography>
        </Content>
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
            minHeight: "100%",
          }}
        >
          <Typography
            gutterBottom
            variant="h4"
            fontWeight="bold"
            component="div"
            sx={{ display: "flex", alignItems: "center", gap: "20px" }}
          >
            {property.price} €
            {isEngciaData && (
              <span
                style={{
                  fontSize: "1rem",
                  fontWeight: "normal",
                  display: "flex",
                  alignItems: "center",
                  maxHeight: "1.1rem",
                  maxWidth: "fit-content",
                  color: "#939393",
                }}
              >
                <SquareFootIcon />
                {"  "} {Math.round(property.price / property.area)}€/m2
              </span>
            )}
          </Typography>
          <Typography
            variant="body2"
            color="text.secondary"
            sx={{
              textTransform: "capitalize",
              display: "flex",
              alignItems: "center",
            }}
            gutterBottom
          >
            <LocationOnIcon /> {"  "} {property.location.name}
          </Typography>
          <Typography
            variant="h4"
            color="text.secondary"
            gutterBottom
            marginTop={"30px"}
            fontWeight={"bold"}
            sx={{
              color:
                propertyTotalScore > 60
                  ? "green"
                  : propertyTotalScore < 40
                  ? "red"
                  : "yellow",
            }}
          >
            Score: {propertyTotalScore} / 100
          </Typography>
        </Box>
      </Content>
      <Box>
        <Typography gutterBottom variant="h6" fontWeight="bold" component="div">
          How did it got that score?
        </Typography>
        <Box>{renderJustifications()}</Box>
      </Box>
    </Box>
  );
};

export default PropertyPage;
