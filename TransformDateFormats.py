from datetime import datetime

def transform_date_format(dates):
    """
    Transforms a list of date strings into a list of date strings in the format YYYYMMDD.
    The function supports three different date formats: YYYY/MM/DD, DD/MM/YYYY, and MM-DD-YYYY.
    All incoming dates will be valid dates... no need to check for invalid dates.

    Args:
        dates (list): A list of date strings to be transformed
        
    Returns:
        list: A list of transformed date strings

    """
    
    transformed_dates = []
    for date_str in dates:
        # Flag to check if the date string is in the correct format
        flag = 0
from datetime import datetime

def transform_date_format(dates):
    """
    Transforms a list of date strings into a list of date strings in the format YYYYMMDD.
    The function supports three different date formats: YYYY/MM/DD, DD/MM/YYYY, and MM-DD-YYYY.
    All incoming dates will be valid dates... no need to check for invalid dates.

    Args:
        dates (list): A list of date strings to be transformed
        
    Returns:
        list: A list of transformed date strings

    """
    
    transformed_dates = []
    for date_str in dates:
        # Flag to check if the date string is in the correct format
        flag = 0

        if '/' in date_str and date_str.count('/') == 2:
            try:
                # Try to parse the date string assuming it is in the format YYYY/MM/DD
                dt = datetime.strptime(date_str, '%Y/%m/%d')  # strptime is used to parse a string into a datetime object
            except ValueError:
                # If parsing as YYYY/MM/DD fails, parse it assuming it is in the format DD/MM/YYYY
                dt = datetime.strptime(date_str, '%d/%m/%Y')  # strptime is used to parse a string into a datetime object
            flag = 1  
        elif '-' in date_str and date_str.count('-') == 2:
            # Parse the date string assuming it is in the format MM-DD-YYYY
            dt = datetime.strptime(date_str, '%m-%d-%Y')  # strptime is used to parse a string into a datetime object
            flag = 1
        if flag == 1:
            transformed_dates.append(dt.strftime('%Y%m%d'))  # strftime is used to format a datetime object into a string
            
    return transformed_dates

dates = ["2010/02/20", "19/12/2016", "11-18-2012", "20130720", "12.11.18"]
# Should return ["20100220", "20161219", "20121118"]
print(transform_date_format(dates))  
