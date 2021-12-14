from django.http import HttpResponse
# get datetime
import datetime
from django.shortcuts import render
 
# create a function
def geeks_view(request):
    now = datetime.datetime.now()
        # convert to string
    html = "Time is {}".format(now)
    print("ok")

    return render(request,'index.html',{'html':html})
