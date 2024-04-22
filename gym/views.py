import datetime
import json

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from gym.Predictionile import predict_diet
from gym.models import *



def mainpage(request):
    return render(request,'mainindex.html')






def login_pg(request):
    return render(request,'index.html')


def logout(request):
    auth.logout(request)
    return render(request,'index.html')




def login_post(request):
 try:
     username = request.POST['textfield']
     password = request.POST['textfield2']
     login_obj = login_table.objects.get(username=username, password=password)
     if login_obj.type == "admin":
         ob1 = auth.authenticate(username='admin', password='admin')
         if ob1 is not None:
             auth.login(request, ob1)
         return HttpResponse('''<script>window.location="/adminho"</script>''')
     elif login_obj.type == "trainer":
         ob1 = auth.authenticate(username='admin', password='admin')
         if ob1 is not None:
             auth.login(request, ob1)
         request.session['lid']=login_obj.id
         return HttpResponse('''<script>window.location="/tainer"</script>''')
     else:
         return HttpResponse('''<script> alert("invalid"); window.location="/"</script>''')
 except:
     return HttpResponse('''<script> alert("invalid"); window.location="/"</script>''')


@login_required(login_url='/')
def addtime1(request):
    ob=trainer_table.objects.all()
    return render(request,'admin/add time 1.html',{"val":ob})



@login_required(login_url='/')
def addtime(request):
    ob=timeschedule_table.objects.all()
    return render(request,'admin/add time.html', {"val": ob})


@login_required(login_url='/')
def deleteaddtime(request,id):
    ob=timeschedule_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script> alert("sucessfully delete"); window.location="/addtime"</script>''')


@login_required(login_url='/')
def editrainer(request,id):
    request.session['et']=id
    ob=trainer_table.objects.get(id=id)
    return render(request,'admin/edittrainer.html',{"val":ob})



@login_required(login_url='/')
def addtime2(request):
    trainer = request.POST['select1']
    starts = request.POST['textfield']
    end = request.POST['textfield2']
    day = request.POST['select']

    ob=timeschedule_table()
    ob.trainers=trainer_table.objects.get(id=trainer)
    ob.starttime=starts
    ob.endtime=end
    ob.day=day
    ob.save()
    return HttpResponse('''<script> alert("Add Success"); window.location="/addtime"</script>''')

@login_required(login_url='/')
def addtimeedit(request,id):
    request.session['at']=id
    obb=trainer_table.objects.all()
    ob=timeschedule_table.objects.get(id=id)
    return render(request,'admin/edittime.html',{"val":ob, 'f_time': str(ob.starttime), 't_time': str(ob.endtime),'val1':obb})


@login_required(login_url='/')
def edittimepost(request):
    trainer = request.POST['select1']
    starts = request.POST['textfield']
    end = request.POST['textfield2']
    day = request.POST['select']

    ob = timeschedule_table.objects.get(id=request.session['at'])
    ob.trainers = trainer_table.objects.get(id=trainer)
    ob.starttime = starts
    ob.endtime = end
    ob.day = day
    ob.save()
    return HttpResponse('''<script> alert("Edit Success"); window.location="/addtime"</script>''')

@login_required(login_url='/')
def addtrian(request):
    return render(request,'admin/add trin.html')


@login_required(login_url='/')
def addtrainer(request):
    firstname = request.POST['textfield']
    lastname = request.POST['textfield2']
    gender = request.POST['radiobutton']
    photo = request.FILES['textfield3']
    FS=FileSystemStorage()
    fn=FS.save(photo.name,photo)
    place = request.POST['textfield4']
    post = request.POST['textfield5']
    pin = request.POST['textfield6']
    certificate = request.FILES['textfield7']
    fp=FileSystemStorage()
    fd=fp.save(certificate.name,certificate)
    experience = request.POST['textfield8']
    phone = request.POST['textfield9']
    email = request.POST['textfield10']
    username = request.POST['textfield11']
    password = request.POST['textfield12']
    ob=login_table()
    ob.username=username
    ob.password=password
    ob.type='trainer'
    ob.save()
    ob1=trainer_table()
    ob1.firstname=firstname
    ob1.lastname=lastname
    ob1.gender=gender
    ob1.photo=fn
    ob1.place=place
    ob1.post=post
    ob1.pin=pin
    ob1.achievements=fd
    ob1.work_experience=experience
    ob1.phone=phone
    ob1.email=email
    ob1.login=ob
    ob1.save()
    return HttpResponse('''<script> alert("sucessfully"); window.location="/managetrainer"</script>''')





@login_required(login_url='/')
def adminho(request):
    return render(request,'admin/admin home.html')

@login_required(login_url='/')
def manageprod(request):
    ob=product_table.objects.all()
    return render(request,'admin/manage products.html', {"val": ob})


@login_required(login_url='/')
def manageprod_search(request):
    search = request.POST['textfield']
    ob=product_table.objects.filter(productname__istartswith=search)
    return render(request,'admin/manage products.html', {"val": ob,'name':search})



@login_required(login_url='/')
def deletemanageprod(request,id):
    ob=product_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script> alert("sucessfully delete"); window.location="/manageprod"</script>''')

