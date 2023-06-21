<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src = "https://code.jquery.com/jquery-3.6.4.js"></script>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Insert title here</title>
    <style>
.container {
	max-width: 700px;
}

#imgOutLine {
	width: 300px;
	height: 400px;
	border: 1px solid black;
	float: right;
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

#genderAlign {
	float: right;
}

.rowFile {
	position: relative;
	bottom: 5px;
}
</style>

</head>
<body>
    <form action="/perfume/insert" method='post' enctype="multipart/form-data">
    <div class="container">
        <div class="row">
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
                <div class="d-flex justify-content-center w-75 " id="genderAlign">
                <div id="imgOutLine" ></div>
                </div>
            </div>
         
        </div>
        <div class="rowFile">
            <div class="col-12">
                <div class="mb-3">
                    <input  type="file" id="formFileSm" class="form-control form-control-sm"  name="files "dir="rtl">
                  </div>
            </div>
        </div>

        <div class="row">
            <hr>
        </div>

        <div class="row ">
            <div class="col-12">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">이름</span>
                <input class="form-control w-75 h-75 d-inline-block" type="text" name="per_name" placeholder="향수명">
            </div>
        </div>
        <div class="row ">
            <div class="col-12">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">브랜드</span>
                <input type="text" class="form-control w-75 h-75 d-inline-block" name="per_brand" placeholder="브랜드명">
            </div>
        </div>
        <div class="row ">
            <div class="col-12">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">용량</span>
                <input type="text" class="form-control w-75 h-75 d-inline-block" name="per_volume" placeholder="용량">
            </div>
        </div>
        <div class="row ">
            <div class="col-12">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">종류</span>
                <select class="form-select text-center w-75 p-0 h-75 d-inline-block" id="select" name="per_kind">
                    <option selected>종류 선택</option>
                    <option value="퍼퓸">퍼퓸</option>
                    <option value="오드퍼퓸">오드퍼퓸</option>
                    <option value="오드뚜왈렛">오드뚜왈렛</option>
                    <option value="오드코롱">오드코롱</option>
                    <option value="샤워코롱">샤코롱</option>
                </select>
            </div>
        </div>

        <div class="row ">
            <div class="col-12">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">가격</span>
                <input  type="text" class="form-control w-75  h-75 d-inline-block" name="per_price" placeholder="가격">
            </div>
        </div>
        <div class="row ">
            <div class="col-12">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">성별</span>
                <div class="d-flex justify-content-center w-75 " id="genderAlign">
                    <input type="radio" id="waman" class="d-inline-block" name="per_gender"  value="woman">
                    <lable for="woman" class="gender">WAMAN</lable>
                    <input type="radio" id="man" class="d-inline-block" name="per_gender" value="man">
                    <lable for="man" class="gender">MAN</lable>
                    <input type="radio" id="unisex" class="d-inline-block" name="per_gender" value="unisex">
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
                <input type="text" class="form-control h-75"  list="datalistOptions" name="top1">
                <datalist id="datalistOptions">
                    <option value="Bergamot">
                        <option value="Bigarade">
                        <option value="Bitter Orange">
                        <option value="Blood Orange">
                        <option value="Calamansi">
                        <option value="Chen Pi">
                        <option value="Chinotto">
                        <option value="Citron">
                        <option value="Citrus Water">
                        <option value="Citruses">
                        <option value="Clementine">
                        <option value="Finger Lime">
                        <option value="Grapefruit">
                        <option value="Grapefruit Leaf">
                        <option value="Grapefruit Peel">
                        <option value="Green Tangerine">
                        <option value="Hassaku">
                        <option value="Hatkora Lemon">
                        <option value="Kaffir Lime">
                        <option value="Kumquat">
                        <option value="Lemon">
                        <option value="Lemon Balm">
                        <option value="Lemon Tree">
                        <option value="Lemon Verbena">
                        <option value="Lemon Zest">
                        <option value="Lemongrass">
                        <option value="Lime">
                        <option value="Limetta">
                        <option value="Litsea Cubeba">
                        <option value="Mandarin Orange">
                        <option value="Mandora">
                        <option value="Methyl Pamplemousse">
                        <option value="Neroli">
                        <option value="Orange">
                        <option value="Palestinian Sweet Lime">
                        <option value="Petitgrain">
                        <option value="Pokan">
                        <option value="Pomelo">
                        <option value="Shiikuwasha">
                        <option value="Tangelo">
                        <option value="Tangerine">
                        <option value="Tangerine Zest">
                        <option value="Yuzu">
                        <option value="Acai Berry">
                        <option value="Acerola">
                        <option value="Acorn">
                        <option value="Almond">
                        <option value="Apple">
                        <option value="Apple Juice">
                        <option value="Apple Pulp">
                        <option value="Apple Sherbet">
                        <option value="Apricot">
                        <option value="Arctic Bramble">
                        <option value="Argan">
                        <option value="Artichoke">
                        <option value="Banana">
                        <option value="Barberry">
                        <option value="Bearberry">
                        <option value="Beetroot">
                        <option value="Black Currant">
                        <option value="Black Walnut">
                        <option value="Blackberry">
                        <option value="Blackthorn">
                        <option value="Blueberry">
                        <option value="Boysenberry">
                        <option value="Brazil Nut">
                        <option value="Breadnut">
                        <option value="Buriti">
                        <option value="Burning Cherry">
                        <option value="Candlenut">
                        <option value="Cantaloupe">
                        <option value="Carambola (Star Fruit)">
                        <option value="Carrot">
                        <option value="Cashew">
                        <option value="Cassowary Fruit">
                        <option value="Cauliflower">
                        <option value="Cepes">
                        <option value="Chayote">
                        <option value="Cherimoya">
                        <option value="Cherry">
                        <option value="Chestnut">
                        <option value="Chia Seed">
                        <option value="Chickpeas">
                        <option value="Chinese Magnolia">
                        <option value="Cloudberry">
                        <option value="Coco De Mer">
                        <option value="Coconut">
                        <option value="Coconut Water">
                        <option value="Conifer">
                        <option value="Corn">
                        <option value="Corn Silk">
                        <option value="Count's Fruit">
                        <option value="Cranberry">
                        <option value="Cucumber">
                        <option value="Cupuaçu, Cupuassu, Copoasu">
                        <option value="Currant Leaf and Bud">
                        <option value="Cyperus Scariosus">
                        <option value="Daikon Radish">
                        <option value="Dark Plum Wu Mei">
                        <option value="Dewberry">
                        <option value="Dried Apple Crisp">
                        <option value="Dried Apricot">
                        <option value="Dried Fruits">
                        <option value="Durian">
                        <option value="Elderberry">
                        <option value="Feijoa Fruit">
                        <option value="Fig">
                        <option value="Fig Leaf">
                        <option value="Forest Fruits">
                        <option value="Frosted Berries">
                        <option value="Fruit Salad">
                        <option value="Fruity Notes">
                        <option value="Gariguette Strawberry">
                        <option value="Genipapo">
                        <option value="Goji Berries">
                        <option value="Gooseberry">
                        <option value="Grains">
                        <option value="Grape Seed">
                        <option value="Grapes">
                        <option value="Green Anjou Pears">
                        <option value="Green Grape">
                        <option value="Green Pear">
                        <option value="Green Plum">
                        <option value="Greengage">
                        <option value="Ground Cherry">
                        <option value="Guarana">
                        <option value="Guava">
                        <option value="Hazelnut">
                        <option value="Jabuticaba">
                        <option value="Jackfruit">
                        <option value="Japanese Loquat">
                        <option value="Jobs Tears (Yi Yi Ren)">
                        <option value="Kiwi">
                        <option value="Kumbaru">
                        <option value="Lingonberry">
                        <option value="Litchi">
                        <option value="Loganberry">
                        <option value="Longan Berries">
                        <option value="Macadamia">
                        <option value="Mahonia">
                        <option value="Malt">
                        <option value="Mango">
                        <option value="Mangosteen">
                        <option value="Maninka">
                        <option value="Marian Plum">
                        <option value="Medlar">
                        <option value="Melon">
                        <option value="Mirabelle">
                        <option value="Moepel Accord">
                        <option value="Mulberry">
                        <option value="Mushroom">
                        <option value="Nashi Pear">
                        <option value="Nectarine">
                        <option value="Nutty Notes">
                        <option value="Okra Seeds">
                        <option value="Olive">
                        <option value="Papaya">
                        <option value="Passionfruit">
                        <option value="Pea">
                        <option value="Peach">
                        <option value="Peanut">
                        <option value="Pear">
                        <option value="Pecan">
                        <option value="Persimmon">
                        <option value="Peruvian Pepper">
                        <option value="Pineapple">
                        <option value="Pinot Noir Grapes">
                        <option value="Pistachio">
                        <option value="Pitahaya">
                        <option value="Pitanga">
                        <option value="Plum">
                        <option value="Pomegranate">
                        <option value="Potato">
                        <option value="Prickly Pear">
                        <option value="Pumpkin">
                        <option value="Quandong Desert Peach">
                        <option value="Quince">
                        <option value="Rambutan">
                        <option value="Raspberry">
                        <option value="Red Apple">
                        <option value="Red Berries">
                        <option value="Red Currant">
                        <option value="Red Fruits">
                        <option value="Red Fruits Smoothie">
                        <option value="Red Mulberry">
                        <option value="Rhubarb">
                        <option value="Roasted Nuts">
                        <option value="Sapodilla">
                        <option value="Sarsaparilla">
                        <option value="Sea Buckthorn">
                        <option value="Seriguela">
                        <option value="Shea Butter">
                        <option value="Shea Nuts">
                        <option value="Silverberry">
                        <option value="Snowberry">
                        <option value="Sour Cherry">
                        <option value="Soursop">
                        <option value="Soybean">
                        <option value="Squash">
                        <option value="Star Apple">
                        <option value="Strawberry">
                        <option value="Tayberry">
                        <option value="Tomato">
                        <option value="Tropical Fruits">
                        <option value="Umbu-Cajá | Taperebá">
                        <option value="Walnut">
                        <option value="Walnut Milk">
                        <option value="Water Fruit">
                        <option value="Watermelon">
                        <option value="Wattleseed">
                        <option value="White Currant">
                        <option value="Wild Strawberry">
                        <option value="Winterberry">
                        <option value="Wolfberry">
                        <option value="Yellow Cherry">
                        <option value="Yuca Cassava">
                        <option value="Yumberry">
                        <option value="Acacia ">
                        <option value="Acerola Blossom">
                        <option value="Aglaia">
                        <option value="Albizia">
                        <option value="Almond Blossom">
                        <option value="Alstroemeria">
                        <option value="Althaea">
                        <option value="Alumroot">
                        <option value="Alyssum">
                        <option value="Amarillys">
                        <option value="Amazon Moonflower">
                        <option value="Anemone">
                        <option value="Angel's Trumpet">
                        <option value="Apple Blossom">
                        <option value="Apricot Blossom">
                        <option value="Ashoka Flower">
                        <option value="Astragalus">
                        <option value="Azteca Lily">
                        <option value="Banana Flower">
                        <option value="Banksia Australian">
                        <option value="Begonia">
                        <option value="Belladona">
                        <option value="Bellflower">
                        <option value="Bergamot Blossom">
                        <option value="Black Currant Blossom">
                        <option value="Blackberry Blossom">
                        <option value="Blue Lilies">
                        <option value="Blue Poppy">
                        <option value="Bottlebrush">
                        <option value="Bougainvillea">
                        <option value="Bread Flower">
                        <option value="Bromelia">
                        <option value="Buddleia">
                        <option value="Butomus Umbellatus">
                        <option value="Buttercup">
                        <option value="Cacao Blossom">
                        <option value="Calla Lily">
                        <option value="Camellia">
                        <option value="Campion Flower">
                        <option value="Cananga">
                        <option value="Cannonball Flower">
                        <option value="Carambola Blossom">
                        <option value="Cardamom Flower">
                        <option value="Carnation">
                        <option value="Celosia">
                        <option value="Chai Hu">
                        <option value="Chamomile">
                        <option value="Champaca">
                        <option value="Cherry Blossom">
                        <option value="Chimonanthus or Wintersweet">
                        <option value="China Rose">
                        <option value="Chinotto blossom">
                        <option value="Chocolate Flower">
                        <option value="Christmas Tree or Flame Tree">
                        <option value="Chrysanthemum">
                        <option value="Cistus Incanus">
                        <option value="Clematis">
                        <option value="Clover">
                        <option value="Coconut Blossom">
                        <option value="Coffee Blossom">
                        <option value="Cornflower Sultan Seeds">
                        <option value="Cosmos Flower">
                        <option value="Costus">
                        <option value="Cotton Flower">
                        <option value="Creamy Flowers">
                        <option value="Crinum Lily">
                        <option value="Cucumber Flower">
                        <option value="Cyclamen">
                        <option value="Dahlia">
                        <option value="Daisy">
                        <option value="Dandelion">
                        <option value="Daphne">
                        <option value="Daylily">
                        <option value="Deadnettle">
                        <option value="Delonix">
                        <option value="Desert Rose">
                        <option value="Dianthus">
                        <option value="Dogwood Blossom">
                        <option value="Dove Tree">
                        <option value="Dried Rose">
                        <option value="Dyer's Greenweed">
                        <option value="Edelweiss">
                        <option value="Eglantine Rose">
                        <option value="Elderflower">
                        <option value="Encian">
                        <option value="English Marigold">
                        <option value="Erigeron (Fleabane)">
                        <option value="Euphorbia">
                        <option value="Eustoma | Lisianthus">
                        <option value="Field Scabious">
                        <option value="Fig Blossom">
                        <option value="Fire Lily">
                        <option value="Flamingo Flower (Anthurium)">
                        <option value="Flax">
                        <option value="Floral Notes">
                        <option value="Forget Me Not">
                        <option value="Fragonia">
                        <option value="Freesia">
                        <option value="Fringed Pink">
                        <option value="Fuchsia">
                        <option value="Geranium">
                        <option value="Gerbera">
                        <option value="Gladiolus">
                        <option value="Goldenrod">
                        <option value="Gorse">
                        <option value="Grapeflower">
                        <option value="Great Burnet">
                        <option value="Green Nard">
                        <option value="Green Tea Flower">
                        <option value="Grevillea">
                        <option value="Guava Blossom">
                        <option value="Guayacan">
                        <option value="Hawthorn">
                        <option value="Hazel Blossom">
                        <option value="Heather">
                        <option value="Heliotrope">
                        <option value="Hellabore Flower">
                        <option value="Hemlock">
                        <option value="Hibiscus">
                        <option value="Hoary Stock">
                        <option value="Holly Flower">
                        <option value="Hollyhock">
                        <option value="Honeybush or Cyclopia">
                        <option value="Honeydew Blossom">
                        <option value="Hortensia">
                        <option value="Hoya Carnosa Wax Plant">
                        <option value="Hyacinth">
                        <option value="Hyssop">
                        <option value="Impatiens">
                        <option value="Inula">
                        <option value="Iris">
                        <option value="Iris Butter">
                        <option value="Iris Pallida">
                        <option value="Jacaranda">
                        <option value="Jade Flower">
                        <option value="Jasmine Orchid">
                        <option value="Jujube Blossom">
                        <option value="Kadam">
                        <option value="Kangaroo Paw">
                        <option value="Kanuka">
                        <option value="Kiwi blossom">
                        <option value="Kudzu">
                        <option value="Laburnum">
                        <option value="Lady of the Night Flower">
                        <option value="Lady Slipper Orchid">
                        <option value="Lamduan Flower">
                        <option value="Lamprocapnos">
                        <option value="Lantana">
                        <option value="Larkspur">
                        <option value="Laurel Blossom">
                        <option value="Lavender">
                        <option value="Leatherwood">
                        <option value="Ledum">
                        <option value="Liatris">
                        <option value="Liatrix">
                        <option value="Lilac">
                        <option value="Lily-of-the-Valley">
                        <option value="Lime (Linden) Blossom">
                        <option value="Litchi Blossom">
                        <option value="Lotus">
                        <option value="Lupin">
                        <option value="Lydia Broom">
                        <option value="Lysylang">
                        <option value="Magnolia">
                        <option value="Magnolia Brooklynensis">
                        <option value="Magnolia Leaf">
                        <option value="Malva">
                        <option value="Mango Blossom">
                        <option value="Mariposa Lily">
                        <option value="Mayflower">
                        <option value="Meadowsweet">
                        <option value="Melilotus">
                        <option value="Melissa Flower">
                        <option value="Michelia">
                        <option value="Mignonette">
                        <option value="Mimosa">
                        <option value="Mimusops Elengi">
                        <option value="Mirabilis">
                        <option value="Monarda">
                        <option value="Monoi Oil">
                        <option value="Morning Glory Flower">
                        <option value="Moss Flox">
                        <option value="Myrtle">
                        <option value="Narcissus">
                        <option value="Nard">
                        <option value="Nasturtium">
                        <option value="Nectarine Blossom">
                        <option value="Nerium Oleander">
                        <option value="Nigella">
                        <option value="Night Blooming Jasmine">
                        <option value="Olive flower">
                        <option value="Opium">
                        <option value="Orange Cassia Tree">
                        <option value="Orange Flower Water">
                        <option value="Orchard Blossom">
                        <option value="Orchid">
                        <option value="Orchid Black Diamond">
                        <option value="Orchid Cactus">
                        <option value="Orchid Pink Leopard">
                        <option value="Ornithogalum">
                        <option value="Orris Root">
                        <option value="Osmanthus">
                        <option value="Pansy">
                        <option value="Papaya Blossom">
                        <option value="Paramela">
                        <option value="Passion Flower">
                        <option value="Pataqueira">
                        <option value="Peach Blossom">
                        <option value="Pear Blossom">
                        <option value="Pelargonium">
                        <option value="Peony">
                        <option value="Periwinkle">
                        <option value="Petunia">
                        <option value="Phlox">
                        <option value="Pineapple Blossom">
                        <option value="Pink Flamingo Heliconia">
                        <option value="Pink Lily">
                        <option value="Pittosporum">
                        <option value="Plum Blossom">
                        <option value="Plumeria">
                        <option value="Poinsettia">
                        <option value="Pomegranate Blossom">
                        <option value="Poppy">
                        <option value="Primrose">
                        <option value="Princess Tree (Paulownia)">
                        <option value="Privet">
                        <option value="Protea">
                        <option value="Prunella">
                        <option value="Rangoon Creeper">
                        <option value="Raspberry Blossom">
                        <option value="Redwood Flower">
                        <option value="Reseda">
                        <option value="Rhododendron">
                        <option value="Rosa Alba">
                        <option value="Rosa Rubiginosa">
                        <option value="Rose">
                        <option value="Rose Hip">
                        <option value="Rose Japanese (Hamanasu)">
                        <option value="Rose Mallow">
                        <option value="Rosebay Willowherb">
                        <option value="Rosebud">
                        <option value="Roselle">
                        <option value="Safflower">
                        <option value="Sainfoins">
                        <option value="Sand Lily">
                        <option value="Sandalwood Flower">
                        <option value="Santolina">
                        <option value="Saucer Magnolia">
                        <option value="Sea Daffodil">
                        <option value="Siberian Rhododendron">
                        <option value="Silk Tree Blossom">
                        <option value="Skeleton Flower (Diphylleia Grayi)">
                        <option value="Smoketree">
                        <option value="Snakeroot">
                        <option value="Snow Lotus">
                        <option value="Snowdrops">
                        <option value="Solomon's Seal">
                        <option value="Sophora Toromiro Flower">
                        <option value="Sour Cherry Blossom">
                        <option value="Spanish Broom">
                        <option value="Spiraea">
                        <option value="St. John's Wort">
                        <option value="Starflower">
                        <option value="Strawberry Flower">
                        <option value="Strelitzia">
                        <option value="Strobilanthes Callosa">
                        <option value="Sunflower">
                        <option value="Sweet Pea">
                        <option value="Taif Rose">
                        <option value="Tamarisk">
                        <option value="Tobacco Blossom">
                        <option value="Transparent Flowers">
                        <option value="Trillium">
                        <option value="Tulip">
                        <option value="Vanilla Bahiana">
                        <option value="Viburnum">
                        <option value="Violet">
                        <option value="Violet Woodsorrel">
                        <option value="Wallflower">
                        <option value="Waratah">
                        <option value="Water Flowers">
                        <option value="Water Hyacinth">
                        <option value="Water Lily">
                        <option value="White Dahlia">
                        <option value="White Ginger Lily">
                        <option value="White Lace Flower">
                        <option value="White Tea Blossom">
                        <option value="Wildflowers">
                        <option value="Wisteria">
                        <option value="Wrightia">
                        <option value="Yellow Bells">
                        <option value="Yellow Flowers">
                        <option value="Ylang-Ylang">
                        <option value="Yuzu Flower">
                        <option value="Zinnia">
                        <option value="Arum Lily">
                        <option value="Belanis">
                        <option value="Black Locust">
                        <option value="Boronia">
                        <option value="Carissa">
                        <option value="Datura">
                        <option value="Frangipani">
                        <option value="Gardenia">
                        <option value="Grapefruit Blossom">
                        <option value="Honeysuckle">
                        <option value="Jasmine">
                        <option value="Karo-Karounde">
                        <option value="Lemon Blossom">
                        <option value="Lily">
                        <option value="Mandarin Orange Blossom">
                        <option value="Melati">
                        <option value="Mock Orange">
                        <option value="Moon Flower">
                        <option value="Night Blooming Cereus">
                        <option value="Orange Blossom">
                        <option value="Stephanotis">
                        <option value="Syringa">
                        <option value="Tangerine Blossom">
                        <option value="Tiare Flower">
                        <option value="Tuberose">
                        <option value="White Flowers">
                        <option value="White Tobacco">
                        <option value="Agave">
                        <option value="Algae">
                        <option value="Aloe Vera">
                        <option value="Ammophila (Beach Grass)">
                        <option value="Angelica">
                        <option value="Angelica Root">
                        <option value="Apple Mint">
                        <option value="Arnica">
                        <option value="Aromatic Notes">
                        <option value="Artemisia">
                        <option value="Asparagus">
                        <option value="Assam Tea">
                        <option value="Avocado">
                        <option value="Azolla (Water Fern)">
                        <option value="Banana Leaf">
                        <option value="Barley">
                        <option value="Basil">
                        <option value="Bay Essence">
                        <option value="Beachheather">
                        <option value="Betel Leaf">
                        <option value="Bigarane™">
                        <option value="Black Currant Leaf">
                        <option value="Blackberry Leaf">
                        <option value="Borage">
                        <option value="Borneol">
                        <option value="Bran">
                        <option value="Buchu or Agathosma">
                        <option value="Buckwheat">
                        <option value="Bulrush">
                        <option value="Burdock">
                        <option value="Cactus">
                        <option value="Calamus">
                        <option value="Calycanthus">
                        <option value="Cangzhu">
                        <option value="Cannabis">
                        <option value="Capitiú">
                        <option value="Carnation Leaves">
                        <option value="Cedar Leaves">
                        <option value="Celery">
                        <option value="Celery Seeds">
                        <option value="Centella Asiatica">
                        <option value="Cherry Leaf">
                        <option value="Chicory">
                        <option value="Chive">
                        <option value="Chuan Xiong">
                        <option value="Cilantro">
                        <option value="Citron Leaf">
                        <option value="Clary Sage">
                        <option value="Coca">
                        <option value="Creosote Bush">
                        <option value="Crithmum">
                        <option value="Davana">
                        <option value="Deer Tongue Grass">
                        <option value="Dried Fallen Leaves">
                        <option value="Earl Grey Tea">
                        <option value="Fermented Tea">
                        <option value="Fern">
                        <option value="Flouve">
                        <option value="Fo Ti (Ho Shou Wu)">
                        <option value="Fresh Evergreen">
                        <option value="Gajumaru Banyan">
                        <option value="Galbanum">
                        <option value="Garlic">
                        <option value="Genmaicha">
                        <option value="Geranium Macrorrhizum (Zdravetz)">
                        <option value="Ginkgo">
                        <option value="Ginseng">
                        <option value="Grape Leaves">
                        <option value="Grass">
                        <option value="Green Branches">
                        <option value="Green Forest">
                        <option value="Green Notes">
                        <option value="Green Pepper">
                        <option value="Green Sap">
                        <option value="Gromwell">
                        <option value="Guao or Maiden Plum">
                        <option value="Hat Straw">
                        <option value="Hay">
                        <option value="Henna">
                        <option value="Hops">
                        <option value="Horseweed">
                        <option value="Immortelle">
                        <option value="Ivy">
                        <option value="Jambu">
                        <option value="Jatamansi or Spikenard">
                        <option value="Juniper">
                        <option value="Juniper Berries">
                        <option value="Katrafay">
                        <option value="Katsura Leaf">
                        <option value="Khella">
                        <option value="Kunzea">
                        <option value="Laminaria">
                        <option value="Lantana leaf">
                        <option value="Lapsang Souchong Tea">
                        <option value="Laurissilva Forest">
                        <option value="Lesser Calamint">
                        <option value="Lettuce">
                        <option value="Lily-of-the-Valley Leaves">
                        <option value="Limnophila Aromatica">
                        <option value="Linaloe Berry">
                        <option value="Longjing Tea">
                        <option value="Lovage Root">
                        <option value="Marigold">
                        <option value="Marjoram">
                        <option value="Matcha Tea">
                        <option value="Mate">
                        <option value="Melilot or Sweet Clover">
                        <option value="Mimosa Leaves">
                        <option value="Mint">
                        <option value="Mistletoe">
                        <option value="Naswar">
                        <option value="Nettle">
                        <option value="Nut Grass">
                        <option value="Oak Leaves">
                        <option value="Oat">
                        <option value="Olive Leaf">
                        <option value="Oolong Tea">
                        <option value="Orchid Leaf">
                        <option value="Oregano">
                        <option value="Palm Leaf">
                        <option value="Palmarosa">
                        <option value="Pandanus">
                        <option value="Parsley">
                        <option value="Peach Leaf">
                        <option value="Pear Leaf">
                        <option value="Pesto">
                        <option value="Peyote">
                        <option value="Polygonum">
                        <option value="Portulaca or Pigweed">
                        <option value="Pu'er Tea">
                        <option value="Purslane">
                        <option value="Red Algae">
                        <option value="Reed">
                        <option value="Rice">
                        <option value="Rooibos Red Tea">
                        <option value="Roots">
                        <option value="Rose Leaf">
                        <option value="Rose Thorn">
                        <option value="Rosemary">
                        <option value="Roseroot">
                        <option value="Rue">
                        <option value="Rumex">
                        <option value="Rye">
                        <option value="Sabah Snake Grass">
                        <option value="Sage">
                        <option value="Sansevieria">
                        <option value="Sap">
                        <option value="Satureja">
                        <option value="Saw Palmetto">
                        <option value="Seaweed">
                        <option value="Shiso">
                        <option value="Sideritis Mountain Tea">
                        <option value="Silk Vine or Milk Broom">
                        <option value="Skunk Cabbage">
                        <option value="Snake Plant">
                        <option value="Spinach">
                        <option value="Stems Greens">
                        <option value="Strawberry Leaf">
                        <option value="Sugandha Kokila">
                        <option value="Sundew">
                        <option value="Swartzia">
                        <option value="Sweet Grass">
                        <option value="Tansy">
                        <option value="Tarragon">
                        <option value="Tea">
                        <option value="Thistle">
                        <option value="Thyme">
                        <option value="Ti Leaf (Cordyline)">
                        <option value="Tieguanyin Tea">
                        <option value="Tobacco">
                        <option value="Tomato Leaf">
                        <option value="Torreya">
                        <option value="Trees">
                        <option value="Tulsi">
                        <option value="Turnera Diffusa (Damiana)">
                        <option value="Valerian">
                        <option value="Vine">
                        <option value="Violet Leaf">
                        <option value="Water Lily Leaf">
                        <option value="Wheat">
                        <option value="White Meranti">
                        <option value="Wintergreen">
                        <option value="Woodfuff or Galium Odoratum">
                        <option value="Wormwood">
                        <option value="Yarrow">
                        <option value="Yunnan Red Tea">
                        <option value="Allspice">
                        <option value="Anise">
                        <option value="Asafoetida">
                        <option value="Bay Leaf">
                        <option value="Bengal Pepper">
                        <option value="Cacao Pod">
                        <option value="Caraway">
                        <option value="Cardamom">
                        <option value="Carolina Reaper">
                        <option value="Cassia">
                        <option value="Chutney">
                        <option value="Cinnamon">
                        <option value="Cinnamon Leaf">
                        <option value="Clove Leaf">
                        <option value="Cloves">
                        <option value="Coffee">
                        <option value="Coffee CO2">
                        <option value="Coffee Tincture">
                        <option value="Coriander">
                        <option value="Cubeb or Tailed Pepper">
                        <option value="Cumin">
                        <option value="Curcuma (Turmeric)">
                        <option value="Curry">
                        <option value="Curry Tree">
                        <option value="Dill">
                        <option value="Fennel">
                        <option value="Fenugreek">
                        <option value="Galanga">
                        <option value="Ginger">
                        <option value="Green Coffee">
                        <option value="Indian Spices">
                        <option value="Japanese Pepper">
                        <option value="Kaempferia Galanga">
                        <option value="Licorice">
                        <option value="Mace">
                        <option value="Mustard Seed">
                        <option value="Nutmeg">
                        <option value="Oily Notes">
                        <option value="Oriental Notes">
                        <option value="Pepper">
                        <option value="Peppertree">
                        <option value="Pimento">
                        <option value="Pimento Leaf">
                        <option value="Pimento Seeds">
                        <option value="Pink Pepper">
                        <option value="Priprioca">
                        <option value="Saffron">
                        <option value="Safraleine">
                        <option value="Sesame">
                        <option value="Siam Cardamom">
                        <option value="Sichuan Pepper">
                        <option value="Spicy Notes">
                        <option value="Star Anise">
                        <option value="Sumac">
                        <option value="Tamarind">
                        <option value="Timur">
                        <option value="Tonka Bean">
                        <option value="Toscanol">
                        <option value="Vanilla">
                        <option value="Wan Sao Lhong">
                        <option value="Wasabi">
                        <option value="Water Pepper">
                        <option value="West Indian Bay">
                        <option value="Acetyl Furan">
                        <option value="Agave Nectar">
                        <option value="Baklava">
                        <option value="Biscuit">
                        <option value="Bread">
                        <option value="Brioche">
                        <option value="Brown Sugar">
                        <option value="Bubbaloo">
                        <option value="Bubble Gum">
                        <option value="Burnt Sugar">
                        <option value="Butter">
                        <option value="Buttercream">
                        <option value="Butterscotch">
                        <option value="Cacao Butter">
                        <option value="Cake">
                        <option value="Calissons d'Aix">
                        <option value="Candied Fruits">
                        <option value="Candied Ginger">
                        <option value="Candied Orange">
                        <option value="Candies">
                        <option value="Canelé">
                        <option value="Caramel">
                        <option value="Cereals">
                        <option value="Cheesecake">
                        <option value="Cherry Milk">
                        <option value="Cherry Syrup">
                        <option value="Chocolate Fudge">
                        <option value="Chocolate Truffle">
                        <option value="Churros">
                        <option value="Coconut Pie">
                        <option value="Condensed Milk">
                        <option value="Cone Waffle">
                        <option value="Confetti (Sugared Almonds)">
                        <option value="Cookie">
                        <option value="Cotton Candy">
                        <option value="Cream">
                        <option value="Crème Brûlée">
                        <option value="Croissant">
                        <option value="Cupcake">
                        <option value="Custard">
                        <option value="Dark Chocolate">
                        <option value="Dates">
                        <option value="Donut or Doughnut">
                        <option value="Dulce de Leche">
                        <option value="Eggnog">
                        <option value="Fougassette">
                        <option value="French Pastries">
                        <option value="Frosting [Glacé]">
                        <option value="Gelatin">
                        <option value="Gianduia">
                        <option value="Gingerbread">
                        <option value="Gourmand Accord">
                        <option value="Griotte Cherries">
                        <option value="Halva">
                        <option value="Hazelnut Cocoa Spread">
                        <option value="Honey">
                        <option value="Honeycomb">
                        <option value="Horchata">
                        <option value="Ice cream">
                        <option value="Icing Pink">
                        <option value="Jelly">
                        <option value="Kulfi">
                        <option value="Lemon Pie">
                        <option value="Loukhoum">
                        <option value="Macarons">
                        <option value="Maple Syrup">
                        <option value="Maraschino Cherry">
                        <option value="Marmalade">
                        <option value="Marron Glacé">
                        <option value="Marshmallow">
                        <option value="Marzipan">
                        <option value="Meringues">
                        <option value="Milk Cream">
                        <option value="Milk Mousse">
                        <option value="Milkshake">
                        <option value="Molasses">
                        <option value="Nougat">
                        <option value="Nutella">
                        <option value="Oatmilk">
                        <option value="Palm Sugar">
                        <option value="Pancake">
                        <option value="Panettone">
                        <option value="Panna Cotta">
                        <option value="Pastiera Napoletana">
                        <option value="Peach Cream">
                        <option value="Pear Ice Cream">
                        <option value="Popcorn">
                        <option value="Praline">
                        <option value="Profiterole">
                        <option value="Pudding">
                        <option value="Rainbow Sorbet">
                        <option value="Red Fruits Sorbet">
                        <option value="Rice Pudding">
                        <option value="Rose Jam">
                        <option value="Sacher Torte">
                        <option value="Sorbet">
                        <option value="Souffle">
                        <option value="Sprinkles">
                        <option value="Spun Sugar">
                        <option value="Strawberry Syrup">
                        <option value="Sugar">
                        <option value="Tartine">
                        <option value="Tiramisu">
                        <option value="Toffee">
                        <option value="Tropézienne Tarte">
                        <option value="Waffle">
                        <option value="White Chocolate">
                        <option value="White Chocolate Truffle">
                        <option value="Whoopie Pie">
                        <option value="Yogurt">
                        <option value="Zefir">
                        <option value="Agarwood (Oud)">
                        <option value="Akigalawood">
                        <option value="Alder">
                        <option value="Almond tree">
                        <option value="Amaranth">
                        <option value="Amburana Bark">
                        <option value="Amburana Wood">
                        <option value="Amyris">
                        <option value="Apple Tree">
                        <option value="Araucaria">
                        <option value="Araucaria">
                        <option value="Arbutus (Madrona, Bearberry Tree)">
                        <option value="Argan Tree">
                        <option value="Aspen">
                        <option value="Australian Blue Cypress">
                        <option value="Bamboo">
                        <option value="Baobab">
                        <option value="Bark">
                        <option value="Beech">
                        <option value="Belambra Tree">
                        <option value="Birch">
                        <option value="Black Hemlock or Tsuga">
                        <option value="Black Spruce">
                        <option value="Blackwood">
                        <option value="Blonde Woods">
                        <option value="Brazilian Rosewood">
                        <option value="Buddha Wood">
                        <option value="Buxus">
                        <option value="Cabreuva">
                        <option value="Cambodian Oud">
                        <option value="Canadian Balsam">
                        <option value="Carob Tree">
                        <option value="Cascarilla">
                        <option value="Cashmir wood">
                        <option value="Cedar">
                        <option value="Chalood Bark">
                        <option value="Cherry Tree">
                        <option value="Chinese Oud">
                        <option value="Clearwood">
                        <option value="Cocobolo">
                        <option value="Coffee Tree">
                        <option value="Cork">
                        <option value="Cottonwood (Poplar)">
                        <option value="Cypress">
                        <option value="Cypriol Oil or Nagarmotha">
                        <option value="Dark Patchouli">
                        <option value="Dreamwood">
                        <option value="Driftwood">
                        <option value="Dry Wood">
                        <option value="Ducke">
                        <option value="Ebony Tree">
                        <option value="Elm">
                        <option value="Enoby Wood">
                        <option value="Eucalyptus">
                        <option value="Fig tree">
                        <option value="Fir">
                        <option value="Grass Tree">
                        <option value="Guaiac Wood">
                        <option value="Hiba">
                        <option value="Hinoki Wood">
                        <option value="Ho Wood">
                        <option value="Incienso">
                        <option value="Indian Oud">
                        <option value="Indian Woods">
                        <option value="Ironwood">
                        <option value="Ishpink, Ocotea Quixos">
                        <option value="Kowhai">
                        <option value="Laotian Oud">
                        <option value="Larch">
                        <option value="Lichen">
                        <option value="Liquidambar">
                        <option value="Mahogany">
                        <option value="Malaysian Oud">
                        <option value="Mango Tree">
                        <option value="Manuka">
                        <option value="Maple">
                        <option value="Massoia">
                        <option value="Mesquite Wood">
                        <option value="Muhuhu">
                        <option value="Mysore Sandalwood">
                        <option value="Neem">
                        <option value="Nootka">
                        <option value="Oak">
                        <option value="Oakmoss">
                        <option value="Olive Tree">
                        <option value="Palisander Rosewood">
                        <option value="Palo Santo">
                        <option value="Palo Verde Tree">
                        <option value="Pamplewood">
                        <option value="Paperbark">
                        <option value="Papyrus">
                        <option value="Patchouli">
                        <option value="Peach Tree">
                        <option value="Pear Tree">
                        <option value="Pepperwood or Hercules Club">
                        <option value="Pine Tree">
                        <option value="Pink Ipê Tree">
                        <option value="Plum Tree">
                        <option value="Pua Keni Keni (Pua-Lulu)">
                        <option value="Ravenala">
                        <option value="Ravensara">
                        <option value="Red Willow">
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
                        <option value="Tamboti Wood">
                        <option value="Tatami">
                        <option value="Teak Wood">
                        <option value="Thailand Oud">
                        <option value="Thanaka Wood">
                        <option value="Thuja">
                        <option value="Transparent Woods">
                        <option value="Vetiver">
                        <option value="Vietnamese Oud">
                        <option value="White Oud">
                        <option value="White Willow">
                        <option value="Woody Notes">
                        <option value="Yohimbe">
                        <option value="Amberwood">
                        <option value="Bakhoor">
                        <option value="Balsamic Notes">
                        <option value="Balsamic Vinegar">
                        <option value="Benzoin">
                        <option value="Birch Tar">
                        <option value="Breu-Branco">
                        <option value="Bushman Candle">
                        <option value="Cade oil">
                        <option value="Choya Loban">
                        <option value="Choya Nakh">
                        <option value="Choya Ral">
                        <option value="Coal Tar">
                        <option value="Copahu Balm">
                        <option value="Copaiba Balm">
                        <option value="Copal">
                        <option value="Dragon Blood Resin">
                        <option value="Elemi">
                        <option value="Estoraque">
                        <option value="Gurjun Balsam">
                        <option value="Incense">
                        <option value="Labdanum">
                        <option value="Mastic or Lentisque">
                        <option value="Mopane">
                        <option value="Myrica">
                        <option value="Myrrh">
                        <option value="Nag Champa">
                        <option value="Olibanum (Frankincense)">
                        <option value="Olibanum Sacra Resin Green">
                        <option value="Opoponax">
                        <option value="Peru Balsam">
                        <option value="Pine Tar">
                        <option value="Poplar (Populus) Buds">
                        <option value="Resins">
                        <option value="Rubber">
                        <option value="Styrax">
                        <option value="Surf Wax">
                        <option value="Tea Tree Oil">
                        <option value="Aldron">
                        <option value="Amber">
                        <option value="Amber Xtreme">
                        <option value="Ambergris">
                        <option value="Ambertonic™ (IFF)">
                        <option value="Ambrarome">
                        <option value="Ambretone">
                        <option value="Ambrette (Musk Mallow)">
                        <option value="Ambrettolide">
                        <option value="Ambrocenide (Symrise)">
                        <option value="Ambroxan">
                        <option value="Animal Notes">
                        <option value="Bacon">
                        <option value="BBQ">
                        <option value="Beeswax">
                        <option value="Carrot Seeds">
                        <option value="Castoreum">
                        <option value="Caviar">
                        <option value="Cetalox">
                        <option value="Cheese">
                        <option value="Civet">
                        <option value="Coral Reef">
                        <option value="Daim">
                        <option value="Fur">
                        <option value="Genet">
                        <option value="Goat Hair">
                        <option value="Goat's Milk">
                        <option value="Hyraceum">
                        <option value="Kephalis">
                        <option value="Leather">
                        <option value="Meat">
                        <option value="Milk">
                        <option value="Musk">
                        <option value="Muskrat">
                        <option value="Oysters">
                        <option value="Saffiano Leather">
                        <option value="Sea Shells">
                        <option value="Skatole">
                        <option value="Skin">
                        <option value="Starfish">
                        <option value="Suede">
                        <option value="Sylkolide">
                        <option value="Tolu Balsam">
                        <option value="Truffle">
                        <option value="Velvione™">
                        <option value="Absinthe">
                        <option value="Advocaat">
                        <option value="Amaretto">
                        <option value="Applejack">
                        <option value="Baileys Irish Cream">
                        <option value="Batida">
                        <option value="Beer/Ale">
                        <option value="Bellini">
                        <option value="Blue Margarita">
                        <option value="Boozy Notes">
                        <option value="Bourbon Whiskey">
                        <option value="Cachaça">
                        <option value="Caipirinha">
                        <option value="Campari">
                        <option value="Cappuccino">
                        <option value="Champagne">
                        <option value="Champagne Rosé">
                        <option value="Chinotto">
                        <option value="Coca-Cola">
                        <option value="Cocktail Fruits">
                        <option value="Cognac">
                        <option value="Cognac">
                        <option value="Cosmopolitan Cocktail">
                        <option value="Cream Soda">
                        <option value="Curaçao">
                        <option value="Daiquiri">
                        <option value="Eau de Vie">
                        <option value="Fruit Tea">
                        <option value="Gin">
                        <option value="Grenadine">
                        <option value="Hi-Fi">
                        <option value="Jasmine Tea">
                        <option value="Kava Drink">
                        <option value="Kir Royal">
                        <option value="Lemonade">
                        <option value="Limoncello">
                        <option value="Liquor">
                        <option value="Macchiato">
                        <option value="Madeira">
                        <option value="Mai Tai Cocktail">
                        <option value="Margarita">
                        <option value="Martini">
                        <option value="Masala Chai">
                        <option value="Mezcal">
                        <option value="Midori">
                        <option value="Mocha">
                        <option value="Mojito">
                        <option value="Moscow Mule">
                        <option value="Mulled Wine">
                        <option value="Orange Soda">
                        <option value="Ouzo">
                        <option value="Pina Colada">
                        <option value="Pisco Sour Cocktail">
                        <option value="Plum Wine">
                        <option value="Port Wine">
                        <option value="Prosecco">
                        <option value="Punch">
                        <option value="Raki">
                        <option value="Red Wine">
                        <option value="Rhum Agricole">
                        <option value="Rice Water">
                        <option value="Rum">
                        <option value="Sake">
                        <option value="Sangria">
                        <option value="Sparkling Water">
                        <option value="Sparkling Wine">
                        <option value="Syrup">
                        <option value="Tequila">
                        <option value="Tokaji Wine">
                        <option value="Tonic Water">
                        <option value="Umeshu">
                        <option value="Vermouth">
                        <option value="Vodka">
                        <option value="Whiskey">
                        <option value="White Wine">
                        <option value="Wine Lees">
                        <option value="Accord Eudora®">
                        <option value="Alcantara Accord">
                        <option value="Aldehydes">
                        <option value="Aluminum">
                        <option value="Ambreine">
                        <option value="Ambrinol">
                        <option value="AMBROX® SUPER">
                        <option value="Ammonia">
                        <option value="Amyl Salicylate">
                        <option value="Antillone™">
                        <option value="Aqual™">
                        <option value="Aquozone">
                        <option value="Ash">
                        <option value="Asphalt">
                        <option value="Azarbre">
                        <option value="Black Diamond">
                        <option value="Black Leather">
                        <option value="Blood">
                        <option value="Boisiris">
                        <option value="Brick">
                        <option value="Brown Scotch Tape">
                        <option value="Burnt Match">
                        <option value="Calone">
                        <option value="Calypsone">
                        <option value="Camphor">
                        <option value="Candle Wax">
                        <option value="Caoutchouc">
                        <option value="Cascalone">
                        <option value="Cashalox">
                        <option value="Cashmeran">
                        <option value="Cetonal®">
                        <option value="Chalk">
                        <option value="Clarycet">
                        <option value="Clay">
                        <option value="CO2 Extracts">
                        <option value="Coal">
                        <option value="Cobblestone">
                        <option value="Cocaine">
                        <option value="Concrete">
                        <option value="Copper">
                        <option value="Coral Limestone">
                        <option value="Coranol">
                        <option value="Cork">
                        <option value="Cosmone">
                        <option value="Coumarin">
                        <option value="Credit Cards">
                        <option value="Crustaceans">
                        <option value="Cyclopidene">
                        <option value="Damascone">
                        <option value="Dew Drop">
                        <option value="Dihydromyrcenol">
                        <option value="Dirt">
                        <option value="Dodecanal">
                        <option value="Earth Tincture">
                        <option value="Earthy Notes">
                        <option value="Egg">
                        <option value="Ember">
                        <option value="Ethyl Maltol">
                        <option value="Eugenol">
                        <option value="Evernyl">
                        <option value="Fabric">
                        <option value="Factor X">
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
                        <option value="Hand Cream">
                        <option value="Head Space Waterfall">
                        <option value="Hedione">
                        <option value="Helvetolide">
                        <option value="Hexenyl Green">
                        <option value="Hexyl Acetate">
                        <option value="Hina">
                        <option value="Hivernal®">
                        <option value="Holy Water">
                        <option value="Hot Iron">
                        <option value="Ice">
                        <option value="Indole">
                        <option value="Industrial Glue">
                        <option value="Ink">
                        <option value="Instant Film Accord">
                        <option value="Iodine">
                        <option value="Ionones">
                        <option value="Iso E Super">
                        <option value="Isobutyl Quinoline">
                        <option value="Jasmolactone">
                        <option value="Jasmone">
                        <option value="Javanol">
                        <option value="Jeans">
                        <option value="Lactones">
                        <option value="latex">
                        <option value="Lava">
                        <option value="Lilybelle®">
                        <option value="Linen">
                        <option value="Lip Gloss">
                        <option value="Lipstick">
                        <option value="Little Doll Strawberry">
                        <option value="Lorenox">
                        <option value="Magnolan">
                        <option value="Mahonial">
                        <option value="Mascarpone Cheese">
                        <option value="Melonal">
                        <option value="Metallic Notes">
                        <option value="Mineral Notes">
                        <option value="Mitti Attar">
                        <option value="Molasses">
                        <option value="Money">
                        <option value="Motor Oil">
                        <option value="Mountain Air">
                        <option value="Mousse de Saxe">
                        <option value="Mud">
                        <option value="Mugane">
                        <option value="Muscenone">
                        <option value="Mystikal">
                        <option value="NaturalCalm™">
                        <option value="Neoprene">
                        <option value="Norlimbanol™">
                        <option value="Nympheal™">
                        <option value="Orcanox™">
                        <option value="Ozonic Notes">
                        <option value="Paper">
                        <option value="Para-Cresyl Phenyl Acetate">
                        <option value="Paradisone">
                        <option value="Pearls">
                        <option value="Peat">
                        <option value="Pebbles">
                        <option value="Pencil">
                        <option value="Petalia">
                        <option value="Petroleum">
                        <option value="Pharaone®">
                        <option value="Pink Crystal">
                        <option value="Pink Himalayan Sea Salt">
                        <option value="Plastic">
                        <option value="Plastic Bag">
                        <option value="Poison">
                        <option value="Poivrol">
                        <option value="Pollen">
                        <option value="Pomarose">
                        <option value="Powdery Notes">
                        <option value="Priest’s Clothes">
                        <option value="Propolis">
                        <option value="Prunol">
                        <option value="Rain Notes">
                        <option value="Rose Oxide">
                        <option value="Salicylic Acid">
                        <option value="Salt">
                        <option value="Sand">
                        <option value="Satin">
                        <option value="Sauna">
                        <option value="Scent Trek®">
                        <option value="Sclarene">
                        <option value="Sea Water">
                        <option value="Serenolide">
                        <option value="Shamama Attar">
                        <option value="Silk">
                        <option value="Silver">
                        <option value="Sinfonide">
                        <option value="Siren">
                        <option value="Slate">
                        <option value="Smoke">
                        <option value="Snow">
                        <option value="Soap">
                        <option value="Sodium Silicate">
                        <option value="Solar Notes">
                        <option value="SP3 Carbon">
                        <option value="Spiranol">
                        <option value="Spray Paint">
                        <option value="Steam accord">
                        <option value="Stone">
                        <option value="Sulphur">
                        <option value="Suntan Lotion">
                        <option value="Sweat">
                        <option value="Talc">
                        <option value="Tennis Ball">
                        <option value="Terpineol">
                        <option value="Terranol">
                        <option value="Timbersilk™">
                        <option value="Tonquitone™">
                        <option value="Trimofix®">
                        <option value="Tuberolide">
                        <option value="Tulle accord">
                        <option value="Vanillin">
                        <option value="Varnish Accord">
                        <option value="Velvet">
                        <option value="Verdox">
                        <option value="Vinyl">
                        <option value="Vinyl Guaiacol">
                        <option value="Water">
                        <option value="Wet Plaster">
                        <option value="Wet Stone">
                        <option value="White Leather">
                        <option value="Wool">
                        <option value="Yeast">
                        
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">top2</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="top2">
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group mb-3">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">top3</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="top3">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">middle1</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="middle1">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">middle2</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="middle2">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group mb-3">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">middle3</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="middle3">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">base1</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="base1">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">base2</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="base2">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row ">
            <div class="col-12 input-group mb-3">
                <span class="badge bg-secondary w-25 p-3 h-75 d-inline-block">base3</span>
                <input type="text" class="form-control h-75"  list="datalistOptions"  name="base3">
                <datalist class="datalistOptions">
                </datalist>
                <button class="btn btn-outline-secondary h-75" type="button" id="button-addon2">버튼</button>
            </div>
        </div>
        <div class="row">
            
        </div>
        <div class="row"><button type="submit">입력</button></div>

    </div>
    </form>
    
    <script>

    

    </script>
</body>
</html>