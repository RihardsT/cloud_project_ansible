scaleway_token=${1}
node_ip=${2}
record_ids=($(/usr/bin/curl -s -X GET -H "X-Auth-Token: ${scaleway_token}" https://api.scaleway.com/domain/v2beta1/dns-zones/rudenspavasaris.id.lv/records | /usr/bin/jq '.records[] | select(.type == "A") | .id'))
for i in ${record_ids[*]}; do
  record_data='{"changes": [{"delete": {"id": '${i}'}}]}'
  /usr/bin/curl -X PATCH -H "X-Auth-Token: ${scaleway_token}" -H 'Content-Type: application/json' \
  https://api.scaleway.com/domain/v2beta1/dns-zones/rudenspavasaris.id.lv/records -d \
  "${record_data}"
done
new_record_data='{"changes": [{"add": {"records": [{"name": "","data": "'${node_ip}'","ttl": "600","type": "A"},
{"name": "*","data": "'${node_ip}'","ttl": "600","type": "A"}]}}]}';
/usr/bin/curl -X PATCH -H "X-Auth-Token: ${scaleway_token}" -H "Content-Type: application/json" \
https://api.scaleway.com/domain/v2beta1/dns-zones/rudenspavasaris.id.lv/records -d \
"${new_record_data}"
