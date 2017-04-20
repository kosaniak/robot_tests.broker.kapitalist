# -*- coding: utf-8 -
import string
import urllib
import urllib2

from iso8601 import parse_date
import dateutil.parser
from datetime import datetime, timedelta
from pytz import timezone
from dateutil import parser


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
    date_string = iso_dt.strftime("%d.%m.%Y %H:%M")
    return date_string


def convert_datetime_to_iso(date):
    date = datetime.strptime(date, "%d.%m.%Y %H:%M")
    return timezone('Europe/Kiev').localize(date).strftime('%Y-%m-%dT%H:%M:%S.%f%z')



def convert_string_to_common_string(string):
    return {
        u"грн.": u"UAH",
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


def adapt_tender_data(tender_data):
    tender_data['data']['procuringEntity']['name'] = u"qa_test"
    return tender_data


def remove_first_word(str):
    return str.lstrip(str.split(' ')[0]+' ')

def get_time_with_offset(date):
    date_obj = datetime.strptime(date, "%d.%m.%Y %H:%M")
    time_zone = timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime('%Y-%m-%d %H:%M:%S.%f%z')


def download_document_from_url(url, file_name, output_dir):
    urllib.urlretrieve(url, ('{}/{}'.format(output_dir, file_name)))
