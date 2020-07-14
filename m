Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E7721F2A1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 15:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgGNNdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 09:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgGNNdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 09:33:05 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B02C061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BfyzzkoolzGQOxyc6LjSkDanzQgp6Lev6ywvNOMJaqc=; b=glV4Hy0xeq+PmeIemp9nhA34MJ
        7m7lOUXYcsA9ZzHN/EC4LSZpSHOtbNsxA5sZ0lEf6zKkiRlpL2m261D6aUSaVRN97CL16FZJutQkz
        ETqZaKA0pJdkQi6li7Vp2WwLsXfcbUWjGF87y2PPQT7KU20V/8lnfyXPXXAoIrtxDHcaM7M/X6hXs
        kXKU85dIiAojtyYBI9Yw4m5SiIPVAkwmvuc3TBcUhpS1c6S9/Vecoe/nkKeHWA3iXx6XdM3sI6wkp
        ulkZtLsoV7q3uf/tZIF3JEnlapT+g0HiR8zlOyZjXWHwJoUx3sEQNU9awGPsCaYhQZA+IgFGAKrGh
        9Ifgdzew==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58790 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jvL3O-0005dK-Ow; Tue, 14 Jul 2020 15:33:02 +0200
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, balbi@kernel.org,
        Peter Stuge <peter@stuge.se>
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
Date:   Tue, 14 Jul 2020 15:33:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709163235.360054-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 09.07.2020 18.32, skrev Lubomir Rintel:
> Hello,
> 
> On 29 May 2020 Noralf Trønnes wrote:
> ...
>> This series adds a USB host driver and a device/gadget driver to achieve
>> that.
>>
>> The reason for calling it 'Generic' is so anyone can make a USB
>> display/adapter against this driver, all that's needed is to add a USB
>> vid:pid. I have done a microcontroller implementation hack just to see
>> how that would work out[1] (which unconvered a couple of bugs in the
>> host driver).
> ...
> 
> This is actually very cool; finally a good way to drive the cheapo
> SPI/I2C displays from computers whose only means of expansion is USB
> with a little help from a microcontroller. I've actually had some
> success doing just that [1].

Nice to see a monochrome implementation, I actually planned to remove
the R1 format from v3 since the gadget driver doesn't implement it.
Having unused (and poorly tested) code isn't that great, but I forgot.
It turns out it was a good thing that I forgot that :-)

> 
> [1] https://assets.octodon.social/media_attachments/files/009/983/960/original/64ad8ea46c1b06c5.jpg
> 
> I suppose you can add:
> 
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> I've had to jump through some hoops though.
> 
> My OLED display is a 128x64 SSD1306 [1] driven from the SPI bus. The frame
> buffer SRAM is normally scanned out in stripes of 8 vertical pixels called
> "pages". When the display is turned on its side, with "vertical
> addressing mode" and "segment remapping" enabled and bytes being sent LSB
> first, it appears linear -- it's easy to repaint the whole display from
> what is now the top left corner to the bottom right. This is very
> convenient for painting pixels as they come, without bufferring them or
> doing any conversions (assuming that memory and cpu cycles are at
> premium on MCUs).
> 
> [1] https://cdn-shop.adafruit.com/datasheets/SSD1306.pdf
> 
> There doesn't seem a comfortable way to do partial redraws though. Would
> you find it objectionable if the device could indicate that needs full
> frames instead of just the damaged areas? Perhaps then the driver
> wouldn't even need to bother issuing GUD_DRM_USB_REQ_SET_BUFFER to
> displays dumb enough to be incapable of partial redraws and decompression.
> 

Yeah I figured always having full updates might benefit/simplify
monochrome devices, but I'd wait for an actual device needing it before
adding it. Now that you need it, I'll add a flag for it in the next
version.

I would like to keep the SET_BUFFER request since it will serve as a
syncing point between the host and the device. I'm no USB expert but I
assume that a bulk transfer can fail halfway through and result in the
next update starting where the previous one failed and thus writing
beyond the end of the display buffer.

Noralf.

> My work-in-progress code that works on STM32F103 (e.g. "Blue Pill"
> boards), or GD32VF103 (RISC-V "Polos Alef") is at [2]. The partial redraws
> that don't start from column zero or are not "page aligned" don't work
> correctly for the time being; X11 doesn't seem to care.
> 
> [2] https://github.com/hackerspace/libopencm3-gf32v-examples/tree/lr/gd32v/examples/gd32v/f103/polos-alef/usb-display
> 
> Thank you!
> Lubo
> 