@login_required(login_url='/')
def add_prod(request):
    return render(request,'admin/add product.html')



@login_required(login_url='/')
def manage2(request):
    product = request.POST['textfield']
    image = request.FILES['file']
    FB=FileSystemStorage()
    fa=FB.save(image.name,image)
    price = request.POST['textfield3']
    stock = request.POST['textfield4']
    details = request.POST['textfield5']
    ob=product_table()
    ob. productname=product
    ob.image=fa
    ob.price=price
    ob.stock=stock
    ob.details=details
    ob.save()
    return HttpResponse('''<script> alert("Add sucessfully"); window.location="/manageprod"</script>''')



@login_required(login_url='/')
def editmanageproduct(request,id):
    request.session['mp'] = id
    ob=product_table.objects.get(id=id)
    return render(request,'admin/editmanage products.html',{"val":ob})



@login_required(login_url='/')
def editmanageproductspot(request):
    if "file" in request.FILES:
        product = request.POST['textfield']
        image = request.FILES['file']
        FB = FileSystemStorage()
        fa = FB.save(image.name, image)
        price = request.POST['textfield3']
        stock = request.POST['textfield4']
        details = request.POST['textfield5']
        ob = product_table.objects.get(id=request.session['mp'])
        ob.productname = product
        ob.image = fa
        ob.price = price
        ob.stock = stock
        ob.details = details
        ob.save()
        return HttpResponse('''<script> alert("sucessfully"); window.location="/manageprod"</script>''')
    else:
        product = request.POST['textfield']

        price = request.POST['textfield3']
        stock = request.POST['textfield4']
        details = request.POST['textfield5']
        ob = product_table.objects.get(id=request.session['mp'])
        ob.productname = product
        ob.price = price
        ob.stock = stock
        ob.details = details
        ob.save()
        return HttpResponse('''<script> alert("sucessfully"); window.location="/manageprod"</script>''')



@login_required(login_url='/')
def managetrainer(request):
    ob=trainer_table.objects.all()
    return render(request,'admin/manage tainer.html',{"val":ob})

@login_required(login_url='/')
def managetrainer_search(request):
    search = request.POST['textfield']
    ob=trainer_table.objects.filter(firstname__istartswith=search)
    return render(request,'admin/manage tainer.html',{"val":ob,"s":search})

