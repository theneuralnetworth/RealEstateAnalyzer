const fs = require("fs").promises;
const path = require("path");

async function scrap() {
  const results = [];
  // Create a folder to store property files
  const folderName = "property_data";
  try {
    await fs.mkdir(folderName, { recursive: true });
  } catch (error) {
    console.error(`Error creating folder ${folderName}:`, error.message);
  }

  for (let i = 0; i < 10; i++) {
    const url = `https://www.imovirtual.com/_next/data/QyLCHxWbzZaIPltR6x2mJ/pt/resultados/comprar/moradia/porto/porto.json?ownerTypeSingleSelect=ALL&by=DEFAULT&direction=DESC&viewType=listing&searchingCriteria=comprar&searchingCriteria=moradia&searchingCriteria=porto&searchingCriteria=porto&limit=72&page${i}`;
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`Response status: ${response.status}`);
      }

      const json = await response.json();
      const properties = json.pageProps.data.searchAds.items;

      for (const property of properties) {
        try {
          const propertyResponse = await fetch(
            `https://www.imovirtual.com/_next/data/QyLCHxWbzZaIPltR6x2mJ/pt/anuncio/${property.slug}.json?id=${property.slug}`
          );

          if (!propertyResponse.ok) {
            throw new Error(
              `Property response status: ${propertyResponse.status}`
            );
          }

          const propertyJson = await propertyResponse.json();

          // Save propertyJson to a .txt file inside the folder
          const filePath = path.join(folderName, `${property.slug}.txt`);
          await fs.writeFile(filePath, JSON.stringify(propertyJson, null, 2));
          console.log(`Saved property data for ${property.slug}`);
        } catch (error) {
          console.error(
            `Error fetching or saving property ${property.slug}:`,
            error.message
          );
        }
      }
    } catch (error) {
      console.error(`Error fetching page ${i}:`, error.message);
    }
  }

  return results;
}

async function main() {
  const result = await scrap();
  console.log(result);
}

main();
