from statsmodels.tsa.stattools import adfuller
import statsmodels.tsa.stattools as ts
import math
import numpy as np

#Keeps track of position
active_position = False

#Tracks portfolio value when trade was executed
entry_value = 0


def initialize(context):
    context.x = sid(2673)
    context.y = sid(40430)


def handle_data(context,data):
    cointegrated = False
    global active_position
    global entry_value

    x = data.history(context.x, "price", 60, "1m")
    y = data.history(context.y, "price", 60, "1m")
    x_is_stationary = adf(x)
    y_is_stationary = adf(y)

    if x_is_stationary and y_is_stationary:
        xy_coint = ts.coint(x,y)
        if xy_coint[1] < 0.05:
            cointegrated = True
        else:
            cointegrated = False

    if cointegrated:
        logx = np.log10(x)
        logy = np.log10(y)
        diff = logx - logy
        std = np.std(diff)
        mean = np.mean(diff)


        #Long x, Short y
        if not active_position and logx[-1]>logy[-1] and logx[-1]-logy[-1] > (mean+2*std):
            order_percent(context.x, 0.5)
            order_percent(context.y, -0.5)
            active_position = True
            entry_value = context.portfolio.portfolio_value

        #Long y, short x
        if not active_position and logx[-1]<logy[-1] and logy[-1]-logx[-1] > (mean+2*std):
            order_percent(context.y, 0.5)
            order_percent(context.x, -0.5)
            active_position = True
            entry_value = context.portfolio.portfolio_value

        #Exit trade if up 5%
        if active_position and context.portfolio.portfolio_value/entry_value >= 1.05:
            order_target_percent(context.x, 0)
            order_target_percent(context.y, 0)
            active_position = False

        #Stop Loss
        #if active_position and context.portfolio.portfolio_value/entry_value <= 0.99:
        #    order_target_percent(context.x, 0)
        #    order_target_percent(context.y, 0)
        #    active_position = False



#Augmented fuller test
def adf(x):
    adf_x = adfuller(x)
    if adf_x[0] >= adf_x[4]['10%']:
        return True
    else:
        return False