@login_required(login_url='/')
def deletemanagetriner(request,id):
    ob=login_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script> alert("sucessfully delete"); window.location="/managetrainer"</script>''')



@login_required(login_url='/')
def editrainer(request,id):
    request.session['et']=id
    ob=trainer_table.objects.get(id=id)
    return render(request,'admin/edittrainer.html',{"val":ob})




@login_required(login_url='/')
def edittrainerpost(request):
    try:
        firstname = request.POST['textfield']
        lastname = request.POST['textfield2']
        gender = request.POST['radiobutton']
        photo = request.FILES['textfield3']
        FS = FileSystemStorage()
        fn = FS.save(photo.name, photo)
        place = request.POST['textfield4']
        post = request.POST['textfield5']
        pin = request.POST['textfield6']
        certificate = request.FILES['textfield7']
        fp = FileSystemStorage()
        fd = fp.save(certificate.name, certificate)
        experience = request.POST['textfield8']
        phone = request.POST['textfield9']
        email = request.POST['textfield10']

        ob1 = trainer_table.objects.get(id=request.session['et'])
        ob1.firstname = firstname
        ob1.lastname = lastname
        ob1.gender = gender
        ob1.photo = fn
        ob1.place = place
        ob1.post = post
        ob1.pin = pin
        ob1.certificate = fd
        ob1.experience = experience
        ob1.phone = phone
        ob1.email = email
        ob1.save()
        return HttpResponse('''<script> alert("Edit Success"); window.location="/managetrainer"</script>''')
    except:
        firstname = request.POST['textfield']
        lastname = request.POST['textfield2']
        gender = request.POST['radiobutton']
        place = request.POST['textfield4']
        post = request.POST['textfield5']
        pin = request.POST['textfield6']
        experience = request.POST['textfield8']
        phone = request.POST['textfield9']
        email = request.POST['textfield10']

        ob1 = trainer_table.objects.get(id=request.session['et'])
        ob1.firstname = firstname
        ob1.lastname = lastname
        ob1.gender = gender
        ob1.place = place
        ob1.post = post
        ob1.pin = pin

        ob1.experience = experience
        ob1.phone = phone
        ob1.email = email
        ob1.save()
        return HttpResponse('''<script> alert("Edit Success"); window.location="/managetrainer"</script>''')


@login_required(login_url='/')
def viewfeeinfor(request):
    ob=fee_table.objects.all()
    return render(request,'admin/view fee info.html',{"val":ob})



@login_required(login_url='/')
def viewfeeinfor_search(request):
    fromm = request.POST['textfield']
    to =  request.POST['textfield2']
    ob=fee_table.objects.filter(date__gte=fromm,date__lte=to)
    return render(request,'admin/view fee info.html',{"val":ob,'date':fromm,'date1':to})



@login_required(login_url='/')
def vieworder(request):
    ob=order_table.objects.all()
    return render(request,'admin/view order.html',{"val":ob})



@login_required(login_url='/')
def viewprod(request,id):
    print("@@@@@@@@@@@@@@@@@@@@@", id)
    ob=order_details.objects.filter(order__id=id,status='order')
    print("$$$$$$$$$$$$$$$$$$$$$$$$", ob)
    return render(request,'admin/view product.html',{"val":ob})



@login_required(login_url='/')
def viewratin(request):
    ob1=trainer_table.objects.all()
    ob=rating_table.objects.all()
    return render(request,'admin/view rating.html',{"val":ob,'val1':ob1})



@login_required(login_url='/')
def viewratin_search(request):
    search = request.POST['select']
    ob1=trainer_table.objects.all()
    ob=rating_table.objects.filter(trainers__id=search)
    return render(request,'admin/view rating.html',{"val":ob,'val1':ob1,"s":int(search)})

@login_required(login_url='/')
def viewuse(request):
    ob=user_table.objects.all()
    return render(request,'admin/view user.html',{"val":ob})


@login_required(login_url='/')
def viewuse_search(request):
    search = request.POST['textfield']
    ob=user_table.objects.filter(firstname__istartswith=search)
    return render(request,'admin/view user.html',{"val":ob,'vall':ob,"s":search})

# def viewuse_searchtra(request):
#     fromm = request.POST['textfield']
#     to =  request.POST['textfield2']
#     ob=user_table.objects.filter(firstname__istartswith=from)
#     return render(request,'admin/view user.html',{"val":ob})



#_________________________TRAINER_________________________

@login_required(login_url='/')
def addattendan(request):
    obj=schedule_booking.objects.filter(timeschedule__trainers__login_id=request.session['lid'])
    return render(request,'trainer/add attendancne.html',{"val":obj})



@login_required(login_url='/')
def addattendanpost(request):
    user_id = request.POST.getlist('checkbox')
    print(user_id,"=======================")
    for i in user_id:
        obb=attendance_table.objects.filter(user__id=i,date=datetime.datetime.today())
        if len(obb)==0:
            ob=attendance_table()
            ob.user=user_table.objects.get(id=i)
            ob.trainers=trainer_table.objects.get(login__id=request.session['lid'])
            ob.attendance='1'
            ob.date=datetime.datetime.today()
            ob.save()
        else:
            return HttpResponse('''<script> alert("Already added!!"); window.location="/manageattendance"</script>''')

    return redirect('/manageattendance')



@login_required(login_url='/')
def addvid(request):

    return render(request,'trainer/add videos.html')



@login_required(login_url='/')
def addvideos(request):
    subject=request.POST['textfield']
    videos=request.FILES['file']
    fi=FileSystemStorage()
    fq=fi.save(videos.name,videos)
    ob=video_table()
    ob.subject=subject
    ob.video=fq
    ob.trainer=trainer_table.objects.get(login__id=request.session['lid'])
    ob.date=datetime.datetime.today()
    ob.save()
    return HttpResponse('''<script> alert("sucessfully"); window.location="/managevideos"</script>''')

@login_required(login_url='/')
def manageattendance(request):
    ob=attendance_table.objects.filter(trainers__login__id=request.session['lid'])
    return render(request,'trainer/manage attendance.html',{"val":ob})


@login_required(login_url='/')
def manageattendance_search(request):
    fromm = request.POST['textfield']
    to = request.POST['textfield2']
    ob = attendance_table.objects.filter(date__gte=fromm, date__lte=to)
    return render(request, 'trainer/manage attendance.html', {"val": ob, 'date': fromm, 'date1': to})



@login_required(login_url='/')
def managevideos(request):
    ob=video_table.objects.filter(trainer__login__id=request.session['lid'])
    return render(request,'trainer/manage videos.html', {"val":ob})



@login_required(login_url='/')
def deletemanagevideos(request,id):
    ob = video_table.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script> alert("sucessfully delete"); window.location="/managevideos"</script>''')

