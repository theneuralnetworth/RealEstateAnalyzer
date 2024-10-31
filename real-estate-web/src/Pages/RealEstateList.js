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

const RealEstateList = () => {
  const [darkMode, setDarkMode] = useState(true);
  const lightTheme = createTheme({
    palette: {
      mode: "light",
      background: {
        default: "#f5f5f5",
        paper: "#FFF",
      },
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
      background: {
        default: "#202124",
        paper: "#292828",
      },
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
      // path: "http://localhost:8080/api/realestates/getrealestates", // local
      path: "http://localhost:8082/api/realestates/getrealestates", // docker
    },
  ];
  const [selectedRoute, setSelectedRoute] = useState(routes[1]);
  const [selectedProperty, setSelectedProperty] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
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

  return (
    <ThemeProvider theme={darkMode ? darkTheme : lightTheme}>
      <CssBaseline />
      <Navbar
        key={"app-navbar"}
        toggleDarkMode={toggleDarkMode}
        darkMode={darkMode}
        routes={routes}
        selectedRoute={selectedRoute}
        setSelectedRoute={setSelectedRoute}
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
          />
        ) : (
          <PropertyPage
            property={selectedProperty}
            preferences={preferences}
            selectedRoute={selectedRoute}
            setSelectedProperty={setSelectedProperty}
            theme={toggleDarkMode ? darkTheme : lightTheme}
          />
        )}
      </Container>
    </ThemeProvider>
  );
};

export default RealEstateList;
