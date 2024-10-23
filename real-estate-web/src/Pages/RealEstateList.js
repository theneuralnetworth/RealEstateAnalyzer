import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Typography, Card, CardMedia, CardContent, CardActions, Button, Grid2, FormControl, InputLabel, Select, MenuItem, CssBaseline, AppBar, Toolbar, Container, Box} from '@mui/material';

const RealEstateList = () => {
    const [realEstates, setRealEstates] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');
    const routes = [{name: 'PPROGIA', path: 'http://localhost:8080/api/realestates/getrealestates'}, {name: 'ENGCIA', path: 'http://localhost:8082/api/realestates/getrealestates'}];
    const [selectedRoute, setSelectedRoute] = useState(routes[1]);
    const [selectedProperty, setSelectedProperty] = useState(null);

    const HomePage = ({realEstates}) =>{
      return (
        <Box display='flex' gap={2} container spacing={2} sx={{ padding: 2, width:'100%' }} >
          {loading && <Typography>Loading...</Typography>}
          {error && <Typography>{error}</Typography>}
          {!loading && !error && realEstates.map((realEstate) => (
            <Box item xs={12} sm={6} md={4} key={realEstate.id} maxWidth='300px'>
              <Card>
                <CardMedia
                  component="img"
                  alt={realEstate.property_type}
                  height="140"
                  width="100"
                  image={realEstate.imageUrl || 'default_house.png'} // Adicione uma URL padrão se não houver imagem
                />
                <CardContent>
                  <Typography gutterBottom variant="h5" component="div">
                    {realEstate.id}
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    Location: {realEstate.location.name}
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    Score: {Math.round(realEstate.finalScore)}
                  </Typography>
                </CardContent>
                <CardActions>
                  <Button size="small" color="primary" onClick={()=>{setSelectedProperty(realEstate)}}>
                    View Details
                  </Button>
                </CardActions>
              </Card>
            </Box>
          ))}
          </Box>
    )}

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

    useEffect(() => {
        setLoading(false);
        setError(false);
        const fetchRealEstates = async () => {
            try {
                const response = await axios.post(selectedRoute.path, {
                    preferences: {
                        location: 'Lisboa'
                    },
                });
                setRealEstates(response.data);
            } catch (err) {
                setError('Error fetching real estates');
            } finally {
                setLoading(false);
            }
        };

        fetchRealEstates();
    }, [selectedRoute]);


    return (
      <>
      <CssBaseline />
        <AppBar>
          <Toolbar>
            <Box display='flex' flex={1}>
              <Box display='flex' flex={1}>
                <Typography variant="h6" component="div">
                  Real Estate Analyzer
                </Typography>
              </Box>
              <Box>
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
              </Box>
            </Box>
          </Toolbar>
        </AppBar>
      <Toolbar />
      <Container sx={{margin:'0px'}}>
        <Box>
          {!selectedProperty  ? <HomePage realEstates={realEstates} /> : <PropertyPage realEstate={selectedProperty}/>}
        </Box>
      </Container>
    </>
  );
};

export default RealEstateList;
