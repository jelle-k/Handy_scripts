# Use Windows cmd, just run.
import lxml.etree as ET
import time
import os

try:
  print("Running...")
  while True: 
    dom = ET.parse(os.getcwd()+"/Input.xml")
    xslt = ET.parse(os.getcwd()+"/Ext_GRPO.xslt")
    transform = ET.XSLT(xslt)
    newdom = transform(dom)
    # print(ET.tostring(newdom, pretty_print=True))
    with open('out.xml', 'w') as f:
      print(newdom, file=f)
    f.close()
    time.sleep(5)
except KeyboardInterrupt:
  print("Ended")
  


