# require "republican_calendar/version"
require 'date'
require 'byebug'

module RepublicanCalendar


  def to_republican
    days = self - Date::Republican::DAY_ONE

    [Date.new(1800, 2, 28), Date.new(1900, 2, 28), Date.new(2100, 2, 28)].each do |date|
      days -= 1 if (Date::Republican::DAY_ONE + days.to_i) > date
    end
    year = 1
    while days >= (year_days = Date::Republican.new(year).sextil? ? 366 : 365)
      days -= year_days
      year +=1
    end
    month = 1 + (days / 30).to_i
    day = 1 + (days % 30).to_i
    Date::Republican.new(year, month, day)
  end
end

class Date::Republican

  attr_accessor :year, :month, :day

  def initialize(year=1, month=1, day=1)
    explanation = if year < 1
      'no year 0 in the republican calendar'
    elsif !month.between?(1,13)
      '13 months in the republican calendar'
    elsif !day.between?(1,30) && !month.between?(1,12)
      '30 days a month in the republican calendar'
     elsif day > (Date::Republican.sextil?(year) ? 6 : 5 ) && month == 13
      'this year the thirteenth month has not so much days'
    end
    raise ArgumentError.new("invalid date #{explanation}") if explanation
    @day              = day
    @month            = month
    @year             = year
  end

  def self.sextil?(year)
    [3, 7, 11, 15, 20].include?(year) || (Date.new(1791 + year).leap? && !year.between?(1,20))
  end

  def sextil?
    [3, 7, 11, 15, 20].include?(year) || (Date.new(1791 + year).leap? && !year.between?(1,20))
  end


  def strftime(format='%F')
    "#{day} #{MONTHS[month - 1]} an #{year}"
  end

  def to_s
    strftime
  end

  [:+, :-].each do |meth|
    define_method meth do |nb|
      to_gregorian.send(meth, nb).to_republican
    end
  end

  def to_gregorian
    days = 0
    (1..(year - 1)).each do |y|
      days += Date::Republican.sextil?(y) ? 366 : 365
    end
    days += (month - 1) * 30
    days += (day - 1)
    [Date.new(1800, 2, 28), Date.new(1900, 2, 28), Date.new(2100, 2, 28)].each do |date|
      days += 1 if (DAY_ONE + days.to_i) > date
    end
    DAY_ONE + days.to_i
  end

  FRENCH_REPUBLIC = 2375840

  DAY_ONE = Date.jd(FRENCH_REPUBLIC)

  DAYS = [
    "Raisin",
    "Safran",
    "Châtaigne",
    "Colchique",
    "Cheval",
    "Balsamine",
    "Carotte",
    "Amarante",
    "Panais",
    "Cuve",
    "Pomme de terre",
    "Immortelle",
    "Potiron",
    "Réséda",
    "Âne",
    "Belle de nuit",
    "Citrouille",
    "Sarrasin",
    "Tournesol",
    "Pressoir",
    "Chanvre",
    "Pêche",
    "Navet",
    "Amaryllis",
    "Bœuf",
    "Aubergine",
    "Piment",
    "Tomate",
    "Orge",
    "Tonneau",
    "Pomme",
    "Céleri",
    "Poire",
    "Betterave",
    "Oie",
    "Héliotrope",
    "Figue",
    "Scorsonère",
    "Alisier",
    "Charrue",
    "Salsifis",
    "Macre",
    "Topinambour",
    "Endive",
    "Dindon",
    "Chervis",
    "Cresson",
    "Dentelaire",
    "Grenade",
    "Herse",
    "Bacchante",
    "Azerole",
    "Garance",
    "Orange",
    "Faisan",
    "Pistache",
    "Macjonc",
    "Coing",
    "Cormier",
    "Rouleau",
    "Raiponce",
    "Turneps",
    "Chicorée",
    "Nèfle",
    "Cochon",
    "Mâche",
    "Chou-fleur",
    "Miel",
    "Genièvre",
    "Pioche",
    "Cire",
    "Raifort",
    "Cèdre",
    "Sapin",
    "Chevreuil",
    "Ajonc",
    "Cyprès",
    "Lierre",
    "Sabine",
    "Hoyau",
    "Érable sucré",
    "Bruyère",
    "Roseau",
    "Oseille",
    "Grillon",
    "Pignon",
    "Liège",
    "Truffe",
    "Olive",
    "Pelle",
    "Tourbe",
    "Houille",
    "Bitume",
    "Soufre",
    "Chien",
    "Lave",
    "Terre végétale",
    "Fumier",
    "Salpêtre",
    "Fléau",
    "Granit",
    "Argile",
    "Ardoise",
    "Grès",
    "Lapin",
    "Silex",
    "Marne",
    "Pierre à chaux",
    "Marbre",
    "Van",
    "Pierre à plâtre",
    "Sel",
    "Fer",
    "Cuivre",
    "Chat",
    "Étain",
    "Plomb",
    "Zinc",
    "Mercure",
    "Crible",
    "Lauréole",
    "Mousse",
    "Fragon",
    "Perce-neige",
    "Taureau",
    "Laurier-thym",
    "Amadouvier",
    "Mézéréon",
    "Peuplier",
    "Coignée",
    "Ellébore",
    "Brocoli",
    "Laurier",
    "Avelinier",
    "Vache",
    "Buis",
    "Lichen",
    "If",
    "Pulmonaire",
    "Serpette",
    "Thlaspi",
    "Thimelé",
    "Chiendent",
    "Trainasse",
    "Lièvre",
    "Guède",
    "Noisetier",
    "Cyclamen",
    "Chélidoine",
    "Traîneau",
    "Tussilage",
    "Cornouiller",
    "Violier",
    "Troène",
    "Bouc",
    "Asaret",
    "Alaterne",
    "Violette",
    "Marceau",
    "Bêche",
    "Narcisse",
    "Orme",
    "Fumeterre",
    "Vélar",
    "Chèvre",
    "Épinard",
    "Doronic",
    "Mouron",
    "Cerfeuil",
    "Cordeau",
    "Mandragore",
    "Persil",
    "Cochléaria",
    "Pâquerette",
    "Thon",
    "Pissenlit",
    "Sylve",
    "Capillaire",
    "Frêne",
    "Plantoir",
    "Primevère",
    "Platane",
    "Asperge",
    "Tulipe",
    "Poule",
    "Bette",
    "Bouleau",
    "Jonquille",
    "Aulne",
    "Couvoir",
    "Pervenche",
    "Charme",
    "Morille",
    "Hêtre",
    "Abeille",
    "Laitue",
    "Mélèze",
    "Ciguë",
    "Radis",
    "Ruche",
    "Gainier",
    "Romaine",
    "Marronnier",
    "Roquette",
    "Pigeon",
    "Lilas",
    "Anémone",
    "Pensée",
    "Myrtille",
    "Greffoir",
    "Rose",
    "Chêne",
    "Fougère",
    "Aubépine",
    "Rossignol",
    "Ancolie",
    "Muguet",
    "Champignon",
    "Hyacinthe",
    "Râteau",
    "Rhubarbe",
    "Sainfoin",
    "Bâton-d’or",
    "Chamérops",
    "Ver à soie",
    "Consoude",
    "Pimprenelle",
    "Corbeille d’or",
    "Arroche",
    "Sarcloir",
    "Statice",
    "Fritillaire",
    "Bourrache",
    "Valériane",
    "Carpe",
    "Fusain",
    "Civette",
    "Buglosse",
    "Sénevé",
    "Houlette",
    "Luzerne",
    "Hémérocalle",
    "Trèfle",
    "Angélique",
    "Canard",
    "Mélisse",
    "Fromental",
    "Martagon",
    "Serpolet",
    "Faux",
    "Fraise",
    "Bétoine",
    "Pois",
    "Acacia",
    "Caille",
    "Œillet",
    "Sureau",
    "Pavot",
    "Tilleul",
    "Fourche",
    "Barbeau",
    "Camomille",
    "Chèvrefeuille",
    "caille-lait",
    "Tanche",
    "Jasmin",
    "Verveine",
    "Thym",
    "Pivoine",
    "Chariot",
    "Seigle",
    "Avoine",
    "Oignon",
    "Véronique",
    "Mulet",
    "Romarin",
    "Concombre",
    "Échalote",
    "Absinthe",
    "Faucille",
    "Coriandre",
    "Artichaut",
    "Girofle",
    "Lavande",
    "Chamois",
    "Tabac",
    "Groseille",
    "Gesse",
    "Cerise",
    "Parc",
    "Menthe",
    "Cumin",
    "Haricot",
    "Orcanète",
    "Pintade",
    "Sauge",
    "Ail",
    "Vesce",
    "Blé",
    "Chalémie",
    "Épeautre",
    "Bouillon blanc",
    "Melon",
    "Ivraie",
    "Bélier",
    "Prêle",
    "Armoise",
    "Carthame",
    "Mûre",
    "Arrosoir",
    "Panis",
    "Salicorne",
    "Abricot",
    "Basilic",
    "Brebis",
    "Guimauve",
    "Lin",
    "Amande",
    "Gentiane",
    "Écluse",
    "Carline",
    "Câprier",
    "Lentille",
    "Aunée",
    "Loutre",
    "Myrte",
    "Colza",
    "Lupin",
    "Coton",
    "Moulin",
    "Prune",
    "Millet",
    "Lycoperdon",
    "Escourgeon",
    "Saumon",
    "Tubéreuse",
    "Sucrion",
    "Apocyn",
    "Réglisse",
    "Échelle",
    "Pastèque",
    "Fenouil",
    "Épine vinette",
    "Noix",
    "Truite",
    "Citron",
    "Cardère",
    "Nerprun",
    "Tagette",
    "Hotte",
    "Églantine",
    "Noisette",
    "Houblon",
    "Sorgho",
    "Écrevisse",
    "Bigarade",
    "Verge d’or",
    "Maïs",
    "Marron",
    "Panier",
    "La Fête de la Vertu",
    "La Fête du Génie",
    "La Fête du Travail",
    "La Fête de l'Opinion",
    "La Fête des Récompenses",
    "La Fête de la Révolution"
  ]

  DECADE_DAYS = [
    "Primidi",
    "Duodi",
    "Tridi",
    "Quartidi",
    "Quintidi",
    "Sextidi",
    "Septidi",
    "Octidi",
    "Nonidi",
    "Décadi"
  ]

  ABBR_DECADE_DAYS = DECADE_DAYS.map {|day| day.downcase[0..2]}

  MONTHS = [
    "Vendémiaire",
    "Brumaire",
    "Frimaire",
    "Nivôse",
    "Pluviôse",
    "Ventôse",
    "Germinal",
    "Floréal",
    "Prairial",
    "Messidor",
    "Thermidor",
    "Fructidor",
    "sans-culottides"
  ]

  ABBR_MONTHS = MONTHS.map do |month|
    ["Vendémiaire", "Ventôse"].include?(month) ? "#{month.downcase[0..1]}#{month.downcase[3]}" : month.downcase[0..2]
  end

end


Date.class_eval do
  include RepublicanCalendar
end
