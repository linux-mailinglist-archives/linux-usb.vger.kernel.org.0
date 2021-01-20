Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EF52FD7C2
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 19:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404148AbhATSEV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 13:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390908AbhATSDe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 13:03:34 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B835AC061757
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 10:02:49 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id a109so24247079otc.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 10:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fdKZTiV4Dlj3fu/0Tocy4ySjvQu80yzqWsAHQT7bEbk=;
        b=UeLepTBI5zuFV2Y0ThIi2p9mghOUBqjqHaF3nSM4Ingr9l4J79KcWHeNlOOJ0RP7II
         AHsfbkBM8aFO2tfUEQpaevSL9ikM74iy4s9vJUfp08x2iiwCTBwhAVTwEQ92De81Jvd6
         L2PUlD8ff7uzW0ZOrtTvL0LR7O36wTEM+aNgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fdKZTiV4Dlj3fu/0Tocy4ySjvQu80yzqWsAHQT7bEbk=;
        b=LNPXsmDTRBGwPF+BHJIkkpu5dUaAFwR6juSYG03DLriFm5bZA9uQA4ntyHmr8kADMk
         ASVnIMsUrfVVIbj5OoTO9p3dZXPFYBzI4qYIuypdqe12cfvMcZbLa+9uqgJhtiUhYOOL
         ULJI3n95F58QTJT0+zLc0CiW0znzmfZtNmpqjRjkVyueb3FenhqsDel3HiZGrpfOvxZB
         uu1+xbnJ0IN4mMPl9da6bTEsjz4BUoP9vrGTxxAKCJN/p6NeeCRAiMeV5Av3DeUy64lv
         E8NJh5e07y6vjazMqCCVyZRg8f1bAqob+4sJqez811/y0nx2G5AbN5PEeZfVq+D4wv7I
         8dlw==
X-Gm-Message-State: AOAM532rcvOxyoI4ZqaCAtC6vR+fTTgHDT6XnA73M5++mDhW2mUdYyY8
        6BBYEx/x4aHQvk1ZPgo1bxDNQFVLke3+25VjhVa1/g==
X-Google-Smtp-Source: ABdhPJyGxvK78cnvwLAbg6kAY4wn5BdEvm0jL1ZJw/kHULgqG+6tT1sFnvGodvkXJFWkiFlHfg4MT7H2P0rv+SNM1ok=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr7744794otj.188.1611165768476;
 Wed, 20 Jan 2021 10:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org> <20210120170033.38468-4-noralf@tronnes.org>
In-Reply-To: <20210120170033.38468-4-noralf@tronnes.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 20 Jan 2021 19:02:36 +0100
Message-ID: <CAKMK7uH_5HgOZX+wzqw_EPkOg-nWOYUuGGD+TP-DDd_iQi2m2g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm: Add Generic USB Display driver
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>, hudson@trmm.net,
        markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
        USB list <linux-usb@vger.kernel.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        peter@stuge.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 20, 2021 at 6:11 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
>
> This adds a generic USB display driver with the intention that it can be
> used with future USB interfaced low end displays/adapters. The Linux
> gadget device driver will serve as the canonical device implementation.
>
> The following DRM properties are supported:
> - Plane rotation
> - Connector TV properties
>
> There is also support for backlight brightness exposed as a backlight
> device.
>
> Display modes can be made available to the host driver either as DRM
> display modes or through EDID. If both are present, EDID is just passed
> on to userspace.
>
> Performance is preferred over color depth, so if the device supports
> RGB565, DRM_CAP_DUMB_PREFERRED_DEPTH will return 16.
>
> If the device transfer buffer can't fit an uncompressed framebuffer
> update, the update is split up into parts that do fit.
>
> Optimal user experience is achieved by providing damage reports either by
> setting FB_DAMAGE_CLIPS on pageflips or calling DRM_IOCTL_MODE_DIRTYFB.
>
> LZ4 compression is used if the device supports it.
>
> The driver supports a one bit monochrome transfer format: R1. This is not
> implemented in the gadget driver. It is added in preparation for future
> monochrome e-ink displays.
>
> The driver is MIT licensed to smooth the path for any BSD port of the
> driver.
>
> v2:
> - Use devm_drm_dev_alloc() and drmm_mode_config_init()
> - drm_fbdev_generic_setup: Use preferred_bpp=3D0, 16 was a copy paste err=
or
> - The drm_backlight_helper is dropped, copy in the code

I think the backlight is still a bit problematic, since you're using
kms locks within the backlight callbacks. Other display drivers use
backlight within their kms locks. This means inconsistent locking
rules, which upsets lockdep.

Since you're already handling brightness as a special case in many
places I don't think it's a big shuffle:
- add a mutex to the connector struct
- move brightness value to connector struct, out of the connector_state
- use the new mutex to protect backlight state both from modeset side
(if needed, I'm not entirely sure about that) and the backlight side

Some more things below, but in general I'd say Acked-by: Daniel Vetter
<daniel.vetter> fwiw (probably not so much).

Cheers, Daniel

> - Support protocol version backwards compatibility for device
>
> v3:
> - Use donated Openmoko USB pid
> - Use direct compression from framebuffer when pitch matches, not only on
>   full frames, so split updates can benefit
> - Use __le16 in struct gud_drm_req_get_connector_status
> - Set edid property when the device only provides edid
> - Clear compression fields in struct gud_drm_req_set_buffer
> - Fix protocol version negotiation
> - Remove mode->vrefresh, it's calculated
>
> v4:
> - Drop the status req polling which was a workaround for something that
>   turned out to be a dwc2 udc driver problem
> - Add a flag for the Linux gadget to require a status request on
>   SET operations. Other devices will only get status req on STALL errors
> - Use protocol specific error codes (Peter)
> - Add a flag for devices that want to receive the entire framebuffer on
>   each flush (Lubomir)
> - Retry a failed framebuffer flush
> - If mode has changed wait for worker and clear pending damage before
>   queuing up new damage, fb width/height might have changed
> - Increase error counter on bulk transfer failures
> - Use DRM_MODE_CONNECTOR_USB
> - Handle R1 kmalloc error (Peter)
> - Don't try and replicate the USB get descriptor request standard for the
>   display descriptor (Peter)
> - Make max_buffer_size optional (Peter), drop the pow2 requirement since
>   it's not necessary anymore.
> - Don't pre-alloc a control request buffer, it was only 4k
> - Let gud.h describe the whole protocol explicitly and don't let DRM
>   leak into it (Peter)
> - Drop display mode .hskew and .vscan from the protocol
> - Shorten names: s/GUD_DRM_/GUD_/ s/gud_drm_/gud_/ (Peter)
> - Fix gud_pipe_check() connector picking when switching connector
> - Drop gud_drm_driver_gem_create_object() cached is default now
> - Retrieve USB device from struct drm_device.dev instead of keeping a
>   pointer
> - Honour fb->offsets[0]
> - Fix mode fetching when connector status is forced
> - Check EDID length reported by the device
> - Use drm_do_get_edid() so userspace can overrride EDID
> - Set epoch counter to signal connector status change
> - gud_drm_driver can be const now
>
> Cc: Peter Stuge <peter@stuge.se>
> Cc: Lubomir Rintel <lkundrak@v3.sk>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>


> ---
>  MAINTAINERS                         |   8 +
>  drivers/gpu/drm/Kconfig             |   2 +
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/gud/Kconfig         |  14 +
>  drivers/gpu/drm/gud/Makefile        |   4 +
>  drivers/gpu/drm/gud/gud_connector.c | 722 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_drv.c       | 620 ++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_internal.h  | 148 ++++++
>  drivers/gpu/drm/gud/gud_pipe.c      | 472 ++++++++++++++++++
>  include/drm/gud.h                   | 356 ++++++++++++++
>  10 files changed, 2347 insertions(+)
>  create mode 100644 drivers/gpu/drm/gud/Kconfig
>  create mode 100644 drivers/gpu/drm/gud/Makefile
>  create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>  create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>  create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>  create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>  create mode 100644 include/drm/gud.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00112c044608..e7f71ac55f08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5525,6 +5525,14 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/display/panel/feiyang,fy07024di=
26a30d.yaml
>  F:     drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
>
> +DRM DRIVER FOR GENERIC USB DISPLAY
> +M:     Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> +S:     Maintained
> +W:     https://github.com/notro/gud/wiki
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     drivers/gpu/drm/gud/
> +F:     include/drm/gud.h
> +
>  DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
>  M:     Hans de Goede <hdegoede@redhat.com>
>  S:     Maintained
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 147d61b9674e..6d3f47933e51 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -388,6 +388,8 @@ source "drivers/gpu/drm/tidss/Kconfig"
>
>  source "drivers/gpu/drm/xlnx/Kconfig"
>
> +source "drivers/gpu/drm/gud/Kconfig"
> +
>  # Keep legacy drivers last
>
>  menuconfig DRM_LEGACY
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 81569009f884..78dd8e12525d 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -124,3 +124,4 @@ obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed/
>  obj-$(CONFIG_DRM_MCDE) +=3D mcde/
>  obj-$(CONFIG_DRM_TIDSS) +=3D tidss/
>  obj-y                  +=3D xlnx/
> +obj-y                  +=3D gud/
> diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
> new file mode 100644
> index 000000000000..d832cd63687c
> --- /dev/null
> +++ b/drivers/gpu/drm/gud/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config DRM_GUD
> +       tristate "Generic USB Display"
> +       depends on DRM && USB
> +       select LZ4_COMPRESS
> +       select DRM_KMS_HELPER
> +       select DRM_GEM_SHMEM_HELPER
> +       select BACKLIGHT_CLASS_DEVICE
> +       help
> +         This is a DRM display driver for Generic USB Displays or displa=
y
> +         adapters.
> +
> +         If M is selected the module will be called gud.
> diff --git a/drivers/gpu/drm/gud/Makefile b/drivers/gpu/drm/gud/Makefile
> new file mode 100644
> index 000000000000..d2bb53a65de6
> --- /dev/null
> +++ b/drivers/gpu/drm/gud/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +gud-objs                       :=3D gud_drv.o gud_pipe.o gud_connector.o
> +obj-$(CONFIG_DRM_GUD)          +=3D gud.o
> diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gu=
d_connector.c
> new file mode 100644
> index 000000000000..a4b9bbf48e19
> --- /dev/null
> +++ b/drivers/gpu/drm/gud/gud_connector.c
> @@ -0,0 +1,722 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2020 Noralf Tr=C3=B8nnes
> + */
> +
> +#include <linux/backlight.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/gud.h>
> +
> +#include "gud_internal.h"
> +
> +struct gud_connector {
> +       struct drm_connector connector;
> +       struct drm_encoder encoder;
> +       struct backlight_device *backlight;
> +
> +       /* Supported properties */
> +       u16 *properties;
> +       unsigned int num_properties;
> +
> +       /* Initial gadget tv state if applicable, applied on state reset =
*/
> +       struct drm_tv_connector_state initial_tv_state;
> +
> +       /*
> +        * Initial gadget backlight brightness if applicable, applied on =
state reset.
> +        * The value -ENODEV is used to signal no backlight.
> +        */
> +       int initial_brightness;
> +
> +       unsigned int num_modes;
> +       size_t edid_len;
> +};
> +
> +static inline struct gud_connector *to_gud_connector(struct drm_connecto=
r *connector)
> +{
> +       return container_of(connector, struct gud_connector, connector);
> +}
> +
> +static int gud_connector_backlight_update_status(struct backlight_device=
 *bd)
> +{
> +       struct drm_connector *connector =3D bl_get_data(bd);
> +       struct drm_connector_state *connector_state;
> +       struct drm_device *dev =3D connector->dev;
> +       struct drm_modeset_acquire_ctx ctx;
> +       struct drm_atomic_state *state;
> +       int ret;
> +
> +       state =3D drm_atomic_state_alloc(dev);
> +       if (!state)
> +               return -ENOMEM;
> +
> +       drm_modeset_acquire_init(&ctx, 0);
> +       state->acquire_ctx =3D &ctx;
> +retry:
> +       connector_state =3D drm_atomic_get_connector_state(state, connect=
or);
> +       if (IS_ERR(connector_state)) {
> +               ret =3D PTR_ERR(connector_state);
> +               goto out;
> +       }
> +
> +       /* Reuse tv.brightness to avoid having to subclass */
> +       connector_state->tv.brightness =3D bd->props.brightness;
> +
> +       ret =3D drm_atomic_commit(state);
> +out:
> +       if (ret =3D=3D -EDEADLK) {
> +               drm_atomic_state_clear(state);
> +               drm_modeset_backoff(&ctx);
> +               goto retry;
> +       }
> +
> +       drm_atomic_state_put(state);
> +
> +       drm_modeset_drop_locks(&ctx);
> +       drm_modeset_acquire_fini(&ctx);
> +
> +       return ret;
> +}
> +
> +static int gud_connector_backlight_get_brightness(struct backlight_devic=
e *bd)
> +{
> +       struct drm_connector *connector =3D bl_get_data(bd);
> +       struct drm_device *dev =3D connector->dev;
> +       int brightness;
> +
> +       drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +       brightness =3D connector->state->tv.brightness;
> +       drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +       return brightness;
> +}
> +
> +static const struct backlight_ops gud_connector_backlight_ops =3D {
> +       .get_brightness =3D gud_connector_backlight_get_brightness,
> +       .update_status  =3D gud_connector_backlight_update_status,
> +};
> +
> +static int gud_connector_backlight_register(struct gud_connector *gconn)
> +{
> +       struct drm_connector *connector =3D &gconn->connector;
> +       struct backlight_device *bd;
> +       const char *name;
> +       const struct backlight_properties props =3D {
> +               .type =3D BACKLIGHT_RAW,
> +               .scale =3D BACKLIGHT_SCALE_NON_LINEAR,
> +               .max_brightness =3D 100,
> +       };
> +
> +       name =3D kasprintf(GFP_KERNEL, "card%d-%s-backlight",
> +                        connector->dev->primary->index, connector->name)=
;
> +       if (!name)
> +               return -ENOMEM;
> +
> +       bd =3D backlight_device_register(name, connector->kdev, connector=
,
> +                                      &gud_connector_backlight_ops, &pro=
ps);
> +       kfree(name);
> +       if (IS_ERR(bd))
> +               return PTR_ERR(bd);
> +
> +       gconn->backlight =3D bd;
> +
> +       return 0;
> +}
> +
> +static int gud_connector_status_request(struct drm_connector *connector)
> +{
> +       struct gud_connector *gconn =3D to_gud_connector(connector);
> +       struct gud_device *gdrm =3D to_gud_device(connector->dev);
> +       struct gud_connector_status_req req;
> +       u16 num_modes, edid_len;
> +       int ret;
> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_STATUS,
> +                         connector->index, &req, sizeof(req));
> +       if (ret)
> +               return ret;
> +
> +       switch (req.status & GUD_CONNECTOR_STATUS_CONNECTED_MASK) {
> +       case GUD_CONNECTOR_STATUS_DISCONNECTED:
> +               ret =3D connector_status_disconnected;
> +               break;
> +       case GUD_CONNECTOR_STATUS_CONNECTED:
> +               ret =3D connector_status_connected;
> +               break;
> +       default:
> +               ret =3D connector_status_unknown;
> +               break;
> +       };
> +
> +       num_modes =3D le16_to_cpu(req.num_modes);
> +       edid_len =3D le16_to_cpu(req.edid_len);
> +
> +       if (edid_len % EDID_LENGTH) {
> +               drm_err(connector->dev, "%s: Invalid EDID size: %u\n", co=
nnector->name, edid_len);
> +               edid_len =3D 0;
> +       }
> +
> +       if (req.status & GUD_CONNECTOR_STATUS_CHANGED ||
> +           gconn->num_modes !=3D num_modes || gconn->edid_len !=3D edid_=
len)
> +               connector->epoch_counter +=3D 1;
> +
> +       gconn->num_modes =3D num_modes;
> +       gconn->edid_len =3D edid_len;
> +
> +       if (!num_modes && !edid_len && ret !=3D connector_status_disconne=
cted)
> +               drm_dbg_kms(connector->dev, "%s: No modes or EDID.\n", co=
nnector->name);
> +
> +       return ret;
> +}
> +
> +static int gud_connector_detect(struct drm_connector *connector,
> +                               struct drm_modeset_acquire_ctx *ctx, bool=
 force)
