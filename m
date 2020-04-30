Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2511C0077
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 17:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgD3PgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 11:36:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22731 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726619AbgD3PgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 11:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588260978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vok4jX4KVlklfjB4ahbfHgWw6VZN4JjjnjCtkfMfk6s=;
        b=EwsRa1p3uVQ1Sego8+3iK6o6ROrnJXz8/YQY4e/xXpUUhvLEtuxSYAB2dgCtzkwrCMaV8T
        OX8kvPk0+cqQxclYlA2r1Dry4Qq4D/mpFLvpVY9+qxS6m948k40b+WMHJo/AWnLaexA93h
        /nXRZEnpuLsw9CApM+Gq/YXDiAV80t8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-2Cs-WAKxOAy6kZuWo7OU8Q-1; Thu, 30 Apr 2020 11:36:12 -0400
X-MC-Unique: 2Cs-WAKxOAy6kZuWo7OU8Q-1
Received: by mail-wr1-f70.google.com with SMTP id x15so4093005wrn.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 08:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vok4jX4KVlklfjB4ahbfHgWw6VZN4JjjnjCtkfMfk6s=;
        b=pD4pvzKfl0Z48yi4ctTa6XttVZcwL2MyToB/bUPmG9K56AeZcuWRNDQiMGlRDYgw6T
         TCanIQ/SvpXdX9TylH4Q70wk+t66qRAx8LIsxlixNdgjWGr0738lc71GIn7FPfyTPTmh
         EqWe05To0D4k9BSRcBF2hpF5ypgYwmqYD4VS68+1qw16No8jmwh79FUhPpcVwkQqqxYr
         iWzFhKOfR2WlfNyDxIoSuD5fRMkUkldh6YAjnq/fUG611VHTfG/KvvR3L6d+vuMGA21Q
         q1YipKQgdheWDtX+q/r9VDeeExVDXwyKBb3fU7Y2pnu8m+XLLslqJO2nlf3xYv1wm2mi
         wtCg==
X-Gm-Message-State: AGi0PuYHBkMIjlkVUVS8ylM/r3E42+cQJoW3VZA867a0AdGMCUGCZsAB
        H58oqrCNGpl5K7tEs90q0IwFIkGkOnej/dYEX2tPxI2YUonQCEeKIr55bVDAbGMQp5PW7wIdYZJ
        tahIOSMhAaazcUKCObzdl
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr4639557wrv.260.1588260970613;
        Thu, 30 Apr 2020 08:36:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypKtnyENpFip41FfCC7ncOk7IxhGOEkLCI9yBwjLwDndi7I4XjaWu+YHfdV9GDpsnomtSJY4bA==
X-Received: by 2002:a5d:61c5:: with SMTP id q5mr4639521wrv.260.1588260970203;
        Thu, 30 Apr 2020 08:36:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f23sm63433wml.4.2020.04.30.08.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 08:36:09 -0700 (PDT)
Subject: Re: [PATCH 02/10] drm: Add backlight helper
To:     =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Martin Peres <martin.peres@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Christian Kellner <ckellner@redhat.com>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-3-noralf@tronnes.org>
 <c9ddad5d-0023-70dd-0be6-9e944150cc92@redhat.com>
 <399a0783-6a10-7ffa-71bc-e1833f9555b0@tronnes.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e88ad692-1bd6-51d8-6b1e-7ff93a2ffc00@redhat.com>
