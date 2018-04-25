# Use Windows cmd, just run.
import lxml.etree as ET
import time

try:
  print("Running...")
  while True: 
    dom = ET.parse(r"C:\Users\jkakebeeke\Documents\Handy_scripts\XML-XSLT\Ext_SBO\Input.xml")
    xslt = ET.parse(r"C:\Users\jkakebeeke\Documents\Handy_scripts\XML-XSLT\Ext_SBO\Ext_GRPO.xslt")
    transform = ET.XSLT(xslt)
    newdom = transform(dom)
    # print(ET.tostring(newdom, pretty_print=True))
    with open('out.xml', 'w') as f:
      print(newdom, file=f)
    f.close()
    time.sleep(5)
except KeyboardInterrupt:
  print("Ended")
  


