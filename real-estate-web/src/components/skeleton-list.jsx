import {
  Box,
  Card,
  CardContent,
  Container,
  Grid,
  Skeleton,
} from "@mui/material";
import { ITEMS_PER_PAGE } from "../utils/constants";

const SkeletonList = () => {
  return (
    <Box display="flex">
      <Container sx={{ padding: 2 }}>
        <Box display="flex" flexDirection="column" gap={2}>
          <Grid container spacing={2}>
            {[...Array(ITEMS_PER_PAGE)].map((_, index) => (
              <Grid item xs={12} sm={6} md={4} lg={4} key={index}>
                <Card
                  sx={{
                    width: "100%",
                    height: "100%",
                    display: "flex",
                    flexDirection: "column",
                  }}
                >
                  {/* Image Skeleton */}
                  <Skeleton
                    variant="rectangular"
                    height={180}
                    animation="wave"
                  />

                  <CardContent
                    sx={{
                      flexGrow: 1,
                      display: "flex",
                      flexDirection: "column",
                      justifyContent: "space-between",
                      gap: 2,
                    }}
                  >
                    {/* Title Skeleton */}
                    <Skeleton
                      variant="text"
                      height={24}
                      width="80%"
                      animation="wave"
                    />

                    {/* Price and Location Skeletons */}
                    <Box>
                      <Skeleton
                        variant="text"
                        height={24}
                        width="60%"
                        animation="wave"
                      />
                      <Skeleton
                        variant="text"
                        height={20}
                        width="70%"
                        animation="wave"
                      />
                    </Box>

                    {/* Avatar Score Skeleton */}
                    <Skeleton
                      variant="circular"
                      width={40}
                      height={40}
                      animation="wave"
                      sx={{ marginLeft: "auto" }}
                    />
                  </CardContent>
                </Card>
              </Grid>
            ))}
          </Grid>

          {/* Pagination Skeleton */}
          <Box display="flex" justifyContent="center" sx={{ marginTop: 2 }}>
            <Skeleton
              variant="rectangular"
              width={300}
              height={40}
              animation="wave"
            />
          </Box>
        </Box>
      </Container>
    </Box>
  );
};

export default SkeletonList;
