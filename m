Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D318936EA81
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 14:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhD2Mbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 08:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24105 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230148AbhD2Mbd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 08:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619699447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qoRcKrEBi+H+iVZRyW+ljvC5IV1Vv5Cz1J3NdxbYP4A=;
        b=f/hPpiNv/EDGlB8gOwtoW75cs6j0CUH/NzjM29IDW8JEBx2Lg6dOQ9qHk8fC1V6G6OR2SC
        zlDuOZAV6e6znpdUe8GfhbiSzcSnICCkUbu0hW6JelweFq1KmeYpDWto3Ehbuo1x6Rcze8
        zL6AjARi68eu5ltWm/JNEzEgqrJ+mrY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-nXqER1WVOPWefIVGrpUbwA-1; Thu, 29 Apr 2021 08:30:45 -0400
X-MC-Unique: nXqER1WVOPWefIVGrpUbwA-1
Received: by mail-ed1-f71.google.com with SMTP id c15-20020a056402100fb029038518e5afc5so21210726edu.18
        for <linux-usb@vger.kernel.org>; Thu, 29 Apr 2021 05:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qoRcKrEBi+H+iVZRyW+ljvC5IV1Vv5Cz1J3NdxbYP4A=;
        b=Tr3+Aazz/k9Z/aSjPYFjOvDKal/ERxLcDlj9PMbAsWtd7vDBs3TgnFIFvDuRj9dP/p
         UwDIn9gn8nhxUJA2x4duY4AZUTKADjYhHofPaJfH3xrVol9vr+/xb3f7O66H/INmuL9G
         2alg3OXTB8nDfd61KVTQOM6BKV9lbFhhLQSXZQURkWS69RCTKUyXhIeOu9LozLwSov24
         wrJ7T3neA+Mud9uIGh5A9+0X/VUoWBF87iQzbWzWm9EbXD5RsVkTCQIwqZjgUZpPugAO
         VmgXZuS4LioB8y2s2JeHgkBoLY+HiYsgU8mOkqJ7f3t97wde/bIPSzAbbtu0HG23/JbV
         5Q0Q==
X-Gm-Message-State: AOAM533Kun+6xUjlOLJ2b04g9xyS9FwPhGARVwI28bmN9xmqCGjD1oVP
        z5WCwIqBTP1JI+Pcde/V+yZauj7B9ObtQjuD+O2TNyS8PK1oCHsuPp14ZmNNRd0FV6HLnZU56Qx
        YvEQ5LUB7m9rXk9rmmhPjh9uQ0ifANQwg5YZt0dRRZeiSdbZO4UjvhHZ2On3xjUdWlrT19mFx
X-Received: by 2002:a05:6402:3079:: with SMTP id bs25mr3025312edb.146.1619699443168;
        Thu, 29 Apr 2021 05:30:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNcIBbNbA+SRuNCwCr/ceTjghEYdGJyByGUWLDGJ81xcqUBqc3v2oKaXHrS7s4xTknidqyOg==
X-Received: by 2002:a05:6402:3079:: with SMTP id bs25mr3025276edb.146.1619699442924;
        Thu, 29 Apr 2021 05:30:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y2sm1719269ejg.123.2021.04.29.05.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:30:42 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
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
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d6a190a-7492-0de3-2fce-595d3b710fdd@redhat.com>
Date:   Thu, 29 Apr 2021 14:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/29/21 1:40 PM, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>> Userspace could hold open a reference to the connector->kdev device,
>> through e.g. holding a sysfs-atrtribute open after
>> drm_sysfs_connector_remove() has been called. In this case the connector
>> could be free-ed while the connector->kdev device's drvdata is still
>> pointing to it.
>>
>> Give drm_connector devices there own device type, which allows
>> us to specify our own release function and make drm_sysfs_connector_add()
>> take a reference on the connector object, and have the new release
>> function put the reference when the device is released.
>>
>> Giving drm_connector devices there own device type, will also allow
>> checking if a device is a drm_connector device with a
>> "if (device->type == &drm_sysfs_device_connector)" check.
>>
>> Note that the setting of the name member of the device_type struct will
>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>> as extra info. So this extends the uevent part of the userspace API.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Are you sure? I thought sysfs is supposed to flush out any pending
> operations (they complete fast) and handle open fd internally?

So I did some digging in fs/kernfs and it looks like you right,
once the file has been removed from sysfs any accesses through an
open fd will fail with -ENODEV, interesting I did not know this.

We still need this change though to make sure that the 
"drm/connector: Add drm_connector_find_by_fwnode() function"
does not end up following a dangling drvdat pointer from one
if the drm_connector kdev-s.

