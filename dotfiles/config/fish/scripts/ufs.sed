#!/bin/sed -f
/code/s/.Z()/.RZ.ID()/g
/code/s/.X()/.RX.ID()/g 
/code/s/.Y()/.RY.ID()/g
/code/s/.I5()/.RI.ID()/g
/execution/s/.Z()/.RZ.UID()/g
/execution/s/.X()/.RX.UID()/g 
/execution/s/.Y()/.RY.UID()/g
/execution/s/.I5()/.RI.UID()/g
