from flask import Flask,render_template,request,flash,session,redirect
from flask_mysqldb import MySQL
from flask_mail import Mail,Message

app=Flask(__name__)
mail_app=Flask(__name__)

#DB Related Parameters

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='May1994!!!!'
app.config['MYSQL_DB']='mobileshop'
app.config['SECURITY_FLASH_MESSAGES'] = True
app.secret_key = 'some_secret'

db=MySQL(app)

"""
mail_app.config['MAIL_SERVER']='www.gmail.com'
mail_app.config['MAIL_USERNAME']='praveenmg45@gmail.com'
mail_app.config['MAIL_PASSWORD']='Sehwag319!!'
mail_app.config['MAIL_PORT']=465
mail_app.config['MAIL_USE_SSL']=True
mail_app.config['MAIl_USE_TLS']=False

mail=Mail(mail_app)
"""
@app.route('/')
def home():
    return render_template("home.html")

@app.route("/signup",methods=['GET','POST'])
def signup():
    if request.method == 'POST':
        userdetails=request.form
        username=userdetails['username']
        id = userdetails['id']
        password = userdetails['password']
        num = userdetails['num']
        cur=db.connection.cursor()

        res=cur.execute("select * from profdb where id=%s", [id])
        if res > 0:
            flash("Email ID already exists")
        else:
            print("Inserting...")
            cur.execute("insert into profdb (username,id,password,num) values (%s,%s,%s,%s)", [username,id,password,int(num)])
            print("Inserted..")
            flash("Created Account Successfully...")
            """msg = Message("Vinayaka Enterprises",
                          sender="praveenmg45@gmail.com",
                          recipients=[id])
            print("Sending mail...")
            msg.body="Thanks for registering in Vinayaka Enterprises"
            mail.send(msg)
            print("Mail sent")"""
            db.connection.commit()

    return render_template("signup.html")

@app.route('/dashboard')
def dashboard():
    username=session.get('username',None)
    return render_template("dashboard.html",username=username)

@app.route('/login',methods=['GET','POST'])
def login():
    if request.method == 'POST':
        logindetails=request.form
        id=logindetails['id']
        password=logindetails['password']

        cur=db.connection.cursor()
        result=cur.execute("select * from profdb where id=%s AND password=%s", [id,password] )

        if result > 0:
            cur.execute("select username from profdb where id=%s", [id])
            username=cur.fetchall()
            session['username']=username
            name=username[0]
            return render_template('dashboard.html',username=name)
        else:
            flash('Invalid login')

    return render_template("login.html")

@app.route("/cart")
def cart():
        name = session.get('username', None)
        username=name[0]
        product=session.get('product',None)

        cur=db.connection.cursor()
        cart_res=cur.execute("select * from cart.mycart where username=%s AND product=%s",[username,product])

        if cart_res > 0:
            cur.execute("select * from cart.mycart where username=%s",[username])
            cartdetails=cur.fetchall()
            return render_template("cart.html",cartdetails=cartdetails,username=username)

        else:
            return "<html><head><script type='text/javascript'>alert('You do not have anything in your cart')</script></head></html>"

@app.route("/iphone7",methods=['GET','POST'])
def iphone7():
    if request.method=="POST":

        if 'Order' in request.form:
            username=session.get('username',None)
            product="Iphone"
            session['product'] = product
            cur=db.connection.cursor()
            print("Adding Order")
            cur.execute("insert into orderdb.details (username,product) values (%s,%s)", [username,product])
            db.connection.commit()
            print("Added Order")
            flash("Ordered Successfully")

        elif 'cart' in request.form:
            cur=db.connection.cursor()
            username=session.get('username',None)
            product='Iphone'
            session['product'] = product
            print("Adding to Cart")
            cur.execute("insert into cart.mycart (username,product) values (%s,%s)", [username,product])
            print("Added to cart")
            db.connection.commit()
            flash("Added to Cart Successfully")

    return render_template("iphone7.html")

@app.route("/samsung",methods=['GET','POST'])

def samsung():
    if request.method=="POST":

        if 'Order' in request.form:
            username=session.get('username',None)
            product="Samsung"
            session['product'] = product
            cur=db.connection.cursor()
            print("Adding Order")
            cur.execute("insert into orderdb.details (username,product) values (%s,%s)", [username,product])
            db.connection.commit()
            print("Added Order")
            flash("Ordered Successfully")

        elif 'cart' in request.form:
            cur=db.connection.cursor()
            product = "Samsung"
            session['product']=product
            username=session.get('username',None)
            product='Samsung'
            print("Adding to Cart")
            cur.execute("insert into cart.mycart (username,product) values (%s,%s)", [username,product])
            print("Added to cart")
            db.connection.commit()
            flash("Added to Cart Successfully")

    return render_template("samsung.html")

@app.route('/orders')
def order():
    name=session.get('username',None)
    username = name[0]
    cur=db.connection.cursor()
    result=cur.execute("select * from orderdb.details where username=%s", [username])
    if result > 0:
        userdetails=cur.fetchall()
        return render_template("orders.html",userdetails=userdetails,username=username)
    else:
        return "<html><head><script type='text/javascript'>alert('You have not ordered anything')</script></head></html>"

@app.route('/pwreset',methods=['GET','POST'])
def pwreset():
    if request.method == "POST":
        details=request.form
        id=details['id']
        new_password=details['password']
        confirm_password=details['pass']

        cur = db.connection.cursor()
        total=cur.execute("select * from mobileshop.profdb where id=%s", [id])

        if total > 0:
            if len(new_password) > 0:
                if new_password == confirm_password:
                    print("Updating password..")
                    cur.execute("update mobileshop.profdb set password=%s where id=%s", [new_password,id])
                    print("Updated password..")
                    db.connection.commit()
                    flash("Password Updated successfully")

                else:
                    flash("Both the passwords are not matching")
            else:
                flash("Password cannot be blank ")

        else:
            flash("Email ID does not exist")

    return render_template("pwreset.html")

if __name__=='__main__':
    app.run(debug=True)
    app.run(host='127.0.0.1',port=80)