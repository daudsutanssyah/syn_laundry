class Config {
  // variabel utk menampung url web service (API)
  static String urlAPI = "https://syntop.poltekbangplg.ac.id/api";
  
  // variabel utk menampung url utama web/backend
    static String urlMain = "https://syntop.poltekbangplg.ac.id/";

   // url register
   String urlRegister = "$urlAPI/register"; 
   String urlLogin = "$urlAPI/login"; 
   String urlLogout = "$urlAPI/logout";

   //url product 
   String productList = "$urlAPI/product-list";

   // url keranjang
   String keranjangPost = "$urlAPI/keranjang-post";

   //url checkout
   String checkoutPostById = "$urlAPI/chekout-post-by-id";
   String checkoutListBaru = "$urlAPI/chekout-list-baru?user_id=";
   String checkoutListProses = "$urlAPI/chekout-list-proses?user_id=";
   String checkoutListSelesai = "$urlAPI/chekout-list-selesai?user_id=";
   
}