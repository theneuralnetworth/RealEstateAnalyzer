import {
  Box,
  Button,
  Slider,
  Typography,
  Accordion,
  AccordionSummary,
  AccordionDetails,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Checkbox,
  FormGroup,
  FormControlLabel,
} from "@mui/material";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import { useState } from "react";
import { capitalizeAndRemoveUnderscores } from "../utils/capitalize";
import {
  INITIAL_PREFERENCES_STATE,
  INITIAL_PRICE_RANGE,
  INITIAL_TYPOLOGIES_STATE,
  UNIQUE_LOCATIONS,
} from "../utils/constants";

const PreferencesPanel = ({
  preferences,
  setPreferences,
  updateResults,
  applyFilters,
}) => {
  const [sliderValues, setSliderValues] = useState(preferences);
  const [selectedLocation, setSelectedLocation] = useState("");
  const [priceRange, setPriceRange] = useState(INITIAL_PRICE_RANGE);
  const [typology, setTypology] = useState(INITIAL_TYPOLOGIES_STATE);

  const handleSliderDrag = (feature) => (event, newValue) => {
    setSliderValues((prev) => ({
      ...prev,
      [feature]: newValue,
    }));
  };

  const handleSliderChangeCommitted = (feature) => (event, newValue) => {
    const value = parseInt(newValue);
    setPreferences((prev) => ({
      ...prev,
      [feature]: value,
    }));
  };

  const handlePriceChange = (event, newValue) => {
    setPriceRange(newValue);
  };

  const handleTypologyChange = (event) => {
    const name = event.target.name;
    const checked = event.target.checked;

    if (name === "default") {
      return setTypology(INITIAL_TYPOLOGIES_STATE);
    }

    setTypology({
      ...typology,
      default: false,
      [name]: checked,
    });
  };

  const handleLocationChange = (event) => {
    setSelectedLocation(event.target.value);
  };

  const resetFilters = () => {
    setPreferences(INITIAL_PREFERENCES_STATE);
    setTypology(INITIAL_TYPOLOGIES_STATE);
    setPriceRange(INITIAL_PRICE_RANGE);
    setSelectedLocation("");
  };

  const saveFilters = () => {
    applyFilters(priceRange, selectedLocation, typology);
  };

  return (
    <Box sx={{ width: "100%", maxWidth: "250px", padding: 2 }}>
      <Accordion defaultExpanded>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls="filters-content"
          id="filters-header"
        >
          <Typography variant="h5">Filters</Typography>
        </AccordionSummary>
        <AccordionDetails>
          <Box sx={{ marginBottom: 2 }}>
            <Typography gutterBottom>
              Price Range: {priceRange[0]}€ - {priceRange[1]}€
            </Typography>
            <Slider
              value={priceRange}
              onChange={handlePriceChange}
              valueLabelDisplay="auto"
              min={0}
              max={2000000}
              step={10000}
            />
          </Box>

          <FormControl fullWidth sx={{ marginBottom: 2 }}>
            <InputLabel id="location-select-label">Location</InputLabel>
            <Select
              labelId="location-select-label"
              id="location-select"
              value={selectedLocation}
              label="Location"
              onChange={handleLocationChange}
              sx={{ textTransform: "capitalize" }}
            >
              <MenuItem value="">
                <em>All</em>
              </MenuItem>
              {UNIQUE_LOCATIONS?.map((location) => (
                <MenuItem
                  key={location}
                  value={location}
                  sx={{ textTransform: "capitalize" }}
                >
                  {location}
                </MenuItem>
              ))}
            </Select>
          </FormControl>

          <FormGroup sx={{ marginBottom: 2 }}>
            <FormControlLabel
              control={
                <Checkbox
                  checked={typology.default}
                  onChange={handleTypologyChange}
                  name="default"
                />
              }
              label="All Types"
            />
            <FormControlLabel
              control={
                <Checkbox
                  checked={typology.T1}
                  onChange={handleTypologyChange}
                  name="T1"
                />
              }
              label="T1"
            />
            <FormControlLabel
              control={
                <Checkbox
                  checked={typology.T2}
                  onChange={handleTypologyChange}
                  name="T2"
                />
              }
              label="T2"
            />
            <FormControlLabel
              control={
                <Checkbox
                  checked={typology.T3}
                  onChange={handleTypologyChange}
                  name="T3"
                />
              }
              label="T3"
            />
            <FormControlLabel
              control={
                <Checkbox
                  checked={typology.T4plus}
                  onChange={handleTypologyChange}
                  name="T4plus"
                />
              }
              label="T4+"
            />
          </FormGroup>
        </AccordionDetails>
      </Accordion>

      <Accordion defaultExpanded>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls="preferences-content"
          id="preferences-header"
        >
          <Typography variant="h5">Preferences</Typography>
        </AccordionSummary>
        <AccordionDetails>
          <Box>
            {Object.keys(preferences).map((feature) => (
              <Box key={`box-${feature}`} sx={{ marginBottom: 2 }}>
                <Typography
                  key={`feature-slider-name-${feature}`}
                  id={`${feature}-slider`}
                  gutterBottom
                >
                  {capitalizeAndRemoveUnderscores(feature)}:{" "}
                  {sliderValues[feature]}
                </Typography>
                <Slider
                  key={`slider-${feature}`}
                  value={sliderValues[feature]}
                  onChange={handleSliderDrag(feature)}
                  onChangeCommitted={handleSliderChangeCommitted(feature)}
                  aria-labelledby={`${feature}-slider`}
                  min={0}
                  max={10}
                  step={1}
                />
              </Box>
            ))}
          </Box>
        </AccordionDetails>
      </Accordion>
      <Box display={"flex"} gap={"5px"} mt={"-10px"}>
        <Button
          variant="outlined"
          color="black"
          onClick={resetFilters}
          fullWidth
        >
          Reset
        </Button>
        <Button
          variant="contained"
          color="primary"
          onClick={saveFilters}
          fullWidth
        >
          Apply
        </Button>
      </Box>
    </Box>
  );
};

export default PreferencesPanel;
