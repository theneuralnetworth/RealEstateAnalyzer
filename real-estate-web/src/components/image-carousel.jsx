import ArrowBack from "@mui/icons-material/ArrowBack";
import ArrowForward from "@mui/icons-material/ArrowForward";
import { Box, IconButton, Slide } from "@mui/material";
import { useState } from "react";

const ImageCarousel = ({ realEstate }) => {
  const [currentImage, setCurrentImage] = useState(0);

  const handlePrev = () => {
    setCurrentImage((prev) =>
      prev === 0 ? realEstate.images.length - 1 : prev - 1
    );
  };

  const handleNext = () => {
    setCurrentImage((prev) =>
      prev === realEstate.images.length - 1 ? 0 : prev + 1
    );
  };

  return (
    <Box
      display="flex"
      alignItems="center"
      justifyContent="center"
      position="relative"
      width="60%"
      // width="520px"
      height="400px"
      overflow="hidden"
    >
      <IconButton
        onClick={handlePrev}
        sx={{
          position: "absolute",
          left: 0,
          top: "50%",
          transform: "translateY(-50%)",
          color: "white",
          zIndex: 1,
          backgroundColor: "rgba(0, 0, 0, 0.5)",
          "&:hover": { backgroundColor: "rgba(0, 0, 0, 0.7)" },
        }}
      >
        <ArrowBack />
      </IconButton>
      {realEstate.images.map((image, index) => (
        <Slide
          key={index}
          in={index === currentImage}
          direction={index === currentImage ? "left" : "right"}
          timeout={500}
          mountOnEnter
          unmountOnExit
        >
          <Box
            component="img"
            src={image}
            alt={`Imagem ${index + 1}`}
            sx={{
              width: "100%",
              height: "100%",
              objectFit: "cover",
              position: "absolute",
            }}
          />
        </Slide>
      ))}
      <IconButton
        onClick={handleNext}
        sx={{
          position: "absolute",
          right: 0,
          top: "50%",
          transform: "translateY(-50%)",
          color: "white",
          zIndex: 1,
          backgroundColor: "rgba(0, 0, 0, 0.5)",
          "&:hover": { backgroundColor: "rgba(0, 0, 0, 0.7)" },
        }}
      >
        <ArrowForward />
      </IconButton>
    </Box>
  );
};

export default ImageCarousel;
