Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66931C3F11
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 17:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgEDPya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 11:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725941AbgEDPy3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 11:54:29 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C007C061A0E
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MKKVfCAscMMMoNdfpcY+wj0/D53ARrYKEKzF43Ea2+o=; b=VaaxgGCYcGwR0uFl3wh3Y//hX9
        ZAPlNMVVREoE6C4n4cEagiL/m0Dt9DCWRyRVNwmYG36D7crjRC/Ok6lJ0m+7ChVOTxxy8bAM4qQvO
        rgbU1AkFxlHWFDW9C/clKQRl3OQkzmurLiWAen3oDBPG7tTDLyMs2GwwErsWWpOchkWrFK+uceoNS
        95fBfiQSql+H6OPUJVseed7jZDvLEXVboWmTq5NGIm+JhzmpnAUwEHCyyVEGq+blo/ZpeAKsELZw7
        1SfTW0+p4bj4zHKqbwNB1NNHqxhGFdOqfDm723avcFqOvPDAIR8NOPlerAJifuVBBGZ9sQn5QFjNQ
        RVTsLWSw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59704 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jVdQG-0007HJ-IP; Mon, 04 May 2020 17:54:24 +0200
Subject: Re: [PATCH 02/10] drm: Add backlight helper
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-3-noralf@tronnes.org>
 <20200504120628.GK10381@phenom.ffwll.local>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d13462fa-831c-9ec4-2523-be1f2fb0c9ae@tronnes.org>
