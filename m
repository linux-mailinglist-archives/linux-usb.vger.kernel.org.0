Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893113F0D70
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 23:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbhHRVgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 17:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28490 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234009AbhHRVgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 17:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629322535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bAbD/eVam4u1SYhNVAX23sMHxA0bG00/tb6Wr76aYKM=;
        b=Ak3tClSjTlSNz2fPEJuV/uMMZ8eVv+TBh9XW6rrEm1nRfQqUoea0bzb0TAve6RRcn8xj1V
        7AvfTBmEpbmV445a4tm//ycvKcEi19XoVLOUxHbSqRd9mTVCJVwXr+koAbNaejdrPRB/ea
        GddY7HNd58WhPHK2yQ3Aa2ZpKNO3M6c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-Qrpu7wVjMbG1I_iO6-eiqw-1; Wed, 18 Aug 2021 17:35:33 -0400
X-MC-Unique: Qrpu7wVjMbG1I_iO6-eiqw-1
Received: by mail-qk1-f200.google.com with SMTP id g73-20020a379d4c000000b003d3ed03ca28so2683892qke.23
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 14:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=bAbD/eVam4u1SYhNVAX23sMHxA0bG00/tb6Wr76aYKM=;
        b=QwJ1Bmdj6KJeX3TtKNA4v8f2pPf1rc+SaMtkKuRgrx23YNAvaaw1BN3Yy3V0OhZaad
         HslBeoxBkW9n0ynha66vVBrRn3PNVhDBM+JKZrS/j1bhUMLxllOJG4jVswECy4BJSh2W
         bKc/uun13kpbANzq2+KF4XfsOXhSpdxt1HYu6MrKyDvQcg7QfbcyfoHzWG6HHLwsRne+
         LtnDPyWgT/Gs6lmRwSHn7xG8Qn1sqF7kpgXFxFZw/62TxU8a2gw/Qv9VGOeQy58mf9bJ
         8Xmk3u94cD0xlkjlK3ypptFEeLg1jctcrttfr8HSNHL0QzS2TMX8dOaIwtxf5m9UEXDn
         k9nw==
X-Gm-Message-State: AOAM530XzoxDxNH/1hk2p3FC35jq+mPHYxWGxfeoMG/hE1VVe7r/EfE9
        wsd9j8FFn4KMqvT8mEQqgxLhyIcRd7ylWDa9UHfMnp+sspRHv1GlQ7D5twFQNfWijGoar0XuOUj
        16qrip1csF1Uv9TCAX97z
X-Received: by 2002:a37:a20f:: with SMTP id l15mr407106qke.24.1629322533474;
        Wed, 18 Aug 2021 14:35:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyab94WdMZQNzhRfZljOGpr8kFn3ZnlXdrrtrXo2AH/UwoRuFvOGPN7L8HPmN/brDTP7nCFjw==
X-Received: by 2002:a37:a20f:: with SMTP id l15mr407091qke.24.1629322533300;
        Wed, 18 Aug 2021 14:35:33 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id f7sm543379qko.52.2021.08.18.14.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:35:32 -0700 (PDT)
Message-ID: <5fe94acc12b0f845cd55436056368c3bf9e48544.camel@redhat.com>
Subject: Re: [PATCH 1/8] drm/connector: Give connector sysfs devices there
 own device_type
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Date:   Wed, 18 Aug 2021 17:35:31 -0400
In-Reply-To: <20210817215201.795062-2-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
         <20210817215201.795062-2-hdegoede@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2021-08-17 at 23:51 +0200, Hans de Goede wrote:
> Give connector sysfs devices there own device_type, this allows us to
> check if a device passed to functions dealing with generic devices is
> a drm_connector or not.
> 
> A check like this is necessary in the drm_connector_acpi_bus_match()
> function added in the next patch in this series.
> 
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 50 +++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 968a9560b4aa..f9d92bbb1f98 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
>         .name = "drm_minor"
>  };
>  
> +static struct device_type drm_sysfs_device_connector = {
> +       .name = "drm_connector",
> +};
> +
>  struct class *drm_class;
>  
>  static char *drm_devnode(struct device *dev, umode_t *mode)
> @@ -102,6 +106,11 @@ void drm_sysfs_destroy(void)
>         drm_class = NULL;
>  }
>  
> +static void drm_sysfs_release(struct device *dev)
> +{
> +       kfree(dev);
> +}
> +
>  /*
>   * Connector properties
>   */
> @@ -273,27 +282,47 @@ static const struct attribute_group
> *connector_dev_groups[] = {
>  int drm_sysfs_connector_add(struct drm_connector *connector)
>  {
>         struct drm_device *dev = connector->dev;
> +       struct device *kdev;
> +       int r;
>  
>         if (connector->kdev)
>                 return 0;
>  
> -       connector->kdev =
> -               device_create_with_groups(drm_class, dev->primary->kdev, 0,
> -                                         connector, connector_dev_groups,
> -                                         "card%d-%s", dev->primary->index,
> -                                         connector->name);
> +       kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
> +       if (!kdev)
> +               return -ENOMEM;
> +
> +       device_initialize(kdev);
> +       kdev->class = drm_class;
> +       kdev->type = &drm_sysfs_device_connector;
> +       kdev->parent = dev->primary->kdev;
> +       kdev->groups = connector_dev_groups;
> +       kdev->release = drm_sysfs_release;
> +       dev_set_drvdata(kdev, connector);
> +
> +       r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector-
> >name);
> +       if (r)
> +               goto err_free;
> +
>         DRM_DEBUG("adding \"%s\" to sysfs\n",
>                   connector->name);
>  
> -       if (IS_ERR(connector->kdev)) {
> -               DRM_ERROR("failed to register connector device: %ld\n",
> PTR_ERR(connector->kdev));
> -               return PTR_ERR(connector->kdev);
> +       r = device_add(kdev);
> +       if (r) {
> +               DRM_ERROR("failed to register connector device: %d\n", r);
> +               goto err_free;

Should probably be using drm_err() here since we have access to struct
drm_device *

>         }
>  
> +       connector->kdev = kdev;
> +
>         if (connector->ddc)
>                 return sysfs_create_link(&connector->kdev->kobj,
>                                  &connector->ddc->dev.kobj, "ddc");
>         return 0;
> +
> +err_free:
> +       put_device(kdev);
> +       return r;
>  }
>  
>  void drm_sysfs_connector_remove(struct drm_connector *connector)
> @@ -374,11 +403,6 @@ void drm_sysfs_connector_status_event(struct
> drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_sysfs_connector_status_event);
>  
> -static void drm_sysfs_release(struct device *dev)
> -{
> -       kfree(dev);
> -}
> -
>  struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>  {
>         const char *minor_str;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

