package handler

import (
	"encoding/json"
	"fmt"
	"net/http"

	twilio "github.com/twilio/twilio-go"
	openapi "github.com/twilio/twilio-go/rest/api/v2010"
)

type LocationData struct {
	Latitude  float64 `json:"latitude"`
	Longitude float64 `json:"longitude"`
}

func SMSHandler(w http.ResponseWriter, r *http.Request) {

	// Parse the JSON request body
	var location LocationData
	err := json.NewDecoder(r.Body).Decode(&location)
	if err != nil {
		http.Error(w, "Invalid request payload", http.StatusBadRequest)
		return
	}

	// client := twilio.NewRestClient()
	accountSid := "ACd0b3713cc11893c90f37e549e9f9af65"
	authToken := "aff3a0b9ba830368e86f46827b8beaf5"

	client := twilio.NewRestClientWithParams(twilio.ClientParams{
		Username: accountSid,
		Password: authToken,
	})

	message := fmt.Sprintf("Please help emergency! I am here at latitude: %f and longitude: %f", location.Latitude, location.Longitude)
	fmt.Println(message)

	params := &openapi.CreateMessageParams{}
	params.SetTo("+91 8157892554")
	params.SetFrom("+1 254 587 5865")
	params.SetBody(message)
	// params.SetApplicationSid("ACb5693e7f1f8aa71a7d23aaa26a47c1f9")

	_, err = client.Api.CreateMessage(params)
	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println("SMS sent successfully!")
	}
}

// set TWILIO_ACCOUNT_SID=ACd0b3713cc11893c90f37e549e9f9af65
// set TWILIO_AUTH_TOKEN="aff3a0b9ba830368e86f46827b8beaf5"
// set TWILIO_PHONE_NUMBER="+12545875865"
// set TO_PHONE_NUMBER="+91 8157892554"
