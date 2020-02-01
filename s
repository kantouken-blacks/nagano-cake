
[1mFrom:[0m /vagrant/nagano-cake/app/controllers/orders_controller.rb @ line 51 OrdersController#create_order:

    [1;34m46[0m: [32mdef[0m [1;34mcreate_order[0m
    [1;34m47[0m:   [1;34m# オーダーの保存[0m
    [1;34m48[0m:   @order = [1;34;4mOrder[0m.new
    [1;34m49[0m:   [1;34m# エラーIDどうやってとってくるか[0m
    [1;34m50[0m:   binding.pry
 => [1;34m51[0m:   @order.customer_id = current_customer.id
    [1;34m52[0m:   @order.address = session[[33m:address[0m]
    [1;34m53[0m:   @order.payment = session[[33m:payment[0m]
    [1;34m54[0m:   @order.total_price = calculate(current_customer)
    [1;34m55[0m:   @order.order_status = [1;34m0[0m
    [1;34m56[0m:   @order.save
    [1;34m57[0m: 
    [1;34m58[0m:   [1;34m# オーダー詳細の保存[0m
    [1;34m59[0m:   @order_detail = [1;34;4mOrderDetail[0m.new(order_detail_params)
    [1;34m60[0m:   @order_detail.order_id = current_customer.order.id
    [1;34m61[0m:   current_customer.cart_items.each [32mdo[0m |cart|
    [1;34m62[0m:   @order_detail.item_name = cart.item.name
    [1;34m63[0m:   @order_detail.item_price = cart.item.price
    [1;34m64[0m:   @order_detail.quantity = cart.quantity
    [1;34m65[0m:   [32mend[0m
    [1;34m66[0m:   @order_detail.item_status = [1;34m0[0m
    [1;34m67[0m:   @order_detail.save
    [1;34m68[0m: 
    [1;34m69[0m:   redirect_to thanks_path
    [1;34m70[0m: [32mend[0m

