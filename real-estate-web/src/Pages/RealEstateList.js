import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { createTheme, ThemeProvider, Pagination, IconButton, Typography, Card, CardMedia, CardContent, CardActions, Button, Grid, FormControl, InputLabel, Select, MenuItem, CssBaseline, AppBar, Toolbar, Container, Box, Slider } from '@mui/material';
import Brightness2Icon from '@mui/icons-material/Brightness2';
import LightMode from '@mui/icons-material/LightMode';

const RealEstateList = () => {
    const [darkMode, setDarkMode] = useState(false);
    const lightTheme = createTheme({
        palette: {
            mode: 'light',
            primary: {
                main: '#1976d2'
            },
            secondary: {
                main: '#dc004e'
            }
        },
    });

    const darkTheme = createTheme({
        palette: {
            mode: 'dark',
            primary: {
                main: '#90caf9'
            },
            secondary: {
                main: '#f48fb1'
            }
        },
    });

    const toggleDarkMode = () => {
      setDarkMode((prev) => !prev);
    };
    const [realEstates, setRealEstates] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const routes = [{name: 'PPROGIA', path: 'http://localhost:8080/api/realestates/getrealestates'}, {name: 'ENGCIA', path: 'http://localhost:8082/api/realestates/getrealestates'}];
    const [selectedRoute, setSelectedRoute] = useState(routes[1]);
    const [selectedProperty, setSelectedProperty] = useState(null);
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage] = useState(12);
    const [preferences, setPreferences] = useState({
        safety: 10,
        comfort: 10,
        accessibility: 10,
        maintenance: 10,
        energy_efficiency: 10,
        services: 10,
        connectivity: 10,
        view_quality: 10,
        spaciousness: 10,
        sun_exposure: 10,
        parking: 10,
        state: 10,
        potential_appreciation: 10
    });

    useEffect(() => {
      setSelectedProperty(null)
      setPreferences({
        safety: 10,
        comfort: 10,
        accessibility: 10,
        maintenance: 10,
        energy_efficiency: 10,
        services: 10,
        connectivity: 10,
        view_quality: 10,
        spaciousness: 10,
        sun_exposure: 10,
        parking: 10,
        state: 10,
        potential_appreciation: 10
    })
      updateResults(); 
  }, [selectedRoute]);
    console.log(realEstates)
    const handleSliderChange = (feature) => (event, newValue) => {
        setPreferences((prevPreferences) => ({
            ...prevPreferences,
            [feature]: newValue,
        }));
    };

    const updateResults = async () => {
        setLoading(true);
        setError('');
        try {
            const response = await axios.post(selectedRoute.path, {
                preferences
            });
            setRealEstates(response.data);
            setCurrentPage(1);
        } catch (err) {
            setError('Error fetching real estates');
        } finally {
            setLoading(false);
        }
    };

    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = realEstates.slice(indexOfFirstItem, indexOfLastItem);
    const totalPages = Math.ceil(realEstates.length / itemsPerPage);


    const HomePage = ({ realEstates }) => (
      <Box display='flex'>
        <PreferencesPanel/>
        <Container sx={{ padding: 2 }}>
            {loading && <Typography>Loading...</Typography>}
            {error && <Typography>{error}</Typography>}
            {!loading && !error && (
                <Box display='flex' flexDirection='column' gap={2}>
                <Typography variant="h5">List real estates</Typography>
                <Grid container spacing={2}>
                  {currentItems.map((realEstate) => (
                        <Grid item xs={12} sm={6} md={4} lg={3} key={realEstate.id}>
                            <Card sx={{ width: '100%', height: '100%', display: 'flex', flexDirection: 'column' }}>
                              <CardMedia
                                component="img"
                                alt={realEstate.property_type}
                                height="140"
                                image={realEstate?.images ? realEstate?.images[0] : 'default_house.png'}
                              />
                              <CardContent sx={{ flexGrow: 1 }}>
                                  <Typography gutterBottom variant="body1" color="primary">
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
                              <CardActions sx={{ justifyContent: 'flex-end' }}>
                                  <Button size="small" color="secondary" variant='outlined' onClick={() => { setSelectedProperty(realEstate); }}>
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

    const PreferencesPanel = () => (
        <Box sx={{ width: '100%', maxWidth:'200px', padding:2}}>
            <Typography variant="h5">Preferences</Typography>
            <Box marginTop={2}>
            {Object.keys(preferences).map((feature) => (
                <Box key={feature} sx={{ marginBottom: 2 }}>
                    <Typography id={`${feature}-slider`} gutterBottom>
                        {feature.charAt(0).toUpperCase() + feature.slice(1)}: {preferences[feature]}
                    </Typography>
                    <Slider
                        value={preferences[feature] || 10} 
                        onChange={handleSliderChange(feature)}
                        aria-labelledby={`${feature}-slider`}
                        min={0}
                        max={10}
                    />
                </Box>
            ))}
            <Button variant="contained" color="primary" onClick={updateResults}>
                Apply
            </Button>
            </Box>
        </Box>
    );

    const PropertyPage = ({realEstate}) =>{ 
      return (
        <Box container spacing={2} sx={{ padding: 2, width:'100%' }} >
          <Button size="small" color="primary" onClick={()=>{setSelectedProperty(null)}}>Back</Button>
          <Typography gutterBottom variant="h5" component="div">
            {realEstate.id}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Location: {realEstate.location.name}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Score: {Math.round(realEstate.finalScore)}
          </Typography>
        </Box>
    )}

    return (
        <ThemeProvider theme={darkMode ? darkTheme : lightTheme}>
            <CssBaseline />
            <AppBar>
            <Toolbar>
            <Box display='flex' flex={1}>
              <Box display='flex' flex={1}>
                <Typography variant="h6" component="div">
                  Real Estate Analyzer
                </Typography>
              </Box>
              <Box display='flex' alignItems='center' gap={1}>
                <FormControl fullWidth>
                  <InputLabel id="select-label">Environment</InputLabel>
                  <Select
                    labelId="select-label"
                    id="select"
                    value={selectedRoute.name}
                    label="Environment"
                    size='small'
                    onChange={(e) => setSelectedRoute(routes.find(r=> r.name === e.target.value))}
                  >
                    <MenuItem value={'PPROGIA'}>PPROGIA</MenuItem>
                    <MenuItem value={'ENGCIA'}>ENGCIA</MenuItem>
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
            <Container sx={{marginLeft:'200px', marginRight:'200px', maxWidth:'1500px !important'}}>
                {!selectedProperty ? <HomePage realEstates={realEstates} /> : <PropertyPage realEstate={selectedProperty} />}
            </Container>
        </ThemeProvider>
    );
};

export default RealEstateList;