The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
a reference on all devices and between getting that reference
and it calling drm_connector_get() - drm_connector_unregister()
may run and drop the possibly last reference to the
drm_connector object, freeing it and leaving the kdev's
drvdata as a dangling pointer.

But I obviously need to rewrite the commit message of this
commit as it currently is completely wrong.

Maybe I should even squash this into the commit adding
drm_connector_find_by_fwnode()  ?

Note sure about that though I personally think this is best
kept as a new preparation patch but with a new commit msg.

> Also I'd assume this creates a loop since the connector holds a reference
> on the kdev?

So I was wondering the same thing when working on this code and
I checked. the reference on the kdev is dropped from:
drm_connector_unregister() -> drm_sysfs_connector_remove()
and then happens independent of the reference count on the
connector-drm-obj dropping to 0.

So what this change does is it keeps a reference to the
drm_connector obj as long as someone is keeping a reference
to the connnector->kdev device around after drm_connector_unregister()
but as soon as that kdev device ref is dropped, so will the
drm_connector's obj reference.

I also tested this using a dock with DP MST, which dynamically
adds/removes connectors on plug-in / plug-out of the dock-cable
and I added a printk to the new drm_sysfs_connector_release() this
adds and that printk triggered pretty much immediately on unplug
as expected, releasing the extra drm_connector obj as soon as
drm_connector_unregister() got called.

Regards,

Hans




> -Daniel
> 
>> ---
>>  drivers/gpu/drm/drm_sysfs.c | 54 +++++++++++++++++++++++++++++++------
>>  1 file changed, 46 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> index f0336c804639..c344c6d5e738 100644
>> --- a/drivers/gpu/drm/drm_sysfs.c
>> +++ b/drivers/gpu/drm/drm_sysfs.c
>> @@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
>>  	.name = "drm_minor"
>>  };
>>  
>> +static struct device_type drm_sysfs_device_connector = {
>> +	.name = "drm_connector",
>> +};
>> +
>>  struct class *drm_class;
>>  
>>  static char *drm_devnode(struct device *dev, umode_t *mode)
>> @@ -271,30 +275,64 @@ static const struct attribute_group *connector_dev_groups[] = {
>>  	NULL
>>  };
>>  
>> +static void drm_sysfs_connector_release(struct device *dev)
>> +{
>> +	struct drm_connector *connector = to_drm_connector(dev);
>> +
>> +	drm_connector_put(connector);
>> +	kfree(dev);
>> +}
>> +
>>  int drm_sysfs_connector_add(struct drm_connector *connector)
>>  {
>>  	struct drm_device *dev = connector->dev;
>> +	struct device *kdev;
>> +	int r;
>>  
>>  	if (connector->kdev)
>>  		return 0;
>>  
>> -	connector->kdev =
>> -		device_create_with_groups(drm_class, dev->primary->kdev, 0,
>> -					  connector, connector_dev_groups,
>> -					  "card%d-%s", dev->primary->index,
>> -					  connector->name);
>> +	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
>> +	if (!kdev)
>> +		return -ENOMEM;
>> +
>> +	device_initialize(kdev);
>> +	kdev->class = drm_class;
>> +	kdev->type = &drm_sysfs_device_connector;
>> +	kdev->parent = dev->primary->kdev;
>> +	kdev->groups = connector_dev_groups;
>> +	kdev->release = drm_sysfs_connector_release;
>> +	dev_set_drvdata(kdev, connector);
>> +
>> +	r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector->name);
>> +	if (r)
>> +		goto err_free;
>> +
>>  	DRM_DEBUG("adding \"%s\" to sysfs\n",
>>  		  connector->name);
>>  
>> -	if (IS_ERR(connector->kdev)) {
>> -		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
>> -		return PTR_ERR(connector->kdev);
>> +	r = device_add(kdev);
>> +	if (r) {
>> +		DRM_ERROR("failed to register connector device: %d\n", r);
>> +		goto err_free;
>>  	}
>>  
>> +	/*
>> +	 * Ensure the connector object does not get free-ed if userspace still has
>> +	 * references open to the device through e.g. the connector sysfs-attributes.
>> +	 */
>> +	drm_connector_get(connector);
>> +
>> +	connector->kdev = kdev;
>> +
>>  	if (connector->ddc)
>>  		return sysfs_create_link(&connector->kdev->kobj,
>>  				 &connector->ddc->dev.kobj, "ddc");
>>  	return 0;
>> +
>> +err_free:
>> +	put_device(kdev);
>> +	return r;
>>  }
>>  
>>  void drm_sysfs_connector_remove(struct drm_connector *connector)
>> -- 
>> 2.31.1
>>
> 

