Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD5A3209CB
	for <lists+linux-usb@lfdr.de>; Sun, 21 Feb 2021 12:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhBULQC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Feb 2021 06:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhBULQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Feb 2021 06:16:00 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85127C061574
        for <linux-usb@vger.kernel.org>; Sun, 21 Feb 2021 03:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q/EsuBx2rpbF4bTNqafbctKSjGqSih9PCFZcmYvOH/Y=; b=JXgiS5WmDnJkDp9xgNRqCRk3Nh
        70/dl7sfXsyq2ockxkR7//xjYkK59E9kace1M1wqdyiEwVD1VAajGj/xtled7xIW+dfCjj7Lijws3
        nXnw0dETs/DSObvBFE0nXUEeqGeOW1JaekITwbMTU48uYISZs3A5PDVnlQKidlC6N4hizkEV7ydvu
        fKLTzRI3bQ1V43bGDUgYcyngBi/F8wf6IdrFnEkvcN/FuH2SgsRD6Fple99vK6CFc1dvx+ySalnhW
        iknbqefCLrpIXSukpGaG3r+2ityISNl+Z46S3x+MzOiC14LDkcPutLpMyOXlsWkWcWXdpMF/LxZE3
        1aJEDSPg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49463 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lDmhV-00050B-Qw; Sun, 21 Feb 2021 12:14:57 +0100
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, pontus.fuchs@gmail.com, peter@stuge.se
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210124183838.GA1873250@demiurge.local>
 <70a91ae8-15eb-e8d8-1ed9-923b09106bfa@tronnes.org>
Message-ID: <1c182bf1-41d7-49e7-f15e-e8d9ad6386a2@tronnes.org>
Date:   Sun, 21 Feb 2021 12:14:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <70a91ae8-15eb-e8d8-1ed9-923b09106bfa@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 24.01.2021 21.51, skrev Noralf Trønnes:
> 
> 
> Den 24.01.2021 19.38, skrev Lubomir Rintel:
>> On Wed, Jan 20, 2021 at 06:00:30PM +0100, Noralf Trønnes wrote:
>>> Hi,
>>>
>>> A while back I had the idea to turn a Raspberry Pi Zero into a $5
>>> USB to HDMI/SDTV/DSI/DPI display adapter.
>>>
>>> The reason for calling it 'Generic' is so anyone can make a USB
>>> display/adapter against this driver, all that's needed is to add a USB
>>> vid:pid.
>>>
>>> Unfortunately I've had some compounding health problems that have
>>> severally limited the time I can spend in front of a computer. For this
>>> reason I've decided to keep the gadget driver out-of-tree and focus on
>>> getting the host driver merged first.
>>>
>>> See the wiki[1] for more information and images for the Raspberry Pi
>>> Zero/4.
>>>
>>> One big change this time is that I've followed Peter Stuge's advice to
>>> not let DRM stuff leak into the USB protocol. This has made the protocol
>>> easier to understand just from reading the header file.
>>>
>>> Noralf.
>>>
>>> [1] https://github.com/notro/gud/wiki
>>
>> The patch set:
>>
>> Tested-by: Lubomir Rintel <lkundrak@v3.sk>
>>
>> Works like a charm with this board [1], though it didn't impress the girls
>> as much as I hoped. Code here [2], picture here [3].
>>
> 
> I have wondered what color display resolution it is possible to drive
> over USB full speed. I can understand that your PoC wasn't that
> impressive since it doesn't use DMA to drive the SPI bus.
> 

I have now done a Raspberry Pi Pico implementation and driving SPI using
DMA was just marginally faster than letting the CPU fill the FIFO. Maybe
I shouldn't be so suprised since the CPU has nothing else to do, but
even so I didn't expect this. But then again I have very little
experience with microcontrollers.

I have the same size display[1] as you 240x135 and my display was quite
snappy (using X windows!), I even added lz4 decompression support. I
haven't done much testing so I can't say how much the actual improvement
is with the compression. The USB double buffering I was hoping for
didn't pan out, the bulk endpoint can only do 64 byte packest (ISO is
512), so I ended up storing the packets and then push the frame in its
entirety to the display. The Pico has 264kB of ram so I can afford to
have a framebuffer and a decompression buffer for this tiny display. My
target display is 320x240 and that means I can't use 2 buffers, so not
sure how that goes.

[1] https://shop.pimoroni.com/products/pico-display-pack

Noralf.

> The new $4 Raspberry Pi Pico that came out this week looks interesting
> as a USB interface board for tiny panels. It can drive DPI panels
> directly, has 2 cores @133MHz, 264K SRAM and USB full speed. Maybe lz4
> decompression is even possible. Another good thing is that the board
> will be around for a long time.
> 
> Thanks for testing, I have limited bandwith these days so I couldn't do
> a test on an MCU myself.
> 
> Noralf.
> 
>> [1] https://www.banggood.com/LILYGO-TTGO-T-Display-GD32-RISC-V-32-bit-Core-Minimal-Development-Board-1_14-IPS-p-1652870.html?rmmds=search&cur_warehouse=CN
>> [2] https://github.com/hackerspace/libopencm3-gf32v-examples/commit/7ef51b31b9
>> [3] https://people.freedesktop.org/~lkundrak/lilygo.jpeg
>>
>> Had to apply a fix for the drm_connector_enum_list[] ommission I mentioned
>> elsewhere, and that I've now noticed you've noted previously.
>>
>> Take care
>> Lubo
>>
