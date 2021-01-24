Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8C301ED2
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 21:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbhAXUwY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jan 2021 15:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbhAXUwP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jan 2021 15:52:15 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CA0C061573
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rZu2N0bPbN0l5Ml3IhwAB/RSLO7PwqBP9V+cJaEHt6A=; b=EtGLctS+r80RcHPE9ZeG9ZRiV5
        X7kUTYRyLFXlPHf5oaGpkMrWof3qQgnxqiknkb5TYNesrHA1GZWj3rvt80DNrr1nW3MVZw4INLZM5
        j/ZThN0VFWy2EmZpoXiCr2p6tvSyzDosN48aifUppiL6W1AZJ66kzTl0StJxmyAhfT/rW4iIQoQAQ
        ATHdJnhP4rVX/im2AOP1viWmJQ26sjeENxo8H+JI3nVlyY2hUXqLuLYEd8CrCgaw2pNl1GK1rzUnE
        6pqHQ+JQRt2O219gLaumNxrC88ohZ1ouVlP8WF33X5cxHXFHsrlak0wrV4gnJ6XK/KVxXUeDgYKkG
        9xHulbJA==;
Received: from [2a01:799:95f:4600:a14b:28a5:23ac:14a3] (port=59614)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1l3mLn-0002ur-Bu; Sun, 24 Jan 2021 21:51:11 +0100
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        sam@ravnborg.org, peter@stuge.se, markus@raatikainen.cc,
        pontus.fuchs@gmail.com, hudson@trmm.net, th020394@gmail.com
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210124183838.GA1873250@demiurge.local>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <70a91ae8-15eb-e8d8-1ed9-923b09106bfa@tronnes.org>
Date:   Sun, 24 Jan 2021 21:51:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210124183838.GA1873250@demiurge.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 24.01.2021 19.38, skrev Lubomir Rintel:
> On Wed, Jan 20, 2021 at 06:00:30PM +0100, Noralf Trønnes wrote:
>> Hi,
>>
>> A while back I had the idea to turn a Raspberry Pi Zero into a $5
>> USB to HDMI/SDTV/DSI/DPI display adapter.
>>
>> The reason for calling it 'Generic' is so anyone can make a USB
>> display/adapter against this driver, all that's needed is to add a USB
>> vid:pid.
>>
>> Unfortunately I've had some compounding health problems that have
>> severally limited the time I can spend in front of a computer. For this
>> reason I've decided to keep the gadget driver out-of-tree and focus on
>> getting the host driver merged first.
>>
>> See the wiki[1] for more information and images for the Raspberry Pi
>> Zero/4.
>>
>> One big change this time is that I've followed Peter Stuge's advice to
>> not let DRM stuff leak into the USB protocol. This has made the protocol
>> easier to understand just from reading the header file.
>>
>> Noralf.
>>
>> [1] https://github.com/notro/gud/wiki
> 
> The patch set:
> 
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> Works like a charm with this board [1], though it didn't impress the girls
> as much as I hoped. Code here [2], picture here [3].
> 

I have wondered what color display resolution it is possible to drive
over USB full speed. I can understand that your PoC wasn't that
impressive since it doesn't use DMA to drive the SPI bus.

The new $4 Raspberry Pi Pico that came out this week looks interesting
as a USB interface board for tiny panels. It can drive DPI panels
directly, has 2 cores @133MHz, 264K SRAM and USB full speed. Maybe lz4
decompression is even possible. Another good thing is that the board
will be around for a long time.

Thanks for testing, I have limited bandwith these days so I couldn't do
a test on an MCU myself.

Noralf.

> [1] https://www.banggood.com/LILYGO-TTGO-T-Display-GD32-RISC-V-32-bit-Core-Minimal-Development-Board-1_14-IPS-p-1652870.html?rmmds=search&cur_warehouse=CN
> [2] https://github.com/hackerspace/libopencm3-gf32v-examples/commit/7ef51b31b9
> [3] https://people.freedesktop.org/~lkundrak/lilygo.jpeg
> 
> Had to apply a fix for the drm_connector_enum_list[] ommission I mentioned
> elsewhere, and that I've now noticed you've noted previously.
> 
> Take care
> Lubo
> 
>>
>>
>> Noralf Trønnes (3):
>>   drm/uapi: Add USB connector type
>>   drm/probe-helper: Check epoch counter in output_poll_execute()
>>   drm: Add Generic USB Display driver
>>
>>  MAINTAINERS                         |   8 +
>>  drivers/gpu/drm/Kconfig             |   2 +
>>  drivers/gpu/drm/Makefile            |   1 +
>>  drivers/gpu/drm/drm_probe_helper.c  |   7 +-
>>  drivers/gpu/drm/gud/Kconfig         |  14 +
>>  drivers/gpu/drm/gud/Makefile        |   4 +
>>  drivers/gpu/drm/gud/gud_connector.c | 722 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/gud/gud_drv.c       | 620 ++++++++++++++++++++++++
>>  drivers/gpu/drm/gud/gud_internal.h  | 148 ++++++
>>  drivers/gpu/drm/gud/gud_pipe.c      | 472 ++++++++++++++++++
>>  include/drm/gud.h                   | 356 ++++++++++++++
>>  include/uapi/drm/drm_mode.h         |   1 +
>>  12 files changed, 2354 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/gud/Kconfig
>>  create mode 100644 drivers/gpu/drm/gud/Makefile
>>  create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>>  create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>>  create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>>  create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>>  create mode 100644 include/drm/gud.h
>>
>> -- 
>> 2.23.0
>>
> 
