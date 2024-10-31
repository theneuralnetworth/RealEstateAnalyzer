import {
  Box,
  Button,
  Card,
  CardActions,
  CardContent,
  CardMedia,
  Container,
  Grid,
  Pagination,
  Typography,
} from "@mui/material";
import { ITEMS_PER_PAGE } from "../utils/constants";
import PreferencesPanel from "./preferences-panel";

const HomePage = ({
  realEstates,
  setSelectedProperty,
  loading,
  error,
  setCurrentPage,
  currentPage,
  preferences,
  setPreferences,
  updateResults,
}) => {
  const indexOfLastItem = currentPage * ITEMS_PER_PAGE;
  const indexOfFirstItem = indexOfLastItem - ITEMS_PER_PAGE;
  const currentItems = realEstates.slice(indexOfFirstItem, indexOfLastItem);
  const totalPages = Math.ceil(realEstates.length / ITEMS_PER_PAGE);
  return (
    <Box display="flex">
      <PreferencesPanel
        preferences={preferences}
        setPreferences={setPreferences}
        updateResults={updateResults}
      />
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
};

export default HomePage;
