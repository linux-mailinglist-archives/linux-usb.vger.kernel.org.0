Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A903327FB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 15:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhCIOCT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 09:02:19 -0500
Received: from foo.stuge.se ([212.116.89.98]:35822 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231270AbhCIOCH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 09:02:07 -0500
Received: (qmail 13095 invoked by uid 1000); 9 Mar 2021 14:02:00 -0000
Message-ID: <20210309140200.13094.qmail@stuge.se>
Date:   Tue, 9 Mar 2021 14:02:00 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
References: <20210305163104.30756-1-noralf@tronnes.org>
 <20210305163104.30756-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305163104.30756-4-noralf@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Noralf,

I've made some progress with my test device. I'm implementing R1
first and once that works I'll test RGB111 as well. Along the way
I've found a couple of things in the code:

Noralf Trønnes wrote:
> +++ b/drivers/gpu/drm/gud/gud_drv.c
..
> +static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
..
> +		if (format == GUD_DRM_FORMAT_R1)
> +			continue; /* Internal not for userspace */

You already found RGB111 missing here.


> +static int gud_usb_control_msg(struct usb_interface *intf, bool in,
> +			       u8 request, u16 value, void *buf, size_t len)
..
> +static int gud_usb_transfer(struct gud_device *gdrm, bool in, u8 request, u16 index,
..
> +	ret = gud_usb_control_msg(intf, in, request, index, buf, len);

The u16 index parameter to gud_usb_transfer() and at least also 
gud_usb_{get,set,get_u8,set_u8}() is eventually passed in u16 value
in the call to gud_usb_control_msg(), which had me confused for a bit.

What do you think about renaming all of those parameters to wValue,
to show that and where they are part of the control request? I think
it would help make the protocol more clear.


Finally, an actual bug:

> +	ret = gud_get_properties(gdrm);
> +	if (ret) {
> +		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
> +		return ret;
> +	}

If gud_get_properties() and gud_connector_add_properties() receive
and process (only!) one or more unknown properties then they return
the number of bytes received from the device rather than 0.

I fixed this by setting ret = 0; before the for() loop, but maybe you
want to do it another way.


I found this because I can't get my device to send 0 bytes IN when
the host requests more, if I provide no data the request STALLs. This
is for sure a bug in my device and I'll come back to it, but for now
I added a dummy 65535 property as a workaround.

What do you think about formalizing this, adding an actual dummy property?

Or maybe adding flags to the display descriptor for "I have properties",
"I have connector properties" and "I have EDID" ?


> +++ b/drivers/gpu/drm/gud/gud_pipe.c
..
> +static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
..
> +	/*
> +	 * Imported buffers are assumed to be write-combined and thus uncached
> +	 * with slow reads (at least on ARM).
> +	 */
> +	if (format != fb->format) {
> +		if (format->format == GUD_DRM_FORMAT_R1) {
> +			len = gud_xrgb8888_to_r124(buf, format, vaddr, fb, rect);
> +			if (!len) {
> +				ret = -ENOMEM;
> +				goto end_cpu_access;
> +			}
> +		} else if (format->format == DRM_FORMAT_RGB565) {
> +			drm_fb_xrgb8888_to_rgb565(buf, vaddr, fb, rect, gud_is_big_endian());
> +		} else {
> +			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
> +		}

Does this section also need a RGB111 case?


> +void gud_pipe_update(struct drm_simple_display_pipe *pipe,
..
> +	if (fb && (crtc->state->mode_changed || crtc->state->connectors_changed))
> +		gud_usb_set(gdrm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);

You mentioned that commit must not fail; what happens/should happen
if a request does fail in pipe_update()? Some reasons could be that
the device was unplugged, a bad cable is glitchy or even that some
device doesn't even implement STATE_COMMIT or does it incorrectly and
will report back failure?


> +++ b/include/drm/gud.h
..
> +  #define GUD_STATUS_REQUEST_NOT_SUPPORTED	0x02

Maybe this can be removed? SET_VERSION has been removed so it's no
longer used anywhere, and in any case devices typically signal that
requests are unsupported using a protocol STALL, which comes back
as -EPIPE from the USB stack.



Finally, here's the drm debug output when I connect my device:

Mar 09 14:57:19 vm kernel: usb 1-1: new full-speed USB device number 24 using uhci_hcd
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_probe] version=1 flags=0x2 compression=0x0 max_buffer_size=0
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x40 index=0 len=32
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x41 index=0 len=320
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_probe] Ignoring unknown property: 65535
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x50 index=0 len=256
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_get_connectors] Connector: index=0 type=0 flags=0x0
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x51 index=0 len=320
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_get_connectors] property: 65535 = 0(0x0)
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_get_connectors] Ignoring unknown property: 65535
Mar 09 14:57:19 vm kernel: [drm:drm_minor_register] 
Mar 09 14:57:19 vm kernel: [drm:drm_minor_register] 
Mar 09 14:57:19 vm kernel: [drm:drm_minor_register] new minor registered 0
Mar 09 14:57:19 vm kernel: [drm:drm_sysfs_connector_add] adding "USB-1" to sysfs
Mar 09 14:57:19 vm kernel: [drm:drm_sysfs_hotplug_event] generating hotplug event
Mar 09 14:57:19 vm kernel: [drm] Initialized gud 1.0.0 20200422 for 1-1:27.0 on minor 0
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] 
Mar 09 14:57:19 vm kernel: [drm:drm_mode_object_get] OBJ ID: 35 (2)
Mar 09 14:57:19 vm kernel: [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:35:USB-1]
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] set: request=0x53 index=0 len=0
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x54 index=0 len=1
Mar 09 14:57:19 vm kernel: [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:35:USB-1] status updated from unknown to connected
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x56 index=0 len=2048
Mar 09 14:57:19 vm kernel: [drm:drm_sysfs_hotplug_event] generating hotplug event
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: USB-1: Invalid EDID size (ret=1)
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:gud_usb_transfer] get: request=0x55 index=0 len=3072
Mar 09 14:57:19 vm kernel: [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:35:USB-1] probed modes :
Mar 09 14:57:19 vm kernel: [drm:drm_mode_debug_printmodeline] Modeline "400x240": 104 10000 400 400 400 400 240 240 240 240 0x40 0x0
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] connector 35 enabled? yes
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] Not using firmware configuration
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] looking for cmdline mode on connector 35
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] looking for preferred mode on connector 35 0
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] found mode 400x240
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] picking CRTCs for 400x240 config
Mar 09 14:57:19 vm kernel: [drm:drm_client_modeset_probe] desired mode 400x240 set on crtc 33 (0,0)
Mar 09 14:57:19 vm kernel: [drm:drm_mode_object_get] OBJ ID: 35 (2)
Mar 09 14:57:19 vm kernel: [drm:drm_mode_object_put.part.0] OBJ ID: 35 (3)
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:__drm_fb_helper_initial_config_and_unlock] test CRTC 0 primary plane
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm:drm_fb_helper_generic_probe] surface width(400), height(240) and bpp(32)
Mar 09 14:57:19 vm kernel: [drm:drm_mode_addfb2] [FB:36]
Mar 09 14:57:19 vm kernel: [drm:drm_mode_object_put.part.0] OBJ ID: 36 (2)
Mar 09 14:57:19 vm kernel: gud 1-1:27.0: [drm] fb0: guddrmfb frame buffer device


It looks good, I think? However, neither GUD_REQ_SET_CONTROLLER_ENABLE
nor GUD_REQ_SET_DISPLAY_ENABLE is ever called, and there is no bulk
output if I write to /dev/fb0.

Can you tell what's missing?


Many thanks and kind regards

//Peter
