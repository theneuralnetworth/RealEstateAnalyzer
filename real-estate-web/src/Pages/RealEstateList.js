import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Typography, Card, CardMedia, CardContent, CardActions, Button, Grid2} from '@mui/material';

const RealEstateList = () => {
    const [realEstates, setRealEstates] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState('');

    useEffect(() => {
        const fetchRealEstates = async () => {
            try {
                const response = await axios.post('http://localhost:8080/api/realestates/getrealestates', {
                    preferences: {
                        location: 'Lisboa'
                    },
                });
                console.log(response)
                setRealEstates(response.data);
            } catch (err) {
                setError('Error fetching real estates');
            } finally {
                setLoading(false);
            }
        };

        fetchRealEstates();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>{error}</div>;

    return (
        <Grid2 display='flex' flexDirection='column' container spacing={2} sx={{ padding: 2 }}>
          <Typography gutterBottom variant="h3" component="div">
            Real estates - Team 1
          </Typography>
          <Grid2 container spacing={2} sx={{ padding: 2 }}>
          {realEstates.map((realEstate) => (
            <Grid2 item xs={12} sm={6} md={4} key={realEstate.id} maxWidth='300px'>
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
                    Location: {realEstate.location}
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    Score: {Math.round(realEstate.finalScore)}
                  </Typography>
                </CardContent>
                <CardActions>
                  <Button size="small" color="primary">
                    View Details
                  </Button>
                </CardActions>
              </Card>
            </Grid2>
          ))}
          </Grid2>
        </Grid2>
      );
};

export default RealEstateList;
