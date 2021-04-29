Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E3F36EA8C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 14:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhD2MeM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 08:34:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39838 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235908AbhD2MeJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 08:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619699602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GrKq3UC4OJTuxJrBqTBTU6T4d2IlYMcI0WkWfsWdexI=;
        b=BY3NK6K/lBjsl+5wAtZE5UH0yVWILhLEY8T2wWmRz7tI0j7z7iCdmU03ZJVdtK8vBFKmBJ
        jxzgoC+9AF7gDePK0z2VfxxUtWAD0wvpDThZphwwaAeYOFhalu4YfD19r9d5k2Eq6yrB40
        xDQkUgZyG0kYSFnykS4L8/7Skb5IWuI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-CZOfYmIRMhGB6jy5nMWD6g-1; Thu, 29 Apr 2021 08:33:20 -0400
X-MC-Unique: CZOfYmIRMhGB6jy5nMWD6g-1
Received: by mail-ed1-f72.google.com with SMTP id z12-20020aa7d40c0000b0290388179cc8bfso2477641edq.21
        for <linux-usb@vger.kernel.org>; Thu, 29 Apr 2021 05:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GrKq3UC4OJTuxJrBqTBTU6T4d2IlYMcI0WkWfsWdexI=;
        b=mayU2zCw29SFpZvi86w68PN37TEd1OyoNccqnCR1h4t31vzAQg7EJzoO5+6Nzd109T
         bm8PS3D/T4jeVjJPm7qt0QYp3bxfeYMqEbkCwiLY5FyPsOTVQlzWGMHyZcqwRoK/Oh62
         FE3H8pp8ux5/hRaDnOfVq8Rt0T85zgy1JXbdCc9FqeEyWUxqN7hth1tMYal8mSpomGEr
         NNVjuuxmJTu7qT00pzMqEwklR7VwMnB7r+HsBgTDFrUHkKu5NlPJ5NZTIaMInxyUf+9v
         yAKRc22E0TJm0sjL1xTh7rPwypl0XoTDN4k3TQk9C1iYI+7tzhoUjZdAkxTi8q2nvLoK
         RLDA==
X-Gm-Message-State: AOAM5300Rij2dorx99ayydKdcV3RsyP5JEAfHezbwfxNArS+1Db+xBSK
        dbZz1wHPpdUTcVjGP2Qr+ullibdw+Li3N1+LfD6UeGrL6BGUCPq1bjLLjWgSX8fmyrPvAh8npnf
        oqWRaWYaumgi3sk8gBaTEjoRpyIxl4mP2OrVg1zLx24xbwD4c6unrH2k65W2iIjeWCMUiXiYT
X-Received: by 2002:a17:907:75f6:: with SMTP id jz22mr24635655ejc.504.1619699599358;
        Thu, 29 Apr 2021 05:33:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6XSSTtlaPBL2Al2wSDZ5kLm8eA5zhcM5X1CoKpafjS9IMvkP05RefygrrVGfqccP4YWJw7A==
X-Received: by 2002:a17:907:75f6:: with SMTP id jz22mr24635628ejc.504.1619699599119;
        Thu, 29 Apr 2021 05:33:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t15sm2296998edr.55.2021.04.29.05.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:33:18 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
Date:   Thu, 29 Apr 2021 14:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIqg59yageIUwiwy@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/29/21 2:04 PM, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>>>> Userspace could hold open a reference to the connector->kdev device,
>>>> through e.g. holding a sysfs-atrtribute open after
>>>> drm_sysfs_connector_remove() has been called. In this case the connector
>>>> could be free-ed while the connector->kdev device's drvdata is still
>>>> pointing to it.
>>>>
>>>> Give drm_connector devices there own device type, which allows
>>>> us to specify our own release function and make drm_sysfs_connector_add()
>>>> take a reference on the connector object, and have the new release
>>>> function put the reference when the device is released.
>>>>
>>>> Giving drm_connector devices there own device type, will also allow
>>>> checking if a device is a drm_connector device with a
>>>> "if (device->type == &drm_sysfs_device_connector)" check.
>>>>
>>>> Note that the setting of the name member of the device_type struct will
>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>>>> as extra info. So this extends the uevent part of the userspace API.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Are you sure? I thought sysfs is supposed to flush out any pending
>>> operations (they complete fast) and handle open fd internally?
>>
>> Yes, it "should" :)
> 
> Thanks for confirming my vague memories :-)
> 
> Hans, pls drop this one.

Please see my earlier reply to your review of this patch, it is
still needed but for a different reason:

"""
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
"""

This is actually why I added it initially, and while adding it
I came up with this wrong theory of why it was necessary independently
of the drm_connector_find_by_fwnode() addition, sorry about that.

Regards,

Hans


