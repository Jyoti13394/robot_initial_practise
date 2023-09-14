from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.sel_lib= BuiltIn().get_library_instance("SeleniumLibrary")

    # A method name will automatically turn into key word name Hello World
    @keyword
    def hello_world(self):
        print("Hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productlist):
        i = 1
        products =self.sel_lib.get_webelements("css:.card-title")
        for product in products:
            if product.text in productlist:
                self.sel_lib.click_button("xpath:(//*[@class = 'card-footer'])["+str(i)+"]/button")
            i = i+1

