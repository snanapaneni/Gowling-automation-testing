# def should_be_x_than (number1, relation, number2):
#     '''
#     This keyword makes relation between 2 numbers (it converts them to number)
#     Accepted relations:
#     < > <= => =
#     '''
#     if relation =="<":
#         return float(number1) < float(number2)
#     if relation ==">":
#         return float(number1) > float(number2)
#     if relation =="=>":
#         return float(number1) >= float(number2)
#     if relation =="<=":
#         return float(number1) <= float(number2)
#     if relation =="=":
#         return float(number1) == float(number2)
#
#
# def should_be_x_than_y (number1, relation, number2, relation1, number3):
#     '''
#     This keyword makes relation between 2 numbers (it converts them to number)
#     Accepted relations:
#     < > <= => =
#     '''
#     if relation =="<" and relation1 == "<":
#         print(relation)
#         print (relation1)
#         print (number1)
#         print (number2)
#         print (number3)
#         return float(number1) < float(number2) < float(number3)
#     if relation ==">" and relation1 == ">":
#         return float(number1) > float(number2) > float(number3)
#     if relation =="=>" and relation1 == "<=":
#         return float(number1) >= float(number2) <= float(number3)
#     if relation =="<=" and relation1 == "=>":
#         return float(number1) <= float(number2) >= float(number3)
#     if relation =="=":
#         return float(number1) == float(number2)


from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver import ActionChains
from Selenium2Library import Selenium2Library

class ExtendedSeleniumLibrary (Selenium2Library):
    # @keyword("Right Click Element")
    def Right_Click(self, xpath):
        driver = self._current_browser()

        actionChains = ActionChains(driver)

        element=driver.find_element_by_xpath(str(xpath))

        actionChains.context_click(element).perform()