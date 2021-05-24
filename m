Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E12B38E62A
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 14:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbhEXMG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 08:06:29 -0400
Received: from cable.insite.cz ([84.242.75.189]:54689 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232735AbhEXMG0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 08:06:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8E90FA1A3D403;
        Mon, 24 May 2021 14:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621857896; bh=dC/PaK883uN3vnCr/XMUuaTTfpLCqKahY1flvzw9w4s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SbV++uOctZf03LNFoOFl1fhJ4nqB6Q9X6O3TWcLRNm1n3rzEMmRAr/fncHe9/IN41
         U7f1WpPc8BSNbAkdndgrTmgSSfds8iI0gK25/knzNZ3dhGoMd+rhapDMm1bwRJdrbg
         YftutKPGUnVc/2P5dNDBd/Mb40jLiDxcO6KtXGas=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2W8QPlSEzanq; Mon, 24 May 2021 14:04:51 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C08E1A1A3D402;
        Mon, 24 May 2021 14:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1621857890; bh=dC/PaK883uN3vnCr/XMUuaTTfpLCqKahY1flvzw9w4s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WlUrW0AoCHFbEnJQOktRHOd2LUnXGvfOsj2TbClg5cppPeAqpBpQsWchbY+CmJJ+M
         A/r+Q0zF6Og4MwIZPQhKlidzNvpI7eWltp/u/mKVRIuQoxT2cXFQZmhuccQRUwaP2j
         +nL6S/LkE2JgEfbDKquUlKknxTjMpXSZn7K7xkKQ=
Subject: Re: [RFC PATCH v2 1/3] usb: gadget: f_uac2/u_audio: add feedback
 endpoint support
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-2-jbrunet@baylibre.com>
 <4f213e44-e939-6d33-a333-a2573bd1e48c@ivitera.com>
 <1jim43hf6h.fsf@starbuckisacylon.baylibre.com>
 <1jfsz7hf45.fsf@starbuckisacylon.baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <5e170334-e374-4841-92d5-b2f787694b52@ivitera.com>
Date:   Mon, 24 May 2021 14:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1jfsz7hf45.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 30. 04. 21 v 19:11 Jerome Brunet napsal(a):
> 
> On Fri 30 Apr 2021 at 19:09, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
>> On Fri 30 Apr 2021 at 16:55, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>>
>>> Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
>>>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>>>
>>>> As per USB and UAC2 specs, asynchronous audio sink endpoint
>>>> requires explicit synchronization mechanism (Isochronous
>>>> Feedback Endpoint)
>>>>
>>>> Implement feedback companion endpoint for ISO OUT endpoint
>>>>
>>>> This patch adds all required infrastructure and USB requests
>>>> handling for feedback endpoint. Syncrhonization itself is
>>>> still dummy (feedback ep always reports 'nomimal frequency'
>>>>  e.g. no adjustement is needed). This satisfies hosts that
>>>> require feedback endpoint (like Win10) and poll it periodically
>>>>
>>>> Actual synchronization mechanism should be implemented
>>>> separately
>>>>
>>>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>
>>> Hi,
>>>
>>> The HS calculation of Q16.16 feedback value
>>> overflows at some 524kHz, disallowing use of larger samplerates (e.g.
>>> 768kHz or higher).
>>>
>>> I tested the formula used in alsa USB driver
>>> https://github.com/torvalds/linux/blob/d99676af540c2dc829999928fb81c58c80a1dce4/sound/usb/endpoint.c#L80
>>> which uses only 10bit shift. The feedback control in UAC2 gadget now
>>> works up to 4M samplerate with 1Hz precision (tested on RPi4 with
>>> bInterval = 1, checked in stream0 proc file on linux host).
>>>
>>> --- a/drivers/usb/gadget/function/u_audio.c
>>> +++ b/drivers/usb/gadget/function/u_audio.c
>>> @@ -118,7 +119,8 @@ static void u_audio_set_fback_frequency(enum
>>> usb_device_speed speed,
>>>                  * Prevent integer overflow by calculating in Q12.13
>>> format and
>>>                  * then shifting to Q16.16
>>>                  */
>>> -               ff = DIV_ROUND_UP((freq << 13), (8*1000)) << 3;
>>> +               ff = ((freq << 10) + 62) / 125;
>>
>> Pavel, The code posted is a little different from snip here.
>> While I understand the "<< 10" and "/ 125", the "+ 62" would welcome a
>> comment.
> 
> OOhhh I got it now ... I think using ROUND_UP() is lot more readable
> (and maintainable) 
> 
>>
>> Also in the final patch, the calculation is a bit different and moved to
>> "long long" ... but I'm sure the same type of improvement could be done.

Jerome, I see (sorry for the misunderstanding) that you have modified
original Ruslan's patch and the freq variable being shifted by 13 is
long long. Your code is definitely better, thanks.

Pavel.
