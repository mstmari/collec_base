{ :company =>
    { :company_users_attributes =>
        [
          { :company_id => 1, :user_id => 1 } ,
          { :company_id => 1, :user_id => 2 },
          { :company_id => 1, :user_id => 3 }
        ]
    }
}

{"title"=>"The Jungle Book", "author"=>"Rudyard Kipling", "volume_number"=>"", "user_books_attributes"=>
 {"condition"=>"Very Old",
 "description"=>"bought at bookstore",
 "price"=>"14"
  }


left to do -

-fix partial so you can edit book/user_book on the edit form (you will need to look in the boks controller)

- fix the #create method

-find a way to filter duplicates on book index view 
