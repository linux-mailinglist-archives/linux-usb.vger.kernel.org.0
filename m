Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6144736FF3F
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 19:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhD3RMN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 13:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3RMN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 13:12:13 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBEEC06174A
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 10:11:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g14so23771807edy.6
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=cq8E1ZKP9VWnAgp7hPIjcmZiOKIEht/5108KvPkf+3s=;
        b=VCXZ/wZTRGu3tSn4Pv9ud5LZnTFn3UtzVsCSzdzZEG5532MVA7/C2aP5Oif2buXxKC
         Wzs+5iHVqMW9toK5Lv0N1HSd3oS5L07CPxf4uQwAZQqW0zTof6I/Gg6QtrbWTDxTc7jJ
         qA3yo4NVveRFdB06T1TduKD1IpyP1JuFByvFpzPGPf7viyFRgvr+w6JSL+10VuTlfvVz
         uPCqYh0PxRoXlO0X0RZVl0uROCp7PSx6m9nNxlx9kpYgQBFfI+2Wfy7jDUIDfs2/MCKM
         WjQJwRa2Ok/ih4H5mp5ABvkSpFioy+jMo3QJ0aaKkKZb68PL7VOvlKNY7WoPNOozXOhX
         sGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=cq8E1ZKP9VWnAgp7hPIjcmZiOKIEht/5108KvPkf+3s=;
        b=bSAT7IzkM1wqs06aLlyCOcFwHsgIfiiLbWFJD7b2EoqOrwiqGCdtlcdvts31ymQRpT
         0l/7IeScb52XomUYuDE6rDr28qaN2NvOCekoQXnCuCak+/in1oTc43EyuK0yAZVwjWg+
         3ecS4NNHu5NyoGkPppfTX60yAeHdUu9oDbn5il8Hn9xauNvLtdkjQ9gnjbEyhOHBJMQI
         MyapljoGviLz0RAr2jcFrCsXNGHOPGfgc3uaKWCbABpYy4gdiBkqRS5mnzIvvNFNWexe
         pkOdm42amz1dDo8HTQw8ymxdNdSZ2yeBKOq7z493LmVvTEkTPpC/nVDuYFL2POuikRBb
         o7Cw==
X-Gm-Message-State: AOAM5329hv0fG/uXGkSoTXY5CyUa+CInkXJ2lKW+dln/sQsvyx360iNt
        6/9SIVbx3r9ezhIapY6DijdWDQ==
X-Google-Smtp-Source: ABdhPJwHx68SXulBKtdIIAurWSHvEA6D8WT0+EXKpw43MFuCHTiWRRZ94ytdKxfWRof5Rs6Ne9fZ9Q==
X-Received: by 2002:a05:6402:1a38:: with SMTP id be24mr7289452edb.293.1619802683322;
        Fri, 30 Apr 2021 10:11:23 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id h11sm1906435eds.15.2021.04.30.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 10:11:23 -0700 (PDT)
References: <20210430142625.357152-1-jbrunet@baylibre.com>
 <20210430142625.357152-2-jbrunet@baylibre.com>
 <4f213e44-e939-6d33-a333-a2573bd1e48c@ivitera.com>
 <1jim43hf6h.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: Re: [RFC PATCH v2 1/3] usb: gadget: f_uac2/u_audio: add feedback
 endpoint support
In-reply-to: <1jim43hf6h.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jfsz7hf45.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 30 Apr 2021 19:11:22 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Fri 30 Apr 2021 at 19:09, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Fri 30 Apr 2021 at 16:55, Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
>> Dne 30. 04. 21 v 16:26 Jerome Brunet napsal(a):
>>> From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>> 
>>> As per USB and UAC2 specs, asynchronous audio sink endpoint
>>> requires explicit synchronization mechanism (Isochronous
>>> Feedback Endpoint)
>>> 
>>> Implement feedback companion endpoint for ISO OUT endpoint
>>> 
>>> This patch adds all required infrastructure and USB requests
>>> handling for feedback endpoint. Syncrhonization itself is
>>> still dummy (feedback ep always reports 'nomimal frequency'
>>>  e.g. no adjustement is needed). This satisfies hosts that
>>> require feedback endpoint (like Win10) and poll it periodically
>>> 
>>> Actual synchronization mechanism should be implemented
>>> separately
>>> 
>>> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> Hi,
>>
>> The HS calculation of Q16.16 feedback value
>> overflows at some 524kHz, disallowing use of larger samplerates (e.g.
>> 768kHz or higher).
>>
>> I tested the formula used in alsa USB driver
>> https://github.com/torvalds/linux/blob/d99676af540c2dc829999928fb81c58c80a1dce4/sound/usb/endpoint.c#L80
>> which uses only 10bit shift. The feedback control in UAC2 gadget now
>> works up to 4M samplerate with 1Hz precision (tested on RPi4 with
>> bInterval = 1, checked in stream0 proc file on linux host).
>>
>> --- a/drivers/usb/gadget/function/u_audio.c
>> +++ b/drivers/usb/gadget/function/u_audio.c
>> @@ -118,7 +119,8 @@ static void u_audio_set_fback_frequency(enum
>> usb_device_speed speed,
>>                  * Prevent integer overflow by calculating in Q12.13
>> format and
>>                  * then shifting to Q16.16
>>                  */
>> -               ff = DIV_ROUND_UP((freq << 13), (8*1000)) << 3;
>> +               ff = ((freq << 10) + 62) / 125;
>
> Pavel, The code posted is a little different from snip here.
> While I understand the "<< 10" and "/ 125", the "+ 62" would welcome a
> comment.

OOhhh I got it now ... I think using ROUND_UP() is lot more readable
(and maintainable) 

>
> Also in the final patch, the calculation is a bit different and moved to
> "long long" ... but I'm sure the same type of improvement could be done.
>
>>         }
>>         *(__le32 *)buf = cpu_to_le32(ff);
>>  }
>>
>>
>> Best regards,
>>
>> Pavel.

