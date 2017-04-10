# -*- coding: utf-8 -
import string

from iso8601 import parse_date
import dateutil.parser


def get_all_dates(initial_tender_data, key):
    tender_period = initial_tender_data.data.tenderPeriod
    start_dt = dateutil.parser.parse(tender_period['startDate'])
    end_dt = dateutil.parser.parse(tender_period['endDate'])
    data = {
        'EndPeriod': start_dt.strftime("%d.%m.%Y %H:%M"),
        'StartDate': start_dt.strftime("%d.%m.%Y %H:%M"),
        'EndDate': end_dt.strftime("%d.%m.%Y %H:%M"),
    }
    return data.get(key, '')


def convert_date_to_format(isodate):
    iso_dt = parse_date(isodate)
    # date_string = iso_dt.strftime("%m/%d/%Y")
    date_string = iso_dt.strftime("%d.%m.%Y %H:%M")
    return date_string


def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%Y.%m.%d %H:%M")
    return date_string


def convert_time_to_format(isodate):
    iso_dt = parse_date(isodate)
    time_string = iso_dt.strftime("%H:%M")
    return time_string


def string_to_float(string):
    return float(string)


def change_data(initial_data):
    initial_data['data']['items'][0]['deliveryAddress']['locality'] = u"м. Київ"
    initial_data['data']['items'][0]['deliveryAddress']['region'] = u"Київська область"
    return initial_data


def convert_string_to_common_string(string):
    return {
        u"Київська область": u"місто Київ",
        u"Украина": u"Україна",
        u"м. Київ": u"Київ",
        u"кг.": u"кілограм",
        u"грн.": u"UAH",
        u" Картонні коробки": u"Картонні коробки",
        u"З ПДВ": True,
    }.get(string, string)


def get_tender_id(str_tender_id):
    substr = u"Інформація про закупівлю "
    index = 0
    length = len(substr)
    while string.find(str_tender_id, substr) != -1:
        index = string.find(str_tender_id, substr)
        str_tender_id = str_tender_id[0:index] + str_tender_id[index + length:]
    return str_tender_id


def adapt_procuringEntity(tender_data):
    tender_data['data']['procuringEntity']['name'] = u"qa_test"
    return tender_data


def remove_first_word(str):
    return str.lstrip(str.split(' ')[0]+' ')
