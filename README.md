<img src="prague-airbnb.png" width="700">

# Exploratory analysis of the Airbnb listings in Prague, Czech Republic
This repository includes two Jupyter notebooks:
* `prague-airbnb.ipynb` - data preprocessing, fitting a regression model, visualisation of feature importance via `SHAP`
* `prague-airbnb-visualisation.ipynb` - plotting geographical data from the dataset via `geoplot`

**:book: Associated Medium article explaining the results: [How does location affect the price of Airbnb in Prague?](https://medium.com/@jakubkocvara/how-does-location-affect-the-price-of-airbnb-in-prague-b8e31e766ca8)**

## Data
The source data was obtained from the Inside Airbnb project ([http://insideairbnb.com/get-the-data.html](http://insideairbnb.com/get-the-data.html)). It includes information about:
* property - number of bedrooms, bathrooms, amenities, property type, text description etc
* hosts - number of other listings, superhost status, hosting experience
* property location - neighbourhood info, latitude and longitude
* availability
* summary of reviews

This data set was enriched with the transit time needed to get to the city centre, popular tourist attraction [Old Town Square](https://goo.gl/maps/pScZHAUKP2ECCQJB7) was chosen. All route times were retrieved via the Google Cloud Routes API ([https://cloud.google.com/maps-platform/routes](https://cloud.google.com/maps-platform/routes)). These times are calculated for a weekday at 9:00 AM.

## Installation
You can run these notebooks on your Jupyter notebook installation with following prerequisites:
* [PROJ](https://proj.org/index.html) - coordinate transformation software
* [GEOS](https://trac.osgeo.org/geos/) - Geometry Engine, Open Source

In addition, these python libraries are used (install them with `pip install <library_name>`):
* `geoplot` - library for plotting geospatial data
* `xgboost` - implementation of the XGBoost gradient boosting algorithm
* `shap` - [SHapley Additive exPlanations](https://github.com/slundberg/shap) - library for Shapley value based explanations of machine learning models

## Running in Docker :whale: (Recommended)
All software and python packages are already in specified in the `Dockerfile`, which is built on top of the official Jupyter Notebook SciPy docker image [https://github.com/jupyter/docker-stacks](https://github.com/jupyter/docker-stacks).

After cloning the repository, simply run `docker-compose up` and after building the image and running the container, you will be able to access the notebooks with a provided `localhost` URL.

