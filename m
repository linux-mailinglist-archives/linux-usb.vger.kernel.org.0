Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432031C12C6
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2020 15:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgEANWO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 May 2020 09:22:14 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:53971 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728586AbgEANWO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 May 2020 09:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1YNtvX4oLOqohRGsO2EGt5NIEzrQblXC2Xx169MlaTc=; b=WepnMGF1q6j/hhvfishf7vhy4D
        kniChuzNXNrOa+AdBwaLSRVLJ4pySwfWgZ/4pNVZL/zpyVxMp3Ff0a4Pl6FXM1m3F8er3dKoR7ygl
        KVehHEnXvTy110W4KB0xxELh8mliDhnd2VNeUgTBtd2sQ+FVq1eVtfJnLCPuGMGWIcRZ6atycgXKY
        OR+4SoPQ7tFbWqoDe6vNiag+2eF7vteNp/R4USHZhztj1hHbrW1kAM4ZklknWAhGuUeILQx20/n6b
        YCkmtrQ5QXdUBR8j20j4BcRbMov8C2r1mRAsCxd+6+y6LQfQYP/KA9w6uyVVC9jRzNaG6P+DHHnOz
        6YSxJogA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57902 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jUVcI-0001IF-Uh; Fri, 01 May 2020 15:22:10 +0200
Subject: Re: [PATCH 00/10] Generic USB Display driver
To:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <10d713c1-f1dd-431e-6b64-520304575ac7@tronnes.org>
Date:   Fri, 1 May 2020 15:22:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429124830.27475-1-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 29.04.2020 14.48, skrev Noralf Trønnes:
> Hi,
> 
> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
> 
> This series adds a USB host driver and a device/gadget driver to achieve
> that.
> 
> The reason for calling it 'Generic' is so anyone can make a USB
> display/adapter against this driver, all that's needed is to add a USB
> vid:pid. I was hoping to have someone working on a microcontroller based
> USB display by now, but unfortunately that has been delayed. It would
> have been nice to have a microcontroller implementation to ensure that I
> haven't made things unnecessary difficult to implement.
> 
> Performance
> The one thing that decides how useful this all is, is how smooth an
> experience it gives. My hope was that it should not be noticeably laggy
> with ordinary office use on 1920x1080@RG16. I'm pleased to see that it's
> also possible to watch youtube movies, although not in fullscreen.
> 
> Some of the main factors that affects performance:
> - Display resolution
> - Userspace providing damage reports (FB_DAMAGE_CLIPS or
> DRM_IOCTL_MODE_DIRTYFB)
> - Color depth (DRM_CAP_DUMB_PREFERRED_DEPTH = 16 if RGB565)
> - How well the frames compress (lz4)
> - Gadget device memory bandwidth, CPU power for decompression
> - (Big endian hosts will have to do byte swapping on the frames)

One factor that I forgot is USB2 vs USB3.
The Pi's have a USB2 Device controller (dwc2). I couldn't find a cheap
board with a USB3 Device controller that could run mainline Linux, so I
haven't tried that.

> 
> I've tested these:
> - xorg-server on Pi4. This was nice and smooth since it uses
> DRM_IOCTL_MODE_DIRTYFB and honours DRM_CAP_DUMB_PREFERRED_DEPTH.
> - Ubuntu 20.04 GNOME on x86. This was useable, but not so good for
> movies. GNOME doesn't look at DRM_CAP_DUMB_PREFERRED_DEPTH and doesn't
> set FB_DAMAGE_CLIPS on the pageflips.
> 
> I've made a short video to show what it looks like[1].

I got a question if this would work with usbip[4], USB over IP.
I did a quick test with two Pi4's connected by cable to the same network
switch (1Gb). Showing a movie in a window like my previous test didn't
show much of a difference. Maybe some occasional glitching, hard to tell
without proper tests.

There's no pageflipping on the device side, so it could be tearing that
I saw.

Noralf.

[4] tools/usb/usbip/README

> 
> I have used a Pi4 as the gadget during development since it has much
> better memory bandwith (4000 vs 200 MBps)[2] and CPU than the PiZ. They
> both have the same gadget controller (dwc2).
> 
> I did an RFC [3] of this 2 months ago where I looked at doing a Multi
> Function USB device. I gave up on that when I realised how much work the
> review process would be. So I stripped down to my original idea. I have
> made sure that the drivers will tolerate another USB interface of type
> VENDOR, so it's still possible for the display to be part of a multi
> function device.
> 
> Noralf.
> 
> [1] https://youtu.be/AhGZWwUm8JU
> [2] https://magpi.raspberrypi.org/articles/raspberry-pi-specs-benchmarks
> [3] https://patchwork.freedesktop.org/series/73508/
> 
