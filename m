Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE97301D6F
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 17:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbhAXQTF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jan 2021 11:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbhAXQTD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jan 2021 11:19:03 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05ACC061573
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 08:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=R/e/wQACrTuY60ofCuTTcu9boTWoCwco1UOGZQjtRQI=; b=gvjC/yIdgGbkKapLceDPRKb9pe
        SbK6H4spolAe6YgCmqlFfqp52BjkA3pIMsNOp+ufEMvWWiYbP1ZURmVQVKFVP/HRZXk6VATFUNBl0
        to4It2m24I2eIeCwEkyG5FGXAPLkmgTc/DdmjchMxoc1m/qz4tdVw+wo6qm/p2yATSpgSefyqIKeT
        Z/oLdXtAn4SV5KJuKHFyQzYEkXdx506LMIcnn+iHvvOaI8RF7+I0rCzPF6AZ+3n5Be53hplDA6du4
        Lb6mk0FliYehsXmHeEqRotUOIHQJrh+SRA+UVRz+AMI7Hm2NNdKWqlk2oJem2lKgysY81zstkXjvU
        YISc2ddA==;
Received: from [2a01:799:95f:4600:a14b:28a5:23ac:14a3] (port=58261)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1l3i5Q-0000hZ-2L; Sun, 24 Jan 2021 17:18:00 +0100
Subject: Re: [PATCH v4 3/3] drm: Add Generic USB Display driver
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>, hudson@trmm.net,
        markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
        USB list <linux-usb@vger.kernel.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        peter@stuge.se
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-4-noralf@tronnes.org>
 <CAKMK7uH_5HgOZX+wzqw_EPkOg-nWOYUuGGD+TP-DDd_iQi2m2g@mail.gmail.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a7f85d87-1d91-1a05-c4f7-896a15edcdc3@tronnes.org>
