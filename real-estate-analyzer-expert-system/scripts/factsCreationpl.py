import json

# Função para ler o JSON
def read_json_from_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

# Função para gerar os factos Prolog
def generate_prolog_facts(data, output_file_path):
    fact_counter = 134 # Contador para o número de factos
    prolog_facts = []

    for item in data:
        id_imovel = item.get("id")
        title = item.get("title")
        description = item.get("description")
        location = item.get("location")
        price = item.get("price")
        area_sqm = item.get("area")
        typology = item.get("typology")
        energyRate = item.get("energyRating")
        toiletsNumber = item.get("toiletsNumber")
        ramps = item.get("ramps")
        securitySystem = item.get("securitySystem")
        elevator = item.get("elevator")
        swimmingPool = item.get("swimmingPool")
        garden = item.get("garden")

       
        yearConstruction = item.get("yearConstruction")
        garage = item.get("garage")
        opticalFiber = item.get("opticalFiber")
        sunOrientation = item.get("sunOrientation")
        floorLevel = item.get("floorLevel")
        smartAppliances = item.get("smartAppliances")
        numberRooms = item.get("numberRooms")
        areaPerRoom = item.get("areaPerRoom")
        thermalComfort = item.get("thermalComfort")
        acousticIsolation = item.get("acousticInsulation")
        images = item.get("images")
        propertyType = item.get("propertyType")
    
        
        
        # Fact: Property
        prolog_facts.append(f"fact({fact_counter}, property({id_imovel}, '{title}')).")
        fact_counter += 1
        
        

        # Fact: Location Property
        prolog_facts.append(f"fact({fact_counter}, location_property({id_imovel}, '{location.lower()}')).")
        fact_counter += 1
        
        
        prolog_facts.append(f"fact({fact_counter}, property_type({id_imovel}, '{propertyType}')).")
        fact_counter += 1

        # Itera sobre as características e cria factos
        #characteristics = {char['label'].lower(): char['localizedValue'] for char in item.get('characteristics', [])}

        # Preço
       
        prolog_facts.append(f"fact({fact_counter}, price({id_imovel}, {price})).")
        fact_counter += 1

        # Área
        
        prolog_facts.append(f"fact({fact_counter}, area({id_imovel}, {area_sqm})).")
        fact_counter += 1

        # Tipologia (Número de quartos)
        
        prolog_facts.append(f"fact({fact_counter}, rooms({id_imovel}, {numberRooms})).")
        fact_counter += 1

        # Certificado energético
        
        prolog_facts.append(f"fact({fact_counter}, energy_rating({id_imovel}, '{energyRate}')).")
        fact_counter += 1

        # Ano de construção
        
        prolog_facts.append(f"fact({fact_counter}, year_construction({id_imovel}, {yearConstruction})).")
        fact_counter += 1

        # Elevador
        
        prolog_facts.append(f"fact({fact_counter}, elevator({id_imovel}, {elevator})).")
        fact_counter += 1

        # Garagem
     
        prolog_facts.append(f"fact({fact_counter}, garage({id_imovel}, {garage})).")
        fact_counter += 1

        # Sistema de segurança
        
        prolog_facts.append(f"fact({fact_counter}, security_system({id_imovel}, {securitySystem})).")
        fact_counter += 1

        # Ramps
       
        prolog_facts.append(f"fact({fact_counter}, ramps({id_imovel}, {ramps})).")
        fact_counter += 1

        # Piscina
        
        prolog_facts.append(f"fact({fact_counter}, swimming_pool({id_imovel}, {swimmingPool})).")
        fact_counter += 1

        # Jardim
        
        prolog_facts.append(f"fact({fact_counter}, garden({id_imovel}, {garden})).")
        fact_counter += 1

        # Fibra óptica
        
        prolog_facts.append(f"fact({fact_counter}, optical_fiber({id_imovel}, {opticalFiber})).")
        fact_counter += 1

        # Smart appliances
        
        prolog_facts.append(f"fact({fact_counter}, smart_appliances({id_imovel}, {smartAppliances})).")
        fact_counter += 1

        # Número de andares
        
        prolog_facts.append(f"fact({fact_counter}, floor_level({id_imovel}, {floorLevel})).")
        fact_counter += 1

        # Orientação solar
       
        prolog_facts.append(f"fact({fact_counter}, sun_orientation({id_imovel}, {sunOrientation})).")
        fact_counter += 1

        # Área por quarto
        
        prolog_facts.append(f"fact({fact_counter}, area_per_room({id_imovel}, {areaPerRoom})).")
        fact_counter += 1


        
        prolog_facts.append(f"fact({fact_counter}, thermal_comfort({id_imovel}, {thermalComfort})).")
        fact_counter += 1

        
        prolog_facts.append(f"fact({fact_counter}, acoustic_insulation({id_imovel}, {acousticIsolation})).")
        fact_counter += 1

        # Adicionar imagens
        images = item.get("images", [])
        for image in images:
            prolog_facts.append(f"fact({fact_counter}, image({id_imovel}, '{image}')).")
            fact_counter += 1
            
            
        

    
        prolog_facts.append("")

    # Escrever os factos gerados no arquivo
    with open(output_file_path, 'w', encoding='utf-8') as output_file:
        for fact in prolog_facts:
            output_file.write(fact + '\n')

# Exemplo de uso
file_path = '../ImoveisData/finalpropertiesDrools.json'
output_file = '../Facts/finalfactsV2.pl'
json_data = read_json_from_file(file_path)
generate_prolog_facts(json_data, output_file)