Date:   Thu, 30 Apr 2020 17:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <399a0783-6a10-7ffa-71bc-e1833f9555b0@tronnes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/29/20 8:40 PM, Noralf Trønnes wrote:
> 
> 
> Den 29.04.2020 16.13, skrev Hans de Goede:
>> Hi Noralf,
>>
>> On 4/29/20 2:48 PM, Noralf Trønnes wrote:
>>> This adds a function that creates a backlight device for a connector.
>>> It does not deal with the KMS backlight ABI proposition[1] to add a
>>> connector property. It only takes the current best practise to
>>> standardise
>>> the creation of a backlight device for DRM drivers while we wait for the
>>> property.
>>>
>>> The brightness value is set using a connector state variable and an
>>> atomic
>>> commit.
>>>
>>> I have looked through some of the backlight users and this is what
>>> I've found:
>>>
>>> GNOME [2]
>>> ---------
>>>
>>> Brightness range: 0-100
>>> Scale: Assumes perceptual
>>
>> I'm afraid that this is an incaccurate view of how GNOME handles the
>> brightness. gnome-settings-daemon (g-s-d) exports a DBUS property which has
>> a range of 0 - 100%.  But it also offers step-up and step-down DBUS methods
>> which are used for handling brightness hotkey presses.
>>
>> This is important because g-s-d internally also keeps a step_size variable
>> which depends on the brightness_max value of the sysfs backlight interface,
>> like this:
>>
>> BRIGHTNESS_STEP_AMOUNT(max) ((max) < 20 ? 1 : (max) / 20)
>>
>> This is important because some older laptops where we depend on the
>> vendor specific ACPI method (from e.g. dell-laptop or thinkpad_acpi)
>> there are only 8 levels. So if g-s-d where to simply fake a 1-100
>> range and would leave the stepping up to the DBus API user and that
>> user would want 20 steps, so 5 % per step, then the user would get
>>
>> Start      -> 100% -> level 8
>> Press down ->  95% -> level 7
>> Press down ->  90% -> level 7 *no change*
>> etc.
>>
>> Somewhat related on some embedded ARM devices there are tricks where
>> when the entire scene being rendered does not use 100% white as color,
>> the entire scene has all its rgb values upscaled (too a curve) so that
>> the brightest colors do hit 100% of one of r/g/b, combined with dimming
>> the backlight a bit to save power. As you can imagine for tricks like
>> these you want as much backlight control precision as possible.
>>
>> So any backlight infra we add must expose the true range of the
>> backlight control and not normalize it to a 0-100 range.
>>
>> So sorry, but nack for the current version because of the hardcoding
>> of the range.
> 
> No problem, I just had to start from somewhere, and I started with: Give
> the driver developer as few options as possible, no more than necessary,
> but I didn't really know what was necessary :-)
> 
> The reason I chose a 0-100 range is because the backlight property ABI
> proposal had this range and it maps so nicely to percent. And can the
> ordinary human see brightness changes in more than 100 steps?
> 
> This helper is only to be used by drm drivers and I assumed that all the
> current drivers registering a backlight device could at least do that range.
> 
> Looking through the drivers and their max_brightness values that
> assumption isn't quite right:
> 
> amd: 255
> gma500: 100
> i915: <don't know, register read>
> nouveau/nv40: 31
> nouveau/nv50: 100
> radeon: 255
> shmobile: <don't know, from platform data>
> 
> panel-dsi-cm.c: 255
> panel-jdi-lt070me05000.c: 255
> panel-orisetech-otm8009a.c: 255
> panel-raydium-rm67191.c: 255
> panel-samsung-s6e63m0.c: 10
> panel-sony-acx424akp.c: 1023
> panel-samsung-s6e3ha2.c: 100
> panel-samsung-s6e63j0x03.c: 100
> panel-sony-acx565akm.c: 255
> bridge/parade-ps8622.c: 255
> 
> I'll add max_brightness as an argument together with scale which you
> commented on below.

Ok, sounds good.

>> Also the scale really should be specified by the driver, or be hardcoded
>> to BACKLIGHT_SCALE_UNKNOWN for now. In many cases we do not really know.
>> But for e.g. the acpi_video firmware backlight interface a good guess is
>> that it actually represents a perceptual scale rather then controlling
>> the wattage.
>>
>> Where as the native i915 backlight interface really is controlling
>> the wattage without any perceptual correction.
>>
>> Another problem with your proposal is that it seems to assume that
>> the backlight is controlled by the drm/kms driver. On x86 we have
> 
> Yes, this backlight device is just for drm drivers.

I was hoping you might have some clever ideas how to deal with /
prepare for the backlight driver outside of drm-driver case too.
But I completely understand that you want to limit your scope.

> The reason I spend time on this is because I want to pass backlight
> brightness changes through the atomic machinery like any other state change.

I understand.

Regards,

Hans











