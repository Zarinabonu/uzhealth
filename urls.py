from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

from app.views import IndexPage, LoginPage, LogoutView

urlpatterns = [
    path('djadmin/', admin.site.urls),
    path('api/v1/', include('app.api.urls')),
    path('administrator/', include('app.urls')),
    path('operator/', include('app.operator_urls')),
    path('staff/', include('app.staff_urls')),
    path('', IndexPage.as_view(), name='index'),
    path('login/', LoginPage.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
]


if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
