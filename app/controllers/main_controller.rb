class MainController < ApplicationController
  def home
  end

  def about
  end

  def show_employees
    @employees = [
      {name:"Daniella Salvatierra", qualification:"Bachelor of Dental Surgery (BChD) Summa Cum-laude 2017", experience: 8, photo: "https://images.unsplash.com/photo-1621859678777-dbff066f723e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNpbHZlciUyMHNlYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"},
      {name:"Timotheus Novachrono", qualification:"Bachelor's Degree (Bachelor of Dentistry (BDS)", experience: 5, photo: "https://plus.unsplash.com/premium_photo-1661914572500-ad8bae6fba5d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3VwZXJub3ZhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"},
      {name:"Noelle Vermillion", qualification:"Bachelor of Dental Surgery (BChD)", experience: 4, photo: "https://images.unsplash.com/photo-1514183053185-29269af4aec3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHZlcm1pbGxpb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"}
    ]
  end
end
