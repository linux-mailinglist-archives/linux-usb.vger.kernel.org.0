Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B02636E9B2
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 13:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhD2LlU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 07:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbhD2LlS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 07:41:18 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAFBC06138B
        for <linux-usb@vger.kernel.org>; Thu, 29 Apr 2021 04:40:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so6452573wmn.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Apr 2021 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9eUkxQOkVtQDsF9AwW1ogEMCTUXqtTF+d+YnllLLjEg=;
        b=YAoccdsFiPYqGJfIn/ZoRDYWHv/Q3ZF9Y7n7AwQ+X+Q/4CVynOl4O3Wh6JMNCT5IzY
         uqXjovTfjYnCWXAwNTd60dzQl0DSuFTl8otxbfI1/O9wbJajUpUrTGI+LMX82EYFW7dH
         NSheFuQjSO6DgbF9h+juTkX/elPK08f0uKcS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9eUkxQOkVtQDsF9AwW1ogEMCTUXqtTF+d+YnllLLjEg=;
        b=rmVQMR+bpN2QolJTYjkVKY4RW66OAVzJwv7uKJJI3Gb5LUn6LDJuojKeAxx5QmIRkd
         7PgIHzyLvKcNzPWKM17K0B3uc9YQ6a/QnTANlesYAeZpqX8SWjvo+L3rDmS6hm94QkBU
         X8XziKVh0tI5Nb4APslyOJ+Jqe4ztO5J31EV635oShoi39NqzG4aCoqowh0C3KVydskh
         1YHCPvvFkBvPEVidC8bRBpF2hfuvxK0kqouzVo6h6LFThsFdv7jzptCzwsGojnKTNc8Q
         JWAmV9xDkMEX8qcgYHQRDeAH9J/QZ0L2nu5G9wax3iI7eb2iwYBisNXOKyIQ67cOnRur
         /ORQ==
X-Gm-Message-State: AOAM5319c343yKkimcPCSbKpfHCWm4o8tPIa3JUHAGG5/sJerQJSyAgr
        OeN6rakhbTHQEPgbj7/k8LGjYw==
X-Google-Smtp-Source: ABdhPJy6P94bq1TrQU8Q0uKhEm5PJtAjsM/T+lraIRT6DDfyHLGiD3njKgkzDmrd0SOO3lsGi098Fg==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr36312197wmc.93.1619696430950;
        Thu, 29 Apr 2021 04:40:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q12sm1942738wrx.17.2021.04.29.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 04:40:30 -0700 (PDT)
Date:   Thu, 29 Apr 2021 13:40:28 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
Message-ID: <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428215257.500088-2-hdegoede@redhat.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
> Userspace could hold open a reference to the connector->kdev device,
> through e.g. holding a sysfs-atrtribute open after
> drm_sysfs_connector_remove() has been called. In this case the connector
> could be free-ed while the connector->kdev device's drvdata is still
> pointing to it.
> 
> Give drm_connector devices there own device type, which allows
> us to specify our own release function and make drm_sysfs_connector_add()
> take a reference on the connector object, and have the new release
> function put the reference when the device is released.
> 
> Giving drm_connector devices there own device type, will also allow
> checking if a device is a drm_connector device with a
> "if (device->type == &drm_sysfs_device_connector)" check.
> 
> Note that the setting of the name member of the device_type struct will
> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
> as extra info. So this extends the uevent part of the userspace API.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Are you sure? I thought sysfs is supposed to flush out any pending
operations (they complete fast) and handle open fd internally?

Also I'd assume this creates a loop since the connector holds a reference
on the kdev?
-Daniel

> ---
>  drivers/gpu/drm/drm_sysfs.c | 54 +++++++++++++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index f0336c804639..c344c6d5e738 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
>  	.name = "drm_minor"
>  };
>  
> +static struct device_type drm_sysfs_device_connector = {
> +	.name = "drm_connector",
> +};
> +
>  struct class *drm_class;
>  
>  static char *drm_devnode(struct device *dev, umode_t *mode)
> @@ -271,30 +275,64 @@ static const struct attribute_group *connector_dev_groups[] = {
>  	NULL
>  };
>  
> +static void drm_sysfs_connector_release(struct device *dev)
> +{
> +	struct drm_connector *connector = to_drm_connector(dev);
> +
> +	drm_connector_put(connector);
> +	kfree(dev);
> +}
> +
>  int drm_sysfs_connector_add(struct drm_connector *connector)
>  {
>  	struct drm_device *dev = connector->dev;
> +	struct device *kdev;
> +	int r;
>  
>  	if (connector->kdev)
>  		return 0;
>  
> -	connector->kdev =
> -		device_create_with_groups(drm_class, dev->primary->kdev, 0,
> -					  connector, connector_dev_groups,
> -					  "card%d-%s", dev->primary->index,
> -					  connector->name);
> +	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
> +	if (!kdev)
> +		return -ENOMEM;
> +
> +	device_initialize(kdev);
> +	kdev->class = drm_class;
> +	kdev->type = &drm_sysfs_device_connector;
> +	kdev->parent = dev->primary->kdev;
> +	kdev->groups = connector_dev_groups;
> +	kdev->release = drm_sysfs_connector_release;
> +	dev_set_drvdata(kdev, connector);
> +
> +	r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector->name);
> +	if (r)
> +		goto err_free;
> +
>  	DRM_DEBUG("adding \"%s\" to sysfs\n",
>  		  connector->name);
>  
> -	if (IS_ERR(connector->kdev)) {
> -		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
> -		return PTR_ERR(connector->kdev);
> +	r = device_add(kdev);
> +	if (r) {
> +		DRM_ERROR("failed to register connector device: %d\n", r);
> +		goto err_free;
>  	}
>  
> +	/*
> +	 * Ensure the connector object does not get free-ed if userspace still has
> +	 * references open to the device through e.g. the connector sysfs-attributes.
> +	 */
> +	drm_connector_get(connector);
> +
> +	connector->kdev = kdev;
> +
>  	if (connector->ddc)
>  		return sysfs_create_link(&connector->kdev->kobj,
>  				 &connector->ddc->dev.kobj, "ddc");
>  	return 0;
> +
> +err_free:
> +	put_device(kdev);
> +	return r;
>  }
>  
>  void drm_sysfs_connector_remove(struct drm_connector *connector)
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
