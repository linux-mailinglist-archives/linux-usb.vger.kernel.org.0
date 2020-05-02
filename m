Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0D21C275C
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2020 19:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbgEBR6I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 May 2020 13:58:08 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:52707 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgEBR6I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 May 2020 13:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=S44YQVBSf+4uM5McTgtiDRdvS1ZBtuWsLXCvE2yH/1Y=; b=bUmAtM3EJWPCZ93Duujk3Fi/So
        TSQ56h/5bYO7tmBJuon0U3TYag1QIxFtGUa6h6Nrg1yI+KdddTVXOfT3ZmbtFmV8Si/EuBOwaTcHw
        wjawSCYs6la65iTTBM2Q/GWOihYDi5uf7HOE6/M7BXOaynQ9XFhwvD7RNTggBXYZYYG1Tq+ibrdLr
        uIdRwDh36pD2Vn0dJIIdcTj2QyqKAtKuGvK4wF3xnxp/6Dtzc8pfySzMwU2uQ4iPj7u93x2n5goq4
        tWTb8w5IXfTvntZbBTFGm0OciOK51cJuv21e3Vuh6wXLfDUOYMQk6pSauhVRxifxPcYCR9yLZkQZn
        m7Tlc3ZA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50543 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jUwOs-0005fV-Eu; Sat, 02 May 2020 19:58:06 +0200
Subject: Re: [PATCH 08/10] drm: Add Generic USB Display driver
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-9-noralf@tronnes.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7ebe9c87-55f8-ae1f-5bdf-3413d676f3d7@tronnes.org>
Date:   Sat, 2 May 2020 19:58:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429124830.27475-9-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 29.04.2020 14.48, skrev Noralf Trønnes:
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
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

> diff --git a/drivers/gpu/drm/gud/gud_drm_drv.c b/drivers/gpu/drm/gud/gud_drm_drv.c

> +static int gud_drm_probe(struct usb_interface *interface,
> +			 const struct usb_device_id *id)
> +{

<snip>

> +	gdrm = kzalloc(sizeof(*gdrm), GFP_KERNEL);
> +	if (!gdrm)
> +		return -ENOMEM;
> +
> +	gdrm->usb = usb;
> +	gdrm->ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
> +	gdrm->compression = desc.bCompression & GUD_DRM_COMPRESSION_LZ4;
> +
> +	drm = &gdrm->drm;
> +	ret = devm_drm_dev_init(dev, drm, &gud_drm_driver);
> +	if (ret) {
> +		kfree(gdrm);
> +		return ret;
> +	}

I see that Daniel's series has landed now, so I will use
devm_drm_dev_alloc() and drmm_mode_config_init() in the next version.

<snip>

> +	drm_fbdev_generic_setup(drm, 16);

This should be:

	drm_fbdev_generic_setup(drm, 0);

Noralf.

> +
> +	return 0;
> +}
