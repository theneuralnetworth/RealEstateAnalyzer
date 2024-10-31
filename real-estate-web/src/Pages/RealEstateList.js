import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  createTheme,
  ThemeProvider,
  Pagination,
  IconButton,
  Typography,
  Card,
  CardMedia,
  CardContent,
  CardActions,
  Button,
  Grid,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  CssBaseline,
  AppBar,
  Toolbar,
  Container,
  Box,
  Slide,
  Slider,
  AccordionSummary,
  Accordion,
  AccordionDetails,
  Chip,
} from "@mui/material";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import ArrowBack from "@mui/icons-material/ArrowBack";
import ArrowForward from "@mui/icons-material/ArrowForward";
import Brightness2Icon from "@mui/icons-material/Brightness2";
import LightMode from "@mui/icons-material/LightMode";

const RealEstateList = () => {
  const [darkMode, setDarkMode] = useState(false);
  const lightTheme = createTheme({
    palette: {
      mode: "light",
      primary: {
        main: "#f4ffa0",
      },
      secondary: {
        main: "#6e96f5",
      },
    },
  });

  const darkTheme = createTheme({
    palette: {
      mode: "dark",
      primary: {
        main: "#8f9b45",
      },
      secondary: {
        main: "#3e6df5",
      },
    },
  });

  const toggleDarkMode = () => {
    setDarkMode((prev) => !prev);
  };
  const [realEstates, setRealEstates] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const routes = [
    {
      name: "PPROGIA",
      path: "http://localhost:8080/api/realestates/getrealestates",
    },
    {
      name: "ENGCIA",
      path: "http://localhost:8080/api/realestates/getrealestates",
    },
  ];
  const [selectedRoute, setSelectedRoute] = useState(routes[1]);
  const [selectedProperty, setSelectedProperty] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage] = useState(12);
  const [preferences, setPreferences] = useState({
    security: 5,
    comfort: 5,
    accessibility: 5,
    maintenance: 5,
    energy_efficiency: 5,
    services: 5,
    connectivity: 5,
    view_quality: 5,
    spaciousness: 5,
    sun_exposure: 5,
    parking: 5,
    state: 5,
    potential_appreciation: 5,
  });

  useEffect(() => {
    setSelectedProperty(null);
    setPreferences({
      security: 5,
      comfort: 5,
      accessibility: 5,
      maintenance: 5,
      energy_efficiency: 5,
      services: 5,
      connectivity: 5,
      view_quality: 5,
      spaciousness: 5,
      sun_exposure: 5,
      parking: 5,
      state: 5,
      potential_appreciation: 5,
    });
    updateResults();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedRoute]);

  const updateResults = async () => {
    setLoading(true);
    setError("");
    try {
      const response = await axios.post(selectedRoute.path, {
        preferences,
      });
      setRealEstates(response.data);
      setCurrentPage(1);
    } catch (err) {
      setError("Error fetching real estates");
    } finally {
      setLoading(false);
    }
  };

  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = realEstates.slice(indexOfFirstItem, indexOfLastItem);
  const totalPages = Math.ceil(realEstates.length / itemsPerPage);

  const HomePage = ({ realEstates }) => (
    <Box display="flex">
      <PreferencesPanel />
      <Container sx={{ padding: 2 }}>
        {loading && <Typography>Loading...</Typography>}
        {error && <Typography>{error}</Typography>}
        {!loading && !error && (
          <Box display="flex" flexDirection="column" gap={2}>
            <Typography variant="h5">List real estates</Typography>
            <Grid container spacing={2}>
              {currentItems.map((realEstate) => (
                <Grid item xs={12} sm={6} md={4} lg={3} key={realEstate.id}>
                  <Card
                    sx={{
                      width: "100%",
                      height: "100%",
                      display: "flex",
                      flexDirection: "column",
                    }}
                  >
                    <CardMedia
                      component="img"
                      alt={realEstate.property_type}
                      height="140"
                      image={
                        realEstate?.images
                          ? realEstate?.images[0]
                          : "default_house.png"
                      }
                    />
                    <CardContent sx={{ flexGrow: 1 }}>
                      <Typography
                        gutterBottom
                        variant="body1"
                        color="secondary"
                      >
                        {realEstate?.title}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Price: {Math.round(realEstate?.price)} €
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Location: {realEstate?.location?.name}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        Score: {Math.round(realEstate?.totalScore)}
                      </Typography>
                    </CardContent>
                    <CardActions sx={{ justifyContent: "flex-end" }}>
                      <Button
                        size="small"
                        color="secondary"
                        variant="outlined"
                        onClick={() => {
                          setSelectedProperty(realEstate);
                        }}
                      >
                        View Details
                      </Button>
                    </CardActions>
                  </Card>
                </Grid>
              ))}
            </Grid>

            <Pagination
              count={totalPages}
              page={currentPage}
              onChange={(event, value) => setCurrentPage(value)}
              variant="outlined"
              shape="rounded"
              sx={{ marginTop: 2 }}
            />
          </Box>
        )}
      </Container>
    </Box>
  );

  const PreferencesPanel = () => {
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

  const ImageCarousel = ({ realEstate }) => {
    const [currentImage, setCurrentImage] = useState(0);
  
    const handlePrev = () => {
      setCurrentImage((prev) => (prev === 0 ? realEstate.images.length - 1 : prev - 1));
    };
  
    const handleNext = () => {
      setCurrentImage((prev) => (prev === realEstate.images.length - 1 ? 0 : prev + 1));
    };
  
    return (
      <Box display="flex" alignItems="center" justifyContent="center" position="relative" width="100%" height="650px" overflow="hidden" mx="auto">
        <IconButton 
          onClick={handlePrev}
          sx={{
            position: 'absolute', 
            left: 0, 
            top: '50%', 
            transform: 'translateY(-50%)', 
            color: 'white', 
            zIndex: 1, 
            backgroundColor: 'rgba(0, 0, 0, 0.5)', 
            '&:hover': { backgroundColor: 'rgba(0, 0, 0, 0.7)' }
          }}
        >
          <ArrowBack />
        </IconButton>
        {realEstate.images.map((image, index) => (
          <Slide
            key={index}
            in={index === currentImage}
            direction={index === currentImage ? 'left' : 'right'}
            timeout={500}
            mountOnEnter
            unmountOnExit
          >
            <Box
              component="img"
              src={image}
              alt={`Imagem ${index + 1}`}
              sx={{ width: '100%', height: '100%', objectFit: 'cover', position: 'absolute' }}
            />
          </Slide>
        ))}
        <IconButton 
          onClick={handleNext}
          sx={{
            position: 'absolute', 
            right: 0, 
            top: '50%', 
            transform: 'translateY(-50%)', 
            color: 'white', 
            zIndex: 1, 
            backgroundColor: 'rgba(0, 0, 0, 0.5)', 
            '&:hover': { backgroundColor: 'rgba(0, 0, 0, 0.7)' }
          }}
        >
          <ArrowForward />
        </IconButton>
      </Box>
    );
  };

  const PropertyPage = ({ realEstate }) => {
    return (
      <Box display='flex' flexDirection='column' container="true" spacing={2} gap={2} sx={{ padding: 2, width: "100%" }}>
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
        <ImageCarousel realEstate={realEstate} />
        <Box>
          <Typography gutterBottom variant="h5" component="div">
            {realEstate.title}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Price: {realEstate.price} €
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Location: {realEstate.location.name}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Score: {Math.round(realEstate.totalScore)}
          </Typography>
        </Box>
        <Box>
          {selectedRoute.name === 'ENGCIA' ? Object.keys(preferences).map((preference, i) => (
            <Accordion key={`accordion-${preference}`}>
              <AccordionSummary
                expandIcon={<ExpandMoreIcon />}
                aria-controls="panel1-content"
                id={`panel-header-${i}`}
              >
                {preference}
              </AccordionSummary>
              <AccordionDetails>
                <ul>
                  {realEstate.justifications[preference].map((justification) => (
                    <li>{justification.split(";")[1].trim()}</li>
                  ))}
                </ul>
              </AccordionDetails>
            </Accordion>
          )): realEstate.categories?.map((category, i) => (
            <Accordion key={`accordion-${category.name}`}>
              <AccordionSummary
                expandIcon={<ExpandMoreIcon />}
                aria-controls="panel1-content"
                id={`panel-header-${i}`}
              >
                <Box display='flex' flex={1} alignItems='center'>
                  <Typography display='flex' flex={1}>{category.name}</Typography>
                  <Chip label={category.value} variant="outlined" color={category.value === 'low' ? 'error' : category.value === 'medium' ? 'warning' : 'success'}/>
                </Box>
              </AccordionSummary>
              <AccordionDetails>
                  {category?.justifications?.map((justification) => (
                    <Typography>{justification}</Typography>
                  ))}
              </AccordionDetails>
            </Accordion>
          ))}
        </Box>
      </Box>
    );
  };

  return (
    <ThemeProvider theme={darkMode ? darkTheme : lightTheme}>
      <CssBaseline />
      <AppBar>
        <Toolbar>
          <Box display="flex" flex={1}>
            <Box display="flex" flex={1} alignItems="center">
              <Typography
                variant="h5"
                component="div"
                fontFamily="Pixelify Sans"
              >
                Real Estate Analyzer
              </Typography>
            </Box>
            <Box display="flex" alignItems="center" gap={1}>
              <FormControl fullWidth>
                <InputLabel id="select-label">Environment</InputLabel>
                <Select
                  labelId="select-label"
                  id="select"
                  value={selectedRoute.name}
                  label="Environment"
                  size="small"
                  onChange={(e) =>
                    setSelectedRoute(
                      routes.find((r) => r.name === e.target.value)
                    )
                  }
                >
                  <MenuItem value={"PPROGIA"}>PPROGIA</MenuItem>
                  <MenuItem value={"ENGCIA"}>ENGCIA</MenuItem>
                </Select>
              </FormControl>
              <IconButton onClick={toggleDarkMode}>
                {darkMode ? <LightMode /> : <Brightness2Icon />}
              </IconButton>
            </Box>
          </Box>
        </Toolbar>
      </AppBar>
      <Toolbar />
      <Container>
        {!selectedProperty ? (
          <HomePage realEstates={realEstates} />
        ) : (
          <PropertyPage realEstate={selectedProperty} />
        )}
      </Container>
    </ThemeProvider>
  );
};

export default RealEstateList;