>> atleast 3 different drivers for the backlight:
>>
>> 1) The i915 (or amd/nouveau) native driver which more or less
>> directly pokes the PWM controller of the GPU.
>> 2) The ACPI video standard backlight interface
>> 3) Vendor specific ACPI interfaces from older laptops
>>
>> ATM we always register 1. which could remain unchanged with
>> your code and then also register 2/3 if we (the kernel) think
>> that will work better (*) and then rely on userspace prefering
>> these (they have a different backlight_type) over 1.
>>
>> Ideally any infra we add will also offer the option to tie
>> 2. or 3. to the connector...
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>> *) e.g. it will work while the others will not work at all
>>
>>
>>
>>
>>>
>>> Avoids setting the sysfs brightness value to zero if max_brightness >=
>>> 99.
>>> Can connect connector and backlight using the sysfs device.
>>>
>>> KDE [3]
>>> -------
>>>
>>> Brightness range: 0-100
>>> Scale: Assumes perceptual
>>>
>>> Weston [4]
>>> ----------
>>>
>>> Brightness range: 0-255
>>> Scale: Assumes perceptual
>>>
>>> Chromium OS [5]
>>> ---------------
>>>
>>> Brightness range: 0-100
>>> Scale: Depends on the sysfs file 'scale' which is a recent addition
>>> (2019)
>>>
>>> xserver [6]
>>> -----------
>>>
>>> Brightness range: 0-x (driver specific) (1 is minimum, 0 is OFF)
>>> Scale: Assumes perceptual
>>>
>>> The builtin modesetting driver[7] does not support Backlight, Intel[8]
>>> does.
>>>
>>> [1]
>>> https://lore.kernel.org/dri-devel/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>>>
>>> [2]
>>> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/plugins/power/gsd-backlight.c
>>>
>>> [3]
>>> https://github.com/KDE/powerdevil/blob/master/daemon/backends/upower/backlighthelper.cpp
>>>
>>> [4]
>>> https://gitlab.freedesktop.org/wayland/weston/-/blob/master/libweston/backend-drm/drm.c
>>>
>>> [5]
>>> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/power_manager/powerd/system/internal_backlight.cc
>>>
>>> [6]
>>> https://github.com/freedesktop/xorg-randrproto/blob/master/randrproto.txt
>>> [7]
>>> https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/drivers/modesetting/drmmode_display.c
>>>
>>> [8]
>>> https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/blob/master/src/backlight.c
>>>
>>>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Martin Peres <martin.peres@linux.intel.com>
>>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>>> ---
>>>    Documentation/gpu/drm-kms-helpers.rst  |   6 +
>>>    drivers/gpu/drm/Kconfig                |   7 ++
>>>    drivers/gpu/drm/Makefile               |   1 +
>>>    drivers/gpu/drm/drm_backlight_helper.c | 154 +++++++++++++++++++++++++
>>>    include/drm/drm_backlight_helper.h     |   9 ++
>>>    include/drm/drm_connector.h            |  10 ++
>>>    6 files changed, 187 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/drm_backlight_helper.c
>>>    create mode 100644 include/drm/drm_backlight_helper.h
>>>
>>> diff --git a/Documentation/gpu/drm-kms-helpers.rst
>>> b/Documentation/gpu/drm-kms-helpers.rst
>>> index 9668a7fe2408..29a2f4b49fd2 100644
>>> --- a/Documentation/gpu/drm-kms-helpers.rst
>>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>>> @@ -411,3 +411,9 @@ SHMEM GEM Helper Reference
>>>      .. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>>>       :export:
>>> +
>>> +Backlight Helper Reference
>>> +==========================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_backlight_helper.c
>>> +   :export:
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index d0aa6cff2e02..f6e13e18c9ca 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -224,6 +224,13 @@ config DRM_GEM_SHMEM_HELPER
>>>        help
>>>          Choose this if you need the GEM shmem helper functions
>>>    +config DRM_BACKLIGHT_HELPER
>>> +    bool
>>> +    depends on DRM
>>> +    select BACKLIGHT_CLASS_DEVICE
>>> +    help
>>> +      Choose this if you need the backlight device helper functions
>>> +
>>>    config DRM_VM
>>>        bool
>>>        depends on DRM && MMU
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index 6493088a0fdd..0d17662dde0a 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -52,6 +52,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) +=
>>> drm_fb_helper.o
>>>    drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
>>>    drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
>>>    drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>>> +drm_kms_helper-$(CONFIG_DRM_BACKLIGHT_HELPER) += drm_backlight_helper.o
>>>      obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>>>    obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
>>> diff --git a/drivers/gpu/drm/drm_backlight_helper.c
>>> b/drivers/gpu/drm/drm_backlight_helper.c
>>> new file mode 100644
>>> index 000000000000..06e6a75d1d0a
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/drm_backlight_helper.c
>>> @@ -0,0 +1,154 @@
>>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>>> +/*
>>> + * Copyright 2020 Noralf Trønnes
>>> + */
>>> +
>>> +#include <linux/backlight.h>
>>> +
>>> +#include <drm/drm_atomic.h>
>>> +#include <drm/drm_connector.h>
>>> +#include <drm/drm_drv.h>
>>> +#include <drm/drm_file.h>
>>> +
>>> +static int drm_backlight_update_status(struct backlight_device *bd)
>>> +{
>>> +    struct drm_connector *connector = bl_get_data(bd);
>>> +    struct drm_connector_state *connector_state;
>>> +    struct drm_device *dev = connector->dev;
>>> +    struct drm_modeset_acquire_ctx ctx;
>>> +    struct drm_atomic_state *state;
>>> +    int ret;
>>> +
>>> +    state = drm_atomic_state_alloc(dev);
>>> +    if (!state)
>>> +        return -ENOMEM;
>>> +
>>> +    drm_modeset_acquire_init(&ctx, 0);
>>> +    state->acquire_ctx = &ctx;
>>> +retry:
>>> +    connector_state = drm_atomic_get_connector_state(state, connector);
>>> +    if (IS_ERR(connector_state)) {
>>> +        ret = PTR_ERR(connector_state);
>>> +        goto out;
>>> +    }
>>> +
>>> +    connector_state->backlight_brightness = bd->props.brightness;
>>> +
>>> +    ret = drm_atomic_commit(state);
>>> +out:
>>> +    if (ret == -EDEADLK) {
>>> +        drm_atomic_state_clear(state);
>>> +        drm_modeset_backoff(&ctx);
>>> +        goto retry;
>>> +    }
>>> +
>>> +    drm_atomic_state_put(state);
>>> +
>>> +    drm_modeset_drop_locks(&ctx);
>>> +    drm_modeset_acquire_fini(&ctx);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int drm_backlight_get_brightness(struct backlight_device *bd)
>>> +{
>>> +    struct drm_connector *connector = bl_get_data(bd);
>>> +    struct drm_device *dev = connector->dev;
>>> +    int brightness;
>>> +
>>> +    drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>>> +    brightness = connector->state->backlight_brightness;
>>> +    drm_modeset_unlock(&dev->mode_config.connection_mutex);
>>> +
>>> +    return brightness;
>>> +}
>>> +
>>> +static const struct backlight_ops drm_backlight_ops = {
>>> +    .get_brightness = drm_backlight_get_brightness,
>>> +    .update_status    = drm_backlight_update_status,
>>> +};
>>> +
>>> +/* Can be exported for drivers carrying a legacy name */
>>> +static int drm_backlight_register_with_name(struct drm_connector
>>> *connector, const char *name)
>>> +{
>>> +    struct backlight_device *bd;
>>> +    const struct backlight_properties props = {
>>> +        .type = BACKLIGHT_RAW,
>>> +        .scale = BACKLIGHT_SCALE_NON_LINEAR,
>>> +        .max_brightness = 100,
>>> +    };
>>> +
>>> +    if (WARN_ON(!drm_core_check_feature(connector->dev,
>>> DRIVER_MODESET) ||
>>> +            !drm_drv_uses_atomic_modeset(connector->dev) ||
>>> +            !connector->kdev))
>>> +        return -EINVAL;
>>> +
>>> +    bd = backlight_device_register(name, connector->kdev, connector,
>>> +                       &drm_backlight_ops, &props);
>>> +    if (IS_ERR(bd))
>>> +        return PTR_ERR(bd);
>>> +
>>> +    connector->backlight = bd;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * drm_backlight_register() - Register a backlight device for a
>>> connector
>>> + * @connector: Connector
>>> + *
>>> + * This function registers a backlight device for @connector with the
>>> following
>>> + * characteristics:
>>> + *
>>> + * - The connector sysfs device is used as a parent device for the
>>> backlight device.
>>> + *   Userspace can use this to connect backlight device and connector.
>>> + * - Name will be on the form: **card0-HDMI-A-1-backlight**
>>> + * - Type is "raw"
>>> + * - Scale is "non-linear" (perceptual)
>>> + * - Max brightness is 100 giving a range of 0-100 inclusive
>>> + * - Reading sysfs **brightness** returns the backlight device property
>>> + * - Reading sysfs **actual_brightness** returns the connector state
>>> value
>>> + * - Writing sysfs **bl_power** is ignored, the DPMS connector
>>> property should
>>> + *   be used to control power.
>>> + * - Backlight device suspend/resume events are ignored.
>>> + *
>>> + * Note:
>>> + *
>>> + * Brightness zero should not turn off backlight it should be the
>>> minimum
>>> + * brightness, DPMS handles power.
>>> + *
>>> + * This function must be called from
>>> &drm_connector_funcs->late_register() since
>>> + * it depends on the sysfs device.
>>> + *
>>> + * Returns:
>>> + * Zero on success or negative error code on failure.
>>> + */
>>> +int drm_backlight_register(struct drm_connector *connector)
>>> +{
>>> +    const char *name = NULL;
>>> +    int ret;
>>> +
>>> +    name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>>> +             connector->dev->primary->index, connector->name);
>>> +    if (!name)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = drm_backlight_register_with_name(connector, name);
>>> +    kfree(name);
>>> +
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL(drm_backlight_register);
>>> +
>>> +/**
>>> + * drm_backlight_unregister() - Unregister backlight device
>>> + * @connector: Connector
>>> + *
>>> + * Unregister a backlight device. This must be called from the
>>> + * &drm_connector_funcs->early_unregister() callback.
>>> + */
>>> +void drm_backlight_unregister(struct drm_connector *connector)
>>> +{
>>> +    backlight_device_unregister(connector->backlight);
>>> +}
>>> +EXPORT_SYMBOL(drm_backlight_unregister);
>>> diff --git a/include/drm/drm_backlight_helper.h
>>> b/include/drm/drm_backlight_helper.h
>>> new file mode 100644
>>> index 000000000000..4151b66eb0b4
>>> --- /dev/null
>>> +++ b/include/drm/drm_backlight_helper.h
>>> @@ -0,0 +1,9 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>> +
>>> +#ifndef _LINUX_DRM_BACKLIGHT_HELPER_H
>>> +#define _LINUX_DRM_BACKLIGHT_HELPER_H
>>> +
>>> +int drm_backlight_register(struct drm_connector *connector);
>>> +void drm_backlight_unregister(struct drm_connector *connector);
>>> +
>>> +#endif
>>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>> index 221910948b37..ce678b694f45 100644
>>> --- a/include/drm/drm_connector.h
>>> +++ b/include/drm/drm_connector.h
>>> @@ -32,6 +32,7 @@
>>>      #include <uapi/drm/drm_mode.h>
>>>    +struct backlight_device;
>>>    struct drm_connector_helper_funcs;
>>>    struct drm_modeset_acquire_ctx;
>>>    struct drm_device;
>>> @@ -656,6 +657,12 @@ struct drm_connector_state {
>>>         */
>>>        u8 max_bpc;
>>>    +    /**
>>> +     * @backlight_brightness: Brightness value of the connector
>>> backlight
>>> +     * device. See drm_backlight_register().
>>> +     */
>>> +    u8 backlight_brightness;
>>> +
>>>        /**
>>>         * @hdr_output_metadata:
>>>         * DRM blob property for HDR output metadata
>>> @@ -1422,6 +1429,9 @@ struct drm_connector {
>>>          /** @hdr_sink_metadata: HDR Metadata Information read from
>>> sink */
>>>        struct hdr_sink_metadata hdr_sink_metadata;
>>> +
>>> +    /** @backlight: Backlight device. See drm_backlight_register() */
>>> +    struct backlight_device *backlight;
>>>    };
>>>      #define obj_to_connector(x) container_of(x, struct drm_connector,
>>> base)
>>>
>>
>>
> 

