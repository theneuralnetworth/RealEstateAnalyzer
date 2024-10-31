import LightMode from "@mui/icons-material/LightMode";
import {
  AppBar,
  Box,
  FormControl,
  IconButton,
  InputLabel,
  MenuItem,
  Select,
  Toolbar,
  Typography,
} from "@mui/material";
import Brightness2Icon from "@mui/icons-material/Brightness2";

const Navbar = ({
  selectedRoute,
  setSelectedRoute,
  routes,
  toggleDarkMode,
  darkMode,
}) => {
  return (
    <AppBar>
      <Toolbar>
        <Box display="flex" flex={1}>
          <Box display="flex" flex={1} alignItems="center">
            <Typography variant="h5" component="div" fontFamily="Pixelify Sans">
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
  );
};

export default Navbar;
