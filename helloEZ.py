from jnpr.junos import Device
 
dev = Device( user='netconf-test', host='lab-switch', password='lab123' )

dev.open()

print dev.facts

dev.close()
