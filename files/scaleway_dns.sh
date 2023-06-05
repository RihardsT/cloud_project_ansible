scaleway_token = $1
node_ip = $2

record_ids=$(/usr/bin/curl -s -X GET -H "X-Auth-Token: ${scaleway_token}" \
https://api.scaleway.com/domain/v2beta1/dns-zones/rudenspavasaris.id.lv/records | /usr/bin/jq '.records[] | select(.type == "A") | .id')
for i in "${record_ids[@]}"; do
  /usr/bin/curl -X PATCH -H 'X-Auth-Token: ${scaleway_token}' -H 'Content-Type: application/json' \
  https://api.scaleway.com/domain/v2beta1/dns-zones/rudenspavasaris.id.lv/records -d \
  "{\"changes\": [{\"delete\": {\"id\": ${i}}}]}"
done
/usr/bin/curl -X PATCH -H "X-Auth-Token: ${scaleway_token}" -H "Content-Type: application/json" \
https://api.scaleway.com/domain/v2beta1/dns-zones/rudenspavasaris.id.lv/records -d \
'{"changes": [{"add": {"records": [{"name": "","data": "${node_ip}","ttl": "600","type": "A"},{"name": "*","data": "${node_ip}","ttl": "600","type": "A"}]}}]}';
