Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CD633D3EB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 13:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhCPMfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 08:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhCPMeb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 08:34:31 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BDCC06174A
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=59x9pyn/wzMOcK3CFN84LpsThoYhj5p4Kl3EH7xP18Y=; b=SWGLvYtUKUFl08Fqk6npxrMxtX
        lM7iMf1QPVttH/4cCjHq8NWLuUYIcLqXcUvYSiiSNIPlTHNbl+wfbwg/61XUhxE5QpODmAcAoD3kR
        t6LaQe5rA++Dx+wxyv1QDSdrkx3RmsGNCL1uD8LO9/7ZIovCqfn4NCL231iWLKItKZWAxNz5fvSyu
        ON4mnW0cFea4Ogj5KRXPT7qqkRplXZzlCb2r9Dtl3KW37lIOTJMHajA6VeT/EqhqWklMKIiMn2fNs
        1XRiGrvQbfz0Ny/BI1c+/YL1UHz7XhrE29qRU7Q2U5jOeFFYOy7Sv4qpWuukd7gVsQPxAX6KYfWsi
        7HnVc32g==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=64280)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lM8u0-00080A-QZ; Tue, 16 Mar 2021 13:34:24 +0100
Subject: Re: [PATCH v8 0/3] GUD USB Display driver
To:     dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com
References: <20210313112545.37527-1-noralf@tronnes.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2aca21e4-aab2-426e-87db-f2d2bb2f46c5@tronnes.org>
Date:   Tue, 16 Mar 2021 13:34:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210313112545.37527-1-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 13.03.2021 12.25, skrev Noralf Trønnes:
> Hi,
> 
> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DPI display adapter.
> 
> The protocol is open so people are free to make displays implementing it and
> use this driver, all that's needed is to add a USB vid:pid to the driver for
> the display.
> 
> See the wiki[1] for more information and images for the Raspberry Pi Zero/4.
> 
> Changes in this version:
> - Forgot to filter RGB111 from reaching userspace
> - Handle a device that only returns unknown device properties (Peter)
> - s/GUD_PIXEL_FORMAT_RGB111/GUD_PIXEL_FORMAT_XRGB1111/ (Peter)
> - Fix R1 and XRGB1111 format conversion
> - Add FIXME about Big Endian being broken (Peter, Ilia)
> 
> I will apply the patches as soon as the dependency shows up in drm-misc-next.
> 
> Dependency:
> drm: Use USB controller's DMA mask when importing dmabufs[2]
> (currently in drm-misc-fixes but not in drm-misc-next yet, also present in
> drm-tip and linux-next)
> 
> Noralf.
> 
> [1] https://github.com/notro/gud/wiki
> [2] https://patchwork.freedesktop.org/patch/msgid/20210303133229.3288-1-tzimmermann@suse.de
> 
> 
> Noralf Trønnes (3):
>   drm/uapi: Add USB connector type
>   drm/probe-helper: Check epoch counter in output_poll_execute()
>   drm: Add GUD USB Display driver
> 

Patches are now applied to drm-misc-next.
Thanks for reviewing and testing!

Noralf.

>  MAINTAINERS                         |   8 +
>  drivers/gpu/drm/Kconfig             |   2 +
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/drm_connector.c     |   1 +
>  drivers/gpu/drm/drm_probe_helper.c  |   7 +-
>  drivers/gpu/drm/gud/Kconfig         |  14 +
>  drivers/gpu/drm/gud/Makefile        |   4 +
>  drivers/gpu/drm/gud/gud_connector.c | 729 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_drv.c       | 661 +++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_internal.h  | 154 ++++++
>  drivers/gpu/drm/gud/gud_pipe.c      | 552 +++++++++++++++++++++
>  include/drm/gud.h                   | 333 +++++++++++++
>  include/uapi/drm/drm_mode.h         |   1 +
>  13 files changed, 2466 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/gud/Kconfig
>  create mode 100644 drivers/gpu/drm/gud/Makefile
>  create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>  create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>  create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>  create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>  create mode 100644 include/drm/gud.h
> 
