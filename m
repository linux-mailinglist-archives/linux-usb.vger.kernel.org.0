Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3AF333BAC
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 12:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbhCJLoD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 06:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhCJLnf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 06:43:35 -0500
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E288DC06174A
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 03:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tfJDUOuq/G8lxislJkZy1H7BcYxByC3tcxXQy85SnCQ=; b=u7CH8ZdFu2RTVQtiS8divD21SU
        Vc4ld70dFLaILkHo5wVa/yi4mXf1DH9VnuIG+tEufN/AjNK59XfatUebVOBKr3KR1PdS/w32alo9V
        5DZOAl4XQg1V4wl/Poawdb4jvgPN11H0EobTSTMU5MpMjNu5hWhowfQLpfxjNPLGbFi5YLKNTMrep
        IrLbspO/8WusGvlXWuFmgIpzc3GxGh38X13541vDZXaaQfEwoWlwx/nwej1VEhIFkbwY1yJZLCiqR
        w4i5sTFwhmojMg99QotLvllEy7deolQJcSLhMm+mty8FzujkQ/WyvLXg7NgSsICp71AH0zxFpLrBp
        c6c6BJqQ==;
Received: from [2a01:799:95f:4600:2010:7a82:9a7a:175c] (port=64334)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lJxFS-00027Y-O6; Wed, 10 Mar 2021 12:43:30 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
References: <20210310045544.28961.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
Date:   Wed, 10 Mar 2021 12:43:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210310045544.28961.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 10.03.2021 05.55, skrev Peter Stuge:
> Noralf Trønnes wrote:
>>> Depending on how long it takes for the DMA mask dependency patch to show
>>> up in drm-misc-next, I will either publish a new version or apply the
>>> current and provide patches with the necessary fixes. 
>>
>> In case I apply this version, are you happy enough with it that you want
>> to give an ack or r-b?
> 
> I've now tested R1 and RGB111 and I think I've found two more things:
> 
> I didn't receive the expected bits/bytes for RGB111 on the bulk endpoint,
> I think because of how components were extracted in gud_xrgb8888_to_color().
> 
> Changing to the following gets me the expected (X R1 G1 B1 X R2 G2 B2) bytes:
> 
> 			r = (*pix32 >> 8) & 0xff;
> 			g = (*pix32 >> 16) & 0xff;
> 			b = (*pix32++ >> 24) & 0xff;
> 

We're accessing the whole word here through pix32, no byte access, so
endianess doesn't come into play. This change will flip r and b, which
gives: XRGB8888 -> XBGR1111

BGR is a common thing on controllers, are you sure yours are set to RGB
and not BGR?

And the 0xff masking isn't necessary since we're assigning to a byte, right?

I haven't got a native R1G1B1 display so I have emulated and I do get
the expected colors. This is the conversion function I use on the device
which I think is correct:

static size_t rgb111_to_rgb565(uint16_t *dst, uint8_t *src,
                               uint16_t src_width, uint16_t src_height)
{
    uint8_t rgb111, val = 0;
    size_t len = 0;

    for (uint16_t y = 0; y < src_height; y++) {
        for (uint16_t x = 0; x < src_width; x++) {
            if (!(x % 2))
                val = *src++;
            rgb111 = val >> 4;
            *dst++ = ((rgb111 & 0x04) << 13) | ((rgb111 & 0x02) << 9) |
                     ((rgb111 & 0x01) << 4);
            len += sizeof(*dst);
            val <<= 4;
        }
    }

   return len;
}

> 
> Then, gud_xrgb8888_to_color() and maybe even gud_xrgb8888_to_r124() seem
> to be host endian dependent, at least because of that pix32, but maybe more?
> I don't know whether drm guarantees "native" XRGB byte sequence in memory,
> then I guess the pix32 is okay? Please take a look?
> 
> 
> Finally my very last ask: Please consider renaming GUD_PIXEL_FORMAT_RGB111
> to GUD_PIXEL_FORMAT_XRGB1111?
> 

It has crossed my mind, I'll change it.

Noralf.
