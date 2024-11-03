import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  createTheme,
  ThemeProvider,
  CssBaseline,
  Toolbar,
  Container,
} from "@mui/material";
import Navbar from "../components/navbar";
import PropertyPage from "../components/property-page";
import HomePage from "../components/home-page";
import {
  INITIAL_PREFERENCES_STATE,
  INITIAL_PRICE_RANGE,
  INITIAL_TYPOLOGIES_STATE,
} from "../utils/constants";

const routes = [
  {
    name: "PPROGIA",
    path: "http://localhost:8080/api/realestates/getrealestates",
  },
  {
    name: "ENGCIA",
    // path: "http://localhost:8080/api/realestates/getrealestates", // local
    path: "http://localhost:8082/api/realestates/getrealestates", // docker
  },
];

const RealEstateList = () => {
  const [darkMode, setDarkMode] = useState(false);
  const [realEstates, setRealEstates] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [selectedRoute, setSelectedRoute] = useState(routes[0]);
  const [selectedProperty, setSelectedProperty] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [preferences, setPreferences] = useState(INITIAL_PREFERENCES_STATE);
  const [selectedLocation, setSelectedLocation] = useState("");
  const [priceRange, setPriceRange] = useState(INITIAL_PRICE_RANGE);
  const [typology, setTypology] = useState(INITIAL_TYPOLOGIES_STATE);

  useEffect(() => {
    setPreferences(INITIAL_PREFERENCES_STATE);
    updateResults();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedRoute]);

  const lightTheme = createTheme({
    palette: {
      mode: "light",
      background: {
        default: "#f5f5f5",
        hover: "#F0F0F0",
      },
      primary: {
        main: "#c9df20",
        contrast: "#000",
      },
      secondary: {
        main: "#6e96f5",
      },
      content: {
        main: "#ffffff",
      },
    },
  });

  const darkTheme = createTheme({
    palette: {
      mode: "dark",
      background: {
        default: "#202124",
        hover: "#303134",
      },
      primary: {
        main: "#8f9b45",
        contrast: "#FFF",
      },
      secondary: {
        main: "#3e6df5",
      },
      content: {
        main: "#333333",
      },
    },
  });

  const toggleDarkMode = () => {
    setDarkMode((prev) => !prev);
  };

  const updateResults = async (
    filter = {
      price: { min: INITIAL_PRICE_RANGE[0], max: INITIAL_PRICE_RANGE[1] },
      location: "",
      typology: [],
    }
  ) => {
    setLoading(true);
    setError("");
    try {
      console.log("filter", filter);
      const response = await axios.post(selectedRoute.path, {
        preferences,
        filter,
      });
      const sortedData =
        selectedRoute.name === "PPROGIA"
          ? response.data.sort(
              (a, b) => Number(b.totalScore) - Number(a.totalScore)
            )
          : response.data;
      setRealEstates(sortedData);
      setCurrentPage(1);
      setSelectedProperty(undefined);
    } catch (err) {
      setError("Error fetching real estates");
    } finally {
      setLoading(false);
    }
  };

  const changeRoute = (newRoute) => {
    setSelectedProperty(undefined);
    setSelectedRoute(routes.find((r) => r.name === newRoute));
  };

  const applyFilters = (priceRange, location, typologies) => {
    const selectedTypologies = Object.entries(typologies)
      .filter((t) => t[1] === true && t[0] !== "default")
      .map((v) => v[0].split("")[1]);

    const filters = {
      price: {
        min: priceRange[0] ?? null,
        max: priceRange[1] ?? null,
      },
      location: location ?? null,
      typology:
        selectedTypologies && selectedTypologies.length > 0
          ? selectedTypologies
          : null,
    };
    updateResults(filters);
  };

  return (
    <ThemeProvider theme={darkMode ? darkTheme : lightTheme}>
      <CssBaseline />
      <Navbar
        key={"app-navbar"}
        toggleDarkMode={toggleDarkMode}
        darkMode={darkMode}
        routes={routes}
        selectedRoute={selectedRoute}
        changeRoute={changeRoute}
      />
      <Toolbar />
      <Container>
        {!selectedProperty ? (
          <HomePage
            realEstates={realEstates}
            currentPage={currentPage}
            error={error}
            loading={loading}
            setCurrentPage={setCurrentPage}
            setSelectedProperty={setSelectedProperty}
            preferences={preferences}
            setPreferences={setPreferences}
            updateResults={updateResults}
            theme={darkMode ? darkTheme : lightTheme}
            applyFilters={applyFilters}
            priceRange={priceRange}
            setPriceRange={setPriceRange}
            typology={typology}
            setTypology={setTypology}
            selectedLocation={selectedLocation}
            setSelectedLocation={setSelectedLocation}
          />
        ) : (
          <PropertyPage
            property={selectedProperty}
            preferences={preferences}
            selectedRoute={selectedRoute}
            setSelectedProperty={setSelectedProperty}
            theme={darkMode ? darkTheme : lightTheme}
          />
        )}
      </Container>
    </ThemeProvider>
  );
};

export default RealEstateList;
