if tail -10 /var/log/cron.log | grep -q 'XP on '"$(date '+%Y-%m-%d')!"; then
    echo "✅ streak is alive"
else
    echo "🔴 streak is in danger, last: "$(tail -10 /var/log/cron.log)
fi