@login_required(login_url='/')
def tainer(request):
    return render(request,'trainer/trainer form.html')




@login_required(login_url='/')
def viewratng(request):
    ob=rating_table.objects.filter(trainers__login__id=request.session['lid'])
    return render(request,'trainer/veiw rating.html',{"val":ob})


@login_required(login_url='/')
def verifyschedule(request):
    ob=schedule_booking.objects.filter(timeschedule__trainers__login__id=request.session['lid'])
    return render(request,'trainer/verify schedule booking.html',{"val":ob})



@login_required(login_url='/')
def acceptverifyschedule(request,id):
    ob=schedule_booking.objects.get(id=id)
    ob.status='accept'
    ob.save()
    return HttpResponse('''<script> alert("accepted"); window.location="/verifyschedule"</script>''')

@login_required(login_url='/')
def rejectverifyschedule(request,id):
    ob=schedule_booking.objects.get(id=id)
    ob.status='reject'
    ob.save()
    return HttpResponse('''<script> alert("reject"); window.location="/verifyschedule"</script>''')

@login_required(login_url='/')
def searchverifyschedule(request):
    date=request.POST['t2']
    ob=schedule_booking.objects.filter(date=date)
    return render(request,'trainer/verify schedule booking.html',{"val":ob})



@login_required(login_url='/')
def viewfood(request):
    return render(request,'trainer/veiw rating.html')



@login_required(login_url='/')
def viewuser(request):
    ob=user_table.objects.all()
    return render(request,'trainer/view user.html',{"val":ob})


@login_required(login_url='/')
def viewuse_searchh(request):
    search = request.POST['textfield']
    ob=user_table.objects.filter(firstname__istartswith=search)
    return render(request,'trainer/view user.html',{"val":ob,'vall':ob,"s":search})

@login_required(login_url='/')
def foodhistoryy(request):
    ob=foodhistory.objects.all()
    return  render(request,"trainer/view foodhistory.html",{"val":ob})



