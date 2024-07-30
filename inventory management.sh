

function addtyre(){
        clear
        echo "ENTER THE DETAILS OF TYRE"
        read -p "Enter the Brand Name: " brand
        read -p "Enter the Width of tyre(mm): " width
        read -p "Enter the Profile of tyre: " profile
        read -p "Enter the rim size: " rim
        read -p "Enter the Model: " model
        read -p "Enter the Price(inc. GST): " price
        read -p "Enter the Quantity: " quantity
        
        echo "$brand,$width,$profile,$rim,$model,$price,$quantity" >> inventory.csv
        echo "TYRES"
        grep -i "^$brand,$width,$profile,$rim,.*$" inventory.csv > data.csv
        echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
        sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
      
}

function check_tyre_inventory() {
        clear
        read -p "Enter brand name: " brand_name
        read -p "Enter width: " width
        read -p "Enter profile: " profile
        read -p "Enter rim: " rim
        
        if grep -q "${brand_name},${width},${profile},${rim}" inventory.csv; then
            echo "STOCK IN INVENTORY"
            grep -i "^$brand_name,$width,$profile,$rim,.*$" inventory.csv > data.csv
            echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
            sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook

        else
            echo "The tyre is not present in the inventory"
        fi
}

function update_tyre(){
    clear
    read -p "Enter brand name: " brand
    read -p "Enter width: " width
    read -p "Enter profile: " profile
    read -p "Enter rim: " rim
    
    if grep -q "${brand},${width},${profile},${rim}" inventory.csv; then
        echo "STOCK IN INVENTORY"
        grep -i "^$brand,$width,$profile,$rim,.*$" inventory.csv > data.csv
        echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
        sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
        read -p "Model: " model
        awk -v brand="$brand" -v width="$width" -v profile="$profile" -v rim="$rim" -v model="$model" 'BEGIN{FS=",";OFS=","} !($1==brand && $2==width && $3==profile && $4==rim && $5==model)' inventory.csv > tmp.csv
        if [[ $(wc -l < tmp.csv) -lt $(wc -l < inventory.csv) ]]; then
           mv tmp.csv inventory.csv
           read -p "Enter the new price: " price
           read -p "Enter the new quantity: " quantity
           echo "$brand,$width,$profile,$rim,$model,$price,$quantity" >> inventory.csv
           grep -i "^$brand,$width,$profile,$rim,.*$" inventory.csv > data.csv
           echo "brand,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
           sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
        else
           echo "Tyre not found in the inventory."
           rm tmp.csv
        fi

    else
        echo "The tyre is not present in the inventory"
    fi
    
}

function display_inventory {
        clear    
        echo "Enter your choice (1-10):"
        echo "1.  Bridgestone"
        echo "2.  Ceat"
        echo "3.  Hankook"
        echo "4.  Michelin"
        echo "5.  Firestone"
        echo "6.  Pirelli"
        echo "7.  Yokohama"
        echo "8.  Goodyear"
        echo "9.  Entire inventory"
        echo "10. Exit"
        read choice
        case $choice in
            1)
                
                data=$(grep 'BRIDGESTONE' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook --no-inference
                
                ;;
            2)
                data=$(grep 'CEAT' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            3)
                data=$(grep 'HANKOOK' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            4)
                data=$(grep 'MICHELIN' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            5)
                data=$(grep 'FIRESTONE' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            6)
                data=$(grep 'PIRELLI' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            7)
                data=$(grep 'YOKOHAMA' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            8)
                data=$(grep 'GOODYEAR' inventory.csv | cut -d',' -f1-7 > data.csv)
                
                echo "Brand Name,Width,Profile,Radius,Model,Cost,Quantity" | cat - data.csv > temp && mv temp data.csv
                sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
                
                ;;
            9)
                
                csvlook inventory.csv
                
                ;;
                
            10)
                echo "Goodbye!"
                ;;
        esac
        echo "Press enter to continue..."
        read dummy
        echo "Goodbye"
}

function tyreSales() {
  echo "Enter the brand name:"
  read brand

  echo "Enter the width of the tyre:"
  read width

  echo "Enter the profile of the tyre:"
  read profile

  echo "Enter the rim size of the tyre:"
  read rim

  grep -i "^$brand,$width,$profile,$rim,.*$" inventory.csv > data.csv
  echo "brand,width,profile,rim,model,cost,quantity" | cat - data.csv > temp && mv temp data.csv
  sed 's/,\([^"]\)\([,$]\)/,"'"'"'\1'"'"'"\2/g' data.csv | csvlook
  echo "Enter the model of the tyre:"
  read model

  tyre=$(awk -F ',' -v brand="$brand" -v width="$width" -v profile="$profile" -v rim="$rim" -v model="$model" '$1 == brand && $2 == width && $3 == profile && $4 == rim && $5 == model {print}' inventory.csv)

  if [ -z "$tyre" ]; then
    echo "Sorry, we do not have that tyre in stock."
  else
    stock=$(echo "$tyre" | cut -d',' -f7 | tr -d '\r')

    echo "Enter the quantity of tyres to sell:"
    read qty

    if [ "$qty" -gt "$stock" ]; then
      echo "Sorry, we only have $stock tyres in stock."
    else
      new_stock=$(expr $stock - $qty)

      awk -F ',' -v brand="$brand" -v width="$width" -v profile="$profile" -v rim="$rim" -v model="$model" -v stock="$stock" -v new_stock="$new_stock" '$1 == brand && $2 == width && $3 == profile && $4 == rim && $5 == model {gsub(stock,new_stock)}1' inventory.csv > temp.csv && mv temp.csv inventory.csv

      echo "Enter your name:"
      read person

      datetime=$(date +"%Y-%m-%d %H:%M:%S")

      echo "$datetime,$brand,$width,$profile,$rim,$model,$qty,$person" >> sales_log.csv

      echo "Sale successful. $qty $brand $width/$profile/$rim/$model tyres sold."
      echo "Thank You :)"

      if [ "$new_stock" -lt 20 ]; then
        clear
        echo "Alert: Only $new_stock tyres of $brand $width/$profile/$rim/$model are left in stock. Quantity less than 20!"


        owner_email="dashyam3018@gmail.com"
        subject="Low Stock Alert"
        body="Only $new_stock tyres of $brand $width/$profile/$rim/$model are left in stock. Quantity less than 20!"
        echo "$body" | mail -s "$subject" "$owner_email"
      fi
    fi
  fi
}



function display_sales_history() {
    clear
    echo "Sales History:"
    csvlook sales_log.csv
    echo "Press enter to continue..."
    read dummy
}
function last_function(){
    echo "Thank You :)"
    break
}
while true; do
    
    echo -e "\nSelect an option:"
    echo "1. Add tyres to inventory"
    echo "2. Check Tyres present in inventory"
    echo "3. Update Tyre's Cost and Quantity"
    echo "4. Display Stock present"
    echo "5. Retail"
    echo "6. Display sales history"
    echo "7. Exit"
    read choice
    case $choice in
        1) addtyre ;;
        2) check_tyre_inventory ;;
        3) update_tyre ;;
        4) display_inventory ;;
        5) tyreSales ;;
        6) display_sales_history ;;
        7) last_function  ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done
