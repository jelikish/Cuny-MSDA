from sklearn.ensemble import RandomForestClassifier
from collections import deque
import numpy as np

active_position = False
order_price = 0
active_position_short = False
active_position_long = False


def initialize(context):
    context.security = sid(8554) # set the security
    context.window_length = 10 # number of bars or edges in a single decision tree

    context.classifier = RandomForestClassifier() # Use a random forest classifier

    # deques are lists with a maximum length where old entries are shifted out

    context.diff = deque(maxlen=context.window_length + 2)
    context.recent_prices = deque(maxlen=context.window_length + 2)
    context.recent_value = deque(maxlen=context.window_length + 2) # Stores recent prices add two to make sure there is enough room
    context.X = deque(maxlen=500) # Independent, or input variables x1, x2, x3... ,xn
    context.Y = deque(maxlen=500) # Dependent, or output variable Y

    context.prediction = 0 # Stores most recent prediction
    # set_slippage(slippage.VolumeShareSlippage(volume_limit=0.025, price_impact=0.1))
    # set_commission(commission.PerShare(cost=0.0075, min_trade_cost=1))


def handle_data(context, data):
    global active_position
    global order_price
    global active_position_long
    global active_position_short


    sma5 = data.history(context.security, 'price', 5, '1m').mean()
    sma30 = data.history(context.security, 'price', 30, '1m').mean()
    diff = sma5 - sma30

    sma200 = data.history(context.security, 'price', 200, '1m').mean()
    sma50 = data.history(context.security, 'price', 50, '1m').mean()
    cross_200_50 = sma50 - sma200

    context.diff.append([diff])
    context.recent_prices.append(data.current(context.security, 'price')) # append recent price to the list
    context.recent_value.append([data.current(context.security, 'price')]) #,
                                 # data.current(context.security, 'volume'),
                                 # data.history(context.security, 'price', 10, '1d').mean()])

    if len(context.recent_prices) == context.window_length + 2: # If there's enough recent price data

        # Make a list of 1's and 0's, 1 when the price increased from the prior bar
        changes = np.diff(context.recent_prices) > 0
        values = np.array(context.diff).flatten()
        context.X.append(values[:-1]) # Add independent variables, the prior changes
        context.Y.append(changes[-1]) # Add dependent variable, the final change

        log.info(values[:-1]) #logging
        log.info(changes[-1]) #logging

        if len(context.Y) >= 200: # There needs to be enough data points to make a good model

            context.classifier.fit(context.X, context.Y) # fit the data using the classifier (supervised learning)

            context.prediction = context.classifier.predict(values[1:]) # predict using 1-9

            # If prediction = 1, buy all shares affordable, if 0 sell all shares

            current_price = data.current(context.security, 'price')

            if not active_position and context.prediction:
                order_percent(context.security, 1.0)
                active_position = True
                order_price = data.current(context.security, 'price')


            if active_position and current_price - order_price > 0.25:
                order_target_percent(context.security, 0)
                active_position = False
                log.info('Taking Profits')

            #STOP-Limit
            #if active_position and order_price - current_price >0.25:
            #    order_target_percent(context.security, 0)
            #    active_position = False
            #    log.info('Stopped out')


            record(prediction=int(context.prediction))