Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F27036FCEA
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 16:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhD3O4N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 10:56:13 -0400
Received: from cable.insite.cz ([84.242.75.189]:35217 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhD3O4M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 10:56:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 10DD6A1A3D402;
        Fri, 30 Apr 2021 16:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619794520; bh=Ayp3OcpEo+0rj/RYItSkP79GHBkdGLVbs5t3fFX0Oh8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sGAp8tIweUBtX61lP6N9p3iwLW5PRZoKQ3B+XJqOirANL+z5R37BeDs2dyeubvKR5
         7H/5WGOjvVHSyOT7Pw0KSRmBRYbL+NJp4TPmPa6j5k6Jblf1hMCmOCn6J4Tj9aUZXE
         KADD8jqEAH6NoLV8b0kOnPVPr5ZK7A6GtLEXSU50=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GF7nBBTAAtmR; Fri, 30 Apr 2021 16:55:14 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 0052AA1A3D401;
        Fri, 30 Apr 2021 16:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619794514; bh=Ayp3OcpEo+0rj/RYItSkP79GHBkdGLVbs5t3fFX0Oh8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZdnNeF3u07gQvcpKwgNDpQY6TFTulFtCwVQX7LxxMHz9VK1a3XH0QlTpz67w1uLUl
         sUcuBbU3C+iJ3AkxVGHWoIRN8EimRV1K1ZpgF+dXtU3fodZF2xmw/QHSoLxyvPxzV6
         hwW+BeuiX1lb4tMo0jsGpRQpSTRa//wADKJXeqks=
Subject: Re: [RFC PATCH v2 1/3] usb: gadget: f_uac2/u_audio: add feedback
 endpoint support
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-2-jbrunet@baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <4f213e44-e939-6d33-a333-a2573bd1e48c@ivitera.com>
Date:   Fri, 30 Apr 2021 16:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430142625.357152-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> 
> As per USB and UAC2 specs, asynchronous audio sink endpoint
> requires explicit synchronization mechanism (Isochronous
> Feedback Endpoint)
> 
> Implement feedback companion endpoint for ISO OUT endpoint
> 
> This patch adds all required infrastructure and USB requests
> handling for feedback endpoint. Syncrhonization itself is
> still dummy (feedback ep always reports 'nomimal frequency'
>  e.g. no adjustement is needed). This satisfies hosts that
> require feedback endpoint (like Win10) and poll it periodically
> 
> Actual synchronization mechanism should be implemented
> separately
> 
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Hi,

The HS calculation of Q16.16 feedback value
overflows at some 524kHz, disallowing use of larger samplerates (e.g.
768kHz or higher).

I tested the formula used in alsa USB driver
https://github.com/torvalds/linux/blob/d99676af540c2dc829999928fb81c58c80a1dce4/sound/usb/endpoint.c#L80
which uses only 10bit shift. The feedback control in UAC2 gadget now
works up to 4M samplerate with 1Hz precision (tested on RPi4 with
bInterval = 1, checked in stream0 proc file on linux host).

--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -118,7 +119,8 @@ static void u_audio_set_fback_frequency(enum
usb_device_speed speed,
                 * Prevent integer overflow by calculating in Q12.13
format and
                 * then shifting to Q16.16
                 */
-               ff = DIV_ROUND_UP((freq << 13), (8*1000)) << 3;
+               ff = ((freq << 10) + 62) / 125;
        }
        *(__le32 *)buf = cpu_to_le32(ff);
 }


Best regards,

Pavel.

