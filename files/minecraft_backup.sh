backup_timestamp=$(date +%Y-%m-%d_%H.%M.%S); echo ${backup_timestamp} | sudo tee /data/backup_timestamp
sudo tar -czf /data/minecraft_${backup_timestamp}.tar /data/minecraft_data
s3cmd put /data/minecraft_${backup_timestamp}.tar s3://rudenspavasaris
