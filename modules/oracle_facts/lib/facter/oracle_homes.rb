Facter.add(:oracle_homes) do
   confine :kernel => :linux
   setcode do
     homes = Facter::Core::Execution.exec('/bin/cat /etc/oratab | /bin/grep -v "#" | /bin/grep -v grid | /usr/bin/cut -f2 -d: | /bin/grep product | /usr/bin/sort | /usr/bin/uniq')
     homes.split(' ')
   end
end