> +{
> +       struct gud_device *gdrm =3D to_gud_device(connector->dev);
> +       int idx, ret;
> +
> +       if (!drm_dev_enter(connector->dev, &idx))
> +               return connector_status_disconnected;
> +
> +       if (force) {
> +               ret =3D gud_usb_set(gdrm, GUD_REQ_SET_CONNECTOR_FORCE_DET=
ECT,
> +                                 connector->index, NULL, 0);
> +               if (ret) {
> +                       ret =3D connector_status_unknown;
> +                       goto exit;
> +               }
> +       }
> +
> +       ret =3D gud_connector_status_request(connector);
> +       if (ret < 0)
> +               ret =3D connector_status_unknown;
> +exit:
> +       drm_dev_exit(idx);
> +
> +       return ret;
> +}
> +
> +struct gud_connector_get_edid_ctx {
> +       struct gud_connector *gconn;
> +       void *buf;
> +};
> +
> +static int gud_connector_get_edid_block(void *data, u8 *buf, unsigned in=
t block, size_t len)
> +{
> +       struct gud_connector_get_edid_ctx *ctx =3D data;
> +       struct gud_connector *gconn =3D ctx->gconn;
> +       size_t start =3D block * EDID_LENGTH;
> +
> +       if (start + len > gconn->edid_len)
> +               return -1;
> +
> +       if (!block) {
> +               struct gud_device *gdrm =3D to_gud_device(gconn->connecto=
r.dev);
> +               int ret;
> +
> +               /* Check because drm_do_get_edid() will retry on failure =
*/
> +               if (!ctx->buf)
> +                       ctx->buf =3D kmalloc(gconn->edid_len, GFP_KERNEL)=
;
> +               if (!ctx->buf)
> +                       return -1;
> +
> +               ret =3D gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_EDID, gco=
nn->connector.index,
> +                                 ctx->buf, gconn->edid_len);
> +               if (ret)
> +                       return -1;
> +       }
> +
> +       memcpy(buf, ctx->buf + start, len);
> +
> +       return 0;
> +}
> +
> +static int gud_connector_get_modes(struct drm_connector *connector)
> +{
> +       struct gud_connector *gconn =3D to_gud_connector(connector);
> +       struct gud_device *gdrm =3D to_gud_device(connector->dev);
> +       struct gud_connector_get_edid_ctx edid_ctx =3D {
> +               .gconn =3D gconn,
> +       };
> +       struct gud_display_mode_req *reqmodes =3D NULL;
> +       unsigned int i, num_modes =3D 0;
> +       struct edid *edid =3D NULL;
> +       bool edid_override;
> +       int idx, ret;
> +
> +       if (!drm_dev_enter(connector->dev, &idx))
> +               return 0;
> +
> +       if (connector->force) {
> +               ret =3D gud_connector_status_request(connector);
> +               if (ret < 0)
> +                       goto out;
> +       }
> +
> +       edid =3D drm_do_get_edid(connector, gud_connector_get_edid_block,=
 &edid_ctx);
> +       edid_override =3D edid && !edid_ctx.buf;
> +       kfree(edid_ctx.buf);
> +       drm_connector_update_edid_property(connector, edid);
> +
> +       if (!gconn->num_modes || edid_override) {
> +               num_modes =3D drm_add_edid_modes(connector, edid);
> +               goto out;
> +       }
> +
> +       reqmodes =3D kmalloc_array(gconn->num_modes, sizeof(*reqmodes), G=
FP_KERNEL);
> +       if (!reqmodes)
> +               goto out;
> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_MODES, connector-=
>index,
> +                         reqmodes, gconn->num_modes * sizeof(*reqmodes))=
;
> +       if (ret)
> +               goto out;
> +
> +       for (i =3D 0; i < gconn->num_modes; i++) {
> +               struct drm_display_mode *mode;
> +
> +               mode =3D drm_mode_create(connector->dev);
> +               if (!mode)
> +                       goto out;
> +
> +               gud_to_display_mode(mode, &reqmodes[i]);
> +               drm_mode_probed_add(connector, mode);
> +               num_modes++;
> +       }
> +out:
> +       kfree(reqmodes);
> +       kfree(edid);
> +       drm_dev_exit(idx);
> +
> +       return num_modes;
> +}
> +
> +static int gud_connector_atomic_check(struct drm_connector *connector,
> +                                     struct drm_atomic_state *state)
> +{
> +       struct drm_connector_state *new_state;
> +       struct drm_crtc_state *new_crtc_state;
> +       struct drm_connector_state *old_state;
> +
> +       new_state =3D drm_atomic_get_new_connector_state(state, connector=
);
> +       if (!new_state->crtc)
> +               return 0;
> +
> +       old_state =3D drm_atomic_get_old_connector_state(state, connector=
);
> +       new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state=
->crtc);
> +
> +       if (old_state->tv.margins.left !=3D new_state->tv.margins.left ||
> +           old_state->tv.margins.right !=3D new_state->tv.margins.right =
||
> +           old_state->tv.margins.top !=3D new_state->tv.margins.top ||
> +           old_state->tv.margins.bottom !=3D new_state->tv.margins.botto=
m ||
> +           old_state->tv.mode !=3D new_state->tv.mode ||
> +           old_state->tv.brightness !=3D new_state->tv.brightness ||
> +           old_state->tv.contrast !=3D new_state->tv.contrast ||
> +           old_state->tv.flicker_reduction !=3D new_state->tv.flicker_re=
duction ||
> +           old_state->tv.overscan !=3D new_state->tv.overscan ||
> +           old_state->tv.saturation !=3D new_state->tv.saturation ||
> +           old_state->tv.hue !=3D new_state->tv.hue)
> +               new_crtc_state->connectors_changed =3D true;
> +
> +       return 0;
> +}
> +
> +static const struct drm_connector_helper_funcs gud_connector_helper_func=
s =3D {
> +       .detect_ctx =3D gud_connector_detect,
> +       .get_modes =3D gud_connector_get_modes,
> +       .atomic_check =3D gud_connector_atomic_check,
> +};
> +
> +static int gud_connector_late_register(struct drm_connector *connector)
> +{
> +       struct gud_connector *gconn =3D to_gud_connector(connector);
> +
> +       if (gconn->initial_brightness < 0)
> +               return 0;
> +
> +       return gud_connector_backlight_register(gconn);
> +}
> +
> +static void gud_connector_early_unregister(struct drm_connector *connect=
or)
> +{
> +       struct gud_connector *gconn =3D to_gud_connector(connector);
> +
> +       backlight_device_unregister(gconn->backlight);
> +}
> +
> +static void gud_connector_destroy(struct drm_connector *connector)
> +{
> +       struct gud_connector *gconn =3D to_gud_connector(connector);
> +
> +       drm_connector_cleanup(connector);
> +       kfree(gconn->properties);
> +       kfree(gconn);
> +}
> +
> +static void gud_connector_reset(struct drm_connector *connector)
> +{
> +       struct gud_connector *gconn =3D to_gud_connector(connector);
> +
> +       drm_atomic_helper_connector_reset(connector);
> +       connector->state->tv =3D gconn->initial_tv_state;
> +       /* Set margins from command line */
> +       drm_atomic_helper_connector_tv_reset(connector);
> +       if (gconn->initial_brightness >=3D 0)
> +               connector->state->tv.brightness =3D gconn->initial_bright=
ness;
> +}
> +
> +static const struct drm_connector_funcs gud_connector_funcs =3D {
> +       .fill_modes =3D drm_helper_probe_single_connector_modes,
> +       .late_register =3D gud_connector_late_register,
> +       .early_unregister =3D gud_connector_early_unregister,
> +       .destroy =3D gud_connector_destroy,
> +       .reset =3D gud_connector_reset,
> +       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate=
_state,
> +       .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
> +};
> +
> +/*
> + * The tv.mode property is shared among the connectors and its enum name=
s are
> + * driver specific. This means that if more than one connector uses tv.m=
ode,
> + * the enum names has to be the same.
> + */
> +static int gud_connector_add_tv_mode(struct gud_device *gdrm,
> +                                    struct drm_connector *connector, u64=
 val)
