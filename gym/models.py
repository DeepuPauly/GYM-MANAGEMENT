from django.db import models

# Create your models here.


class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)


class trainer_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    photo=models.FileField()
    phone=models.BigIntegerField()
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    achievements=models.FileField()
    work_experience=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    pin=models.BigIntegerField()
    email=models.CharField(max_length=100)


class timeschedule_table(models.Model):
    trainers = models.ForeignKey(trainer_table, on_delete=models.CASCADE)
    starttime=models.TimeField()
    endtime=models.TimeField()
    day=models.CharField(max_length=100)

class user_table(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    photo=models.FileField()
    gender=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.BigIntegerField()
    phone=models.BigIntegerField()
    email=models.CharField(max_length=100)



class schedule_booking(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    timeschedule=models.ForeignKey(timeschedule_table,on_delete=models.CASCADE)
    date=models.DateField()
    time=models.TimeField()
    status=models.CharField(max_length=100)

class fee_table(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    schedule=models.ForeignKey(schedule_booking,on_delete=models.CASCADE)
    date=models.DateField()
    amount=models.IntegerField()
    status=models.CharField(max_length=100)


class product_table(models.Model):
    productname=models.CharField(max_length=100)
    image=models.FileField()
    price=models.FloatField()
    stock=models.IntegerField()
    details=models.CharField(max_length=100)


class rating_table(models.Model):
    trainers = models.ForeignKey(trainer_table, on_delete=models.CASCADE)
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    rating=models.FloatField()
    reviews=models.CharField(max_length=100)
    date=models.DateField()


class attendance_table(models.Model):
    trainers=models.ForeignKey(trainer_table,on_delete=models.CASCADE)
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    date=models.DateField()
    attendance=models.CharField(max_length=100)

class order_table(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    amount=models.FloatField()
    date=models.DateField()
    status=models.CharField(max_length=100)


class order_details(models.Model):
    order=models.ForeignKey(order_table,on_delete=models.CASCADE)
    product=models.ForeignKey(product_table,on_delete=models.CASCADE)
    status=models.CharField(max_length=100)
    date=models.DateField()
    quantity=models.IntegerField()




class video_table(models.Model):
    trainer=models.ForeignKey(trainer_table,on_delete=models.CASCADE)
    video=models.FileField()
    subject=models.CharField(max_length=100)
    date=models.DateField()


class foodhistory(models.Model):
    date=models.DateField()
    time=models.TimeField()
    food=models.CharField(max_length=100)
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)



class diatchart(models.Model):
    user=models.ForeignKey(user_table,on_delete=models.CASCADE)
    height=models.IntegerField()
    weight=models.IntegerField()
    age=models.IntegerField()
    gender=models.CharField(max_length=100)
    plan=models.TextField()
    diat=models.FileField()
    status=models.CharField(max_length=100)


class Diet_Details(models.Model):
    diet= models.CharField(max_length=50)
    desc = models.TextField()
    food_allowed = models.TextField()
    food_not_allowed =models.TextField()