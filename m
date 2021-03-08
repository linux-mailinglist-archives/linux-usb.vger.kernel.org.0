Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C988A33159F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 19:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhCHSNR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 13:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCHSNK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Mar 2021 13:13:10 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DFDC06174A
        for <linux-usb@vger.kernel.org>; Mon,  8 Mar 2021 10:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KwYAVxQ8Xu/wb34tkAmEqFZ19a36NBCgir10GRki8Qs=; b=vcV1ZpPJMU9M7k+rEGYIR+UEDi
        jKoba5vA0uhkn/ojw3rNFGlQ9OuZKr2ICUNFJs2Fo/ft5IVuitlhfrRO8y785onYWhrSwh5y7hZWl
        ku44Mbo/t71KPd3ue0CrpwMHcJZHnb62vJAG369U3Yovtz3VYXF49EB+Dpj1x/+dt6upg8XrVXNNx
        4slTPtKxf0Hk7f4SUDhQPwyMUsao8mzMZnGgXVbDxRVlwfCttd5oih+2fB5QcjSa+WPChgKbDMLPy
        +gviMedSSTHDfStX46XMjHQVV2X8JoKT+q8KUZyHldfDLZlW4tJztu6pZERNyTahZWepA/S8L5D/F
        YoGoqdkw==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=56906)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lJKNN-0006wf-7l; Mon, 08 Mar 2021 19:13:05 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210305163104.30756-1-noralf@tronnes.org>
 <20210305163104.30756-4-noralf@tronnes.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e22eca11-6758-fb1b-5b36-0182bcf16574@tronnes.org>
Date:   Mon, 8 Mar 2021 19:13:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305163104.30756-4-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 05.03.2021 17.31, skrev Noralf Trønnes:
> This adds a USB display driver with the intention that it can be
> used with future USB interfaced low end displays/adapters. The Linux
> gadget device driver will serve as the canonical device implementation.
> 

> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c

> +static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
> +{

> +	num_formats_dev = ret;
> +	for (i = 0; i < num_formats_dev; i++) {
> +		const struct drm_format_info *info;
> +		size_t fmt_buf_size;
> +		u32 format;
> +
> +		format = gud_to_fourcc(formats_dev[i]);
> +		if (!format) {
> +			drm_dbg(drm, "Unsupported format: 0x%02x\n", formats_dev[i]);
> +			continue;
> +		}
> +
> +		if (format == GUD_DRM_FORMAT_R1)
> +			info = &gud_drm_format_r1;
> +		else if (format == GUD_DRM_FORMAT_RGB111)
> +			info = &gud_drm_format_rgb111;
> +		else
> +			info = drm_format_info(format);
> +
> +		switch (format) {
> +		case GUD_DRM_FORMAT_R1:
> +			fallthrough;
> +		case GUD_DRM_FORMAT_RGB111:
> +			xrgb8888_emulation_format = info;
> +			break;
> +		case DRM_FORMAT_RGB565:
> +			rgb565_supported = true;
> +			if (!xrgb8888_emulation_format)
> +				xrgb8888_emulation_format = info;
> +			break;
> +		case DRM_FORMAT_XRGB8888:
> +			xrgb8888_supported = true;
> +			break;
> +		};
> +
> +		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
> +			       drm->mode_config.max_height;
> +		max_buffer_size = max(max_buffer_size, fmt_buf_size);
> +
> +		if (format == GUD_DRM_FORMAT_R1)

This line should be:

		if (format == GUD_DRM_FORMAT_R1 || format == GUD_DRM_FORMAT_RGB111)

There's also a bug in the format conversion functions that shows up on
transfers with widths that are not pixels per byte aligned. I've fixed
R1, I'll look at RGB111 tomorrow.

Noralf.

> +			continue; /* Internal not for userspace */
> +
> +		formats[num_formats++] = format;
> +	}