@login_required(login_url='/')
def viewtimesce(request):
    ob=timeschedule_table.objects.filter(trainers__login__id=request.session['lid'])
    return render(request,'trainer/viewtime scheu.html',{"val":ob})






@login_required(login_url='/')
def expert_dietchart(request):
    # ob = assign.objects.filter(DIET_EXPERT__LOGIN__id=request.session['lid'])
    # r=[]
    # for i in ob:
    #     r.append(i.USER.id)
    ob = diatchart.objects.filter(status='pending')
    return render(request, 'trainer/diet_chart.html',{'val':ob})

@login_required(login_url='/')
def accept_diet(request,id):

    ob = diatchart.objects.get(id=id)
    ob.status="accepted"
    ob.save()

    return HttpResponse('''<script>alert("Accepted");window.location='/expert_dietchart'</script>''')


@login_required(login_url='/')
def reject_diet(request,id):

    ob = diatchart.objects.get(id=id)
    ob.status="rejected"
    ob.save()

    return HttpResponse('''<script>alert("Rejected");window.location='/expert_dietchart'</script>''')


# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5web-service%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


def login_code(request):
    print(request.POST)
    un = request.POST['uname']
    pwd = request.POST['pass']
    print(un, pwd)
    try:
        users = login_table.objects.get(username=un, password=pwd,type='user')
        print(users,"ooooooooooooooooooooooo")

        if users is None:
            data = {"task": "invalid"}
        else:
            print("in user function")
            data = {"task": "valid", "id": users.id,"type":users.type}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)

def registration(request):
        firstname = request.POST['Firstname']
        lastname = request.POST['Lastname']
        place = request.POST['Place']
        post_office = request.POST['Post']
        pin_code = request.POST['Pin']
        phone = request.POST['Phone']
        gender = request.POST['Gender']
        email_id = request.POST['Email']
        username = request.POST['Username']
        password = request.POST['Password']
        image = request.FILES['file']
        fs = FileSystemStorage()
        fsave = fs.save(image.name, image)

        lob = login_table()
        lob.username = username
        lob.password = password
        lob.type = 'user'
        lob.save()

        user_obj = user_table()
        user_obj.firstname = firstname
        user_obj.lastname = lastname
        user_obj.place = place
        user_obj.post = post_office
        user_obj.pin = pin_code
        user_obj.phone = phone
        user_obj.photo = fsave
        user_obj.gender = gender
        user_obj.email = email_id
        user_obj.login = lob
        user_obj.save()
        data = {"task": "success"}
        r = json.dumps(data)
        return HttpResponse(r)



