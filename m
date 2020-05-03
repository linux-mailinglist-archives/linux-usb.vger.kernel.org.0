Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E081C2A80
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 09:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgECHNj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 03:13:39 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:35772 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgECHNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 03:13:39 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 4922320026;
        Sun,  3 May 2020 09:13:35 +0200 (CEST)
Date:   Sun, 3 May 2020 09:13:28 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200503071328.GA11582@ravnborg.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429124830.27475-2-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=8nJEP1OIZ-IA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=SJz97ENfAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Glsn2Xz2PHKrFKEi74kA:9
        a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22 a=vFet0B0WnEQeilDPIY6i:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf.

On Wed, Apr 29, 2020 at 02:48:21PM +0200, Noralf Trønnes wrote:
> Add a way to lookup a backlight device based on its name.
> Will be used by a USB display gadget getting the name from configfs.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

Simple and well-documented.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
>  include/linux/backlight.h           |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index cac3e35d7630..92d80aa0c0ef 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
>  }
>  EXPORT_SYMBOL(backlight_device_get_by_type);
>  
> +/**
> + * backlight_device_get_by_name - Get backlight device by name
> + * @name: Device name
> + *
> + * This function looks up a backlight device by its name. It obtains a reference
> + * on the backlight device and it is the caller's responsibility to drop the
> + * reference by calling backlight_put().
> + *
> + * Returns:
> + * A pointer to the backlight device if found, otherwise NULL.
> + */
> +struct backlight_device *backlight_device_get_by_name(const char *name)
> +{
> +	struct device *dev;
> +
> +	dev = class_find_device_by_name(backlight_class, name);
> +
> +	return dev ? to_backlight_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(backlight_device_get_by_name);
> +
>  /**
>   * backlight_device_unregister - unregisters a backlight device object.
>   * @bd: the backlight device object to be unregistered and freed.
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..56e4580d4f55 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_device *bd,
>  extern int backlight_register_notifier(struct notifier_block *nb);
>  extern int backlight_unregister_notifier(struct notifier_block *nb);
>  extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
> +struct backlight_device *backlight_device_get_by_name(const char *name);
>  extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
>  
>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