Date:   Mon, 4 May 2020 17:54:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504120628.GK10381@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 04.05.2020 14.06, skrev Daniel Vetter:
> On Wed, Apr 29, 2020 at 02:48:22PM +0200, Noralf Trønnes wrote:
>> This adds a function that creates a backlight device for a connector.
>> It does not deal with the KMS backlight ABI proposition[1] to add a
>> connector property. It only takes the current best practise to standardise
>> the creation of a backlight device for DRM drivers while we wait for the
>> property.
>>
>> The brightness value is set using a connector state variable and an atomic
>> commit.
>>
>> I have looked through some of the backlight users and this is what I've found:
>>
>> GNOME [2]
>> ---------
>>
>> Brightness range: 0-100
>> Scale: Assumes perceptual
>>
>> Avoids setting the sysfs brightness value to zero if max_brightness >= 99.
>> Can connect connector and backlight using the sysfs device.
>>
>> KDE [3]
>> -------
>>
>> Brightness range: 0-100
>> Scale: Assumes perceptual
>>
>> Weston [4]
>> ----------
>>
>> Brightness range: 0-255
>> Scale: Assumes perceptual
>>
>> Chromium OS [5]
>> ---------------
>>
>> Brightness range: 0-100
>> Scale: Depends on the sysfs file 'scale' which is a recent addition (2019)
>>
>> xserver [6]
>> -----------
>>
>> Brightness range: 0-x (driver specific) (1 is minimum, 0 is OFF)
>> Scale: Assumes perceptual
>>
>> The builtin modesetting driver[7] does not support Backlight, Intel[8] does.
>>
>> [1] https://lore.kernel.org/dri-devel/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>> [2] https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/plugins/power/gsd-backlight.c
>> [3] https://github.com/KDE/powerdevil/blob/master/daemon/backends/upower/backlighthelper.cpp
>> [4] https://gitlab.freedesktop.org/wayland/weston/-/blob/master/libweston/backend-drm/drm.c
>> [5] https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/power_manager/powerd/system/internal_backlight.cc
>> [6] https://github.com/freedesktop/xorg-randrproto/blob/master/randrproto.txt
>> [7] https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/drivers/modesetting/drmmode_display.c
>> [8] https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/blob/master/src/backlight.c
>>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Martin Peres <martin.peres@linux.intel.com>
>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  Documentation/gpu/drm-kms-helpers.rst  |   6 +
>>  drivers/gpu/drm/Kconfig                |   7 ++
>>  drivers/gpu/drm/Makefile               |   1 +
>>  drivers/gpu/drm/drm_backlight_helper.c | 154 +++++++++++++++++++++++++
>>  include/drm/drm_backlight_helper.h     |   9 ++
>>  include/drm/drm_connector.h            |  10 ++
>>  6 files changed, 187 insertions(+)
>>  create mode 100644 drivers/gpu/drm/drm_backlight_helper.c
>>  create mode 100644 include/drm/drm_backlight_helper.h
>>
>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
>> index 9668a7fe2408..29a2f4b49fd2 100644
>> --- a/Documentation/gpu/drm-kms-helpers.rst
>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>> @@ -411,3 +411,9 @@ SHMEM GEM Helper Reference
>>  
>>  .. kernel-doc:: drivers/gpu/drm/drm_gem_shmem_helper.c
>>     :export:
>> +
>> +Backlight Helper Reference
>> +==========================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_backlight_helper.c
>> +   :export:
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index d0aa6cff2e02..f6e13e18c9ca 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -224,6 +224,13 @@ config DRM_GEM_SHMEM_HELPER
>>  	help
>>  	  Choose this if you need the GEM shmem helper functions
>>  
>> +config DRM_BACKLIGHT_HELPER
>> +	bool
>> +	depends on DRM
>> +	select BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  Choose this if you need the backlight device helper functions
>> +
>>  config DRM_VM
>>  	bool
>>  	depends on DRM && MMU
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 6493088a0fdd..0d17662dde0a 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -52,6 +52,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>>  drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
>>  drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
>>  drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>> +drm_kms_helper-$(CONFIG_DRM_BACKLIGHT_HELPER) += drm_backlight_helper.o
>>  
>>  obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>>  obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
>> diff --git a/drivers/gpu/drm/drm_backlight_helper.c b/drivers/gpu/drm/drm_backlight_helper.c
>> new file mode 100644
>> index 000000000000..06e6a75d1d0a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_backlight_helper.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Copyright 2020 Noralf Trønnes
>> + */
>> +
>> +#include <linux/backlight.h>
>> +
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +
>> +static int drm_backlight_update_status(struct backlight_device *bd)
>> +{
>> +	struct drm_connector *connector = bl_get_data(bd);
>> +	struct drm_connector_state *connector_state;
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_atomic_state *state;
>> +	int ret;
>> +
>> +	state = drm_atomic_state_alloc(dev);
>> +	if (!state)
>> +		return -ENOMEM;
>> +
>> +	drm_modeset_acquire_init(&ctx, 0);
>> +	state->acquire_ctx = &ctx;
>> +retry:
>> +	connector_state = drm_atomic_get_connector_state(state, connector);
>> +	if (IS_ERR(connector_state)) {
>> +		ret = PTR_ERR(connector_state);
>> +		goto out;
>> +	}
>> +
>> +	connector_state->backlight_brightness = bd->props.brightness;
>> +
>> +	ret = drm_atomic_commit(state);
>> +out:
>> +	if (ret == -EDEADLK) {
>> +		drm_atomic_state_clear(state);
>> +		drm_modeset_backoff(&ctx);
>> +		goto retry;
>> +	}
>> +
>> +	drm_atomic_state_put(state);
>> +
>> +	drm_modeset_drop_locks(&ctx);
>> +	drm_modeset_acquire_fini(&ctx);
>> +
>> +	return ret;
>> +}
> 
> Looking at this, I'm not sure this is generally useable outside of your
> usb driver. Or stuff that does essentially the same.
> 
> For real hw drivers I expect a similar relationship between the kms driver
> and the backlight driver like for i2c, clocks, power domaines, ... i.e.
> the kms driver calls into the backlight driver. This also means that kms
> locks will be nesting outside of the locks of these subordinate
> subsystems, and hence direct access through other userspace interfaces
> (like we have for i2c too) needs to bypass atomic kms. Otherwise we have
> deadlock potential.
> 
> 
> With your stuff here we can potentially get a backlight locks -> kms locks
> -> backlight locks scenario, and lockdep will be angry about this. So in
> general this doesn't work (I think, locking is hard), and in this specific
> case it only works because your usb driver shovels everything over to
> another machine. Lockdep will still complain if you load this together
> with some other kms driver that uses backlight normally.
> 
> Aside: Locking is broken in the backlight code, we take the
> bd->update_lock too late, after bd->props has already been handled
> unsafely. But I guess that's a side effect of the sysfs interface being
> racy by default. Or the backlight_enable/disable helpers should take
> bd->ops_lock too.
> 
> So two things:
> - I think the actual update needs to be pushed to a work_struct, with no
>   flush_work, to avoid these locking loops completely.
> - I think this is best left in your usb driver for now, until someone
>   comes up with maybe an spi forwarder or whatever where we might need
>   this again.
> 
> Or, and this is probably much simpler, just have a simpler backlight
> driver that's completely orthogonal to the kms side, with some hw lock to
> organize updates. For that case just adding a drm_connector->backlight
> pointer, as prep for Hans' work, would be great.

I don't quite follow you here. This backlight device is for kms drivers
that control the backlight brightness by themselves, by setting a pwm
value or something on their hardware. The kms driver will not act as a
proxy and forward the value to another backlight driver. Nor will
another driver use this backlight device. It's purely for userspace. So
I don't understand how a locking loop can happen.

What this code does for me is pushing brightness changes through the
atomic machinery so I can treat it like any other property change.
So the reason I made it a core helper is that I figured I wasn't the
only one who would want this.

I'll move it inside my driver unless someone chimes in and say they want
it to.

Noralf.

