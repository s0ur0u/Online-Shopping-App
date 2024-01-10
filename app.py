from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

@app.route('/')
def Display_Content():
    cnx = mysql.connector.connect(  user='root', 
                                password='MyPassword', 
                                host='127.0.0.1', 
                                database='OnlineShopping',
                                port='3306',
                                auth_plugin='mysql_native_password'
                             )

    table1 = 'Products'
    table2 = 'Manifacturer'
    table3 = 'Supplied'
    cursor = cnx.cursor()

    #query1 = (f'INSERT INTO {table1} values("Z45","Wind Chimes Lights","$20");')
    #cursor.execute(query1)

    #query2 = (f'INSERT INTO {table2} values("069","Qunpon","Houston");')
    #cursor.execute(query2)

    #query3 = (f'INSERT INTO {table3} values("069","Z45","2012-10-14");')
    #cursor.execute(query3)

    #query = (f'select * from {table3};')
    query = (f'SELECT Products.Name, Products.Price, Supplied.estimated_delivery FROM (({table1} INNER JOIN {table3} ON Products.ID=Supplied.ProductID) INNER JOIN {table2} ON Manifacturer.ID=Supplied.ManifacturerID);')
    cursor.execute(query)
    data = cursor.fetchall()

    query = (f'commit;')
    cursor.execute(query)

    cursor.close()
    cnx.close()  

    return render_template('display.html', data=data)

@app.route('/home.html')  # Route for home.html
def home():
    return render_template('home.html')

if __name__ == '__main__':
    app.run(debug=True, host="127.0.0.1", port=3307)
