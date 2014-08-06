from jnpr.junos.utils.config import Config
from jnpr.junos import Device
import yaml
 
dev = Device( user='netconf-test', host='lab-switch', password='lab123' )
dev.open()
 
dev.bind(cu=Config)
dev.cu

tvars = yaml.load(open("demo-template.yml").read())
dev.cu.load(template_path="demo-template.j2", template_vars=tvars, format="text")

commit_diff = dev.cu.diff()
print commit_diff

#commit_check = dev.cu.commit_check()
#print commit_check

#dev.cu.commit()

dev.close()
