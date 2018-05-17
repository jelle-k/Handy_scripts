# Use Windows cmd, just run.
import lxml.etree as ET
import time
import os

  
dom = ET.parse(os.getcwd()+"/Input.xml")
xslt = ET.parse(os.getcwd()+"/filterY.xslt")
transform = ET.XSLT(xslt)
newdom = transform(dom)
# print(ET.tostring(newdom, pretty_print=True))
with open('out.xml', 'w') as f:
  print(newdom, file=f)
f.close()
    


