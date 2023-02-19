#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e $1
  fi

  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]; then
    MAIN_MENU "\nI could not find that service. What would you like today?"
  else 
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    if [[ -z $CUSTOMER_NAME ]]; then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'") 
    FORMATED_SNM=$(echo $SERVICE_NAME_SELECTED | sed 's/ |/"/')
    FORMATED_CN=$(echo $CUSTOMER_NAME | sed 's/ |/"/')
    echo -e "What time would you like your $FORMATED_SNM, $FORMATED_CN?"
    
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    INSERTED_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $FORMATED_SNM at $SERVICE_TIME, $FORMATED_CN."
  fi
}
  
MAIN_MENU "\nWelcome to My Salon, how can I help you?\n"