def trainer_views(request):
    ob = trainer_table.objects.all()
    data = []
    for i in ob:
        row = {'name': i.firstname+i.lastname,'phone':i.phone,'photo':i.photo.url,'work_experience':i.work_experience,'place':i.place ,'post':i.post,'gender':i.gender,'pin':i.pin,'email':i.email,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def product_views(request):
    ob = product_table.objects.all()
    data = []
    for i in ob:
        row = {'productname':i.productname,'image':i.image.url,'price':i.price,'stock':i.stock,'details':i.details,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def product_search(request):
    name=request.POST['name']
    ob = product_table.objects.filter(productname__istartswith=name)
    data = []
    for i in ob:
        row = {'productname':i.productname,'image':i.image.url,'price':i.price,'stock':i.stock,'details':i.details,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def schedule_views(request):
    tid=request.POST['tid']
    ob = timeschedule_table.objects.filter(trainers__id=tid)
    data = []
    for i in ob:
        row = {'starttime':str(i.starttime),'endtime':str(i.endtime),'day':i.day,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def addappointment(request):
    # review = request.POST['review']
    # tid = request.POST['tid']
    ttid = request.POST['ttid']
    lid = request.POST['lid']


    lob = schedule_booking()
    lob.user = user_table.objects.get(login__id=lid)
    lob.date = datetime.datetime.now().strftime("%Y-%m-%d")
    lob.time = datetime.datetime.now()
    lob.timeschedule = timeschedule_table.objects.get(id=ttid)
    lob.status='pending'
    lob.save()

    data = {"task": "valid","bid":lob.id}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)




def order_views(request):
    ob = order_table.objects.all()
    data = []
    for i in ob:
        row = {'user':i.user,'amount':i.amount,'date':str(i.date )}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def orderhistory_views(request):
    ob = order_details.objects.all()
    data = []
    for i in ob:
        row = {'order':i.order,'product':i.product,'quantity':i.quantity,'amount':i.amount,'status':i.status,'date':str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def video_views(request):
    tid=request.POST['tid']
    ob = video_table.objects.filter(trainer__id=tid)
    data = []
    for i in ob:
        row = {'video':i.video.url,'subject':i.subject,'date':str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def viewfoods(request):
    lid=request.POST['lid']
    ob = foodhistory.objects.filter(user__login__id=lid)
    data = []
    for i in ob:
        row = {'food':i.food,'time':str(i.time),'date':str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def viewbooking(request):
    lid=request.POST['lid']
    ob = schedule_booking.objects.filter(user__login__id=lid)
    data = []
    for i in ob:
        row = {'timeschedule':str(i.timeschedule.starttime)+" "+str(i.timeschedule.endtime),'time':str(i.time),'date':str(i.date),'status':i.status,'id':i.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)









def rating_app(request):
    a = request.POST["rating"]
    b = request.POST["review"]
    usrid= request.POST["lid"]
    tid= request.POST["tid"]
    ob = rating_table()
    ob.rating=  a
    ob.reviews=b
    ob.date= datetime.datetime.now()
    ob.user = user_table.objects.get(login__id=usrid)
    ob.trainers = trainer_table.objects.get(id=tid)
    ob.save()
    data = {'task': "success"}
    r = json.dumps(data)
    return HttpResponse(r)



def foodmanagement(request):
    a = request.POST["food"]
    b = request.POST["date"]
    c = request.POST["time"]
    usrid= request.POST["lid"]
    ob = foodhistory()
    ob.date=  b
    ob.time=c
    ob.food= a
    ob.user = user_table.objects.get(login__id=usrid)
    ob.save()
    data = {'task': "success"}
    r = json.dumps(data)
    return HttpResponse(r)






def vieworderstatus(request):
    uid=request.POST['lid']
    ob=order_details.objects.filter(order__user__login__id=uid).exclude(order__status='cart')
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    total=0
    tt=0
    for i in ob:
        # obf = Offer.objects.filter(PRODUCT__id=i.PRODUCT.id, fromdate__lte=datetime.datetime.today(),
        #                            todate__gte=datetime.datetime.today())
        # print(obf, "+++++++++++=============")
        # tt1=int(i.quantity) * int(i.PRODUCT.price)
        # if len(obf) > 0:
        #     i.OFFER = obf[0].offer
        #     tt1 = tt1- (tt1 * float(obf[0].offer) / 100)
        #     print(tt1,")000000000000000")
        #     total = (int(i.quantity) * int(i.PRODUCT.price)) - int(tt1)
        # else:
        #     i.OFFER = '0'
        #     total = int(i.quantity) * int(i.PRODUCT.price)
        data={'product':i.product.productname,'status':i.status,'date': str(i.order.date),'total':i.order.amount}
        mdata.append(data)
        print(mdata)
    r=json.dumps(mdata)
    return HttpResponse(r)



def viewaddtocart(request):
    lid=request.POST['lid']
    ob=order_details.objects.filter(order__status='cart',order__user__login__id=lid)
    if len(ob) == 0:
        # return JsonResponse({"total":""})
        data={'total':"0"}
        r=json.dumps(data)
        return HttpResponse(r)
    print(ob,"HHHHHHHHHHHHHHH")
    tamt=0
    mdata = []
    tot=0
    # for i in ob:
    #    tot = int(i.quantity) * int(i.PRODUCT.price)
    #    tamt = int(tamt) + int(tot)
    for i in ob:
        ob1 = order_table.objects.filter(id=i.order.id)
        # print(ob1,"jjjjjjjjjjjjjjjjjjjjjjjjjjjj")
        data = {'product':i.product.productname, 'image':str(i.product.image),'quantity':i.quantity,'price':i.product.price,'pid':i.id,'oid':ob1[0].id,'amt':ob1[0].amount}
        mdata.append(data)
        print(mdata)
        # tot = int(i.quantity) * int(i.PRODUCT.price)
        # tamt+= int(i.quantity)*int(i.PRODUCT.price)
    # r = json.dumps(mdata)
        tob=order_table.objects.get(id=i.order.id)
    tamt=tob.amount
    print(tamt,"=======================")
    return JsonResponse({"data":mdata,"total":str(tamt)})


def cancel_s_order(request):
    oid=request.POST['oid']
    ob=order_details.objects.get(id=oid)
    p = product_table.objects.get(id=ob.product.id)
    p.stock=int(p.stock)-int(ob.quantity)
    p.save()
    obb=order_table.objects.get(id=ob.order.id)
    obb.amount=int(obb.amount)-(int(ob.quantity)*int(ob.product.price))
    obb.save()
    ob.delete()
    data = {"task": "valid"}
    r = json.dumps(data)


    print(r)
    return HttpResponse(r)



def orders(request):
    print(request.POST, "=================================")
    pro_id = request.POST['pid']
    qty = request.POST['quantity']
    lid = request.POST['lid']
    # off = request.POST['offer']
    print(pro_id, "PPPPPPPPPPPPPPPPPPPPPPP")
    print(qty, "qqqqqqqqqqqqqqqqqqqqqqq")
    print(lid, "lllllllllllllllllllllllll")

    ob = product_table.objects.get(id=pro_id)
    tt = int(ob.price) * int(qty)
    stock = ob.stock
    print(stock, "SSSSSSSSSSSSSSSSSSSSSSSSS")
    print(ob.stock, "bbbbbbbbbbbbbbbbbb")

    nstk = int(stock) - int(qty)
    print(nstk, "OOOOOOOOOOOOOOOOOOOO")
    if int(stock) >= int(qty):
        up = product_table.objects.get(id=pro_id)
        up.stock = nstk
        up.save()

        ob = order_table()
        ob.user = user_table.objects.get(login__id=lid)
        ob.status = 'order'
        ob.date = datetime.datetime.now()
        ob.amount = tt
        ob.save()


        obj = order_details()
        obj.order = ob
        obj.product = product_table.objects.get(id=pro_id)
        obj.quantity = qty
        obj.status = 'order'
        obj.date = datetime.datetime.today()


        obj.save()
        id = ob.id
        data = {"task": "valid", "oid": id, "tt": str(tt)}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)





    else:
        data = {"task": "out of stock"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)




def add_to_cart(request):
    print(request.POST, "=================================")
    pro_id = request.POST['pro_id']
    qty = request.POST['quantity']
    lid = request.POST['lid']
    print(pro_id, "PPPPPPPPPPPPPPPPPPPPPPP")
    print(qty, "qqqqqqqqqqqqqqqqqqqqqqq")
    print(lid, "lllllllllllllllllllllllll")

    ob = product_table.objects.get(id=pro_id)
    tt = int(ob.price) * int(qty)
    print(tt, "price=====================tt========")
    stock = ob.stock
    print(stock, "SSSSSSSSSSSSSSSSSSSSSSSSS")
    nstk = int(stock) - int(qty)
    print(nstk, "OOOOOOOOOOOOOOOOOOOO")
    if int(stock) >= int(qty):
        up = product_table.objects.get(id=pro_id)
        up.stock = nstk
        up.save()

        q = order_table.objects.filter(user__login__id=lid, status='cart')
        if len(q) == 0:

            obe = order_table()
            obe.amount = tt
            obe.status = 'cart'
            obe.date = datetime.datetime.now().strftime("%Y-%m-%d")

            obe.user = user_table.objects.get(login__id=lid)
            obe.save()
            # obf = Offer.objects.filter(PRODUCT__id=up.id, fromdate__lte=datetime.datetime.today(),
            #                            todate__gte=datetime.datetime.today())
            # print(obf, "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII")
            obe1 = order_details()
            obe1.quantity = qty
            obe1.order = obe
            obe1.status = 'order'
            obe1.product = up
            obe1.date = datetime.datetime.now()

            # if len(obf) > 0:
            #     obe1.OFFER = obf[0].offer
            #     tt = tt - (tt * float(obf[0].offer) / 100)
            #     obe.total = tt
            #     print("ooooooooooooooooooooooooo")
            #     obe.save()
            # else:
            #     obe1.OFFER = '0'

            obe1.save()
            data = {"task": "valid"}
            r = json.dumps(data)
            print(r)
            return HttpResponse(r)
        else:
            total = int(ob.price) + int(tt)
            print(total, "KKKKKKKKKKKKKKKK")

            obr = order_table.objects.get(id=q[0].id)
            # obr. total= total
            # obr.status = 'cart'
            # obr.save()
            obr1 = order_details()
            obr1.quantity = qty
            obr1.order = obr
            obr1.product = up
            obr1.date = datetime.datetime.today()
            obr1.status = 'order'
            # obf = Offer.objects.filter(PRODUCT__id=up.id, fromdate__lte=datetime.datetime.today(),
            #                            todate__gte=datetime.datetime.today())
            # print(obf, "+++++++++++=============")
            # if len(obf) > 0:
            #     obr1.OFFER = obf[0].offer
            #     tt = tt - (tt * float(obf[0].offer) / 100)
            #     total = int(obr.total) + int(tt)
            #     obr.total = total
            #
            #     obr.save()
            # else:
            #     obr1.OFFER = '0'
            #     total = int(obr.total) + int(tt)
            #     print(total, "===========+++++++++++")
            #     obr.total = total
            #
            #     obr.save()
            obr1.save()
            data = {"task": "valid", "tt": str(tt)}

            r = json.dumps(data)
            print(r)
            return HttpResponse(r)

        data = {"task": "valid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)



    else:
        data = {"task": "out of stock"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)



def payment_sucess(request):
    amount=request.POST['amt']
    lid=request.POST['lid']
    oid=request.POST['orderid']
    lob=fee_table()
    lob.user = user_table.objects.get(login__id=lid)
    lob.date=datetime.datetime.now().strftime("%Y-%m-%d")
    lob.status='paid'
    lob.amount=amount
    lob.schedule=schedule_booking.objects.get(id=oid)
    lob.save()
    data = {"task": "success"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)




def diet_details(request):
    idd=request.POST['lid']

    # plan = models.TextField()
    # diet = models.FileField()
    # date = models.DateField()
    # status = models.CharField(max_length=50)

    ob = diatchart.objects.filter(user__login__id=idd)
    data = []
    for i in ob:
        row = { "diet": i.diat.url,"status":i.status,"type":i.plan}
        data.append(row)
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def user_report(request):

    id=request.GET['id']
    ob=diatchart.objects.filter(user__login__id=id)
    x=[]
    y=[]
    j=1
    for i in ob:
        x.append(j)
        y.append(int(i.weight))
        j=j+1
    print(x,y)
    return render(request,"userchart.html",{"x":x,"y":y})


def diet_prediction(request):
    idd=request.POST['lid']
    age=request.POST['age']
    gender=request.POST['gender']
    iw=request.POST['iw']
    fw=request.POST['fw']
    he=request.POST['he']
    r=[float(gender),float(age),float(he),float(iw),float(fw)]
    res=predict_diet(r)
    res=int(res)+1
    print(res,"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    obp=Diet_Details.objects.get(id=res)
    print(obp,"pppppppppppppp")
    ob=diatchart()
    ob.user=user_table.objects.get(login__id=idd)
    ob.height = he
    ob.weight = iw
    ob.age = age
    ob.gender = gender
    ob.plan=obp.diet
    ob.diat=str(res)+".jpg"
    ob.status='pending'
    ob.save()
    print(res,"========================================")

    # diet = models.CharField(max_length=50)
    # desc = models.TextField()
    # food_allowed = models.TextField()
    # food_not_allowed = models.TextField()
    return JsonResponse({"diet":obp.diet,"desc":obp.desc,"fa":obp.food_allowed,"fna":obp.food_not_allowed})



