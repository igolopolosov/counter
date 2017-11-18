#!/bin/bash 
COUNTER=1
while [ $COUNTER -lt 1000000 ]; do   
   echo $COUNTER
   echo $COUNTER > README.md
   git add README.md
   git commit -m "$COUNTER"
   
   if (( $COUNTER % 1000 == 0 ))
      then
         echo repack, tag and push
         git repack
         git prune-packed
         git tag $COUNTER 
         git push origin master --tags
      fi

   let COUNTER=COUNTER+1
done
