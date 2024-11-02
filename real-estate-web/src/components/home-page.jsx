import {
  Box,
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
  theme,
  applyFilters,
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
        applyFilters={applyFilters}
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
                    onClick={() => setSelectedProperty(realEstate)}
                    sx={{
                      width: "100%",
                      height: "100%",
                      display: "flex",
                      flexDirection: "column",
                      cursor: "pointer",
                      "&:hover": {
                        backgroundColor: theme.palette.background.hover,
                        opacity: 0.8,
                        transition: "all 0.3s ease-in-out",
                      },
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
                    <CardContent
                      sx={{
                        flexGrow: 1,
                        display: "flex",
                        flexDirection: "column",
                        justifyContent: "space-between",
                      }}
                    >
                      <Typography
                        gutterBottom
                        variant="body1"
                        fontWeight={"bold"}
                        color="textPrimary"
                      >
                        {realEstate?.title.split("•")[0].trim()}
                      </Typography>
                      <div>
                        <Typography
                          variant="body2"
                          color="text.secondary"
                          fontWeight={"bold"}
                          sx={{
                            fontSize: "1rem",
                          }}
                        >
                          Price: {Math.round(realEstate?.price)} €
                        </Typography>
                        <Typography
                          variant="body2"
                          color="text.secondary"
                          fontSize={"0.77rem"}
                        >
                          Location: {realEstate?.location?.name}
                        </Typography>
                      </div>
                      <Typography
                        variant="body2"
                        color="text.secondary"
                        fontWeight={"bolder"}
                        fontSize={"1.3rem"}
                        marginTop="4px"
                        textAlign={"right"}
                        sx={{
                          color:
                            Math.round(realEstate?.totalScore / 10) >= 60
                              ? "green"
                              : Math.round(realEstate?.totalScore / 10) <= 40
                              ? "red"
                              : "orange",
                        }}
                      >
                        Score: {Math.round(realEstate?.totalScore / 10)}
                      </Typography>
                    </CardContent>
                    <CardActions
                      sx={{ justifyContent: "flex-end" }}
                    ></CardActions>
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