Date:   Sun, 24 Jan 2021 17:17:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH_5HgOZX+wzqw_EPkOg-nWOYUuGGD+TP-DDd_iQi2m2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 20.01.2021 19.02, skrev Daniel Vetter:
> On Wed, Jan 20, 2021 at 6:11 PM Noralf Trønnes <noralf@tronnes.org> wrote:
>>
>> This adds a generic USB display driver with the intention that it can be
>> used with future USB interfaced low end displays/adapters. The Linux
>> gadget device driver will serve as the canonical device implementation.
>>
>> The following DRM properties are supported:
>> - Plane rotation
>> - Connector TV properties
>>
>> There is also support for backlight brightness exposed as a backlight
>> device.
>>
>> Display modes can be made available to the host driver either as DRM
>> display modes or through EDID. If both are present, EDID is just passed
>> on to userspace.
>>
>> Performance is preferred over color depth, so if the device supports
>> RGB565, DRM_CAP_DUMB_PREFERRED_DEPTH will return 16.
>>
>> If the device transfer buffer can't fit an uncompressed framebuffer
>> update, the update is split up into parts that do fit.
>>
>> Optimal user experience is achieved by providing damage reports either by
>> setting FB_DAMAGE_CLIPS on pageflips or calling DRM_IOCTL_MODE_DIRTYFB.
>>
>> LZ4 compression is used if the device supports it.
>>
>> The driver supports a one bit monochrome transfer format: R1. This is not
>> implemented in the gadget driver. It is added in preparation for future
>> monochrome e-ink displays.
>>
>> The driver is MIT licensed to smooth the path for any BSD port of the
>> driver.
>>
>> v2:
>> - Use devm_drm_dev_alloc() and drmm_mode_config_init()
>> - drm_fbdev_generic_setup: Use preferred_bpp=0, 16 was a copy paste error
>> - The drm_backlight_helper is dropped, copy in the code
> 
> I think the backlight is still a bit problematic, since you're using
> kms locks within the backlight callbacks. Other display drivers use
> backlight within their kms locks. This means inconsistent locking
> rules, which upsets lockdep.
> 
> Since you're already handling brightness as a special case in many
> places I don't think it's a big shuffle:
> - add a mutex to the connector struct
> - move brightness value to connector struct, out of the connector_state
> - use the new mutex to protect backlight state both from modeset side
> (if needed, I'm not entirely sure about that) and the backlight side
> 

It's not enough to store the value I need to send it to the device as
well. Currently I send the entire state each time there's a change. To
continue that I would need to keep a copy of the state that I can use
when brightness changes. Or I can treat backlight as an exception and
add a USB control request just for backlight.

There is some special treatment of the backlight in the driver, but I
would really like to handle the backlight brightness through the atomic
machinery. I want to avoid special treatment of backlight in the USB
protocol.

I can avoid the lockdep problem by letting a worker commit the state and
schedule it from the backlight update callback. I'll do that unless you
see other issues with that approach.

Is it ok to take the connection_mutex lock in the get_brightness
callback to get to the connector state and the brightness value?

i915 takes that lock in intel_backlight_device_update_status() and
intel_backlight_device_get_brightness().

> Some more things below, but in general I'd say Acked-by: Daniel Vetter
> <daniel.vetter> fwiw (probably not so much).
> 

Thanks for taking a look, much appreciated.

Noralf.


>> diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
>> new file mode 100644
>> index 000000000000..a4b9bbf48e19
>> --- /dev/null
>> +++ b/drivers/gpu/drm/gud/gud_connector.c
>> @@ -0,0 +1,722 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2020 Noralf Trønnes
>> + */
>> +
>> +#include <linux/backlight.h>
>> +
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_state_helper.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_encoder.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +#include <drm/gud.h>
>> +
>> +#include "gud_internal.h"
>> +
>> +struct gud_connector {
>> +       struct drm_connector connector;
>> +       struct drm_encoder encoder;
>> +       struct backlight_device *backlight;
>> +
>> +       /* Supported properties */
>> +       u16 *properties;
>> +       unsigned int num_properties;
>> +
>> +       /* Initial gadget tv state if applicable, applied on state reset */
>> +       struct drm_tv_connector_state initial_tv_state;
>> +
>> +       /*
>> +        * Initial gadget backlight brightness if applicable, applied on state reset.
>> +        * The value -ENODEV is used to signal no backlight.
>> +        */
>> +       int initial_brightness;
>> +
>> +       unsigned int num_modes;
>> +       size_t edid_len;
>> +};
>> +
>> +static inline struct gud_connector *to_gud_connector(struct drm_connector *connector)
>> +{
>> +       return container_of(connector, struct gud_connector, connector);
>> +}
>> +
>> +static int gud_connector_backlight_update_status(struct backlight_device *bd)
>> +{
>> +       struct drm_connector *connector = bl_get_data(bd);
>> +       struct drm_connector_state *connector_state;
>> +       struct drm_device *dev = connector->dev;
>> +       struct drm_modeset_acquire_ctx ctx;
>> +       struct drm_atomic_state *state;
>> +       int ret;
>> +
>> +       state = drm_atomic_state_alloc(dev);
>> +       if (!state)
>> +               return -ENOMEM;
>> +
>> +       drm_modeset_acquire_init(&ctx, 0);
>> +       state->acquire_ctx = &ctx;
>> +retry:
>> +       connector_state = drm_atomic_get_connector_state(state, connector);
>> +       if (IS_ERR(connector_state)) {
>> +               ret = PTR_ERR(connector_state);
>> +               goto out;
>> +       }
>> +
>> +       /* Reuse tv.brightness to avoid having to subclass */
>> +       connector_state->tv.brightness = bd->props.brightness;
>> +
>> +       ret = drm_atomic_commit(state);
>> +out:
>> +       if (ret == -EDEADLK) {
>> +               drm_atomic_state_clear(state);
>> +               drm_modeset_backoff(&ctx);
>> +               goto retry;
>> +       }
>> +
>> +       drm_atomic_state_put(state);
>> +
>> +       drm_modeset_drop_locks(&ctx);
>> +       drm_modeset_acquire_fini(&ctx);
>> +
>> +       return ret;
>> +}
>> +
>> +static int gud_connector_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +       struct drm_connector *connector = bl_get_data(bd);
>> +       struct drm_device *dev = connector->dev;
>> +       int brightness;
>> +
>> +       drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>> +       brightness = connector->state->tv.brightness;
>> +       drm_modeset_unlock(&dev->mode_config.connection_mutex);
>> +
>> +       return brightness;
>> +}
>> +
>> +static const struct backlight_ops gud_connector_backlight_ops = {
>> +       .get_brightness = gud_connector_backlight_get_brightness,
>> +       .update_status  = gud_connector_backlight_update_status,
>> +};
>> +
>> +static int gud_connector_backlight_register(struct gud_connector *gconn)
>> +{
>> +       struct drm_connector *connector = &gconn->connector;
>> +       struct backlight_device *bd;
>> +       const char *name;
>> +       const struct backlight_properties props = {
>> +               .type = BACKLIGHT_RAW,
>> +               .scale = BACKLIGHT_SCALE_NON_LINEAR,
>> +               .max_brightness = 100,
>> +       };
>> +
>> +       name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>> +                        connector->dev->primary->index, connector->name);
>> +       if (!name)
>> +               return -ENOMEM;
>> +
>> +       bd = backlight_device_register(name, connector->kdev, connector,
>> +                                      &gud_connector_backlight_ops, &props);
>> +       kfree(name);
>> +       if (IS_ERR(bd))
>> +               return PTR_ERR(bd);
>> +
>> +       gconn->backlight = bd;
>> +
>> +       return 0;
>> +}
>> +
>> +static int gud_connector_status_request(struct drm_connector *connector)
>> +{
>> +       struct gud_connector *gconn = to_gud_connector(connector);
>> +       struct gud_device *gdrm = to_gud_device(connector->dev);
>> +       struct gud_connector_status_req req;
>> +       u16 num_modes, edid_len;
>> +       int ret;
>> +
>> +       ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_STATUS,
>> +                         connector->index, &req, sizeof(req));
>> +       if (ret)
>> +               return ret;
>> +
>> +       switch (req.status & GUD_CONNECTOR_STATUS_CONNECTED_MASK) {
>> +       case GUD_CONNECTOR_STATUS_DISCONNECTED:
>> +               ret = connector_status_disconnected;
>> +               break;
>> +       case GUD_CONNECTOR_STATUS_CONNECTED:
>> +               ret = connector_status_connected;
>> +               break;
>> +       default:
>> +               ret = connector_status_unknown;
>> +               break;
>> +       };
>> +
>> +       num_modes = le16_to_cpu(req.num_modes);
>> +       edid_len = le16_to_cpu(req.edid_len);
>> +
>> +       if (edid_len % EDID_LENGTH) {
>> +               drm_err(connector->dev, "%s: Invalid EDID size: %u\n", connector->name, edid_len);
>> +               edid_len = 0;
>> +       }
>> +
>> +       if (req.status & GUD_CONNECTOR_STATUS_CHANGED ||
>> +           gconn->num_modes != num_modes || gconn->edid_len != edid_len)
>> +               connector->epoch_counter += 1;
>> +
>> +       gconn->num_modes = num_modes;
>> +       gconn->edid_len = edid_len;
>> +
>> +       if (!num_modes && !edid_len && ret != connector_status_disconnected)
>> +               drm_dbg_kms(connector->dev, "%s: No modes or EDID.\n", connector->name);
>> +
>> +       return ret;
>> +}
>> +
>> +static int gud_connector_detect(struct drm_connector *connector,
>> +                               struct drm_modeset_acquire_ctx *ctx, bool force)
>> +{
>> +       struct gud_device *gdrm = to_gud_device(connector->dev);
>> +       int idx, ret;
>> +
>> +       if (!drm_dev_enter(connector->dev, &idx))
>> +               return connector_status_disconnected;
>> +
>> +       if (force) {
>> +               ret = gud_usb_set(gdrm, GUD_REQ_SET_CONNECTOR_FORCE_DETECT,
>> +                                 connector->index, NULL, 0);
>> +               if (ret) {
>> +                       ret = connector_status_unknown;
>> +                       goto exit;
>> +               }
>> +       }
>> +
>> +       ret = gud_connector_status_request(connector);
>> +       if (ret < 0)
>> +               ret = connector_status_unknown;
>> +exit:
>> +       drm_dev_exit(idx);
>> +
>> +       return ret;
>> +}
>> +
>> +struct gud_connector_get_edid_ctx {
>> +       struct gud_connector *gconn;
>> +       void *buf;
>> +};
>> +
>> +static int gud_connector_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>> +{
>> +       struct gud_connector_get_edid_ctx *ctx = data;
>> +       struct gud_connector *gconn = ctx->gconn;
>> +       size_t start = block * EDID_LENGTH;
>> +
>> +       if (start + len > gconn->edid_len)
>> +               return -1;
>> +
>> +       if (!block) {
>> +               struct gud_device *gdrm = to_gud_device(gconn->connector.dev);
>> +               int ret;
>> +
>> +               /* Check because drm_do_get_edid() will retry on failure */
>> +               if (!ctx->buf)
>> +                       ctx->buf = kmalloc(gconn->edid_len, GFP_KERNEL);
>> +               if (!ctx->buf)
>> +                       return -1;
>> +
>> +               ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, gconn->connector.index,
>> +                                 ctx->buf, gconn->edid_len);
>> +               if (ret)
>> +                       return -1;
>> +       }
>> +
>> +       memcpy(buf, ctx->buf + start, len);
>> +
>> +       return 0;
>> +}
>> +
>> +static int gud_connector_get_modes(struct drm_connector *connector)
>> +{
>> +       struct gud_connector *gconn = to_gud_connector(connector);
>> +       struct gud_device *gdrm = to_gud_device(connector->dev);
>> +       struct gud_connector_get_edid_ctx edid_ctx = {
>> +               .gconn = gconn,
>> +       };
>> +       struct gud_display_mode_req *reqmodes = NULL;
>> +       unsigned int i, num_modes = 0;
>> +       struct edid *edid = NULL;
>> +       bool edid_override;
>> +       int idx, ret;
>> +
>> +       if (!drm_dev_enter(connector->dev, &idx))
>> +               return 0;
>> +
>> +       if (connector->force) {
>> +               ret = gud_connector_status_request(connector);
>> +               if (ret < 0)
>> +                       goto out;
>> +       }
>> +
>> +       edid = drm_do_get_edid(connector, gud_connector_get_edid_block, &edid_ctx);
>> +       edid_override = edid && !edid_ctx.buf;
>> +       kfree(edid_ctx.buf);
>> +       drm_connector_update_edid_property(connector, edid);
>> +
>> +       if (!gconn->num_modes || edid_override) {
>> +               num_modes = drm_add_edid_modes(connector, edid);
>> +               goto out;
>> +       }
>> +
>> +       reqmodes = kmalloc_array(gconn->num_modes, sizeof(*reqmodes), GFP_KERNEL);
>> +       if (!reqmodes)
>> +               goto out;
>> +
>> +       ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_MODES, connector->index,
>> +                         reqmodes, gconn->num_modes * sizeof(*reqmodes));
>> +       if (ret)
>> +               goto out;
>> +
>> +       for (i = 0; i < gconn->num_modes; i++) {
>> +               struct drm_display_mode *mode;
>> +
>> +               mode = drm_mode_create(connector->dev);
>> +               if (!mode)
>> +                       goto out;
>> +
>> +               gud_to_display_mode(mode, &reqmodes[i]);
>> +               drm_mode_probed_add(connector, mode);
>> +               num_modes++;
>> +       }
>> +out:
>> +       kfree(reqmodes);
>> +       kfree(edid);
>> +       drm_dev_exit(idx);
>> +
>> +       return num_modes;
>> +}
>> +
>> +static int gud_connector_atomic_check(struct drm_connector *connector,
>> +                                     struct drm_atomic_state *state)
>> +{
>> +       struct drm_connector_state *new_state;
>> +       struct drm_crtc_state *new_crtc_state;
>> +       struct drm_connector_state *old_state;
>> +
>> +       new_state = drm_atomic_get_new_connector_state(state, connector);
>> +       if (!new_state->crtc)
>> +               return 0;
>> +
>> +       old_state = drm_atomic_get_old_connector_state(state, connector);
>> +       new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>> +
>> +       if (old_state->tv.margins.left != new_state->tv.margins.left ||
>> +           old_state->tv.margins.right != new_state->tv.margins.right ||
>> +           old_state->tv.margins.top != new_state->tv.margins.top ||
>> +           old_state->tv.margins.bottom != new_state->tv.margins.bottom ||
>> +           old_state->tv.mode != new_state->tv.mode ||
>> +           old_state->tv.brightness != new_state->tv.brightness ||
>> +           old_state->tv.contrast != new_state->tv.contrast ||
>> +           old_state->tv.flicker_reduction != new_state->tv.flicker_reduction ||
>> +           old_state->tv.overscan != new_state->tv.overscan ||
>> +           old_state->tv.saturation != new_state->tv.saturation ||
>> +           old_state->tv.hue != new_state->tv.hue)
>> +               new_crtc_state->connectors_changed = true;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct drm_connector_helper_funcs gud_connector_helper_funcs = {
>> +       .detect_ctx = gud_connector_detect,
>> +       .get_modes = gud_connector_get_modes,
>> +       .atomic_check = gud_connector_atomic_check,
>> +};
>> +
>> +static int gud_connector_late_register(struct drm_connector *connector)
>> +{
>> +       struct gud_connector *gconn = to_gud_connector(connector);
>> +
>> +       if (gconn->initial_brightness < 0)
>> +               return 0;
>> +
>> +       return gud_connector_backlight_register(gconn);
>> +}
>> +
>> +static void gud_connector_early_unregister(struct drm_connector *connector)
>> +{
>> +       struct gud_connector *gconn = to_gud_connector(connector);
>> +
>> +       backlight_device_unregister(gconn->backlight);
>> +}
>> +
>> +static void gud_connector_destroy(struct drm_connector *connector)
>> +{
>> +       struct gud_connector *gconn = to_gud_connector(connector);
>> +
>> +       drm_connector_cleanup(connector);
>> +       kfree(gconn->properties);
>> +       kfree(gconn);
>> +}
>> +
>> +static void gud_connector_reset(struct drm_connector *connector)
>> +{
>> +       struct gud_connector *gconn = to_gud_connector(connector);
>> +
>> +       drm_atomic_helper_connector_reset(connector);
>> +       connector->state->tv = gconn->initial_tv_state;
>> +       /* Set margins from command line */
>> +       drm_atomic_helper_connector_tv_reset(connector);
>> +       if (gconn->initial_brightness >= 0)
>> +               connector->state->tv.brightness = gconn->initial_brightness;
>> +}
>> +
>> +static const struct drm_connector_funcs gud_connector_funcs = {
>> +       .fill_modes = drm_helper_probe_single_connector_modes,
>> +       .late_register = gud_connector_late_register,
>> +       .early_unregister = gud_connector_early_unregister,
>> +       .destroy = gud_connector_destroy,
>> +       .reset = gud_connector_reset,
>> +       .atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +/*
>> + * The tv.mode property is shared among the connectors and its enum names are
>> + * driver specific. This means that if more than one connector uses tv.mode,
>> + * the enum names has to be the same.
>> + */
>> +static int gud_connector_add_tv_mode(struct gud_device *gdrm,
>> +                                    struct drm_connector *connector, u64 val)
>> +{
>> +       unsigned int i, num_modes;
>> +       const char **modes;
>> +       size_t buf_len;
>> +       char *buf;
>> +       int ret;
>> +
>> +       num_modes = val >> GUD_CONNECTOR_TV_MODE_NUM_SHIFT;
>> +
>> +       if (!num_modes)
>> +               return -EINVAL;
>> +
>> +       buf_len = num_modes * GUD_CONNECTOR_TV_MODE_NAME_LEN;
>> +       modes = kmalloc_array(num_modes, sizeof(*modes), GFP_KERNEL);
>> +       buf = kmalloc(buf_len, GFP_KERNEL);
>> +       if (!modes || !buf) {
>> +               ret = -ENOMEM;
>> +               goto free;
>> +       }
>> +
>> +       ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_TV_MODE_VALUES,
>> +                         connector->index, buf, buf_len);
>> +       if (ret)
>> +               goto free;
>> +
>> +       for (i = 0; i < num_modes; i++)
>> +               modes[i] = &buf[i * GUD_CONNECTOR_TV_MODE_NAME_LEN];
>> +
>> +       ret = drm_mode_create_tv_properties(connector->dev, num_modes, modes);
>> +free:
>> +       kfree(modes);
>> +       kfree(buf);
>> +
>> +       return ret;
>> +}
>> +
>> +static struct drm_property *
>> +gud_connector_property_lookup(struct drm_connector *connector, u16 prop)
>> +{
>> +       struct drm_mode_config *config = &connector->dev->mode_config;
>> +
>> +       switch (prop) {
>> +       case GUD_PROPERTY_TV_LEFT_MARGIN:
>> +               return config->tv_left_margin_property;
>> +       case GUD_PROPERTY_TV_RIGHT_MARGIN:
>> +               return config->tv_right_margin_property;
>> +       case GUD_PROPERTY_TV_TOP_MARGIN:
>> +               return config->tv_top_margin_property;
>> +       case GUD_PROPERTY_TV_BOTTOM_MARGIN:
>> +               return config->tv_bottom_margin_property;
>> +       case GUD_PROPERTY_TV_MODE:
>> +               return config->tv_mode_property;
>> +       case GUD_PROPERTY_TV_BRIGHTNESS:
>> +               return config->tv_brightness_property;
>> +       case GUD_PROPERTY_TV_CONTRAST:
>> +               return config->tv_contrast_property;
>> +       case GUD_PROPERTY_TV_FLICKER_REDUCTION:
>> +               return config->tv_flicker_reduction_property;
>> +       case GUD_PROPERTY_TV_OVERSCAN:
>> +               return config->tv_overscan_property;
>> +       case GUD_PROPERTY_TV_SATURATION:
>> +               return config->tv_saturation_property;
>> +       case GUD_PROPERTY_TV_HUE:
>> +               return config->tv_hue_property;
>> +       default:
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +}
>> +
>> +static unsigned int *gud_connector_tv_state_val(u16 prop, struct drm_tv_connector_state *state)
>> +{
>> +       switch (prop) {
>> +       case GUD_PROPERTY_TV_LEFT_MARGIN:
>> +               return &state->margins.left;
>> +       case GUD_PROPERTY_TV_RIGHT_MARGIN:
>> +               return &state->margins.right;
>> +       case GUD_PROPERTY_TV_TOP_MARGIN:
>> +               return &state->margins.top;
>> +       case GUD_PROPERTY_TV_BOTTOM_MARGIN:
>> +               return &state->margins.bottom;
>> +       case GUD_PROPERTY_TV_MODE:
>> +               return &state->mode;
>> +       case GUD_PROPERTY_TV_BRIGHTNESS:
>> +               return &state->brightness;
>> +       case GUD_PROPERTY_TV_CONTRAST:
>> +               return &state->contrast;
>> +       case GUD_PROPERTY_TV_FLICKER_REDUCTION:
>> +               return &state->flicker_reduction;
>> +       case GUD_PROPERTY_TV_OVERSCAN:
>> +               return &state->overscan;
>> +       case GUD_PROPERTY_TV_SATURATION:
>> +               return &state->saturation;
>> +       case GUD_PROPERTY_TV_HUE:
>> +               return &state->hue;
>> +       default:
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +}
>> +
>> +static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_connector *gconn,
>> +                                       unsigned int num_properties)
>> +{
>> +       struct drm_device *drm = &gdrm->drm;
>> +       struct drm_connector *connector = &gconn->connector;
>> +       struct gud_property_req *properties;
>> +       unsigned int i;
>> +       int ret;
>> +
>> +       gconn->properties = kcalloc(num_properties, sizeof(*gconn->properties), GFP_KERNEL);
>> +       if (!gconn->properties)
>> +               return -ENOMEM;
>> +
>> +       properties = kcalloc(num_properties, sizeof(*properties), GFP_KERNEL);
>> +       if (!properties)
>> +               return -ENOMEM;
>> +
>> +       ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_PROPERTIES, connector->index,
>> +                         properties, num_properties * sizeof(*properties));
>> +       if (ret)
>> +               goto out;
>> +
>> +       for (i = 0; i < num_properties; i++) {
>> +               u16 prop = le16_to_cpu(properties[i].prop);
>> +               u64 val = le64_to_cpu(properties[i].val);
>> +               struct drm_property *property;
>> +               unsigned int *state_val;
>> +
>> +               drm_dbg(drm, "property: %u = %llu(0x%llx)\n", prop, val, val);
>> +
>> +               switch (prop) {
>> +               case GUD_PROPERTY_TV_LEFT_MARGIN:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_RIGHT_MARGIN:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_TOP_MARGIN:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_BOTTOM_MARGIN:
>> +                       ret = drm_mode_create_tv_margin_properties(drm);
>> +                       if (ret)
>> +                               goto out;
>> +                       break;
>> +               case GUD_PROPERTY_TV_MODE:
>> +                       ret = gud_connector_add_tv_mode(gdrm, connector, val);
>> +                       if (ret)
>> +                               goto out;
>> +                       val = val & (BIT(GUD_CONNECTOR_TV_MODE_NUM_SHIFT) - 1);
>> +                       break;
>> +               case GUD_PROPERTY_TV_BRIGHTNESS:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_CONTRAST:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_FLICKER_REDUCTION:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_OVERSCAN:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_SATURATION:
>> +                       fallthrough;
>> +               case GUD_PROPERTY_TV_HUE:
>> +                       /* This is a no-op if already added. */
>> +                       ret = drm_mode_create_tv_properties(drm, 0, NULL);
>> +                       if (ret)
>> +                               goto out;
>> +                       break;
>> +               case GUD_PROPERTY_BACKLIGHT_BRIGHTNESS:
>> +                       if (val > 100) {
>> +                               ret = -EINVAL;
>> +                               goto out;
>> +                       }
>> +                       gconn->initial_brightness = val;
>> +                       break;
>> +               default:
>> +                       /* New ones might show up in future devices, skip those we don't know. */
>> +                       drm_dbg(drm, "Unknown property: %u\n", prop);
>> +                       continue;
>> +               }
>> +
>> +               gconn->properties[gconn->num_properties++] = prop;
>> +
>> +               if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS)
>> +                       continue; /* not a DRM property */
>> +
>> +               property = gud_connector_property_lookup(connector, prop);
>> +               if (WARN_ON(IS_ERR(property)))
>> +                       continue;
>> +
>> +               state_val = gud_connector_tv_state_val(prop, &gconn->initial_tv_state);
>> +               if (WARN_ON(IS_ERR(state_val)))
>> +                       continue;
>> +
>> +               *state_val = val;
>> +               drm_object_attach_property(&connector->base, property, 0);
>> +       }
>> +out:
>> +       kfree(properties);
>> +
>> +       return ret;
>> +}
>> +
>> +int gud_connector_fill_properties(struct drm_connector *connector,
>> +                                 struct drm_connector_state *connector_state,
>> +                                 struct gud_property_req *properties)
>> +{
>> +       struct gud_connector *gconn;
>> +       unsigned int i;
>> +
>> +       gconn = to_gud_connector(connector);
>> +
>> +       /* Only interested in the count? */
>> +       if (!connector_state)
>> +               return gconn->num_properties;
>> +
>> +       for (i = 0; i < gconn->num_properties; i++) {
>> +               u16 prop = gconn->properties[i];
>> +               u64 val;
>> +
>> +               if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
>> +                       val = connector_state->tv.brightness;
>> +               } else {
>> +                       unsigned int *state_val;
>> +
>> +                       state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
>> +                       if (WARN_ON_ONCE(IS_ERR(state_val)))
>> +                               return PTR_ERR(state_val);
>> +
>> +                       val = *state_val;
>> +               }
>> +
>> +               properties[i].prop = cpu_to_le16(prop);
>> +               properties[i].val = cpu_to_le64(val);
>> +       }
>> +
>> +       return gconn->num_properties;
>> +}
>> +
>> +int gud_connector_create(struct gud_device *gdrm, unsigned int index)
>> +{
>> +       struct gud_connector_descriptor_req desc;
>> +       struct drm_device *drm = &gdrm->drm;
>> +       struct gud_connector *gconn;
>> +       struct drm_connector *connector;
>> +       struct drm_encoder *encoder;
>> +       int ret, connector_type;
>> +       u32 flags;
>> +
>> +       ret = gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR, index, &desc, sizeof(desc));
>> +       if (ret)
>> +               return ret;
>> +
>> +       gconn = kzalloc(sizeof(*gconn), GFP_KERNEL);
> 
> Would be nice to do that with drmm_, but we don't have the
> drmm_connector_alloc wrapper yet.
> 
>> +       if (!gconn)
>> +               return -ENOMEM;
>> +
>> +       gconn->initial_brightness = -ENODEV;
>> +       flags = le32_to_cpu(desc.flags);
>> +       connector = &gconn->connector;
>> +
>> +       drm_dbg(drm, "Connector: index=%u type=%u flags=0x%x num_properties=%u\n",
>> +               index, desc.connector_type, flags, desc.num_properties);
>> +
>> +       switch (desc.connector_type) {
>> +       case GUD_CONNECTOR_TYPE_PANEL:
>> +               connector_type = DRM_MODE_CONNECTOR_USB;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_VGA:
>> +               connector_type = DRM_MODE_CONNECTOR_VGA;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_DVI:
>> +               connector_type = DRM_MODE_CONNECTOR_DVID;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_COMPOSITE:
>> +               connector_type = DRM_MODE_CONNECTOR_Composite;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_SVIDEO:
>> +               connector_type = DRM_MODE_CONNECTOR_SVIDEO;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_COMPONENT:
>> +               connector_type = DRM_MODE_CONNECTOR_Component;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_DISPLAYPORT:
>> +               connector_type = DRM_MODE_CONNECTOR_DisplayPort;
>> +               break;
>> +       case GUD_CONNECTOR_TYPE_HDMI:
>> +               connector_type = DRM_MODE_CONNECTOR_HDMIA;
>> +               break;
>> +       default: /* future types */
>> +               connector_type = DRM_MODE_CONNECTOR_USB;
>> +               break;
>> +       };
>> +
>> +       drm_connector_helper_add(connector, &gud_connector_helper_funcs);
>> +       ret = drm_connector_init(drm, connector, &gud_connector_funcs, connector_type);
>> +       if (ret) {
>> +               kfree(connector);
>> +               return ret;
>> +       }
>> +
>> +       if (WARN_ON(connector->index != index))
>> +               return -EINVAL;
>> +
>> +       if (flags & GUD_CONNECTOR_FLAGS_POLL_STATUS)
>> +               connector->polled = (DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT);
>> +       if (flags & GUD_CONNECTOR_FLAGS_INTERLACE)
>> +               connector->interlace_allowed = true;
>> +       if (flags & GUD_CONNECTOR_FLAGS_DOUBLESCAN)
>> +               connector->doublescan_allowed = true;
>> +
>> +       if (desc.num_properties) {
>> +               ret = gud_connector_add_properties(gdrm, gconn, desc.num_properties);
>> +               if (ret) {
>> +                       dev_err(drm->dev, "Failed to add connector/%u properties\n", index);
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       /* The first connector is attached to the existing simple pipe encoder */
>> +       if (!connector->index) {
>> +               encoder = &gdrm->pipe.encoder;
>> +       } else {
>> +               encoder = &gconn->encoder;
>> +
>> +               ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               encoder->possible_crtcs = 1;
>> +       }
>> +
>> +       return drm_connector_attach_encoder(connector, encoder);
>> +}
