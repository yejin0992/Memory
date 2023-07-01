<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.17/dist/sweetalert2.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.17/dist/sweetalert2.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	max-width: 700px;
}

* {
	box-sizing: border-box;
	font-family: 'Pretendard-Regular';
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

#imgOutLine {
	width: 300px;
	height: 400px;
	border: 1px solid black;
	position:relative;
	left : 130px;
	border : 0.5px solid lightgrey;
}

#h3 {
	padding: 0;
	margin: 0;
	text-align: center;
	width: 70%;
}

.form-control {
	float: right;
	text-align: center
}

.bg-secondary {
	position: relative;
	right: 5px;
}

.form-select {
	float: right;
}

.gender {
	margin-right: 20px;
	margin-left: 5px;
}

#gender {
	float: right;
}

.rowFile {
	position: relative;
	bottom: 5px;
}

#img {
	width: 100%;
	height: 100%;
}

.reChoice{
display:none;
}

#headMargin{
margin-top:70px;
}


</style>

</head>
<body>
			<c:import url="/WEB-INF/views/common/navi.jsp" />
	<form action="/perfume/insert" method='post' enctype="multipart/form-data">
		<div class="container">
			<div class="row" id="headMargin">
				<div class="col">
					<h1>향수 정보 입력</h1>

				</div>
			</div>
			<div class="row">
				<hr>
			</div>
			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-2  d-inline-block">이미지</span>
					<div class="d-flex justify-content-center w-75 ">
						<div id="imgOutLine"></div>
					</div>
				</div>

			</div>
			<div class="rowFile">
				<div class="col-12">
					<div class="mb-3">
						<input type="file" id="formFileSm"
							class="form-control form-control-sm" name="files" dir="rtl"
							accept="image/*" onchange="setImage(event)">
					</div>
				</div>
			</div>

			<div class="row">
				<hr>
			</div>

			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">이름</span>
					<input id="per_name" class="form-control w-75 h-75 d-inline-block"
						type="text" name="per_name" placeholder="향수명">
				</div>
			</div>
			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">브랜드</span>
					<input id="per_brand" type="text"
						class="form-control w-75 h-75 d-inline-block" name="per_brand"
						placeholder="브랜드명">
				</div>
			</div>
			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">용량</span>
					<input id="per_volume" type="text"
						class="form-control w-75 h-75 d-inline-block" name="per_volume"
						placeholder="용량">
				</div>
			</div>
			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">종류</span>
					<select
						class="form-select text-center w-75 p-0 h-75 d-inline-block"
						id="select" name="per_kind">
						<option selected>종류 선택</option>
						<option value="퍼퓸">퍼퓸</option>
						<option value="오드퍼퓸">오드퍼퓸</option>
						<option value="오드뚜왈렛">오드뚜왈렛</option>
						<option value="오드코롱">오드코롱</option>
						<option value="샤워코롱">코롱</option>
					</select>
				</div>
			</div>

			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">가격</span>
					<input type="text" id="per_price"
						class="form-control w-75  h-75 d-inline-block" name="per_price"
						placeholder="가격">
				</div>
			</div>
			<div class="row ">
				<div class="col-12">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">성별</span>
					<div class="d-flex justify-content-center w-75 " id="gender">
						<input type="radio" id="woman" class="d-inline-block"
							name="per_gender" value="woman">
						<lable for="woman" class="gender">WOMAN</lable>
						<input type="radio" id="man" class="d-inline-block"
							name="per_gender" value="man">
						<lable for="man" class="gender">MAN</lable>
						<input type="radio" id="unisex" class="d-inline-block"
							name="per_gender" value="unisex">
						<lable for="unisex" class="gender">UNISEX</lable>
					</div>
				</div>
			</div>
			<div class="row">
				<hr>
			</div>

			<div class="row ">

				<div class="col-12 input-group">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">top1</span>
					<datalist id="datalistOptions">
						<option value="Bergamot">
						<option value="Bigarade">
						<option value="BitterOrange">
						<option value="BloodOrange">
						<option value="Calamansi">
						<option value="ChenPi">
						<option value="Citron">
						<option value="CitrusWater">
						<option value="Citruses">
						<option value="Clementine">
						<option value="FingerLime">
						<option value="Grapefruit">
						<option value="GrapefruitLeaf">
						<option value="GrapefruitPeel">
						<option value="GreenTangerine">
						<option value="Hassaku">
						<option value="HatkoraLemon">
						<option value="KaffirLime">
						<option value="Kumquat">
						<option value="Lemon">
						<option value="LemonBalm">
						<option value="LemonTree">
						<option value="LemonVerbena">
						<option value="LemonZest">
						<option value="Lemongrass">
						<option value="Lime">
						<option value="Limetta">
						<option value="LitseaCubeba">
						<option value="MandarinOrange">
						<option value="Mandora">
						<option value="MethylPamplemousse">
						<option value="Neroli">
						<option value="Orange">
						<option value="PalestinianSweetLime">
						<option value="Petitgrain">
						<option value="Pokan">
						<option value="Pomelo">
						<option value="Shiikuwasha">
						<option value="Tangelo">
						<option value="Tangerine">
						<option value="TangerineZest">
						<option value="Yuzu">
						<option value="AcaiBerry">
						<option value="Acerola">
						<option value="Acorn">
						<option value="Almond">
						<option value="Apple">
						<option value="AppleJuice">
						<option value="ApplePulp">
						<option value="AppleSherbet">
						<option value="Apricot">
						<option value="ArcticBramble">
						<option value="Argan">
						<option value="Artichoke">
						<option value="Banana">
						<option value="Barberry">
						<option value="Bearberry">
						<option value="Beetroot">
						<option value="BlackCurrant">
						<option value="BlackWalnut">
						<option value="Blackberry">
						<option value="Blackthorn">
						<option value="Blueberry">
						<option value="Boysenberry">
						<option value="BrazilNut">
						<option value="Breadnut">
						<option value="Buriti">
						<option value="BurningCherry">
						<option value="Candlenut">
						<option value="Cantaloupe">
						<option value="Carambola(StarFruit)">
						<option value="Carrot">
						<option value="Cashew">
						<option value="CassowaryFruit">
						<option value="Cauliflower">
						<option value="Cepes">
						<option value="Chayote">
						<option value="Cherimoya">
						<option value="Cherry">
						<option value="Chestnut">
						<option value="ChiaSeed">
						<option value="Chickpeas">
						<option value="ChineseMagnolia">
						<option value="Cloudberry">
						<option value="CocoDeMer">
						<option value="Coconut">
						<option value="CoconutWater">
						<option value="Conifer">
						<option value="Corn">
						<option value="CornSilk">
						<option value="CountsFruit">
						<option value="Cranberry">
						<option value="Cucumber">
						<option value="Cupuaçu,Cupuassu,Copoasu">
						<option value="CurrantLeafandBud">
						<option value="CyperusScariosus">
						<option value="DaikonRadish">
						<option value="DarkPlumWuMei">
						<option value="Dewberry">
						<option value="DriedAppleCrisp">
						<option value="DriedApricot">
						<option value="DriedFruits">
						<option value="Durian">
						<option value="Elderberry">
						<option value="FeijoaFruit">
						<option value="Fig">
						<option value="FigLeaf">
						<option value="ForestFruits">
						<option value="FrostedBerries">
						<option value="FruitSalad">
						<option value="FruityNotes">
						<option value="GariguetteStrawberry">
						<option value="Genipapo">
						<option value="GojiBerries">
						<option value="Gooseberry">
						<option value="Grains">
						<option value="GrapeSeed">
						<option value="Grapes">
						<option value="GreenAnjouPears">
						<option value="GreenGrape">
						<option value="GreenPear">
						<option value="GreenPlum">
						<option value="Greengage">
						<option value="GroundCherry">
						<option value="Guarana">
						<option value="Guava">
						<option value="Hazelnut">
						<option value="Jabuticaba">
						<option value="Jackfruit">
						<option value="JapaneseLoquat">
						<option value="JobsTears(YiYiRen)">
						<option value="Kiwi">
						<option value="Kumbaru">
						<option value="Lingonberry">
						<option value="Litchi">
						<option value="Loganberry">
						<option value="LonganBerries">
						<option value="Macadamia">
						<option value="Mahonia">
						<option value="Malt">
						<option value="Mango">
						<option value="Mangosteen">
						<option value="Maninka">
						<option value="MarianPlum">
						<option value="Medlar">
						<option value="Melon">
						<option value="Mirabelle">
						<option value="MoepelAccord">
						<option value="Mulberry">
						<option value="Mushroom">
						<option value="NashiPear">
						<option value="Nectarine">
						<option value="NuttyNotes">
						<option value="OkraSeeds">
						<option value="Olive">
						<option value="Papaya">
						<option value="Passionfruit">
						<option value="Pea">
						<option value="Peach">
						<option value="Peanut">
						<option value="Pear">
						<option value="Pecan">
						<option value="Persimmon">
						<option value="PeruvianPepper">
						<option value="Pineapple">
						<option value="PinotNoirGrapes">
						<option value="Pistachio">
						<option value="Pitahaya">
						<option value="Pitanga">
						<option value="Plum">
						<option value="Pomegranate">
						<option value="Potato">
						<option value="PricklyPear">
						<option value="Pumpkin">
						<option value="QuandongDesertPeach">
						<option value="Quince">
						<option value="Rambutan">
						<option value="Raspberry">
						<option value="RedApple">
						<option value="RedBerries">
						<option value="RedCurrant">
						<option value="RedFruits">
						<option value="RedFruitsSmoothie">
						<option value="RedMulberry">
						<option value="Rhubarb">
						<option value="RoastedNuts">
						<option value="Sapodilla">
						<option value="Sarsaparilla">
						<option value="SeaBuckthorn">
						<option value="Seriguela">
						<option value="SheaButter">
						<option value="SheaNuts">
						<option value="Silverberry">
						<option value="Snowberry">
						<option value="SourCherry">
						<option value="Soursop">
						<option value="Soybean">
						<option value="Squash">
						<option value="StarApple">
						<option value="Strawberry">
						<option value="Tayberry">
						<option value="Tomato">
						<option value="TropicalFruits">
						<option value="Umbu-Cajá|Taperebá">
						<option value="Walnut">
						<option value="WalnutMilk">
						<option value="WaterFruit">
						<option value="Watermelon">
						<option value="Wattleseed">
						<option value="WhiteCurrant">
						<option value="WildStrawberry">
						<option value="Winterberry">
						<option value="Wolfberry">
						<option value="YellowCherry">
						<option value="YucaCassava">
						<option value="Yumberry">
						<option value="Acacia ">
						<option value="AcerolaBlossom">
						<option value="Aglaia">
						<option value="Albizia">
						<option value="AlmondBlossom">
						<option value="Alstroemeria">
						<option value="Althaea">
						<option value="Alumroot">
						<option value="Alyssum">
						<option value="Amarillys">
						<option value="AmazonMoonflower">
						<option value="Anemone">
						<option value="AngelsTrumpet">
						<option value="AppleBlossom">
						<option value="ApricotBlossom">
						<option value="AshokaFlower">
						<option value="Astragalus">
						<option value="AztecaLily">
						<option value="BananaFlower">
						<option value="BanksiaAustralian">
						<option value="Begonia">
						<option value="Belladona">
						<option value="Bellflower">
						<option value="BergamotBlossom">
						<option value="BlackCurrantBlossom">
						<option value="BlackberryBlossom">
						<option value="BlueLilies">
						<option value="BluePoppy">
						<option value="Bottlebrush">
						<option value="Bougainvillea">
						<option value="BreadFlower">
						<option value="Bromelia">
						<option value="Buddleia">
						<option value="ButomusUmbellatus">
						<option value="Buttercup">
						<option value="CacaoBlossom">
						<option value="CallaLily">
						<option value="Camellia">
						<option value="CampionFlower">
						<option value="Cananga">
						<option value="CannonballFlower">
						<option value="CarambolaBlossom">
						<option value="CardamomFlower">
						<option value="Carnation">
						<option value="Celosia">
						<option value="ChaiHu">
						<option value="Chamomile">
						<option value="Champaca">
						<option value="CherryBlossom">
						<option value="ChimonanthusorWintersweet">
						<option value="ChinaRose">
						<option value="Chinottoblossom">
						<option value="ChocolateFlower">
						<option value="ChristmasTreeorFlameTree">
						<option value="Chrysanthemum">
						<option value="CistusIncanus">
						<option value="Clematis">
						<option value="Clover">
						<option value="CoconutBlossom">
						<option value="CoffeeBlossom">
						<option value="CornflowerSultanSeeds">
						<option value="CosmosFlower">
						<option value="Costus">
						<option value="CottonFlower">
						<option value="CreamyFlowers">
						<option value="CrinumLily">
						<option value="CucumberFlower">
						<option value="Cyclamen">
						<option value="Dahlia">
						<option value="Daisy">
						<option value="Dandelion">
						<option value="Daphne">
						<option value="Daylily">
						<option value="Deadnettle">
						<option value="Delonix">
						<option value="DesertRose">
						<option value="Dianthus">
						<option value="DogwoodBlossom">
						<option value="DoveTree">
						<option value="DriedRose">
						<option value="DyersGreenweed">
						<option value="Edelweiss">
						<option value="EglantineRose">
						<option value="Elderflower">
						<option value="Encian">
						<option value="EnglishMarigold">
						<option value="Erigeron(Fleabane)">
						<option value="Euphorbia">
						<option value="Eustoma|Lisianthus">
						<option value="FieldScabious">
						<option value="FigBlossom">
						<option value="FireLily">
						<option value="FlamingoFlower(Anthurium)">
						<option value="Flax">
						<option value="FloralNotes">
						<option value="ForgetMeNot">
						<option value="Fragonia">
						<option value="Freesia">
						<option value="FringedPink">
						<option value="Fuchsia">
						<option value="Geranium">
						<option value="Gerbera">
						<option value="Gladiolus">
						<option value="Goldenrod">
						<option value="Gorse">
						<option value="Grapeflower">
						<option value="GreatBurnet">
						<option value="GreenNard">
						<option value="GreenTeaFlower">
						<option value="Grevillea">
						<option value="GuavaBlossom">
						<option value="Guayacan">
						<option value="Hawthorn">
						<option value="HazelBlossom">
						<option value="Heather">
						<option value="Heliotrope">
						<option value="HellaboreFlower">
						<option value="Hemlock">
						<option value="Hibiscus">
						<option value="HoaryStock">
						<option value="HollyFlower">
						<option value="Hollyhock">
						<option value="HoneybushorCyclopia">
						<option value="HoneydewBlossom">
						<option value="Hortensia">
						<option value="HoyaCarnosaWaxPlant">
						<option value="Hyacinth">
						<option value="Hyssop">
						<option value="Impatiens">
						<option value="Inula">
						<option value="Iris">
						<option value="IrisButter">
						<option value="IrisPallida">
						<option value="Jacaranda">
						<option value="JadeFlower">
						<option value="JasmineOrchid">
						<option value="JujubeBlossom">
						<option value="Kadam">
						<option value="KangarooPaw">
						<option value="Kanuka">
						<option value="Kiwiblossom">
						<option value="Kudzu">
						<option value="Laburnum">
						<option value="LadyoftheNightFlower">
						<option value="LadySlipperOrchid">
						<option value="LamduanFlower">
						<option value="Lamprocapnos">
						<option value="Lantana">
						<option value="Larkspur">
						<option value="LaurelBlossom">
						<option value="Lavender">
						<option value="Leatherwood">
						<option value="Ledum">
						<option value="Liatris">
						<option value="Liatrix">
						<option value="Lilac">
						<option value="Lily-of-the-Valley">
						<option value="Lime(Linden)Blossom">
						<option value="LitchiBlossom">
						<option value="Lotus">
						<option value="Lupin">
						<option value="LydiaBroom">
						<option value="Lysylang">
						<option value="Magnolia">
						<option value="MagnoliaBrooklynensis">
						<option value="MagnoliaLeaf">
						<option value="Malva">
						<option value="MangoBlossom">
						<option value="MariposaLily">
						<option value="Mayflower">
						<option value="Meadowsweet">
						<option value="Melilotus">
						<option value="MelissaFlower">
						<option value="Michelia">
						<option value="Mignonette">
						<option value="Mimosa">
						<option value="MimusopsElengi">
						<option value="Mirabilis">
						<option value="Monarda">
						<option value="MonoiOil">
						<option value="MorningGloryFlower">
						<option value="MossFlox">
						<option value="Myrtle">
						<option value="Narcissus">
						<option value="Nard">
						<option value="Nasturtium">
						<option value="NectarineBlossom">
						<option value="NeriumOleander">
						<option value="Nigella">
						<option value="NightBloomingJasmine">
						<option value="Oliveflower">
						<option value="Opium">
						<option value="OrangeCassiaTree">
						<option value="OrangeFlowerWater">
						<option value="OrchardBlossom">
						<option value="Orchid">
						<option value="OrchidBlackDiamond">
						<option value="OrchidCactus">
						<option value="OrchidPinkLeopard">
						<option value="Ornithogalum">
						<option value="OrrisRoot">
						<option value="Osmanthus">
						<option value="Pansy">
						<option value="PapayaBlossom">
						<option value="Paramela">
						<option value="PassionFlower">
						<option value="Pataqueira">
						<option value="PeachBlossom">
						<option value="PearBlossom">
						<option value="Pelargonium">
						<option value="Peony">
						<option value="Periwinkle">
						<option value="Petunia">
						<option value="Phlox">
						<option value="PineappleBlossom">
						<option value="PinkFlamingoHeliconia">
						<option value="PinkLily">
						<option value="Pittosporum">
						<option value="PlumBlossom">
						<option value="Plumeria">
						<option value="Poinsettia">
						<option value="PomegranateBlossom">
						<option value="Poppy">
						<option value="Primrose">
						<option value="PrincessTree(Paulownia)">
						<option value="Privet">
						<option value="Protea">
						<option value="Prunella">
						<option value="RangoonCreeper">
						<option value="RaspberryBlossom">
						<option value="RedwoodFlower">
						<option value="Reseda">
						<option value="Rhododendron">
						<option value="RosaAlba">
						<option value="RosaRubiginosa">
						<option value="Rose">
						<option value="RoseHip">
						<option value="RoseJapanese(Hamanasu)">
						<option value="RoseMallow">
						<option value="RosebayWillowherb">
						<option value="Rosebud">
						<option value="Roselle">
						<option value="Safflower">
						<option value="Sainfoins">
						<option value="SandLily">
						<option value="SandalwoodFlower">
						<option value="Santolina">
						<option value="SaucerMagnolia">
						<option value="SeaDaffodil">
						<option value="SiberianRhododendron">
						<option value="SilkTreeBlossom">
						<option value="SkeletonFlower(DiphylleiaGrayi)">
						<option value="Smoketree">
						<option value="Snakeroot">
						<option value="SnowLotus">
						<option value="Snowdrops">
						<option value="SolomonsSeal">
						<option value="SophoraToromiroFlower">
						<option value="SourCherryBlossom">
						<option value="SpanishBroom">
						<option value="Spiraea">
						<option value="St.JohnsWort">
						<option value="Starflower">
						<option value="StrawberryFlower">
						<option value="Strelitzia">
						<option value="StrobilanthesCallosa">
						<option value="Sunflower">
						<option value="SweetPea">
						<option value="TaifRose">
						<option value="Tamarisk">
						<option value="TobaccoBlossom">
						<option value="TransparentFlowers">
						<option value="Trillium">
						<option value="Tulip">
						<option value="VanillaBahiana">
						<option value="Viburnum">
						<option value="Violet">
						<option value="VioletWoodsorrel">
						<option value="Wallflower">
						<option value="Waratah">
						<option value="WaterFlowers">
						<option value="WaterHyacinth">
						<option value="WaterLily">
						<option value="WhiteDahlia">
						<option value="WhiteGingerLily">
						<option value="WhiteLaceFlower">
						<option value="WhiteTeaBlossom">
						<option value="Wildflowers">
						<option value="Wisteria">
						<option value="Wrightia">
						<option value="YellowBells">
						<option value="YellowFlowers">
						<option value="Ylang-Ylang">
						<option value="YuzuFlower">
						<option value="Zinnia">
						<option value="ArumLily">
						<option value="Belanis">
						<option value="BlackLocust">
						<option value="Boronia">
						<option value="Carissa">
						<option value="Datura">
						<option value="Frangipani">
						<option value="Gardenia">
						<option value="GrapefruitBlossom">
						<option value="Honeysuckle">
						<option value="Jasmine">
						<option value="Karo-Karounde">
						<option value="LemonBlossom">
						<option value="Lily">
						<option value="MandarinOrangeBlossom">
						<option value="Melati">
						<option value="MockOrange">
						<option value="MoonFlower">
						<option value="NightBloomingCereus">
						<option value="OrangeBlossom">
						<option value="Stephanotis">
						<option value="Syringa">
						<option value="TangerineBlossom">
						<option value="TiareFlower">
						<option value="Tuberose">
						<option value="WhiteFlowers">
						<option value="WhiteTobacco">
						<option value="Agave">
						<option value="Algae">
						<option value="AloeVera">
						<option value="Ammophila(BeachGrass)">
						<option value="Angelica">
						<option value="AngelicaRoot">
						<option value="AppleMint">
						<option value="Arnica">
						<option value="AromaticNotes">
						<option value="Artemisia">
						<option value="Asparagus">
						<option value="AssamTea">
						<option value="Avocado">
						<option value="Azolla(WaterFern)">
						<option value="BananaLeaf">
						<option value="Barley">
						<option value="Basil">
						<option value="BayEssence">
						<option value="Beachheather">
						<option value="BetelLeaf">
						<option value="Bigarane">
						<option value="BlackCurrantLeaf">
						<option value="BlackberryLeaf">
						<option value="Borage">
						<option value="Borneol">
						<option value="Bran">
						<option value="BuchuorAgathosma">
						<option value="Buckwheat">
						<option value="Bulrush">
						<option value="Burdock">
						<option value="Cactus">
						<option value="Calamus">
						<option value="Calycanthus">
						<option value="Cangzhu">
						<option value="Cannabis">
						<option value="Capitiú">
						<option value="CarnationLeaves">
						<option value="CedarLeaves">
						<option value="Celery">
						<option value="CelerySeeds">
						<option value="CentellaAsiatica">
						<option value="CherryLeaf">
						<option value="Chicory">
						<option value="Chive">
						<option value="ChuanXiong">
						<option value="Cilantro">
						<option value="CitronLeaf">
						<option value="ClarySage">
						<option value="Coca">
						<option value="CreosoteBush">
						<option value="Crithmum">
						<option value="Davana">
						<option value="DeerTongueGrass">
						<option value="DriedFallenLeaves">
						<option value="EarlGreyTea">
						<option value="FermentedTea">
						<option value="Fern">
						<option value="Flouve">
						<option value="FoTi(HoShouWu)">
						<option value="FreshEvergreen">
						<option value="GajumaruBanyan">
						<option value="Galbanum">
						<option value="Garlic">
						<option value="Genmaicha">
						<option value="GeraniumMacrorrhizum(Zdravetz)">
						<option value="Ginkgo">
						<option value="Ginseng">
						<option value="GrapeLeaves">
						<option value="Grass">
						<option value="GreenBranches">
						<option value="GreenForest">
						<option value="GreenNotes">
						<option value="GreenPepper">
						<option value="GreenSap">
						<option value="Gromwell">
						<option value="GuaoorMaidenPlum">
						<option value="HatStraw">
						<option value="Hay">
						<option value="Henna">
						<option value="Hops">
						<option value="Horseweed">
						<option value="Immortelle">
						<option value="Ivy">
						<option value="Jambu">
						<option value="JatamansiorSpikenard">
						<option value="Juniper">
						<option value="JuniperBerries">
						<option value="Katrafay">
						<option value="KatsuraLeaf">
						<option value="Khella">
						<option value="Kunzea">
						<option value="Laminaria">
						<option value="Lantanaleaf">
						<option value="LapsangSouchongTea">
						<option value="LaurissilvaForest">
						<option value="LesserCalamint">
						<option value="Lettuce">
						<option value="Lily-of-the-ValleyLeaves">
						<option value="LimnophilaAromatica">
						<option value="LinaloeBerry">
						<option value="LongjingTea">
						<option value="LovageRoot">
						<option value="Marigold">
						<option value="Marjoram">
						<option value="MatchaTea">
						<option value="Mate">
						<option value="MelilotorSweetClover">
						<option value="MimosaLeaves">
						<option value="Mint">
						<option value="Mistletoe">
						<option value="Naswar">
						<option value="Nettle">
						<option value="NutGrass">
						<option value="OakLeaves">
						<option value="Oat">
						<option value="OliveLeaf">
						<option value="OolongTea">
						<option value="OrchidLeaf">
						<option value="Oregano">
						<option value="PalmLeaf">
						<option value="Palmarosa">
						<option value="Pandanus">
						<option value="Parsley">
						<option value="PeachLeaf">
						<option value="PearLeaf">
						<option value="Pesto">
						<option value="Peyote">
						<option value="Polygonum">
						<option value="PortulacaorPigweed">
						<option value="PuerTea">
						<option value="Purslane">
						<option value="RedAlgae">
						<option value="Reed">
						<option value="Rice">
						<option value="RooibosRedTea">
						<option value="Roots">
						<option value="RoseLeaf">
						<option value="RoseThorn">
						<option value="Rosemary">
						<option value="Roseroot">
						<option value="Rue">
						<option value="Rumex">
						<option value="Rye">
						<option value="SabahSnakeGrass">
						<option value="Sage">
						<option value="Sansevieria">
						<option value="Sap">
						<option value="Satureja">
						<option value="SawPalmetto">
						<option value="Seaweed">
						<option value="Shiso">
						<option value="SideritisMountainTea">
						<option value="SilkVineorMilkBroom">
						<option value="SkunkCabbage">
						<option value="SnakePlant">
						<option value="Spinach">
						<option value="StemsGreens">
						<option value="StrawberryLeaf">
						<option value="SugandhaKokila">
						<option value="Sundew">
						<option value="Swartzia">
						<option value="SweetGrass">
						<option value="Tansy">
						<option value="Tarragon">
						<option value="Tea">
						<option value="Thistle">
						<option value="Thyme">
						<option value="TiLeaf(Cordyline)">
						<option value="TieguanyinTea">
						<option value="Tobacco">
						<option value="TomatoLeaf">
						<option value="Torreya">
						<option value="Trees">
						<option value="Tulsi">
						<option value="TurneraDiffusa(Damiana)">
						<option value="Valerian">
						<option value="Vine">
						<option value="VioletLeaf">
						<option value="WaterLilyLeaf">
						<option value="Wheat">
						<option value="WhiteMeranti">
						<option value="Wintergreen">
						<option value="WoodfufforGaliumOdoratum">
						<option value="Wormwood">
						<option value="Yarrow">
						<option value="YunnanRedTea">
						<option value="Allspice">
						<option value="Anise">
						<option value="Asafoetida">
						<option value="BayLeaf">
						<option value="BengalPepper">
						<option value="CacaoPod">
						<option value="Caraway">
						<option value="Cardamom">
						<option value="CarolinaReaper">
						<option value="Cassia">
						<option value="Chutney">
						<option value="Cinnamon">
						<option value="CinnamonLeaf">
						<option value="CloveLeaf">
						<option value="Cloves">
						<option value="Coffee">
						<option value="CoffeeCO2">
						<option value="CoffeeTincture">
						<option value="Coriander">
						<option value="CubeborTailedPepper">
						<option value="Cumin">
						<option value="Curcuma(Turmeric)">
						<option value="Curry">
						<option value="CurryTree">
						<option value="Dill">
						<option value="Fennel">
						<option value="Fenugreek">
						<option value="Galanga">
						<option value="Ginger">
						<option value="GreenCoffee">
						<option value="IndianSpices">
						<option value="JapanesePepper">
						<option value="KaempferiaGalanga">
						<option value="Licorice">
						<option value="Mace">
						<option value="MustardSeed">
						<option value="Nutmeg">
						<option value="OilyNotes">
						<option value="OrientalNotes">
						<option value="Pepper">
						<option value="Peppertree">
						<option value="Pimento">
						<option value="PimentoLeaf">
						<option value="PimentoSeeds">
						<option value="PinkPepper">
						<option value="Priprioca">
						<option value="Saffron">
						<option value="Safraleine">
						<option value="Sesame">
						<option value="SiamCardamom">
						<option value="SichuanPepper">
						<option value="SpicyNotes">
						<option value="StarAnise">
						<option value="Sumac">
						<option value="Tamarind">
						<option value="Timur">
						<option value="TonkaBean">
						<option value="Toscanol">
						<option value="Vanilla">
						<option value="WanSaoLhong">
						<option value="Wasabi">
						<option value="WaterPepper">
						<option value="WestIndianBay">
						<option value="AcetylFuran">
						<option value="AgaveNectar">
						<option value="Baklava">
						<option value="Biscuit">
						<option value="Bread">
						<option value="Brioche">
						<option value="BrownSugar">
						<option value="Bubbaloo">
						<option value="BubbleGum">
						<option value="BurntSugar">
						<option value="Butter">
						<option value="Buttercream">
						<option value="Butterscotch">
						<option value="CacaoButter">
						<option value="Cake">
						<option value="CalissonsdAix">
						<option value="CandiedFruits">
						<option value="CandiedGinger">
						<option value="CandiedOrange">
						<option value="Candies">
						<option value="Canelé">
						<option value="Caramel">
						<option value="Cereals">
						<option value="Cheesecake">
						<option value="CherryMilk">
						<option value="CherrySyrup">
						<option value="ChocolateFudge">
						<option value="ChocolateTruffle">
						<option value="Churros">
						<option value="CoconutPie">
						<option value="CondensedMilk">
						<option value="ConeWaffle">
						<option value="Confetti(SugaredAlmonds)">
						<option value="Cookie">
						<option value="CottonCandy">
						<option value="Cream">
						<option value="CrèmeBrûlée">
						<option value="Croissant">
						<option value="Cupcake">
						<option value="Custard">
						<option value="DarkChocolate">
						<option value="Dates">
						<option value="DonutorDoughnut">
						<option value="DulcedeLeche">
						<option value="Eggnog">
						<option value="Fougassette">
						<option value="FrenchPastries">
						<option value="Frosting[Glacé]">
						<option value="Gelatin">
						<option value="Gianduia">
						<option value="Gingerbread">
						<option value="GourmandAccord">
						<option value="GriotteCherries">
						<option value="Halva">
						<option value="HazelnutCocoaSpread">
						<option value="Honey">
						<option value="Honeycomb">
						<option value="Horchata">
						<option value="Icecream">
						<option value="IcingPink">
						<option value="Jelly">
						<option value="Kulfi">
						<option value="LemonPie">
						<option value="Loukhoum">
						<option value="Macarons">
						<option value="MapleSyrup">
						<option value="MaraschinoCherry">
						<option value="Marmalade">
						<option value="MarronGlacé">
						<option value="Marshmallow">
						<option value="Marzipan">
						<option value="Meringues">
						<option value="MilkCream">
						<option value="MilkMousse">
						<option value="Milkshake">
						<option value="Molasses">
						<option value="Nougat">
						<option value="Nutella">
						<option value="Oatmilk">
						<option value="PalmSugar">
						<option value="Pancake">
						<option value="Panettone">
						<option value="PannaCotta">
						<option value="PastieraNapoletana">
						<option value="PeachCream">
						<option value="PearIceCream">
						<option value="Popcorn">
						<option value="Praline">
						<option value="Profiterole">
						<option value="Pudding">
						<option value="RainbowSorbet">
						<option value="RedFruitsSorbet">
						<option value="RicePudding">
						<option value="RoseJam">
						<option value="SacherTorte">
						<option value="Sorbet">
						<option value="Souffle">
						<option value="Sprinkles">
						<option value="SpunSugar">
						<option value="StrawberrySyrup">
						<option value="Sugar">
						<option value="Tartine">
						<option value="Tiramisu">
						<option value="Toffee">
						<option value="TropézienneTarte">
						<option value="Waffle">
						<option value="WhiteChocolate">
						<option value="WhiteChocolateTruffle">
						<option value="WhoopiePie">
						<option value="Yogurt">
						<option value="Zefir">
						<option value="Agarwood(Oud)">
						<option value="Akigalawood">
						<option value="Alder">
						<option value="Almondtree">
						<option value="Amaranth">
						<option value="AmburanaBark">
						<option value="AmburanaWood">
						<option value="Amyris">
						<option value="AppleTree">
						<option value="Araucaria">
						<option value="Araucaria">
						<option value="Arbutus(Madrona,BearberryTree)">
						<option value="ArganTree">
						<option value="Aspen">
						<option value="AustralianBlueCypress">
						<option value="Bamboo">
						<option value="Baobab">
						<option value="Bark">
						<option value="Beech">
						<option value="BelambraTree">
						<option value="Birch">
						<option value="BlackHemlockorTsuga">
						<option value="BlackSpruce">
						<option value="Blackwood">
						<option value="BlondeWoods">
						<option value="BrazilianRosewood">
						<option value="BuddhaWood">
						<option value="Buxus">
						<option value="Cabreuva">
						<option value="CambodianOud">
						<option value="CanadianBalsam">
						<option value="CarobTree">
						<option value="Cascarilla">
						<option value="Cashmirwood">
						<option value="Cedar">
						<option value="ChaloodBark">
						<option value="CherryTree">
						<option value="ChineseOud">
						<option value="Clearwood">
						<option value="Cocobolo">
						<option value="CoffeeTree">
						<option value="Cork">
						<option value="Cottonwood(Poplar)">
						<option value="Cypress">
						<option value="CypriolOilorNagarmotha">
						<option value="DarkPatchouli">
						<option value="Dreamwood">
						<option value="Driftwood">
						<option value="DryWood">
						<option value="Ducke">
						<option value="EbonyTree">
						<option value="Elm">
						<option value="EnobyWood">
						<option value="Eucalyptus">
						<option value="Figtree">
						<option value="Fir">
						<option value="GrassTree">
						<option value="GuaiacWood">
						<option value="Hiba">
						<option value="HinokiWood">
						<option value="HoWood">
						<option value="Incienso">
						<option value="IndianOud">
						<option value="IndianWoods">
						<option value="Ironwood">
						<option value="Ishpink,OcoteaQuixos">
						<option value="Kowhai">
						<option value="LaotianOud">
						<option value="Larch">
						<option value="Lichen">
						<option value="Liquidambar">
						<option value="Mahogany">
						<option value="MalaysianOud">
						<option value="MangoTree">
						<option value="Manuka">
						<option value="Maple">
						<option value="Massoia">
						<option value="MesquiteWood">
						<option value="Muhuhu">
						<option value="MysoreSandalwood">
						<option value="Neem">
						<option value="Nootka">
						<option value="Oak">
						<option value="Oakmoss">
						<option value="OliveTree">
						<option value="PalisanderRosewood">
						<option value="PaloSanto">
						<option value="PaloVerdeTree">
						<option value="Pamplewood">
						<option value="Paperbark">
						<option value="Papyrus">
						<option value="Patchouli">
						<option value="PeachTree">
						<option value="PearTree">
						<option value="PepperwoodorHerculesClub">
						<option value="PineTree">
						<option value="PinkIpêTree">
						<option value="PlumTree">
						<option value="PuaKeniKeni(Pua-Lulu)">
						<option value="Ravenala">
						<option value="Ravensara">
						<option value="RedWillow">
						<option value="Redwood">
						<option value="Saman">
						<option value="Sandalwood">
						<option value="Satinwood">
						<option value="Sawdust">
						<option value="Sequoia">
						<option value="Siam">
						<option value="Spruce">
						<option value="Sycamore">
						<option value="Takamaka">
						<option value="TambotiWood">
						<option value="Tatami">
						<option value="TeakWood">
						<option value="ThailandOud">
						<option value="ThanakaWood">
						<option value="Thuja">
						<option value="TransparentWoods">
						<option value="Vetiver">
						<option value="VietnameseOud">
						<option value="WhiteOud">
						<option value="WhiteWillow">
						<option value="WoodyNotes">
						<option value="Yohimbe">
						<option value="Amberwood">
						<option value="Bakhoor">
						<option value="BalsamicNotes">
						<option value="BalsamicVinegar">
						<option value="Benzoin">
						<option value="BirchTar">
						<option value="Breu-Branco">
						<option value="BushmanCandle">
						<option value="Cadeoil">
						<option value="ChoyaLoban">
						<option value="ChoyaNakh">
						<option value="ChoyaRal">
						<option value="CoalTar">
						<option value="CopahuBalm">
						<option value="CopaibaBalm">
						<option value="Copal">
						<option value="DragonBloodResin">
						<option value="Elemi">
						<option value="Estoraque">
						<option value="GurjunBalsam">
						<option value="Incense">
						<option value="Labdanum">
						<option value="MasticorLentisque">
						<option value="Mopane">
						<option value="Myrica">
						<option value="Myrrh">
						<option value="NagChampa">
						<option value="Olibanum(Frankincense)">
						<option value="OlibanumSacraResinGreen">
						<option value="Opoponax">
						<option value="PeruBalsam">
						<option value="PineTar">
						<option value="Poplar(Populus)Buds">
						<option value="Resins">
						<option value="Rubber">
						<option value="Styrax">
						<option value="SurfWax">
						<option value="TeaTreeOil">
						<option value="Aldron">
						<option value="Amber">
						<option value="AmberXtreme">
						<option value="Ambergris">
						<option value="Ambertonic(IFF)">
						<option value="Ambrarome">
						<option value="Ambretone">
						<option value="Ambrette(MuskMallow)">
						<option value="Ambrettolide">
						<option value="Ambrocenide(Symrise)">
						<option value="Ambroxan">
						<option value="AnimalNotes">
						<option value="Bacon">
						<option value="BBQ">
						<option value="Beeswax">
						<option value="CarrotSeeds">
						<option value="Castoreum">
						<option value="Caviar">
						<option value="Cetalox">
						<option value="Cheese">
						<option value="Civet">
						<option value="CoralReef">
						<option value="Daim">
						<option value="Fur">
						<option value="Genet">
						<option value="GoatHair">
						<option value="GoatsMilk">
						<option value="Hyraceum">
						<option value="Kephalis">
						<option value="Leather">
						<option value="Meat">
						<option value="Milk">
						<option value="Musk">
						<option value="Muskrat">
						<option value="Oysters">
						<option value="SaffianoLeather">
						<option value="SeaShells">
						<option value="Skatole">
						<option value="Skin">
						<option value="Starfish">
						<option value="Suede">
						<option value="Sylkolide">
						<option value="ToluBalsam">
						<option value="Truffle">
						<option value="Velvione">
						<option value="Absinthe">
						<option value="Advocaat">
						<option value="Amaretto">
						<option value="Applejack">
						<option value="BaileysIrishCream">
						<option value="Batida">
						<option value="Beer/Ale">
						<option value="Bellini">
						<option value="BlueMargarita">
						<option value="BoozyNotes">
						<option value="BourbonWhiskey">
						<option value="Cachaça">
						<option value="Caipirinha">
						<option value="Campari">
						<option value="Cappuccino">
						<option value="Champagne">
						<option value="ChampagneRosé">
						<option value="Chinotto">
						<option value="Coca-Cola">
						<option value="CocktailFruits">
						<option value="Cognac">
						<option value="Cognac">
						<option value="CosmopolitanCocktail">
						<option value="CreamSoda">
						<option value="Curaçao">
						<option value="Daiquiri">
						<option value="EaudeVie">
						<option value="FruitTea">
						<option value="Gin">
						<option value="Grenadine">
						<option value="Hi-Fi">
						<option value="JasmineTea">
						<option value="KavaDrink">
						<option value="KirRoyal">
						<option value="Lemonade">
						<option value="Limoncello">
						<option value="Liquor">
						<option value="Macchiato">
						<option value="Madeira">
						<option value="MaiTaiCocktail">
						<option value="Margarita">
						<option value="Martini">
						<option value="MasalaChai">
						<option value="Mezcal">
						<option value="Midori">
						<option value="Mocha">
						<option value="Mojito">
						<option value="MoscowMule">
						<option value="MulledWine">
						<option value="OrangeSoda">
						<option value="Ouzo">
						<option value="PinaColada">
						<option value="PiscoSourCocktail">
						<option value="PlumWine">
						<option value="PortWine">
						<option value="Prosecco">
						<option value="Punch">
						<option value="Raki">
						<option value="RedWine">
						<option value="RhumAgricole">
						<option value="RiceWater">
						<option value="Rum">
						<option value="Sake">
						<option value="Sangria">
						<option value="SparklingWater">
						<option value="SparklingWine">
						<option value="Syrup">
						<option value="Tequila">
						<option value="TokajiWine">
						<option value="TonicWater">
						<option value="Umeshu">
						<option value="Vermouth">
						<option value="Vodka">
						<option value="Whiskey">
						<option value="WhiteWine">
						<option value="WineLees">
						<option value="AccordEudora">
						<option value="AlcantaraAccord">
						<option value="Aldehydes">
						<option value="Aluminum">
						<option value="Ambreine">
						<option value="Ambrinol">
						<option value="AMBROXSUPER">
						<option value="Ammonia">
						<option value="AmylSalicylate">
						<option value="Antillone">
						<option value="Aqual">
						<option value="Aquozone">
						<option value="Ash">
						<option value="Asphalt">
						<option value="Azarbre">
						<option value="BlackDiamond">
						<option value="BlackLeather">
						<option value="Blood">
						<option value="Boisiris">
						<option value="Brick">
						<option value="BrownScotchTape">
						<option value="BurntMatch">
						<option value="Calone">
						<option value="Calypsone">
						<option value="Camphor">
						<option value="CandleWax">
						<option value="Caoutchouc">
						<option value="Cascalone">
						<option value="Cashalox">
						<option value="Cashmeran">
						<option value="Cetonal">
						<option value="Chalk">
						<option value="Clarycet">
						<option value="Clay">
						<option value="CO2Extracts">
						<option value="Coal">
						<option value="Cobblestone">
						<option value="Cocaine">
						<option value="Concrete">
						<option value="Copper">
						<option value="CoralLimestone">
						<option value="Coranol">
						<option value="Cork">
						<option value="Cosmone">
						<option value="Coumarin">
						<option value="CreditCards">
						<option value="Crustaceans">
						<option value="Cyclopidene">
						<option value="Damascone">
						<option value="DewDrop">
						<option value="Dihydromyrcenol">
						<option value="Dirt">
						<option value="Dodecanal">
						<option value="EarthTincture">
						<option value="EarthyNotes">
						<option value="Egg">
						<option value="Ember">
						<option value="EthylMaltol">
						<option value="Eugenol">
						<option value="Evernyl">
						<option value="Fabric">
						<option value="FactorX">
						<option value="Fire">
						<option value="Fish">
						<option value="Flint">
						<option value="Flour">
						<option value="Galaxolide">
						<option value="Gasoline">
						<option value="Geosmin">
						<option value="Gold">
						<option value="Graphite">
						<option value="Guaiacol">
						<option value="Gunpowder">
						<option value="HandCream">
						<option value="HeadSpaceWaterfall">
						<option value="Hedione">
						<option value="Helvetolide">
						<option value="HexenylGreen">
						<option value="HexylAcetate">
						<option value="Hina">
						<option value="Hivernal">
						<option value="HolyWater">
						<option value="HotIron">
						<option value="Ice">
						<option value="Indole">
						<option value="IndustrialGlue">
						<option value="Ink">
						<option value="InstantFilmAccord">
						<option value="Iodine">
						<option value="Ionones">
						<option value="IsoESuper">
						<option value="IsobutylQuinoline">
						<option value="Jasmolactone">
						<option value="Jasmone">
						<option value="Javanol">
						<option value="Jeans">
						<option value="Lactones">
						<option value="latex">
						<option value="Lava">
						<option value="Lilybelle">
						<option value="Linen">
						<option value="LipGloss">
						<option value="Lipstick">
						<option value="LittleDollStrawberry">
						<option value="Lorenox">
						<option value="Magnolan">
						<option value="Mahonial">
						<option value="MascarponeCheese">
						<option value="Melonal">
						<option value="MetallicNotes">
						<option value="MineralNotes">
						<option value="MittiAttar">
						<option value="Molasses">
						<option value="Money">
						<option value="MotorOil">
						<option value="MountainAir">
						<option value="MoussedeSaxe">
						<option value="Mud">
						<option value="Mugane">
						<option value="Muscenone">
						<option value="Mystikal">
						<option value="NaturalCalm">
						<option value="Neoprene">
						<option value="Norlimbanol">
						<option value="Nympheal">
						<option value="Orcanox">
						<option value="OzonicNotes">
						<option value="Paper">
						<option value="Para-CresylPhenylAcetate">
						<option value="Paradisone">
						<option value="Pearls">
						<option value="Peat">
						<option value="Pebbles">
						<option value="Pencil">
						<option value="Petalia">
						<option value="Petroleum">
						<option value="Pharaone®">
						<option value="PinkCrystal">
						<option value="PinkHimalayanSeaSalt">
						<option value="Plastic">
						<option value="PlasticBag">
						<option value="Poison">
						<option value="Poivrol">
						<option value="Pollen">
						<option value="Pomarose">
						<option value="PowderyNotes">
						<option value="Priest’sClothes">
						<option value="Propolis">
						<option value="Prunol">
						<option value="RainNotes">
						<option value="RoseOxide">
						<option value="SalicylicAcid">
						<option value="Salt">
						<option value="Sand">
						<option value="Satin">
						<option value="Sauna">
						<option value="ScentTrek">
						<option value="Sclarene">
						<option value="SeaWater">
						<option value="Serenolide">
						<option value="ShamamaAttar">
						<option value="Silk">
						<option value="Silver">
						<option value="Sinfonide">
						<option value="Siren">
						<option value="Slate">
						<option value="Smoke">
						<option value="Snow">
						<option value="Soap">
						<option value="SodiumSilicate">
						<option value="SolarNotes">
						<option value="SP3Carbon">
						<option value="Spiranol">
						<option value="SprayPaint">
						<option value="Steamaccord">
						<option value="Stone">
						<option value="Sulphur">
						<option value="SuntanLotion">
						<option value="Sweat">
						<option value="Talc">
						<option value="TennisBall">
						<option value="Terpineol">
						<option value="Terranol">
						<option value="Timbersilk">
						<option value="Tonquitone">
						<option value="Trimofix">
						<option value="Tuberolide">
						<option value="Tulleaccord">
						<option value="Vanillin">
						<option value="VarnishAccord">
						<option value="Velvet">
						<option value="Verdox">
						<option value="Vinyl">
						<option value="VinylGuaiacol">
						<option value="Water">
						<option value="WetPlaster">
						<option value="WetStone">
						<option value="WhiteLeather">
						<option value="Wool">
						<option value="Yeast">
					</datalist>
					<input type="text" id="top1" class="form-control h-75"
						list="datalistOptions" name="top1">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote "
						type="button">선택</button>

				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">top2</span>
					<input type="text" id="top2" class="form-control h-75"
						list="datalistOptions" name="top2">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
					<button class="btn btn-outline-secondary h-75 flagTrue"
						type="button">X</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group mb-3">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">top3</span>
					<input type="text" id="top3" class="form-control h-75"
						list="datalistOptions" name="top3">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
					<button class="btn btn-outline-secondary h-75 flagTrue"
						type="button">X</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">middle1</span>
					<input type="text" id="middle1" class="form-control h-75"
						list="datalistOptions" name="middle1">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">middle2</span>
					<input type="text" id="middle2" class="form-control h-75"
						list="datalistOptions" name="middle2">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
					<button class="btn btn-outline-secondary h-75 flagTrue"
						type="button">X</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group mb-3">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">middle3</span>
					<input type="text" id="middle3" class="form-control h-75"
						list="datalistOptions" name="middle3">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
					<button class="btn btn-outline-secondary h-75 flagTrue"
						type="button">X</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">base1</span>
					<input type="text" id="base1" class="form-control h-75"
						list="datalistOptions" name="base1">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button" class="searchNote">선택</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">base2</span>
					<input type="text" id="base2" class="form-control h-75"
						list="datalistOptions" name="base2">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
					<button class="btn btn-outline-secondary h-75 flagTrue"
						type="button">X</button>
				</div>
			</div>
			<div class="row ">
				<div class="col-12 input-group mb-3">
					<span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">base3</span>
					<input type="text" id="base3" class="form-control h-75"
						list="datalistOptions" name="base3">
					<button class="btn btn-outline-secondary h-75 reChoice"
						type="button">재선택</button>
					<button class="btn btn-outline-secondary h-75 searchNote"
						type="button">선택</button>
					<button class="btn btn-outline-secondary h-75 flagTrue"
						type="button">X</button>
				</div>
			</div>
			<div class="row"></div>
			<div class="row">
				<button id="insertBtn" class="btn btn-outline-primary" type="submit">저장</button>
			</div>
			<div style="height: 50px;"></div>
		</div>
	</form>