> -Daniel
> 
> 
>> +
>> +static int drm_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +	struct drm_connector *connector = bl_get_data(bd);
>> +	struct drm_device *dev = connector->dev;
>> +	int brightness;
>> +
>> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +	brightness = connector->state->backlight_brightness;
>> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +	return brightness;
>> +}
>> +
>> +static const struct backlight_ops drm_backlight_ops = {
>> +	.get_brightness = drm_backlight_get_brightness,
>> +	.update_status	= drm_backlight_update_status,
>> +};
>> +
>> +/* Can be exported for drivers carrying a legacy name */
>> +static int drm_backlight_register_with_name(struct drm_connector *connector, const char *name)
>> +{
>> +	struct backlight_device *bd;
>> +	const struct backlight_properties props = {
>> +		.type = BACKLIGHT_RAW,
>> +		.scale = BACKLIGHT_SCALE_NON_LINEAR,
>> +		.max_brightness = 100,
>> +	};
>> +
>> +	if (WARN_ON(!drm_core_check_feature(connector->dev, DRIVER_MODESET) ||
>> +		    !drm_drv_uses_atomic_modeset(connector->dev) ||
>> +		    !connector->kdev))
>> +		return -EINVAL;
>> +
>> +	bd = backlight_device_register(name, connector->kdev, connector,
>> +				       &drm_backlight_ops, &props);
>> +	if (IS_ERR(bd))
>> +		return PTR_ERR(bd);
>> +
>> +	connector->backlight = bd;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * drm_backlight_register() - Register a backlight device for a connector
>> + * @connector: Connector
>> + *
>> + * This function registers a backlight device for @connector with the following
>> + * characteristics:
>> + *
>> + * - The connector sysfs device is used as a parent device for the backlight device.
>> + *   Userspace can use this to connect backlight device and connector.
>> + * - Name will be on the form: **card0-HDMI-A-1-backlight**
>> + * - Type is "raw"
>> + * - Scale is "non-linear" (perceptual)
>> + * - Max brightness is 100 giving a range of 0-100 inclusive
>> + * - Reading sysfs **brightness** returns the backlight device property
>> + * - Reading sysfs **actual_brightness** returns the connector state value
>> + * - Writing sysfs **bl_power** is ignored, the DPMS connector property should
>> + *   be used to control power.
>> + * - Backlight device suspend/resume events are ignored.
>> + *
>> + * Note:
>> + *
>> + * Brightness zero should not turn off backlight it should be the minimum
>> + * brightness, DPMS handles power.
>> + *
>> + * This function must be called from &drm_connector_funcs->late_register() since
>> + * it depends on the sysfs device.
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
>> +int drm_backlight_register(struct drm_connector *connector)
>> +{
>> +	const char *name = NULL;
>> +	int ret;
>> +
>> +	name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>> +			 connector->dev->primary->index, connector->name);
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	ret = drm_backlight_register_with_name(connector, name);
>> +	kfree(name);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_backlight_register);
>> +
>> +/**
>> + * drm_backlight_unregister() - Unregister backlight device
>> + * @connector: Connector
>> + *
>> + * Unregister a backlight device. This must be called from the
>> + * &drm_connector_funcs->early_unregister() callback.
>> + */
>> +void drm_backlight_unregister(struct drm_connector *connector)
>> +{
>> +	backlight_device_unregister(connector->backlight);
>> +}
>> +EXPORT_SYMBOL(drm_backlight_unregister);
>> diff --git a/include/drm/drm_backlight_helper.h b/include/drm/drm_backlight_helper.h
>> new file mode 100644
>> index 000000000000..4151b66eb0b4
>> --- /dev/null
>> +++ b/include/drm/drm_backlight_helper.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +
>> +#ifndef _LINUX_DRM_BACKLIGHT_HELPER_H
>> +#define _LINUX_DRM_BACKLIGHT_HELPER_H
>> +
>> +int drm_backlight_register(struct drm_connector *connector);
>> +void drm_backlight_unregister(struct drm_connector *connector);
>> +
>> +#endif
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 221910948b37..ce678b694f45 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -32,6 +32,7 @@
>>  
>>  #include <uapi/drm/drm_mode.h>
>>  
>> +struct backlight_device;
>>  struct drm_connector_helper_funcs;
>>  struct drm_modeset_acquire_ctx;
>>  struct drm_device;
>> @@ -656,6 +657,12 @@ struct drm_connector_state {
>>  	 */
>>  	u8 max_bpc;
>>  
>> +	/**
>> +	 * @backlight_brightness: Brightness value of the connector backlight
>> +	 * device. See drm_backlight_register().
>> +	 */
>> +	u8 backlight_brightness;
>> +
>>  	/**
>>  	 * @hdr_output_metadata:
>>  	 * DRM blob property for HDR output metadata
>> @@ -1422,6 +1429,9 @@ struct drm_connector {
>>  
>>  	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>>  	struct hdr_sink_metadata hdr_sink_metadata;
>> +
>> +	/** @backlight: Backlight device. See drm_backlight_register() */
>> +	struct backlight_device *backlight;
>>  };
>>  
>>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
