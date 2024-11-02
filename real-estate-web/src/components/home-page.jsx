import {
  Avatar,
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
import SkeletonList from "./skeleton-list";
import ErrorScreen from "./error-screen";
import EmptyList from "./empty-list";

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
        {loading && <SkeletonList />}
        {error && <ErrorScreen onRetry={() => updateResults()} />}
        {!loading && !error && realEstates.length === 0 && <EmptyList />}
        {!loading && !error && realEstates.length > 0 && (
          <Box display="flex" flexDirection="column" gap={2}>
            <Grid container spacing={2}>
              {currentItems.map((realEstate) => (
                <Grid item xs={12} sm={6} md={4} lg={4} key={realEstate.id}>
                  <Card
                    onClick={() => setSelectedProperty(realEstate)}
                    sx={{
                      width: "100%",
                      height: "100%",
                      display: "flex",
                      flexDirection: "column",
                      cursor: "pointer",
                      textAlign: "left",
                      "&:hover": {
                        transition: "all 0.3s ease-in-out",
                        backgroundColor: theme.palette.background.hover,
                        border: `1px solid ${theme.palette.primary.contrast}`,
                        opacity: 0.8,
                      }
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
                        "& .MuiAvatar-root": {
                          marginLeft: "auto",
                        },
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
                    </CardContent>
                    <CardActions
                      sx={{ justifyContent: "flex-end" }}
                    >
                      <Avatar
                        sx={{
                          bgcolor:
                            Math.round(realEstate?.totalScore / 10) >= 60
                              ? "green"
                              : Math.round(realEstate?.totalScore / 10) <= 40
                              ? "red"
                              : "orange",
                        }}
                      >
                        {Math.round(realEstate?.totalScore / 10)}
                      </Avatar>
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
