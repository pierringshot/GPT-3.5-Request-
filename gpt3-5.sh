green=$(tput setaf 2)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

read -p "${green}Məhsulun adı: ${reset}" user2_input

response=$(curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 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 " \
  -d '{
  "model": "gpt-3.5-turbo-16k",
  "messages": [
    {
      "role": "system",
      "content": "Sən elektronik cihazlar üçün aksessuar və ehtiyat hissələri üçün qısa və tam açıqlayıcı məzmunlar yaza bilərsən. Bizim PierringShot Electronics™ adlı mağazamızda olan elektronik cihazlar həm keyfiyyətli, orijinal həm də ucuz və zəmanətlidir. Bizim məhsulların üstünlüyünü istifadəçiyə çatdıraraq daha çox müştərinin PierringShot Electronics™-i seçməsinə səbəb ola biləcək məzmunlar yaza bilərsən."
    },
    {
      "role": "user",
      "content": "'"$user2_input"'"
    }
  ],
  "temperature": 0.23,
  "max_tokens": 2048,
  "top_p": 1,
  "frequency_penalty": 0.01,
  "presence_penalty": 0.23
}')

assistant_response=$(echo $response | jq -r '.choices[-1].message.content')
echo "${yellow}Assistant: $assistant_response${reset}"
