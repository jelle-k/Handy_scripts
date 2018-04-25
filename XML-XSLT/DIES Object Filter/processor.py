# Use Windows cmd, just run.
import lxml.etree as ET
import time

  
dom = ET.parse(r"C:\Users\jkakebeeke\Documents\Handy_scripts\XML-XSLT\DIES Object Filter\Input.xml")
xslt = ET.parse(r"C:\Users\jkakebeeke\Documents\Handy_scripts\XML-XSLT\DIES Object Filter\filterY.xslt")
transform = ET.XSLT(xslt)
newdom = transform(dom)
# print(ET.tostring(newdom, pretty_print=True))
with open('out.xml', 'w') as f:
  print(newdom, file=f)
f.close()
    


