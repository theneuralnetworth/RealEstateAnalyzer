import { Box, Button, Slider, Typography } from "@mui/material";
import { useState } from "react";

const PreferencesPanel = ({ preferences, setPreferences, updateResults }) => {
  const [sliderValues, setSliderValues] = useState(preferences);

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

  return (
    <Box sx={{ width: "100%", maxWidth: "200px", padding: 2 }}>
      <Typography variant="h5">Preferences</Typography>
      <Box marginTop={2}>
        {Object.keys(preferences).map((feature) => (
          <Box key={`box-${feature}`} sx={{ marginBottom: 2 }}>
            <Typography
              key={`feature-slider-name-${feature}`}
              id={`${feature}-slider`}
              gutterBottom
            >
              {feature.charAt(0).toUpperCase() + feature.slice(1)}:{" "}
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
        <Button variant="contained" color="primary" onClick={updateResults}>
          Apply
        </Button>
      </Box>
    </Box>
  );
};

export default PreferencesPanel;
