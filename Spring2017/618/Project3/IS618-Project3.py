"""
This is a template algorithm on Quantopian for you to adapt and fill in.
"""
from quantopian.algorithm import attach_pipeline, pipeline_output
from quantopian.pipeline import Pipeline
from quantopian.pipeline.data.builtin import USEquityPricing
from quantopian.pipeline.factors import AverageDollarVolume
from quantopian.pipeline.filters.morningstar import Q1500US

import numpy as np
import pytz


def initialize(context):
    context.vxx = sid(38054)
    context.spy = sid(8554)
    #context.tlt = sid(23921)

    context.delta = 0.0001 #delta
    context.Vw = context.delta / (1 - context.delta) * np.eye(2)
    context.Ve = 0.001

    context.beta = np.zeros(2) #beta
    context.P = np.zeros((2, 2)) #Predicted error of the system
    context.R = None #estimate of the measurement error covariance

    context.pos = None #position
    context.pos_spy = None
    context.day = None #current day


def handle_data(context, data):
    exchange_time = get_datetime().astimezone(pytz.timezone('US/Eastern'))

    # update Kalman filter and execute a trade during the last 5 mins of trading each day
    if exchange_time.hour == 15 and exchange_time.minute >= 55:  #anytime after 3:55pm Eastern
        # only execute this once per day
        if context.day is not None and context.day == exchange_time.day:  #only once per day
            return
        context.day = exchange_time.day

        x = np.asarray([data.current(context.vxx, 'price'), 1.0]).reshape((1, 2))
        y = data.current(context.spy, 'price')

        # update Kalman filter with latest price
        if context.R is not None:
            context.R = context.P + context.Vw
        else:
            context.R = np.zeros((2, 2))

        yhat = x.dot(context.beta) #initial prediction



        Q = x.dot(context.R).dot(x.T) + context.Ve  #estimate of the process error

        sqrt_Q = np.sqrt(Q)  #establish signal bands
        e = y - yhat #estimator
        K = context.R.dot(x.T) / Q
        context.beta = context.beta + K.flatten() * e  #calculate beta
        context.P = context.R - K * x.dot(context.R)  #estimate error

        #Exit
        if context.pos is not None:
            if context.pos =='short' and e < -sqrt_Q:
                order_target_percent(context.vxx, 0)
                context.pos = None
        #    if context.pos == 'short' and e < 2*sqrt_Q:
        #        order_target_percent(context.vxx, -0.5)
        #        context.pos = None

        #if context.pos_spy is not None:
        #    if context.pos_spy == 'long' and e > -sqrt_Q:
        #        order_target_percent(context.spy, 0)
        #        context.pos_spy = None

        #Enter positions
        if context.pos is None:
            # 1STD
            if e > sqrt_Q:
                order_target_percent(context.vxx, -0.5)
                context.pos = 'short'

            #3 STD
            if e > 3*sqrt_Q:
                order_target_percent(context.vxx, -1)
                context.pos = 'short'

       # if context.pos_spy is None:
       #     if e < -sqrt_Q:
       #         order_target_percent(context.spy, 0.5)
       #         context.pos_spy = 'long'