> +{
> +       unsigned int i, num_modes;
> +       const char **modes;
> +       size_t buf_len;
> +       char *buf;
> +       int ret;
> +
> +       num_modes =3D val >> GUD_CONNECTOR_TV_MODE_NUM_SHIFT;
> +
> +       if (!num_modes)
> +               return -EINVAL;
> +
> +       buf_len =3D num_modes * GUD_CONNECTOR_TV_MODE_NAME_LEN;
> +       modes =3D kmalloc_array(num_modes, sizeof(*modes), GFP_KERNEL);
> +       buf =3D kmalloc(buf_len, GFP_KERNEL);
> +       if (!modes || !buf) {
> +               ret =3D -ENOMEM;
> +               goto free;
> +       }
> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_TV_MODE_VALUES,
> +                         connector->index, buf, buf_len);
> +       if (ret)
> +               goto free;
> +
> +       for (i =3D 0; i < num_modes; i++)
> +               modes[i] =3D &buf[i * GUD_CONNECTOR_TV_MODE_NAME_LEN];
> +
> +       ret =3D drm_mode_create_tv_properties(connector->dev, num_modes, =
modes);
> +free:
> +       kfree(modes);
> +       kfree(buf);
> +
> +       return ret;
> +}
> +
> +static struct drm_property *
> +gud_connector_property_lookup(struct drm_connector *connector, u16 prop)
> +{
> +       struct drm_mode_config *config =3D &connector->dev->mode_config;
> +
> +       switch (prop) {
> +       case GUD_PROPERTY_TV_LEFT_MARGIN:
> +               return config->tv_left_margin_property;
> +       case GUD_PROPERTY_TV_RIGHT_MARGIN:
> +               return config->tv_right_margin_property;
> +       case GUD_PROPERTY_TV_TOP_MARGIN:
> +               return config->tv_top_margin_property;
> +       case GUD_PROPERTY_TV_BOTTOM_MARGIN:
> +               return config->tv_bottom_margin_property;
> +       case GUD_PROPERTY_TV_MODE:
> +               return config->tv_mode_property;
> +       case GUD_PROPERTY_TV_BRIGHTNESS:
> +               return config->tv_brightness_property;
> +       case GUD_PROPERTY_TV_CONTRAST:
> +               return config->tv_contrast_property;
> +       case GUD_PROPERTY_TV_FLICKER_REDUCTION:
> +               return config->tv_flicker_reduction_property;
> +       case GUD_PROPERTY_TV_OVERSCAN:
> +               return config->tv_overscan_property;
> +       case GUD_PROPERTY_TV_SATURATION:
> +               return config->tv_saturation_property;
> +       case GUD_PROPERTY_TV_HUE:
> +               return config->tv_hue_property;
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +}
> +
> +static unsigned int *gud_connector_tv_state_val(u16 prop, struct drm_tv_=
connector_state *state)
> +{
> +       switch (prop) {
> +       case GUD_PROPERTY_TV_LEFT_MARGIN:
> +               return &state->margins.left;
> +       case GUD_PROPERTY_TV_RIGHT_MARGIN:
> +               return &state->margins.right;
> +       case GUD_PROPERTY_TV_TOP_MARGIN:
> +               return &state->margins.top;
> +       case GUD_PROPERTY_TV_BOTTOM_MARGIN:
> +               return &state->margins.bottom;
> +       case GUD_PROPERTY_TV_MODE:
> +               return &state->mode;
> +       case GUD_PROPERTY_TV_BRIGHTNESS:
> +               return &state->brightness;
> +       case GUD_PROPERTY_TV_CONTRAST:
> +               return &state->contrast;
> +       case GUD_PROPERTY_TV_FLICKER_REDUCTION:
> +               return &state->flicker_reduction;
> +       case GUD_PROPERTY_TV_OVERSCAN:
> +               return &state->overscan;
> +       case GUD_PROPERTY_TV_SATURATION:
> +               return &state->saturation;
> +       case GUD_PROPERTY_TV_HUE:
> +               return &state->hue;
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +}
> +
> +static int gud_connector_add_properties(struct gud_device *gdrm, struct =
gud_connector *gconn,
> +                                       unsigned int num_properties)
> +{
> +       struct drm_device *drm =3D &gdrm->drm;
> +       struct drm_connector *connector =3D &gconn->connector;
> +       struct gud_property_req *properties;
> +       unsigned int i;
> +       int ret;
> +
> +       gconn->properties =3D kcalloc(num_properties, sizeof(*gconn->prop=
erties), GFP_KERNEL);
> +       if (!gconn->properties)
> +               return -ENOMEM;
> +
> +       properties =3D kcalloc(num_properties, sizeof(*properties), GFP_K=
ERNEL);
> +       if (!properties)
> +               return -ENOMEM;
> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR_PROPERTIES, conne=
ctor->index,
> +                         properties, num_properties * sizeof(*properties=
));
> +       if (ret)
> +               goto out;
> +
> +       for (i =3D 0; i < num_properties; i++) {
> +               u16 prop =3D le16_to_cpu(properties[i].prop);
> +               u64 val =3D le64_to_cpu(properties[i].val);
> +               struct drm_property *property;
> +               unsigned int *state_val;
> +
> +               drm_dbg(drm, "property: %u =3D %llu(0x%llx)\n", prop, val=
, val);
> +
> +               switch (prop) {
> +               case GUD_PROPERTY_TV_LEFT_MARGIN:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_RIGHT_MARGIN:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_TOP_MARGIN:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_BOTTOM_MARGIN:
> +                       ret =3D drm_mode_create_tv_margin_properties(drm)=
;
> +                       if (ret)
> +                               goto out;
> +                       break;
> +               case GUD_PROPERTY_TV_MODE:
> +                       ret =3D gud_connector_add_tv_mode(gdrm, connector=
, val);
> +                       if (ret)
> +                               goto out;
> +                       val =3D val & (BIT(GUD_CONNECTOR_TV_MODE_NUM_SHIF=
T) - 1);
> +                       break;
> +               case GUD_PROPERTY_TV_BRIGHTNESS:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_CONTRAST:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_FLICKER_REDUCTION:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_OVERSCAN:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_SATURATION:
> +                       fallthrough;
> +               case GUD_PROPERTY_TV_HUE:
> +                       /* This is a no-op if already added. */
> +                       ret =3D drm_mode_create_tv_properties(drm, 0, NUL=
L);
> +                       if (ret)
> +                               goto out;
> +                       break;
> +               case GUD_PROPERTY_BACKLIGHT_BRIGHTNESS:
> +                       if (val > 100) {
> +                               ret =3D -EINVAL;
> +                               goto out;
> +                       }
> +                       gconn->initial_brightness =3D val;
> +                       break;
> +               default:
> +                       /* New ones might show up in future devices, skip=
 those we don't know. */
> +                       drm_dbg(drm, "Unknown property: %u\n", prop);
> +                       continue;
> +               }
> +
> +               gconn->properties[gconn->num_properties++] =3D prop;
> +
> +               if (prop =3D=3D GUD_PROPERTY_BACKLIGHT_BRIGHTNESS)
> +                       continue; /* not a DRM property */
> +
> +               property =3D gud_connector_property_lookup(connector, pro=
p);
> +               if (WARN_ON(IS_ERR(property)))
> +                       continue;
> +
> +               state_val =3D gud_connector_tv_state_val(prop, &gconn->in=
itial_tv_state);
> +               if (WARN_ON(IS_ERR(state_val)))
> +                       continue;
> +
> +               *state_val =3D val;
> +               drm_object_attach_property(&connector->base, property, 0)=
;
> +       }
> +out:
> +       kfree(properties);
> +
> +       return ret;
> +}
> +
> +int gud_connector_fill_properties(struct drm_connector *connector,
> +                                 struct drm_connector_state *connector_s=
tate,
> +                                 struct gud_property_req *properties)
> +{
> +       struct gud_connector *gconn;
> +       unsigned int i;
> +
> +       gconn =3D to_gud_connector(connector);
> +
> +       /* Only interested in the count? */
> +       if (!connector_state)
> +               return gconn->num_properties;
> +
> +       for (i =3D 0; i < gconn->num_properties; i++) {
> +               u16 prop =3D gconn->properties[i];
> +               u64 val;
> +
> +               if (prop =3D=3D GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
> +                       val =3D connector_state->tv.brightness;
> +               } else {
> +                       unsigned int *state_val;
> +
> +                       state_val =3D gud_connector_tv_state_val(prop, &c=
onnector_state->tv);
> +                       if (WARN_ON_ONCE(IS_ERR(state_val)))
> +                               return PTR_ERR(state_val);
> +
> +                       val =3D *state_val;
> +               }
> +
> +               properties[i].prop =3D cpu_to_le16(prop);
> +               properties[i].val =3D cpu_to_le64(val);
> +       }
> +
> +       return gconn->num_properties;
> +}
> +
> +int gud_connector_create(struct gud_device *gdrm, unsigned int index)
> +{
> +       struct gud_connector_descriptor_req desc;
> +       struct drm_device *drm =3D &gdrm->drm;
> +       struct gud_connector *gconn;
> +       struct drm_connector *connector;
> +       struct drm_encoder *encoder;
> +       int ret, connector_type;
> +       u32 flags;
> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_CONNECTOR, index, &desc, si=
zeof(desc));
> +       if (ret)
> +               return ret;
> +
> +       gconn =3D kzalloc(sizeof(*gconn), GFP_KERNEL);

Would be nice to do that with drmm_, but we don't have the
drmm_connector_alloc wrapper yet.

> +       if (!gconn)
> +               return -ENOMEM;
> +
> +       gconn->initial_brightness =3D -ENODEV;
> +       flags =3D le32_to_cpu(desc.flags);
> +       connector =3D &gconn->connector;
> +
> +       drm_dbg(drm, "Connector: index=3D%u type=3D%u flags=3D0x%x num_pr=
operties=3D%u\n",
> +               index, desc.connector_type, flags, desc.num_properties);
> +
> +       switch (desc.connector_type) {
> +       case GUD_CONNECTOR_TYPE_PANEL:
> +               connector_type =3D DRM_MODE_CONNECTOR_USB;
> +               break;
> +       case GUD_CONNECTOR_TYPE_VGA:
> +               connector_type =3D DRM_MODE_CONNECTOR_VGA;
> +               break;
> +       case GUD_CONNECTOR_TYPE_DVI:
> +               connector_type =3D DRM_MODE_CONNECTOR_DVID;
> +               break;
> +       case GUD_CONNECTOR_TYPE_COMPOSITE:
> +               connector_type =3D DRM_MODE_CONNECTOR_Composite;
> +               break;
> +       case GUD_CONNECTOR_TYPE_SVIDEO:
> +               connector_type =3D DRM_MODE_CONNECTOR_SVIDEO;
> +               break;
> +       case GUD_CONNECTOR_TYPE_COMPONENT:
> +               connector_type =3D DRM_MODE_CONNECTOR_Component;
> +               break;
> +       case GUD_CONNECTOR_TYPE_DISPLAYPORT:
> +               connector_type =3D DRM_MODE_CONNECTOR_DisplayPort;
> +               break;
> +       case GUD_CONNECTOR_TYPE_HDMI:
> +               connector_type =3D DRM_MODE_CONNECTOR_HDMIA;
> +               break;
> +       default: /* future types */
> +               connector_type =3D DRM_MODE_CONNECTOR_USB;
> +               break;
> +       };
> +
> +       drm_connector_helper_add(connector, &gud_connector_helper_funcs);
> +       ret =3D drm_connector_init(drm, connector, &gud_connector_funcs, =
connector_type);
> +       if (ret) {
> +               kfree(connector);
> +               return ret;
> +       }
> +
> +       if (WARN_ON(connector->index !=3D index))
> +               return -EINVAL;
> +
> +       if (flags & GUD_CONNECTOR_FLAGS_POLL_STATUS)
> +               connector->polled =3D (DRM_CONNECTOR_POLL_CONNECT | DRM_C=
ONNECTOR_POLL_DISCONNECT);
> +       if (flags & GUD_CONNECTOR_FLAGS_INTERLACE)
> +               connector->interlace_allowed =3D true;
> +       if (flags & GUD_CONNECTOR_FLAGS_DOUBLESCAN)
> +               connector->doublescan_allowed =3D true;
> +
> +       if (desc.num_properties) {
> +               ret =3D gud_connector_add_properties(gdrm, gconn, desc.nu=
m_properties);
> +               if (ret) {
> +                       dev_err(drm->dev, "Failed to add connector/%u pro=
perties\n", index);
> +                       return ret;
> +               }
> +       }
> +
> +       /* The first connector is attached to the existing simple pipe en=
coder */
> +       if (!connector->index) {
> +               encoder =3D &gdrm->pipe.encoder;
> +       } else {
> +               encoder =3D &gconn->encoder;
> +
> +               ret =3D drm_simple_encoder_init(drm, encoder, DRM_MODE_EN=
CODER_NONE);
> +               if (ret)
> +                       return ret;
> +
> +               encoder->possible_crtcs =3D 1;
> +       }
> +
> +       return drm_connector_attach_encoder(connector, encoder);
> +}
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.=
c
> new file mode 100644
> index 000000000000..6c5e9eeb8cdc
> --- /dev/null
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -0,0 +1,620 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2020 Noralf Tr=C3=B8nnes
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/lz4.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/string_helpers.h>
> +#include <linux/usb.h>
> +#include <linux/vmalloc.h>
> +#include <linux/workqueue.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/gud.h>
> +
> +#include "gud_internal.h"
> +
> +/* Only used internally */
> +static const struct drm_format_info gud_drm_format_r1 =3D {
> +       .format =3D GUD_DRM_FORMAT_R1,
> +       .num_planes =3D 1,
> +       .char_per_block =3D { 1, 0, 0 },
> +       .block_w =3D { 8, 0, 0 },
> +       .block_h =3D { 1, 0, 0 },
> +       .hsub =3D 1,
> +       .vsub =3D 1,
> +};
> +
> +static int gud_usb_control_msg(struct usb_device *usb, u8 ifnum, bool in=
,
> +                              u8 request, u16 value, void *buf, size_t l=
en)
> +{
> +       u8 requesttype =3D USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
> +       unsigned int pipe;
> +       int ret;
> +
> +       if (in) {
> +               pipe =3D usb_rcvctrlpipe(usb, 0);
> +               requesttype |=3D USB_DIR_IN;
> +       } else {
> +               pipe =3D usb_sndctrlpipe(usb, 0);
> +               requesttype |=3D USB_DIR_OUT;
> +       }
> +
> +       ret =3D usb_control_msg(usb, pipe, request, requesttype, value,
> +                             ifnum, buf, len, USB_CTRL_GET_TIMEOUT);
> +       if (ret < 0)
> +               return ret;
> +       if (ret !=3D len)
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +static int gud_get_display_descriptor(struct usb_interface *interface,
> +                                     struct gud_display_descriptor_req *=
desc)
> +{
> +       u8 ifnum =3D interface->cur_altsetting->desc.bInterfaceNumber;
> +       struct usb_device *usb =3D interface_to_usbdev(interface);
> +       void *buf;
> +       int ret;
> +
> +       buf =3D kmalloc(sizeof(*desc), GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       ret =3D gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_DESCRIP=
TOR, 0, buf, sizeof(*desc));
> +       memcpy(desc, buf, sizeof(*desc));
> +       kfree(buf);
> +       if (ret)
> +               return ret;
> +
> +       if (desc->magic !=3D GUD_DISPLAY_MAGIC)
> +               return -ENODATA;
> +
> +       DRM_DEV_DEBUG_DRIVER(&interface->dev,
> +                            "version=3D%u flags=3D0x%x compression=3D0x%=
x num_formats=3D%u num_connectors=3D%u max_buffer_size=3D%u\n",
> +                            desc->version, le32_to_cpu(desc->flags), des=
c->compression,
> +                            desc->num_formats, desc->num_connectors,
> +                            le32_to_cpu(desc->max_buffer_size));
> +
> +       if (!desc->version || !desc->num_formats || !desc->num_connectors=
 ||
> +           !desc->max_width || !desc->max_height ||
> +           le32_to_cpu(desc->min_width) > le32_to_cpu(desc->max_width) |=
|
> +           le32_to_cpu(desc->min_height) > le32_to_cpu(desc->max_height)=
)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum, u8 *stat=
us)
> +{
> +       u8 *buf;
> +       int ret;
> +
> +       buf =3D kmalloc(sizeof(*buf), GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       ret =3D gud_usb_control_msg(usb, ifnum, true, GUD_REQ_GET_STATUS,=
 0, buf, sizeof(*buf));
> +       *status =3D *buf;
> +       kfree(buf);
> +
> +       return ret;
> +}
> +
> +static int gud_status_to_errno(u8 status)
> +{
> +       switch (status) {
> +       case GUD_STATUS_OK:
> +               return 0;
> +       case GUD_STATUS_BUSY:
> +               return -EBUSY;
> +       case GUD_STATUS_REQUEST_NOT_SUPPORTED:
> +               return -EOPNOTSUPP;
> +       case GUD_STATUS_PROTOCOL_ERROR:
> +               return -EPROTO;
> +       case GUD_STATUS_INVALID_PARAMETER:
> +               return -EINVAL;
> +       case GUD_STATUS_ERROR:
> +               return -EREMOTEIO;
> +       default:
> +               return -EREMOTEIO;
> +       }
> +}
> +
> +static int gud_usb_transfer(struct gud_device *gdrm, bool in, u8 request=
, u16 index,
> +                           void *buf, size_t len)
> +{
> +       struct usb_device *usb =3D gud_to_usb_device(gdrm);
> +       void *trbuf =3D NULL;
> +       int idx, ret;
> +
> +       drm_dbg(&gdrm->drm, "%s: request=3D0x%x index=3D%u len=3D%zu\n",
> +               in ? "get" : "set", request, index, len);
> +
> +       if (!drm_dev_enter(&gdrm->drm, &idx))
> +               return -ENODEV;
> +
> +       mutex_lock(&gdrm->ctrl_lock);
> +
> +       if (buf) {
> +               if (in)
> +                       trbuf =3D kmalloc(len, GFP_KERNEL);
> +               else
> +                       trbuf =3D kmemdup(buf, len, GFP_KERNEL);
> +               if (!trbuf) {
> +                       ret =3D -ENOMEM;
> +                       goto unlock;
> +               }
> +       }
> +
> +       ret =3D gud_usb_control_msg(usb, gdrm->ifnum, in, request, index,=
 trbuf, len);
> +       if (ret =3D=3D -EPIPE || (!ret && !in && (gdrm->flags & GUD_DISPL=
AY_FLAG_STATUS_ON_SET))) {
> +               bool error =3D ret;
> +               u8 status;
> +
> +               ret =3D gud_usb_get_status(usb, gdrm->ifnum, &status);
> +               if (!ret) {
> +                       if (error && status =3D=3D GUD_STATUS_OK) {
> +                               dev_err_once(gdrm->drm.dev,
> +                                            "Unexpected status OK for fa=
iled transfer\n");
> +                               ret =3D -EPIPE;
> +                       } else {
> +                               ret =3D gud_status_to_errno(status);
> +                       }
> +               }
> +       }
> +
> +       if (!ret && in && buf)
> +               memcpy(buf, trbuf, len);
> +
> +       if (ret) {
> +               drm_dbg(&gdrm->drm, "ret=3D%d\n", ret);
> +               gdrm->stats_num_errors++;
> +       }
> +
> +       kfree(trbuf);
> +unlock:
> +       mutex_unlock(&gdrm->ctrl_lock);
> +       drm_dev_exit(idx);
> +
> +       return ret;
> +}
> +
> +int gud_usb_get(struct gud_device *gdrm, u8 request, u16 index, void *bu=
f, size_t len)
> +{
> +       return gud_usb_transfer(gdrm, true, request, index, buf, len);
> +}
> +
> +int gud_usb_set(struct gud_device *gdrm, u8 request, u16 index, void *bu=
f, size_t len)
> +{
> +       return gud_usb_transfer(gdrm, false, request, index, buf, len);
> +}
> +
> +int gud_usb_write8(struct gud_device *gdrm, u8 request, u8 val)
> +{
> +       return gud_usb_set(gdrm, request, 0, &val, sizeof(val));
> +}
> +
> +static int gud_set_version(struct usb_device *usb, u8 ifnum, u32 flags, =
u8 version)
> +{
> +       u8 *buf;
> +       int ret;
> +
> +       buf =3D kmalloc(sizeof(*buf), GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       *buf =3D version;
> +       ret =3D gud_usb_control_msg(usb, ifnum, false, GUD_REQ_SET_VERSIO=
N, 0, buf, sizeof(*buf));
> +       kfree(buf);
> +       if (ret =3D=3D -EPIPE)
> +               return -EPROTONOSUPPORT;
> +       if (ret)
> +               return ret;
> +
> +       if (flags & GUD_DISPLAY_FLAG_STATUS_ON_SET) {
> +               u8 status;
> +
> +               ret =3D gud_usb_get_status(usb, ifnum, &status);
> +               if (!ret && status !=3D GUD_STATUS_OK)
> +                       ret =3D -EPROTONOSUPPORT;
> +       }
> +
> +       return ret;
> +}
> +
> +static int gud_get_properties(struct gud_device *gdrm, unsigned int num_=
properties)
> +{
> +       struct gud_property_req *properties;
> +       unsigned int i;
> +       int ret;
> +
> +       if (!num_properties)
> +               return 0;
> +
> +       gdrm->properties =3D drmm_kcalloc(&gdrm->drm, num_properties, siz=
eof(*gdrm->properties),
> +                                       GFP_KERNEL);
> +       if (!gdrm->properties)
> +               return -ENOMEM;
> +
> +       properties =3D kcalloc(num_properties, sizeof(*properties), GFP_K=
ERNEL);
> +       if (!properties)
> +               return -ENOMEM;
> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_PROPERTIES, 0,
> +                         properties, num_properties * sizeof(*properties=
));
> +       if (ret)
> +               goto out;
> +
> +       for (i =3D 0; i < num_properties; i++) {
> +               u16 prop =3D le16_to_cpu(properties[i].prop);
> +               u64 val =3D le64_to_cpu(properties[i].val);
> +
> +               switch (prop) {
> +               case GUD_PROPERTY_ROTATION:
> +                       /*
> +                        * DRM UAPI matches the protocol so use the value=
 directly,
> +                        * but mask out any additions on future devices.
> +                        */
> +                       val &=3D GUD_ROTATION_MASK;
> +                       ret =3D drm_plane_create_rotation_property(&gdrm-=
>pipe.plane,
> +                                                                DRM_MODE=
_ROTATE_0, val);
> +                       break;
> +               default:
> +                       /* New ones might show up in future devices, skip=
 those we don't know. */
> +                       drm_dbg(&gdrm->drm, "Unknown property: %u\n", pro=
p);
> +                       continue;
> +               }
> +
> +               if (ret)
> +                       goto out;
> +
> +               gdrm->properties[gdrm->num_properties++] =3D prop;
> +       }
> +out:
> +       kfree(properties);
> +
> +       return ret;
> +}
> +
> +static int gud_stats_debugfs(struct seq_file *m, void *data)
> +{
> +       struct drm_info_node *node =3D m->private;
> +       struct gud_device *gdrm =3D to_gud_device(node->minor->dev);
> +       char buf[10];
> +
> +       string_get_size(gdrm->bulk_len, 1, STRING_UNITS_2, buf, sizeof(bu=
f));
> +       seq_printf(m, "Max buffer size: %s\n", buf);
> +       seq_printf(m, "Number of errors:  %u\n", gdrm->stats_num_errors);
> +
> +       seq_puts(m, "Compression:      ");
> +       if (gdrm->compression & GUD_COMPRESSION_LZ4)
> +               seq_puts(m, " lz4");
> +       seq_puts(m, "\n");
> +
> +       if (gdrm->compression) {
> +               u64 remainder;
> +               u64 ratio =3D div64_u64_rem(gdrm->stats_length, gdrm->sta=
ts_actual_length,
> +                                         &remainder);
> +               u64 ratio_frac =3D div64_u64(remainder * 10, gdrm->stats_=
actual_length);
> +
> +               seq_printf(m, "Compression ratio: %llu.%llu\n", ratio, ra=
tio_frac);
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct drm_info_list gud_debugfs_list[] =3D {
> +       { "stats", gud_stats_debugfs, 0, NULL },
> +};
> +
> +static void gud_debugfs_init(struct drm_minor *minor)
> +{
> +       drm_debugfs_create_files(gud_debugfs_list, ARRAY_SIZE(gud_debugfs=
_list),
> +                                minor->debugfs_root, minor);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs gud_pipe_funcs =3D {
> +       .check      =3D gud_pipe_check,
> +       .update     =3D gud_pipe_update,
> +       .prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_mode_config_funcs gud_mode_config_funcs =3D {
> +       .fb_create =3D drm_gem_fb_create_with_dirty,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static const u64 gud_pipe_modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
> +DEFINE_DRM_GEM_FOPS(gud_fops);
> +
> +static const struct drm_driver gud_drm_driver =3D {
> +       .driver_features        =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_=
ATOMIC,
> +       .fops                   =3D &gud_fops,
> +       DRM_GEM_SHMEM_DRIVER_OPS,
> +       .debugfs_init           =3D gud_debugfs_init,
> +
> +       .name                   =3D "gud",
> +       .desc                   =3D "Generic USB Display",
> +       .date                   =3D "20200422",
> +       .major                  =3D 1,
> +       .minor                  =3D 0,
> +};
> +
> +static void gud_free_buffers_and_mutex(struct drm_device *drm, void *unu=
sed)
> +{
> +       struct gud_device *gdrm =3D to_gud_device(drm);
> +
> +       vfree(gdrm->compress_buf);
> +       kfree(gdrm->bulk_buf);
> +       mutex_destroy(&gdrm->ctrl_lock);
> +       mutex_destroy(&gdrm->damage_lock);
> +}
> +
> +static int gud_probe(struct usb_interface *interface, const struct usb_d=
evice_id *id)
> +{
> +       u8 ifnum =3D interface->cur_altsetting->desc.bInterfaceNumber;
> +       struct usb_device *usb =3D interface_to_usbdev(interface);
> +       struct device *dev =3D &interface->dev;
> +       const struct drm_format_info *xrgb8888_emulation_format =3D NULL;
> +       bool rgb565_supported =3D false, xrgb8888_supported =3D false;
> +       struct usb_endpoint_descriptor *bulk_out;
> +       struct gud_display_descriptor_req desc;
> +       unsigned int num_formats =3D 0;
> +       struct gud_device *gdrm;
> +       size_t max_buffer_size =3D 0;
> +       struct drm_device *drm;
> +       u8 *formats_dev;
> +       u32 *formats;
> +       int ret, i;
> +
> +       ret =3D usb_find_bulk_out_endpoint(interface->cur_altsetting, &bu=
lk_out);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D gud_get_display_descriptor(interface, &desc);
> +       if (ret) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=
=3D%d\n", ret);
> +               return -ENODEV;
> +       }
> +
> +       if (desc.version > 1) {
> +               ret =3D gud_set_version(usb, ifnum, le32_to_cpu(desc.flag=
s), 1);
> +               if (ret) {
> +                       if (ret =3D=3D -EPROTONOSUPPORT)
> +                               dev_err(dev, "Protocol version %u is not =
supported\n",
> +                                       desc.version);
> +                       return ret;
> +               }
> +       }
> +
> +       gdrm =3D devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_devi=
ce, drm);
> +       if (IS_ERR(gdrm))
> +               return PTR_ERR(gdrm);
> +
> +       drm =3D &gdrm->drm;
> +       drm->mode_config.funcs =3D &gud_mode_config_funcs;
> +       ret =3D drmm_mode_config_init(drm);
> +       if (ret)
> +               return ret;
> +
> +       gdrm->ifnum =3D ifnum;
> +       gdrm->flags =3D le32_to_cpu(desc.flags);
> +       gdrm->compression =3D desc.compression & GUD_COMPRESSION_LZ4;
> +
> +       if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compressi=
on)
> +               return -EINVAL;
> +
> +       mutex_init(&gdrm->ctrl_lock);
> +       mutex_init(&gdrm->damage_lock);
> +       INIT_WORK(&gdrm->work, gud_flush_work);
> +       gud_clear_damage(gdrm);
> +
> +       ret =3D drmm_add_action_or_reset(drm, gud_free_buffers_and_mutex,=
 NULL);
> +       if (ret)
> +               return ret;
> +
> +       drm->mode_config.min_width =3D le32_to_cpu(desc.min_width);
> +       drm->mode_config.max_width =3D le32_to_cpu(desc.max_width);
> +       drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> +       drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> +
> +       formats_dev =3D devm_kmalloc(dev, desc.num_formats, GFP_KERNEL);
> +       /* Add room for emulated XRGB8888 */
> +       formats =3D devm_kmalloc_array(dev, desc.num_formats + 1, sizeof(=
*formats), GFP_KERNEL);
> +       if (!formats_dev || !formats)
> +               return -ENOMEM;

Today I learned that we copy these, might be good to explain this in
the kerneldoc for all these functions that the caller can throw away
the formats and modifiers array afterwards. I got really confused here
for a moment.

> +
> +       ret =3D gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, de=
sc.num_formats);
> +       if (ret)
> +               return ret;
> +
> +       for (i =3D 0; i < desc.num_formats; i++) {
> +               const struct drm_format_info *info;
> +               size_t fmt_buf_size;
> +               u32 format;
> +
> +               format =3D gud_to_fourcc(formats_dev[i]);
> +               if (!format) {
> +                       drm_dbg(drm, "Unsupported format: 0x%02x\n", form=
ats_dev[i]);
> +                       continue;
> +               }
> +
> +               if (format =3D=3D GUD_DRM_FORMAT_R1)
> +                       info =3D &gud_drm_format_r1;
> +               else
> +                       info =3D drm_format_info(format);
> +
> +               switch (format) {
> +               case GUD_DRM_FORMAT_R1:
> +                       xrgb8888_emulation_format =3D info;
> +                       break;
> +               case DRM_FORMAT_RGB565:
> +                       rgb565_supported =3D true;
> +                       if (!xrgb8888_emulation_format)
> +                               xrgb8888_emulation_format =3D info;
> +                       break;
> +               case DRM_FORMAT_XRGB8888:
> +                       xrgb8888_supported =3D true;
> +                       break;
> +               };
> +
> +               fmt_buf_size =3D drm_format_info_min_pitch(info, 0, drm->=
mode_config.max_width) *
> +                              drm->mode_config.max_height;
> +               max_buffer_size =3D max(max_buffer_size, fmt_buf_size);
> +
> +               if (format =3D=3D GUD_DRM_FORMAT_R1)
> +                       continue; /* Internal not for userspace */
> +
> +               formats[num_formats++] =3D format;
> +       }
> +
> +       if (!num_formats && !xrgb8888_emulation_format) {
> +               dev_err(dev, "No supported pixel formats found\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Prefer speed over color depth */
> +       if (rgb565_supported)
> +               drm->mode_config.preferred_depth =3D 16;
> +
> +       if (!xrgb8888_supported && xrgb8888_emulation_format) {
> +               gdrm->xrgb8888_emulation_format =3D xrgb8888_emulation_fo=
rmat;
> +               formats[num_formats++] =3D DRM_FORMAT_XRGB8888;
> +       }
> +
> +       if (desc.max_buffer_size)
> +               max_buffer_size =3D le32_to_cpu(desc.max_buffer_size);
> +retry:
> +       /*
> +        * Use plain kmalloc here since devm_kmalloc() places struct devr=
es at the beginning
> +        * of the buffer it allocates. This wastes a lot of memory when a=
llocating big buffers.
> +        * Asking for 2M would actually allocate 4M. This would also prev=
ent getting the biggest
> +        * possible buffer potentially leading to split transfers.
> +        */
> +       gdrm->bulk_buf =3D kmalloc(max_buffer_size, GFP_KERNEL | __GFP_NO=
WARN);
> +       if (!gdrm->bulk_buf) {
> +               max_buffer_size =3D roundup_pow_of_two(max_buffer_size) /=
 2;
> +               if (max_buffer_size < SZ_512K)
> +                       return -ENOMEM;
> +               goto retry;
> +       }
> +
> +       gdrm->bulk_pipe =3D usb_sndbulkpipe(usb, usb_endpoint_num(bulk_ou=
t));
> +       gdrm->bulk_len =3D max_buffer_size;
> +
> +       if (gdrm->compression & GUD_COMPRESSION_LZ4) {
> +               gdrm->lz4_comp_mem =3D devm_kmalloc(dev, LZ4_MEM_COMPRESS=
, GFP_KERNEL);
> +               if (!gdrm->lz4_comp_mem)
> +                       return -ENOMEM;
> +
> +               gdrm->compress_buf =3D vmalloc(gdrm->bulk_len);
> +               if (!gdrm->compress_buf)
> +                       return -ENOMEM;
> +       }
> +
> +       ret =3D drm_simple_display_pipe_init(drm, &gdrm->pipe, &gud_pipe_=
funcs,
> +                                          formats, num_formats,
> +                                          gud_pipe_modifiers, NULL);
> +       if (ret)
> +               return ret;
> +
> +       devm_kfree(dev, formats);
> +       devm_kfree(dev, formats_dev);
> +
> +       ret =3D gud_get_properties(gdrm, desc.num_properties);
> +       if (ret)
> +               return ret;
> +
> +       drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
> +
> +       for (i =3D 0; i < desc.num_connectors; i++) {
> +               ret =3D gud_connector_create(gdrm, i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       drm_mode_config_reset(drm);
> +
> +       usb_set_intfdata(interface, gdrm);
> +
> +       ret =3D drm_dev_register(drm, 0);
> +       if (ret)
> +               return ret;
> +
> +       drm_kms_helper_poll_init(drm);
> +
> +       drm_fbdev_generic_setup(drm, 0);
> +
> +       return 0;
> +}
> +
> +static void gud_disconnect(struct usb_interface *interface)
> +{
> +       struct gud_device *gdrm =3D usb_get_intfdata(interface);
> +       struct drm_device *drm =3D &gdrm->drm;
> +
> +       drm_dbg(drm, "%s:\n", __func__);
> +
> +       drm_kms_helper_poll_fini(drm);
> +       drm_dev_unplug(drm);
> +       drm_atomic_helper_shutdown(drm);
> +}
> +
> +static int gud_suspend(struct usb_interface *interface, pm_message_t mes=
sage)
> +{
> +       struct gud_device *gdrm =3D usb_get_intfdata(interface);
> +
> +       return drm_mode_config_helper_suspend(&gdrm->drm);
> +}
> +
> +static int gud_resume(struct usb_interface *interface)
> +{
> +       struct gud_device *gdrm =3D usb_get_intfdata(interface);
> +
> +       drm_mode_config_helper_resume(&gdrm->drm);
> +
> +       return 0;
> +}
> +
> +static const struct usb_device_id gud_id_table[] =3D {
> +       { USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x614d, USB_CLASS_VENDOR_SPE=
C) },
> +       { }
> +};
> +
> +MODULE_DEVICE_TABLE(usb, gud_id_table);
> +
> +static struct usb_driver gud_usb_driver =3D {
> +       .name           =3D "gud",
> +       .probe          =3D gud_probe,
> +       .disconnect     =3D gud_disconnect,
> +       .id_table       =3D gud_id_table,
> +       .suspend        =3D gud_suspend,
> +       .resume         =3D gud_resume,
> +       .reset_resume   =3D gud_resume,
> +};
> +
> +module_usb_driver(gud_usb_driver);
> +
> +MODULE_AUTHOR("Noralf Tr=C3=B8nnes");
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud=
_internal.h
> new file mode 100644
> index 000000000000..46e7d7ed2c69
> --- /dev/null
> +++ b/drivers/gpu/drm/gud/gud_internal.h
> @@ -0,0 +1,148 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __LINUX_GUD_INTERNAL_H
> +#define __LINUX_GUD_INTERNAL_H
> +
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/usb.h>
> +#include <linux/workqueue.h>
> +#include <uapi/drm/drm_fourcc.h>
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +struct gud_device {
> +       struct drm_device drm;
> +       struct drm_simple_display_pipe pipe;
> +       struct work_struct work;
> +       u8 ifnum;
> +       u32 flags;
> +       const struct drm_format_info *xrgb8888_emulation_format;
> +
> +       u16 *properties;
> +       unsigned int num_properties;
> +
> +       unsigned int bulk_pipe;
> +       void *bulk_buf;
> +       size_t bulk_len;
> +
> +       u8 compression;
> +       void *lz4_comp_mem;
> +       void *compress_buf;
> +
> +       u64 stats_length;
> +       u64 stats_actual_length;
> +       unsigned int stats_num_errors;
> +
> +       struct mutex ctrl_lock; /* Serialize get/set and status transfers=
 */
> +
> +       struct mutex damage_lock; /* Protects the following members: */
> +       struct drm_framebuffer *fb;
> +       struct drm_rect damage;
> +       bool prev_flush_failed;
> +};
> +
> +static inline struct gud_device *to_gud_device(struct drm_device *drm)
> +{
> +       return container_of(drm, struct gud_device, drm);
> +}
> +
> +static inline struct usb_device *gud_to_usb_device(struct gud_device *gd=
rm)
> +{
> +       return interface_to_usbdev(to_usb_interface(gdrm->drm.dev));
> +}
> +
> +int gud_usb_get(struct gud_device *gdrm, u8 request, u16 index, void *bu=
f, size_t len);
> +int gud_usb_set(struct gud_device *gdrm, u8 request, u16 index, void *bu=
f, size_t len);
> +int gud_usb_write8(struct gud_device *gdrm, u8 request, u8 val);
> +
> +void gud_clear_damage(struct gud_device *gdrm);
> +void gud_flush_work(struct work_struct *work);
> +int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> +                  struct drm_plane_state *new_plane_state,
> +                  struct drm_crtc_state *new_crtc_state);
> +void gud_pipe_update(struct drm_simple_display_pipe *pipe,
> +                    struct drm_plane_state *old_state);
> +int gud_connector_fill_properties(struct drm_connector *connector,
> +                                 struct drm_connector_state *connector_s=
tate,
> +                                 struct gud_property_req *properties);
> +int gud_connector_create(struct gud_device *gdrm, unsigned int index);
> +
> +#define GUD_DRM_FORMAT_R1      fourcc_code('R', '1', ' ', ' ')

Hm I'd use somet 32bit value which isn't an legal ascii code, just to
make it clear it's all internal.

> +
> +static inline u8 gud_from_fourcc(u32 fourcc)
> +{
> +       switch (fourcc) {
> +       case GUD_DRM_FORMAT_R1:
> +               return GUD_PIXEL_FORMAT_R1;
> +       case DRM_FORMAT_RGB565:
> +               return GUD_PIXEL_FORMAT_RGB565;
> +       case DRM_FORMAT_XRGB8888:
> +               return GUD_PIXEL_FORMAT_XRGB8888;
> +       case DRM_FORMAT_ARGB8888:
> +               return GUD_PIXEL_FORMAT_ARGB8888;
> +       };
> +
> +       return 0;
> +}
> +
> +static inline u32 gud_to_fourcc(u8 format)
> +{
> +       switch (format) {
> +       case GUD_PIXEL_FORMAT_R1:
> +               return GUD_DRM_FORMAT_R1;
> +       case GUD_PIXEL_FORMAT_RGB565:
> +               return DRM_FORMAT_RGB565;
> +       case GUD_PIXEL_FORMAT_XRGB8888:
> +               return DRM_FORMAT_XRGB8888;
> +       case GUD_PIXEL_FORMAT_ARGB8888:
> +               return DRM_FORMAT_ARGB8888;
> +       };
> +
> +       return 0;
> +}
> +
> +static inline void gud_from_display_mode(struct gud_display_mode_req *ds=
t,
> +                                        const struct drm_display_mode *s=
rc)
> +{
> +       u32 flags =3D src->flags & GUD_DISPLAY_MODE_FLAG_USER_MASK;
> +
> +       if (src->type & DRM_MODE_TYPE_PREFERRED)
> +               flags |=3D GUD_DISPLAY_MODE_FLAG_PREFERRED;
> +
> +       dst->clock =3D cpu_to_le32(src->clock);
> +       dst->hdisplay =3D cpu_to_le16(src->hdisplay);
> +       dst->hsync_start =3D cpu_to_le16(src->hsync_start);
> +       dst->hsync_end =3D cpu_to_le16(src->hsync_end);
> +       dst->htotal =3D cpu_to_le16(src->htotal);
> +       dst->vdisplay =3D cpu_to_le16(src->vdisplay);
> +       dst->vsync_start =3D cpu_to_le16(src->vsync_start);
> +       dst->vsync_end =3D cpu_to_le16(src->vsync_end);
> +       dst->vtotal =3D cpu_to_le16(src->vtotal);
> +       dst->flags =3D cpu_to_le32(flags);
> +}
> +
> +static inline void gud_to_display_mode(struct drm_display_mode *dst,
> +                                      const struct gud_display_mode_req =
*src)
> +{
> +       u32 flags =3D le32_to_cpu(src->flags);
> +
> +       memset(dst, 0, sizeof(*dst));
> +       dst->clock =3D le32_to_cpu(src->clock);
> +       dst->hdisplay =3D le16_to_cpu(src->hdisplay);
> +       dst->hsync_start =3D le16_to_cpu(src->hsync_start);
> +       dst->hsync_end =3D le16_to_cpu(src->hsync_end);
> +       dst->htotal =3D le16_to_cpu(src->htotal);
> +       dst->vdisplay =3D le16_to_cpu(src->vdisplay);
> +       dst->vsync_start =3D le16_to_cpu(src->vsync_start);
> +       dst->vsync_end =3D le16_to_cpu(src->vsync_end);
> +       dst->vtotal =3D le16_to_cpu(src->vtotal);
> +       dst->flags =3D flags & GUD_DISPLAY_MODE_FLAG_USER_MASK;
> +       dst->type =3D DRM_MODE_TYPE_DRIVER;
> +       if (flags & GUD_DISPLAY_MODE_FLAG_PREFERRED)
> +               dst->type |=3D DRM_MODE_TYPE_PREFERRED;
> +       drm_mode_set_name(dst);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pip=
e.c
> new file mode 100644
> index 000000000000..1eef930bcf9b
> --- /dev/null
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -0,0 +1,472 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2020 Noralf Tr=C3=B8nnes
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/lz4.h>
> +#include <linux/usb.h>
> +#include <linux/workqueue.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_rect.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/gud.h>
> +
> +#include "gud_internal.h"
> +
> +static bool gud_is_big_endian(void)
> +{
> +#if defined(__BIG_ENDIAN)
> +       return true;
> +#else
> +       return false;
> +#endif
> +}
> +
> +static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info=
 *format,
> +                                  void *src, struct drm_framebuffer *fb,
> +                                  struct drm_rect *rect)
> +{
> +       unsigned int block_width =3D drm_format_info_block_width(format, =
0);
> +       unsigned int bits_per_pixel =3D 8 / block_width;
> +       unsigned int x, y, width, height;
> +       u8 *p, *block =3D dst; /* Assign to silence compiler warning */
> +       size_t len;
> +       void *buf;
> +
> +       WARN_ON_ONCE(format->char_per_block[0] !=3D 1);
> +
> +       /* Start on a byte boundary */
> +       rect->x1 =3D ALIGN_DOWN(rect->x1, block_width);
> +       width =3D drm_rect_width(rect);
> +       height =3D drm_rect_height(rect);
> +       len =3D drm_format_info_min_pitch(format, 0, width) * height;
> +
> +       buf =3D kmalloc(width * height, GFP_KERNEL);
> +       if (!buf)
> +               return 0;
> +
> +       drm_fb_xrgb8888_to_gray8(buf, src, fb, rect);
> +
> +       p =3D buf;
> +       for (y =3D 0; y < drm_rect_height(rect); y++) {
> +               for (x =3D 0; x < drm_rect_width(rect); x++) {
> +                       if (!(x % block_width)) {
> +                               block =3D dst++;
> +                               *block =3D 0;
> +                       }
> +
> +                       *block <<=3D bits_per_pixel;
> +                       *block |=3D (*p++) >> (8 - bits_per_pixel);
> +               }
> +       }
> +
> +       kfree(buf);
> +
> +       return len;
> +}
> +
> +static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffe=
r *fb,
> +                         const struct drm_format_info *format, struct dr=
m_rect *rect,
> +                         struct gud_set_buffer_req *req)
> +{
> +       struct dma_buf_attachment *import_attach =3D fb->obj[0]->import_a=
ttach;
> +       u8 compression =3D gdrm->compression;
> +       struct dma_buf_map map;
> +       void *vaddr, *buf;
> +       size_t pitch, len;
> +       int ret =3D 0;
> +
> +       pitch =3D drm_format_info_min_pitch(format, 0, drm_rect_width(rec=
t));
> +       len =3D pitch * drm_rect_height(rect);
> +       if (len > gdrm->bulk_len)
> +               return -E2BIG;
> +
> +       ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
> +       if (ret)
> +               return ret;
> +
> +       vaddr =3D map.vaddr + fb->offsets[0];
> +
> +       if (import_attach) {
> +               ret =3D dma_buf_begin_cpu_access(import_attach->dmabuf, D=
MA_FROM_DEVICE);
> +               if (ret)
> +                       goto vunmap;
> +       }
> +retry:
> +       if (compression)
> +               buf =3D gdrm->compress_buf;
> +       else
> +               buf =3D gdrm->bulk_buf;
> +
> +       /*
> +        * Imported buffers are assumed to be write-combined and thus unc=
ached
> +        * with slow reads (at least on ARM).
> +        */
> +       if (format !=3D fb->format) {
> +               if (format->format =3D=3D GUD_DRM_FORMAT_R1) {
> +                       len =3D gud_xrgb8888_to_r124(buf, format, vaddr, =
fb, rect);
> +                       if (!len) {
> +                               ret =3D -ENOMEM;
> +                               goto end_cpu_access;
> +                       }
> +               } else if (format->format =3D=3D DRM_FORMAT_RGB565) {
> +                       drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, g=
ud_is_big_endian());
> +               }
> +       } else if (gud_is_big_endian() && format->cpp[0] > 1) {
> +               drm_fb_swab(buf, vaddr, fb, rect, !import_attach);
> +       } else if (compression && !import_attach && pitch =3D=3D fb->pitc=
hes[0]) {
> +               /* can compress directly from the framebuffer */
> +               buf =3D vaddr + rect->y1 * pitch;
> +       } else {
> +               drm_fb_memcpy(buf, vaddr, fb, rect);
> +       }
> +
> +       memset(req, 0, sizeof(*req));
> +       req->x =3D cpu_to_le32(rect->x1);
> +       req->y =3D cpu_to_le32(rect->y1);
> +       req->width =3D cpu_to_le32(drm_rect_width(rect));
> +       req->height =3D cpu_to_le32(drm_rect_height(rect));
> +       req->length =3D cpu_to_le32(len);
> +
> +       if (compression & GUD_COMPRESSION_LZ4) {
> +               int complen;
> +
> +               complen =3D LZ4_compress_default(buf, gdrm->bulk_buf, len=
, len, gdrm->lz4_comp_mem);
> +               if (complen < 0) {
> +                       compression =3D 0;
> +                       goto retry;
> +               }
> +
> +               req->compression =3D GUD_COMPRESSION_LZ4;
> +               req->compressed_length =3D cpu_to_le32(complen);
> +       }
> +
> +end_cpu_access:
> +       if (import_attach)
> +               dma_buf_end_cpu_access(import_attach->dmabuf, DMA_FROM_DE=
VICE);
> +vunmap:
> +       drm_gem_shmem_vunmap(fb->obj[0], &map);
> +
> +       return ret;
> +}
> +
> +static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffe=
r *fb,
> +                         const struct drm_format_info *format, struct dr=
m_rect *rect)
> +{
> +       struct usb_device *usb =3D gud_to_usb_device(gdrm);
> +       struct gud_set_buffer_req req;
> +       int ret, actual_length;
> +       size_t len, trlen;
> +
> +       drm_dbg(&gdrm->drm, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->ba=
se.id, DRM_RECT_ARG(rect));
> +
> +       ret =3D gud_prep_flush(gdrm, fb, format, rect, &req);
> +       if (ret)
> +               return ret;
> +
> +       len =3D le32_to_cpu(req.length);
> +
> +       if (req.compression)
> +               trlen =3D le32_to_cpu(req.compressed_length);
> +       else
> +               trlen =3D len;
> +
> +       gdrm->stats_length +=3D len;
> +       /* Did it wrap around? */
> +       if (gdrm->stats_length <=3D len && gdrm->stats_actual_length) {
> +               gdrm->stats_length =3D len;
> +               gdrm->stats_actual_length =3D 0;
> +       }
> +       gdrm->stats_actual_length +=3D trlen;
> +
> +       if (!(gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE) || gdrm->prev_f=
lush_failed) {
> +               ret =3D gud_usb_set(gdrm, GUD_REQ_SET_BUFFER, 0, &req, si=
zeof(req));
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret =3D usb_bulk_msg(usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
> +                          &actual_length, msecs_to_jiffies(3000));
> +       if (!ret && trlen !=3D actual_length)
> +               ret =3D -EIO;
> +       if (ret)
> +               gdrm->stats_num_errors++;
> +
> +       return ret;
> +}
> +
> +void gud_clear_damage(struct gud_device *gdrm)
> +{
> +       gdrm->damage.x1 =3D INT_MAX;
> +       gdrm->damage.y1 =3D INT_MAX;
> +       gdrm->damage.x2 =3D 0;
> +       gdrm->damage.y2 =3D 0;
> +}
> +
> +static void gud_add_damage(struct gud_device *gdrm, struct drm_rect *dam=
age)
> +{
> +       gdrm->damage.x1 =3D min(gdrm->damage.x1, damage->x1);
> +       gdrm->damage.y1 =3D min(gdrm->damage.y1, damage->y1);
> +       gdrm->damage.x2 =3D max(gdrm->damage.x2, damage->x2);
> +       gdrm->damage.y2 =3D max(gdrm->damage.y2, damage->y2);
> +}
> +
> +static void gud_retry_failed_flush(struct gud_device *gdrm, struct drm_f=
ramebuffer *fb,
> +                                  struct drm_rect *damage)
> +{
> +       /*
> +        * pipe_update waits for the worker when the display mode is goin=
g to change.
> +        * This ensures that the width and height is still the same makin=
g it safe to
> +        * add back the damage.
> +        */
> +
> +       mutex_lock(&gdrm->damage_lock);
> +       if (!gdrm->fb) {
> +               drm_framebuffer_get(fb);
> +               gdrm->fb =3D fb;
> +       }
> +       gud_add_damage(gdrm, damage);
> +       mutex_unlock(&gdrm->damage_lock);
> +
> +       /* Retry only once to avoid a possible storm in case of continues=
 errors. */
> +       if (!gdrm->prev_flush_failed)
> +               queue_work(system_long_wq, &gdrm->work);
> +       gdrm->prev_flush_failed =3D true;
> +}
> +
> +void gud_flush_work(struct work_struct *work)
> +{
> +       struct gud_device *gdrm =3D container_of(work, struct gud_device,=
 work);
> +       const struct drm_format_info *format;
> +       struct drm_framebuffer *fb;
> +       struct drm_rect damage;
> +       unsigned int i, lines;
> +       int idx, ret =3D 0;
> +       size_t pitch;
> +
> +       if (!drm_dev_enter(&gdrm->drm, &idx))
> +               return;
> +
> +       mutex_lock(&gdrm->damage_lock);
> +       fb =3D gdrm->fb;
> +       gdrm->fb =3D NULL;
> +       damage =3D gdrm->damage;
> +       gud_clear_damage(gdrm);
> +       mutex_unlock(&gdrm->damage_lock);
> +
> +       if (!fb)
> +               goto out;
> +
> +       format =3D fb->format;
> +       if (format->format =3D=3D DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_e=
mulation_format)
> +               format =3D gdrm->xrgb8888_emulation_format;
> +
> +       /* Split update if it's too big */
> +       pitch =3D drm_format_info_min_pitch(format, 0, drm_rect_width(&da=
mage));
> +       lines =3D drm_rect_height(&damage);
> +
> +       if (gdrm->bulk_len < lines * pitch)
> +               lines =3D gdrm->bulk_len / pitch;
> +
> +       for (i =3D 0; i < DIV_ROUND_UP(drm_rect_height(&damage), lines); =
i++) {
> +               struct drm_rect rect =3D damage;
> +
> +               rect.y1 +=3D i * lines;
> +               rect.y2 =3D min_t(u32, rect.y1 + lines, damage.y2);
> +
> +               ret =3D gud_flush_rect(gdrm, fb, format, &rect);
> +               if (ret) {
> +                       if (ret !=3D -ENODEV && ret !=3D -ECONNRESET &&
> +                           ret !=3D -ESHUTDOWN && ret !=3D -EPROTO) {
> +                               gud_retry_failed_flush(gdrm, fb, &damage)=
;
> +                               dev_err_once(fb->dev->dev,
> +                                            "Failed to flush framebuffer=
: error=3D%d\n", ret);
> +                       }
> +                       break;
> +               }
> +
> +               gdrm->prev_flush_failed =3D false;
> +       }
> +
> +       drm_framebuffer_put(fb);
> +out:
> +       drm_dev_exit(idx);
> +}
> +
> +static void gud_fb_queue_damage(struct gud_device *gdrm, struct drm_fram=
ebuffer *fb,
> +                               struct drm_rect *damage)
> +{
> +       struct drm_framebuffer *old_fb =3D NULL;
> +
> +       mutex_lock(&gdrm->damage_lock);
> +
> +       if (fb !=3D gdrm->fb) {
> +               old_fb =3D gdrm->fb;
> +               drm_framebuffer_get(fb);
> +               gdrm->fb =3D fb;
> +       }
> +
> +       gud_add_damage(gdrm, damage);
> +
> +       mutex_unlock(&gdrm->damage_lock);
> +
> +       queue_work(system_long_wq, &gdrm->work);
> +
> +       if (old_fb)
> +               drm_framebuffer_put(old_fb);
> +}
> +
> +int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> +                  struct drm_plane_state *new_plane_state,
> +                  struct drm_crtc_state *new_crtc_state)
> +{
> +       struct gud_device *gdrm =3D to_gud_device(pipe->crtc.dev);
> +       struct drm_plane_state *old_plane_state =3D pipe->plane.state;
> +       const struct drm_display_mode *mode =3D &new_crtc_state->mode;
> +       struct drm_atomic_state *state =3D new_plane_state->state;
> +       struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> +       struct drm_connector_state *connector_state =3D NULL;
> +       struct drm_framebuffer *fb =3D new_plane_state->fb;
> +       const struct drm_format_info *format =3D fb->format;
> +       struct drm_connector *connector;
> +       int idx, ret, num_properties;
> +       struct gud_state_req *req;
> +       unsigned int i;
> +       size_t len;
> +
> +       if (WARN_ON_ONCE(!fb))
> +               return -EINVAL;
> +
> +       if (old_plane_state->rotation !=3D new_plane_state->rotation)
> +               new_crtc_state->mode_changed =3D true;
> +
> +       if (old_fb && old_fb->format !=3D format)
> +               new_crtc_state->mode_changed =3D true;
> +
> +       if (!new_crtc_state->mode_changed && !new_crtc_state->connectors_=
changed)
> +               return 0;
> +
> +       /* Only one connector is supported */
> +       if (hweight32(new_crtc_state->connector_mask) !=3D 1)
> +               return -EINVAL;
> +
> +       if (format->format =3D=3D DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_e=
mulation_format)
> +               format =3D gdrm->xrgb8888_emulation_format;
> +
> +       for_each_new_connector_in_state(state, connector, connector_state=
, i) {
> +               if (connector_state->crtc)
> +                       break;
> +       }
> +
> +       if (WARN_ON_ONCE(!connector_state))
> +               return -ENOENT;
> +
> +       num_properties =3D gud_connector_fill_properties(connector, NULL,=
 NULL);
> +       if (num_properties < 0)
> +               return num_properties;
> +
> +       num_properties +=3D gdrm->num_properties;
> +
> +       len =3D struct_size(req, properties, num_properties);
> +       req =3D kzalloc(len, GFP_KERNEL);
> +       if (!req)
> +               return -ENOMEM;
> +
> +       gud_from_display_mode(&req->mode, mode);
> +
> +       req->format =3D gud_from_fourcc(format->format);
> +       if (WARN_ON_ONCE(!req->format))
> +               return -EINVAL;
> +
> +       req->connector =3D drm_connector_index(connector);
> +       req->num_properties =3D num_properties;
> +
> +       num_properties =3D gud_connector_fill_properties(connector, conne=
ctor_state,
> +                                                      req->properties);
> +
> +       for (i =3D 0; i < gdrm->num_properties; i++) {
> +               u16 prop =3D gdrm->properties[i];
> +               u64 val;
> +
> +               switch (prop) {
> +               case GUD_PROPERTY_ROTATION:
> +                       /* DRM UAPI matches the protocol so use value dir=
ectly */
> +                       val =3D new_plane_state->rotation;
> +                       break;
> +               default:
> +                       WARN_ON_ONCE(1);
> +                       ret =3D -EINVAL;
> +                       goto out;
> +               }
> +
> +               req->properties[num_properties + i].prop =3D cpu_to_le16(=
prop);
> +               req->properties[num_properties + i].val =3D cpu_to_le64(v=
al);
> +       }
> +
> +       if (drm_dev_enter(fb->dev, &idx)) {
> +               ret =3D gud_usb_set(gdrm, GUD_REQ_SET_STATE_CHECK, 0, req=
, len);
> +               drm_dev_exit(idx);
> +       }  else {
> +               ret =3D -ENODEV;
> +       }
> +out:
> +       kfree(req);
> +
> +       return ret;
> +}
> +
> +void gud_pipe_update(struct drm_simple_display_pipe *pipe,
> +                    struct drm_plane_state *old_state)
> +{
> +       struct drm_device *drm =3D pipe->crtc.dev;
> +       struct gud_device *gdrm =3D to_gud_device(drm);
> +       struct drm_plane_state *state =3D pipe->plane.state;
> +       struct drm_framebuffer *fb =3D state->fb;
> +       struct drm_crtc *crtc =3D &pipe->crtc;
> +       struct drm_rect damage;
> +       int idx;
> +
> +       if (crtc->state->mode_changed || !crtc->state->enable) {
> +               cancel_work_sync(&gdrm->work);
> +               mutex_lock(&gdrm->damage_lock);
> +               if (gdrm->fb) {
> +                       drm_framebuffer_put(gdrm->fb);
> +                       gdrm->fb =3D NULL;
> +               }
> +               gud_clear_damage(gdrm);
> +               mutex_unlock(&gdrm->damage_lock);
> +       }
> +
> +       if (!drm_dev_enter(drm, &idx))
> +               return;
> +
> +       if (!old_state->fb)
> +               gud_usb_write8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> +
> +       if (fb && (crtc->state->mode_changed || crtc->state->connectors_c=
hanged))
> +               gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> +
> +       if (crtc->state->active_changed)
> +               gud_usb_write8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->st=
ate->active);
> +
> +       if (drm_atomic_helper_damage_merged(old_state, state, &damage)) {
> +               if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
> +                       drm_rect_init(&damage, 0, 0, fb->width, fb->heigh=
t);
> +               gud_fb_queue_damage(gdrm, fb, &damage);
> +       }
> +
> +       if (!crtc->state->enable)
> +               gud_usb_write8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);
> +
> +       drm_dev_exit(idx);
> +}
> diff --git a/include/drm/gud.h b/include/drm/gud.h
> new file mode 100644
> index 000000000000..ebf19f50f780
> --- /dev/null
> +++ b/include/drm/gud.h
> @@ -0,0 +1,356 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2020 Noralf Tr=C3=B8nnes
> + */
> +
> +#ifndef __LINUX_GUD_H
> +#define __LINUX_GUD_H
> +
> +#include <linux/types.h>
> +
> +/*
> + * struct gud_display_descriptor_req - Display descriptor
> + * @magic: Magic value GUD_DISPLAY_MAGIC
> + * @version: Protocol version
> + * @flags: Flags
> + *         - STATUS_ON_SET: Always do a status request after a SET reque=
st.
> + *                          This is used by the Linux gadget driver sinc=
e it has
> + *                          no way to control the status stage of a cont=
rol OUT
> + *                          request that has a payload.
> + *         - FULL_UPDATE:   Always send the entire framebuffer when flus=
hing changes.
> + *                          The GUD_REQ_SET_BUFFER request will not be s=
ent
> + *                          before each bulk transfer, it will only be s=
ent if the
> + *                          previous bulk transfer had failed. This give=
s the device
> + *                          a chance to reset its state machine if neede=
d.
> + *                          This flag can not be used in combination wit=
h compression.
> + * @compression: Supported compression types
> + *               - GUD_COMPRESSION_LZ4: LZ4 lossless compression.
> + * @max_buffer_size: Maximum buffer size the device can handle (optional=
).
> + *                   This is useful for devices that don't have a big en=
ough
> + *                   buffer to decompress the entire framebuffer in one =
go.
> + * @min_width: Minimum pixel width the controller can handle
> + * @max_width: Maximum width
> + * @min_height: Minimum height
> + * @max_height: Maximum height
> + * @num_formats: Number of supported pixel formats
> + * @num_properties: Number of properties that are not connector properti=
es
> + * @num_connectors: Number of connectors
> + *
> + * Devices that have only one display mode will have min_width =3D=3D ma=
x_width
> + * and min_height =3D=3D max_height.
> + */
> +struct gud_display_descriptor_req {
> +       __u32 magic;
> +#define GUD_DISPLAY_MAGIC                      0x1d50614d
> +       __u8 version;
> +       __le32 flags;
> +#define GUD_DISPLAY_FLAG_STATUS_ON_SET         BIT(0)
> +#define GUD_DISPLAY_FLAG_FULL_UPDATE           BIT(1)
> +       __u8 compression;
> +#define GUD_COMPRESSION_LZ4                    BIT(0)
> +       __le32 max_buffer_size;
> +       __le32 min_width;
> +       __le32 max_width;
> +       __le32 min_height;
> +       __le32 max_height;
> +       __u8 num_formats;
> +       __u8 num_properties;
> +       __u8 num_connectors;
> +} __packed;
> +
> +/*
> + * struct gud_property_req - Property
> + * @prop: Property
> + * @val: Value
> + */
> +struct gud_property_req {
> +       __le16 prop;
> +       __le64 val;
> +} __packed;
> +
> +/*
> + * struct gud_display_mode_req - Display mode
> + * @clock: Pixel clock in kHz
> + * @hdisplay: Horizontal display size
> + * @hsync_start: Horizontal sync start
> + * @hsync_end: Horizontal sync end
> + * @htotal: Horizontal total size
> + * @vdisplay: Vertical display size
> + * @vsync_start: Vertical sync start
> + * @vsync_end: Vertical sync end
> + * @vtotal: Vertical total size
> + * @flags: Bits 0-13 are the same as in the RandR protocol and also what=
 DRM uses.
> + *         The deprecated bits are reused for internal protocol flags le=
aving us
> + *         free to follow DRM for the other bits in the future.
> + *         - FLAG_PREFERRED: Set on the preferred display mode.
> + */
> +struct gud_display_mode_req {
> +       __le32 clock;
> +       __le16 hdisplay;
> +       __le16 hsync_start;
> +       __le16 hsync_end;
> +       __le16 htotal;
> +       __le16 vdisplay;
> +       __le16 vsync_start;
> +       __le16 vsync_end;
> +       __le16 vtotal;
> +       __le32 flags;
> +#define GUD_DISPLAY_MODE_FLAG_PHSYNC           BIT(0)
> +#define GUD_DISPLAY_MODE_FLAG_NHSYNC           BIT(1)
> +#define GUD_DISPLAY_MODE_FLAG_PVSYNC           BIT(2)
> +#define GUD_DISPLAY_MODE_FLAG_NVSYNC           BIT(3)
> +#define GUD_DISPLAY_MODE_FLAG_INTERLACE                BIT(4)
> +#define GUD_DISPLAY_MODE_FLAG_DBLSCAN          BIT(5)
> +#define GUD_DISPLAY_MODE_FLAG_CSYNC            BIT(6)
> +#define GUD_DISPLAY_MODE_FLAG_PCSYNC           BIT(7)
> +#define GUD_DISPLAY_MODE_FLAG_NCSYNC           BIT(8)
> +#define GUD_DISPLAY_MODE_FLAG_HSKEW            BIT(9)
> +/* BCast and PixelMultiplex are deprecated */
> +#define GUD_DISPLAY_MODE_FLAG_DBLCLK           BIT(12)
> +#define GUD_DISPLAY_MODE_FLAG_CLKDIV2          BIT(13)
> +#define GUD_DISPLAY_MODE_FLAG_USER_MASK                \
> +               (GUD_DISPLAY_MODE_FLAG_PHSYNC | GUD_DISPLAY_MODE_FLAG_NHS=
YNC | \
> +               GUD_DISPLAY_MODE_FLAG_PVSYNC | GUD_DISPLAY_MODE_FLAG_NVSY=
NC | \
> +               GUD_DISPLAY_MODE_FLAG_INTERLACE | GUD_DISPLAY_MODE_FLAG_D=
BLSCAN | \
> +               GUD_DISPLAY_MODE_FLAG_CSYNC | GUD_DISPLAY_MODE_FLAG_PCSYN=
C | \
> +               GUD_DISPLAY_MODE_FLAG_NCSYNC | GUD_DISPLAY_MODE_FLAG_HSKE=
W | \
> +               GUD_DISPLAY_MODE_FLAG_DBLCLK | GUD_DISPLAY_MODE_FLAG_CLKD=
IV2)
> +/* Internal protocol flags */
> +#define GUD_DISPLAY_MODE_FLAG_PREFERRED                BIT(10)
> +} __packed;
> +
> +/*
> + * struct gud_connector_descriptor_req - Connector descriptor
> + * @connector_type: Connector type (GUD_CONNECTOR_TYPE_*).
> + *                  If the host doesn't support the type it should fall =
back to PANEL.
> + * @flags: Flags
> + *         - POLL_STATUS: Connector status can change (polled every 10 s=
econds)
> + *         - INTERLACE: Interlaced modes are supported
> + *         - DOUBLESCAN: Doublescan modes are supported
> + * @num_properties: Number of supported properties
> + */
> +struct gud_connector_descriptor_req {
> +       __u8 connector_type;
> +#define GUD_CONNECTOR_TYPE_PANEL               0
> +#define GUD_CONNECTOR_TYPE_VGA                 1
> +#define GUD_CONNECTOR_TYPE_COMPOSITE           2
> +#define GUD_CONNECTOR_TYPE_SVIDEO              3
> +#define GUD_CONNECTOR_TYPE_COMPONENT           4
> +#define GUD_CONNECTOR_TYPE_DVI                 5
> +#define GUD_CONNECTOR_TYPE_DISPLAYPORT         6
> +#define GUD_CONNECTOR_TYPE_HDMI                        7
> +       __le32 flags;
> +#define GUD_CONNECTOR_FLAGS_POLL_STATUS                BIT(0)
> +#define GUD_CONNECTOR_FLAGS_INTERLACE          BIT(1)
> +#define GUD_CONNECTOR_FLAGS_DOUBLESCAN         BIT(2)
> +       __u8 num_properties;
> +} __packed;
> +
> +/*
> + * struct gud_connector_status_req - Connector status
> + * @status: Status
> + *          - DISCONNECTED: Connector is disconnected
> + *          - CONNECTED: Connector is connected
> + *          - UNKNOWN: Connection status is unknown
> + *          Flags:
> + *          - CHANGED: A change has happened since the last request
> + * @num_modes: Number of available display modes
> + * @edid_len: Length of EDID data
> + *
> + * If @num_modes is zero, EDID is used to create display modes.
> + * If both @num_modes and @edid_len are set, EDID is just passed on to u=
serspace
> + * in the EDID connector property.
> + *
> + * Userspace will get a HOTPLUG uevent if one of the following is true:
> + * - Connection status has changed
> + * - @num_modes or @edid_len has changed
> + * - CHANGED is set
> + */
> +struct gud_connector_status_req {
> +       __u8 status;
> +#define GUD_CONNECTOR_STATUS_DISCONNECTED      0x00
> +#define GUD_CONNECTOR_STATUS_CONNECTED         0x01
> +#define GUD_CONNECTOR_STATUS_UNKNOWN           0x02
> +#define GUD_CONNECTOR_STATUS_CONNECTED_MASK    0x03
> +#define GUD_CONNECTOR_STATUS_CHANGED           BIT(7)
> +       __le16 num_modes;
> +       __le16 edid_len;
> +} __packed;
> +
> +/*
> + * struct gud_set_buffer_req - Set buffer transfer info
> + * @x: X position of rectangle
> + * @y: Y position
> + * @width: Pixel width of rectangle
> + * @height: Pixel height
> + * @length: Buffer length in bytes
> + * @compression: Transfer compression
> + * @compressed_length: Compressed buffer length
> + *
> + * This request is issued right before the bulk transfer.
> + * @x, @y, @width and @height specifies the rectangle where the buffer s=
hould be
> + * placed inside the framebuffer.
> + */
> +struct gud_set_buffer_req {
> +       __le32 x;
> +       __le32 y;
> +       __le32 width;
> +       __le32 height;
> +       __le32 length;
> +       __u8 compression;
> +       __le32 compressed_length;
> +} __packed;
> +
> +/*
> + * struct gud_state_req - Display state
> + * @mode: Display mode
> + * @format: Pixel format GUD_PIXEL_FORMAT_*
> + * @connector: Connector index
> + * @num_properties: Number of properties in the state
> + * @properties: Array of properties
> + *
> + * The entire state is transferred each time there's a change.
> + */
> +struct gud_state_req {
> +       struct gud_display_mode_req mode;
> +       __u8 format;
> +       __u8 connector;
> +       __u8 num_properties;
> +       struct gud_property_req properties[];
> +} __packed;
> +
> +/* List of supported connector properties: */
> +
> +/* Margins in pixels to deal with overscan, range 0-100 */
> +#define GUD_PROPERTY_TV_LEFT_MARGIN                    1
> +#define GUD_PROPERTY_TV_RIGHT_MARGIN                   2
> +#define GUD_PROPERTY_TV_TOP_MARGIN                     3
> +#define GUD_PROPERTY_TV_BOTTOM_MARGIN                  4
> +/* Number of modes are placed at _SHIFT in val on retrieval */
> +#define GUD_PROPERTY_TV_MODE                           5
> +  #define GUD_CONNECTOR_TV_MODE_NUM_SHIFT      16
> +/* Brightness in percent, range 0-100 */
> +#define GUD_PROPERTY_TV_BRIGHTNESS                     6
> +/* Contrast in percent, range 0-100 */
> +#define GUD_PROPERTY_TV_CONTRAST                       7
> +/* Flicker reduction in percent, range 0-100 */
> +#define GUD_PROPERTY_TV_FLICKER_REDUCTION              8
> +/* Overscan in percent, range 0-100 */
> +#define GUD_PROPERTY_TV_OVERSCAN                       9
> +/* Saturation in percent, range 0-100 */
> +#define GUD_PROPERTY_TV_SATURATION                     10
> +/* Hue in percent, range 0-100 */
> +#define GUD_PROPERTY_TV_HUE                            11
> +
> +/*
> + * Backlight brightness is in the range 0-100 inclusive. The value repre=
sents the human perceptual
> + * brightness and not a linear PWM value. 0 is minimum brightness which =
should not turn the
> + * backlight completely off. The DPMS connector property should be used =
to control power which will
> + * trigger a GUD_REQ_SET_DISPLAY_ENABLE request.
> + *
> + * This does not map to a DRM property, it is used with the backlight de=
vice.
> + */
> +#define GUD_PROPERTY_BACKLIGHT_BRIGHTNESS              12
> +
> +/* List of supported properties that are not connector propeties: */
> +
> +/*
> + * Plane rotation. Should return the supported bitmask on
> + * GUD_REQ_GET_PROPERTIES. GUD_ROTATION_0 is mandatory.
> + *
> + * Note: This is not display rotation so 90/270 will need scaling to mak=
e it fit (unless squared).
> + */
> +#define GUD_PROPERTY_ROTATION                          50
> +  #define GUD_ROTATION_0                       BIT(0)
> +  #define GUD_ROTATION_90                      BIT(1)
> +  #define GUD_ROTATION_180                     BIT(2)
> +  #define GUD_ROTATION_270                     BIT(3)
> +  #define GUD_ROTATION_REFLECT_X               BIT(4)
> +  #define GUD_ROTATION_REFLECT_Y               BIT(5)
> +  #define GUD_ROTATION_MASK                    (GUD_ROTATION_0 | GUD_ROT=
ATION_90 | \
> +                                               GUD_ROTATION_180 | GUD_RO=
TATION_270 | \
> +                                               GUD_ROTATION_REFLECT_X | =
GUD_ROTATION_REFLECT_Y)
> +
> +/* USB Control requests: */
> +
> +/* Get status from the last GET/SET control request. Value is u8. */
> +#define GUD_REQ_GET_STATUS                             0x00
> +  /* Status values: */
> +  #define GUD_STATUS_OK                                0x00
> +  #define GUD_STATUS_BUSY                      0x01
> +  #define GUD_STATUS_REQUEST_NOT_SUPPORTED     0x02
> +  #define GUD_STATUS_PROTOCOL_ERROR            0x03
> +  #define GUD_STATUS_INVALID_PARAMETER         0x04
> +  #define GUD_STATUS_ERROR                     0x05
> +
> +/* Get display descriptor as a &gud_display_descriptor_req */
> +#define GUD_REQ_GET_DESCRIPTOR                         0x01
> +
> +/*
> + * If the host driver doesn't support the device protocol version it wil=
l send the versions it
> + * supports starting with the latest. If the device isn't backwards comp=
atible or doesn't support
> + * the version the host suggests, it shall stall the request. The versio=
n is sent as u8.
> + */
> +#define GUD_REQ_SET_VERSION                            0x30
> +
> +/* Get supported pixel formats as a byte array of GUD_PIXEL_FORMAT_* */
> +#define GUD_REQ_GET_FORMATS                            0x40
> +  /* R1 is a 1-bit monochrome transfer format presented to userspace as =
XRGB8888 */
> +  #define GUD_PIXEL_FORMAT_R1                  0x01
> +  #define GUD_PIXEL_FORMAT_RGB565              0x40
> +  #define GUD_PIXEL_FORMAT_XRGB8888            0x80
> +  #define GUD_PIXEL_FORMAT_ARGB8888            0x81
> +
> +/*
> + * Get supported properties that are not connector propeties as a &gud_p=
roperty_req array.
> + * gud_property_req.val often contains the initial value for the propert=
y.
> + */
> +#define GUD_REQ_GET_PROPERTIES                         0x41
> +
> +/* Connector requests have the connector index passed in the wValue fiel=
d */
> +
> +/* Get connector descriptor as a &gud_connector_descriptor_req */
> +#define GUD_REQ_GET_CONNECTOR                          0x50
> +
> +/*
> + * Get properties supported by the connector as a &gud_property_req arra=
y.
> + * gud_property_req.val often contains the initial value for the propert=
y.
> + */
> +#define GUD_REQ_GET_CONNECTOR_PROPERTIES               0x51
> +
> +/*
> + * Issued when there's a TV_MODE property present.
> + * Gets an array of the supported TV_MODE names each entry of length
> + * GUD_CONNECTOR_TV_MODE_NAME_LEN. Names must be NUL-terminated.
> + */
> +#define GUD_REQ_GET_CONNECTOR_TV_MODE_VALUES           0x52
> +  #define GUD_CONNECTOR_TV_MODE_NAME_LEN       16
> +
> +/* When userspace checks connector status, this is issued first, not use=
d for poll requests. */
> +#define GUD_REQ_SET_CONNECTOR_FORCE_DETECT             0x53
> +
> +/* Get connector status as &gud_connector_status_req. */
> +#define GUD_REQ_GET_CONNECTOR_STATUS                   0x54
> +
> +/* Get &gud_display_mode_req array of supported display modes */
> +#define GUD_REQ_GET_CONNECTOR_MODES                    0x55
> +
> +/* Get Extended Display Identification Data */
> +#define GUD_REQ_GET_CONNECTOR_EDID                     0x56
> +
> +/* Set buffer properties before bulk transfer as &gud_set_buffer_req */
> +#define GUD_REQ_SET_BUFFER                             0x60
> +
> +/* Check display configuration as &gud_state_req */
> +#define GUD_REQ_SET_STATE_CHECK                                0x61
> +
> +/* Apply the previous STATE_CHECK configuration */
> +#define GUD_REQ_SET_STATE_COMMIT                       0x62
> +
> +/* Enable/disable the display controller, value is u8: 0/1 */
> +#define GUD_REQ_SET_CONTROLLER_ENABLE                  0x63
> +
> +/* Enable/disable display/output (DPMS), value is u8: 0/1 */
> +#define GUD_REQ_SET_DISPLAY_ENABLE                     0x64
> +
> +#endif
> --
> 2.23.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