<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script>
    // 노트 검색
    let flags = {
    		"top1" : false, 
    		"top2": false, 
    		"top3": false,
    		"middle1" :false,
    		"middle2" :false,
    		"middle3" :false,
    		"base1" : false,
    		"base2": false,
    		"base3" :false
    		}
	
    // 노트검색 
	$(".searchNote").on("click", function(){
		let noteBtn = $(this);
		let note = $(this).prev().prev();
		console.log(note.val());
		a(note, noteBtn);
	});
    
    a = (note, noteBtn) => {
    	let noteID = note.attr("id");
    	console.log("노트 아이디는 : "+ noteID);
    	 $.ajax({
    			url:"/perfume/noteIsTrue",
    			data : {
    				note : note.val()
    			},
    			type:"post"
    		}).done(function(resp){
    			if (resp == 0) {
    					    alert("해당 노트가 없습니다. 다시 입력해주세요.");
    					    note.val("");
    					    flags[noteID] = false;
    			}
	    		else if(resp == 1){
	    				note.attr("readonly",true);
	    				noteBtn.css("display","none");
	    				noteBtn.prev().css({
	    					"display":"block",
	    					"border-radius":"6px"
	    					});
	    				note.css("background-color", "lightgrey");
	    				noteBtn.text("완료");
	    				noteBtn.css("background-color", "lightgrey");
	    				flags[noteID] = true;
	    		}
	    	})
   		 }
 	
    // 노트 재검색
 	$(".reChoice").on("click", function(){
 		$(this).css("display","none");
 		$(this).next().css("display","block");
 		$(this).prev().attr("readonly", false).css("background-color", "white").val("");
 		$(this).next().text("선택");
 		$(this).next().css("background-color", "white");
 		let noteID = $(this).prev().attr("id");
 		flags[noteID] = false;
 	})
    	
	// 이미지 미리보기
 	function setImage(event){
 		//filereader객체 생성, 스크립트 내장 함수
 		var reader = new FileReader();
 		  var file = event.target.files[0];
 		$("#imgOutLine").empty();
 		reader.onload = function(event){
 			var img = $("<img>").attr("id","img");
 			// 이미지가 로드되면 이미지라인에 이미지 들어갈 태그 append
 			img.on("load", function(){
 				 $("#imgOutLine").append(img);
 			});
 			//이미지 표시를 수행
 			img.attr("src", event.target.result);
 		};
 		// 받은 객체를 url형식으로 변환
 		reader.readAsDataURL(file);
 	};
 	
 	// 선택안했을 때 true로 반환
 	$(".flagTrue").on("click", function(){
 		let noteID = $(this).prev().prev().prev().attr("id");
 		let note = $(this).prev().prev().prev();
 		console.log(noteID);
 		note.css("background-color","lightgrey");
 		note.next().next().css("background-color", "lightgrey");
 		flags[noteID] = true;
 		note.val("");
 		note.attr("readonly",true);
 	})
 	
	let numRegex = /^[0-9]*$/;
 	
 	$("#insertBtn").on("click", function(){
 		let per_name = $("#per_name").val();
 		console.log(per_name);
 		let per_brand = $("#per_brand").val();
 		console.log(per_brand);
 		let per_volume = $("#per_volume").val();
 		console.log(per_volume);
 		let select = $("#select").val();
 		console.log(select);
 		let per_price = $("#per_price").val();
 		console.log(per_price);
 		let gender = $("input[type=radio][name=per_gender]:checked").val();
 		console.log(gender);
 		let top1 = $("#top1").val();
 		console.log(top1);
 		let top2 = $("#top2").val();
 		console.log(top2);
 		let top3 = $("#top3").val();
 		console.log(top3);
 		let middle1 = $("#middle1").val();
 		console.log(middle1);
 		let middle2 = $("#middle2").val();
 		console.log(middle2);
 		let middle3 = $("#middle3").val();
 		console.log(middle3);
		let base1 = $("#base1").val();
		console.log(base1);
		let base2 = $("#base2").val();
		console.log(base2);
		let base3 = $("#base3").val();
		console.log(base3);
		if(per_name == ""){
			alert("향수 이름을 입력해주세요.");
			return false;
		}
		else if(per_brand == ""){
			alert("향수 브랜드를 입력해주세요.");
			return false;
		}
		else if(per_volume == ""){
			alert("향수 용량을 입력해주세요.");
			return false;
		}
		else if(select ==""){
			alert("향수 종류를 입력해주세요");
			return false;
		}
		else if(per_price ==""){
			alert("향수 금액을 입력해주세요");
			return false;
		}
		else if(gender ==undefined){
			alert("성별을 입력해주세요");
			return false;
		}
		else if(top1 ==""){
			alert("탑노트는 적어도 하나를 입력해주세요");
			return false;
		}
		else if(middle1 ==""){
			alert("미들노트는 적어도 하나를 입력해주세요");
			return false;
		}
		else if(base1 ==""){
			alert("베이스노트는 적어도 하나를 입력해주세요");
			return false;
		}
		else if(!numRegex.test(per_price)){
			alert("가격은 숫자로 입력해주세요");
			return false;
		}
		else if(!numRegex.test(per_volume)){
			alert("용량은 숫자로 입력해주세요");
			return false;
		}
		// test
	    	  if (!flags.top1) {
		          alert("top1의 값을 올바르게 입력해주세요.");
		          return false;
		     }else if(!flags.top2){
		    	 alert("top2의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.top3){
		    	 alert("top3의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.middle1){
		    	 alert("middle1의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.middle2){
		    	 alert("middle2의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.middle3){
		    	 alert("middle3의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.base1){
		    	 alert("base1의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.base2){
		    	 alert("base2의 값을 올바르게 입력해주세요");
		    	 return false;
		     }else if(!flags.base3){
		    	 alert("base3의 값을 올바르게 입력해주세요");
		    	 return false;
		     } 
 	})
 	
 	
    </script>
</body>
</html>