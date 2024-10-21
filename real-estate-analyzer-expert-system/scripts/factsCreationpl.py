import json

# Função para ler o JSON
def read_json_from_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

# Função para gerar os factos Prolog
def generate_prolog_facts(data, output_file_path):
    fact_counter = 109  # Contador para o número de factos
    prolog_facts = []

    for item in data:
        id_imovel = item.get("id")
        title = item.get("title", "").replace("'", "")
        description = item.get("description", "").replace("'", "")
        location = item.get("location", "").replace("'", "")
        
        # Fact: Property
        prolog_facts.append(f"fact({fact_counter}, property({id_imovel}, '{title}')).")
        fact_counter += 1

        # Fact: Location Property
        prolog_facts.append(f"fact({fact_counter}, location_property({id_imovel}, '{location.lower()}')).")
        fact_counter += 1

        # Itera sobre as características e cria factos
        characteristics = {char['label'].lower(): char['localizedValue'] for char in item.get('characteristics', [])}

        # Preço
        price = characteristics.get('preço', '').replace('€', '').replace(' ', '')
        if price:
            prolog_facts.append(f"fact({fact_counter}, price({id_imovel}, {price})).")
            fact_counter += 1

        # Área
        area = characteristics.get('área', '').replace('m²', '').replace(' ', '')
        if area:
            prolog_facts.append(f"fact({fact_counter}, area({id_imovel}, {area})).")
            fact_counter += 1

        # Tipologia (Número de quartos)
        rooms = characteristics.get('tipologia', '0').replace('T', '')
        prolog_facts.append(f"fact({fact_counter}, rooms({id_imovel}, {rooms})).")
        fact_counter += 1

        # Certificado energético
        energy_rating = characteristics.get('certificado energético', '').lower()
        prolog_facts.append(f"fact({fact_counter}, energy_rating({id_imovel}, '{energy_rating}')).")
        fact_counter += 1

        # Ano de construção
        year_construction = characteristics.get('ano de construção', '')
        prolog_facts.append(f"fact({fact_counter}, year_construction({id_imovel}, {year_construction})).")
        fact_counter += 1

        # Elevador
        elevator_present = characteristics.get("elevator", "absent")
        prolog_facts.append(f"fact({fact_counter}, elevator({id_imovel}, {elevator_present})).")
        fact_counter += 1

        # Garagem
        garage_present = characteristics.get("garage", "absent")
        prolog_facts.append(f"fact({fact_counter}, garage({id_imovel}, {garage_present})).")
        fact_counter += 1

        # Sistema de segurança
        security_system = characteristics.get("security_system", "absent")
        prolog_facts.append(f"fact({fact_counter}, security_system({id_imovel}, {security_system})).")
        fact_counter += 1

        # Ramps
        ramps_present = characteristics.get("ramps", "absent")
        prolog_facts.append(f"fact({fact_counter}, ramps({id_imovel}, {ramps_present})).")
        fact_counter += 1

        # Piscina
        swimming_pool_present = characteristics.get("swimming_pool", "absent")
        prolog_facts.append(f"fact({fact_counter}, swimming_pool({id_imovel}, {swimming_pool_present})).")
        fact_counter += 1

        # Jardim
        garden_present = characteristics.get("garden", "absent")
        prolog_facts.append(f"fact({fact_counter}, garden({id_imovel}, {garden_present})).")
        fact_counter += 1

        # Fibra óptica
        optical_fiber_present = characteristics.get("optical_fiber", "absent")
        prolog_facts.append(f"fact({fact_counter}, optical_fiber({id_imovel}, {optical_fiber_present})).")
        fact_counter += 1

        # Smart appliances
        smart_appliances_present = characteristics.get("smart_appliances", "absent")
        prolog_facts.append(f"fact({fact_counter}, smart_appliances({id_imovel}, {smart_appliances_present})).")
        fact_counter += 1

        # Número de andares
        floor_number = characteristics.get("floor number", 0)
        prolog_facts.append(f"fact({fact_counter}, floor_level({id_imovel}, {floor_number})).")
        fact_counter += 1

        # Orientação solar
        sun_orientation = characteristics.get("sun_orientation", "unknown").lower()
        prolog_facts.append(f"fact({fact_counter}, sun_orientation({id_imovel}, {sun_orientation})).")
        fact_counter += 1

        # Área por quarto
        area_per_room = characteristics.get("area_per_room", 0)
        prolog_facts.append(f"fact({fact_counter}, area_per_room({id_imovel}, {area_per_room})).")
        fact_counter += 1


        thermal_comfort = characteristics.get("thermalconfort")
        prolog_facts.append(f"fact({fact_counter}, thermal_comfort({id_imovel}, {thermal_comfort})).")
        fact_counter += 1

        acoustic_insulation = characteristics.get("acoustic_insulation")
        prolog_facts.append(f"fact({fact_counter}, acoustic_insulation({id_imovel}, {acoustic_insulation})).")
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
file_path = '../ImoveisData/finalproperties.json'
output_file = '../Facts/finalfacts.pl'
json_data = read_json_from_file(file_path)
generate_prolog_facts(json_data, output_file)