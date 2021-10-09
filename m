Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3ED4277CA
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 08:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhJIGo7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Oct 2021 02:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhJIGo6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Oct 2021 02:44:58 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4963EC061570
        for <linux-usb@vger.kernel.org>; Fri,  8 Oct 2021 23:43:02 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id l7-20020a0568302b0700b0054e40740571so8614043otv.0
        for <linux-usb@vger.kernel.org>; Fri, 08 Oct 2021 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sch71Tn4pcTeG3qTTIg7X9YowDl5vCB4ih5b/eob0I0=;
        b=PzCJzM9upRa2fD25ELTFoURbCSg0Ytiuoqb+7JusLOfrXV+YUQvrCfvKK+1bKrp9pD
         Nj8xtmqKGqdLtBFYMD3fTmsq9YxRC8+q4PabdsP52kRk2CkNCizMv0cbo2JjOvxrZDhA
         8SOC0gHMz0DvI2NUg/WMZBoRZuHSYovrrkiPUYGOXsS7jx0Q3ti1rQn7XJBnWrDmUjaj
         jnLAUceZlqvL8FeHL1CIZ07WMYjfEUJb6bxSSRLuh1116riD7dXaeC1fN5GT12oOEyX0
         rF67itJGd71QxA+3IwQdEPqPjt/WFDPv4597+7YP8k4/kLgE69urNZ5PsWpyGUKXrti9
         UzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sch71Tn4pcTeG3qTTIg7X9YowDl5vCB4ih5b/eob0I0=;
        b=gQkTFmeG0HdmtcHCYDqVki2WcSX9Zd0k5FP8+NTCuylrwAygSNQAcmfoi3espi2wZv
         yEz1a3/2RP4ZUbUh19QDrPWYpiFxkcvwRORAkA0O0y4O3Xnw28wbk6cNOj0+w6AEJAnr
         MDecqgQQ/XoeSdi0XiH1ac3XhvYv2tEwDSiTKCCgzu5NwFLatONoUQPPpIVgoVs1S/JP
         AzUAERa7caFF3zYLWO5YlFk18CRIvN2N6ZgHUKPxRtFxwdio/wez2gmgK1+hzdg2vv/i
         JE3VCrIEi/CJ8dkPX28yMj5JDovIHSdZ/KLYnNB4a1jIKHT56UaVuxJFaNYOKV3ScBYc
         Rrvg==
X-Gm-Message-State: AOAM531eCNDkoKtb1pwH/T7m+PLk1K+SXOV7rOaGOFeKP2YB+3Ifr6me
        nhdmFCF9NU9guOa87H1Z31M=
X-Google-Smtp-Source: ABdhPJy+95/59vCflzrf6MKPSa6y1wUv5tvrViPNS9epw9tRwce7Hj4cERcxpt/hb9UiIMFes8qJjg==
X-Received: by 2002:a9d:19a9:: with SMTP id k38mr12253627otk.284.1633761781601;
        Fri, 08 Oct 2021 23:43:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k6sm347676otf.80.2021.10.08.23.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 23:43:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: ignore data role mismatch with a
 GoodCRC Message
To:     Gianni Pisetta <gianni.pisetta@gmail.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
References: <20211008201455.8739-1-gianni.pisetta@gmail.com>
 <7d81a8ef-faa1-f8a6-cccc-493cc8bff085@roeck-us.net>
 <CAP7v90N=UDs3FSrp7Vke2ckzB5TavhCKz3xKYC8t96wajFM-NA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <bab08505-d69f-d9d3-0951-9e130c81c948@roeck-us.net>
Date:   Fri, 8 Oct 2021 23:42:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAP7v90N=UDs3FSrp7Vke2ckzB5TavhCKz3xKYC8t96wajFM-NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/8/21 11:25 PM, Gianni Pisetta wrote:
> Il ven 8 ott 2021, 22:47 Guenter Roeck <linux@roeck-us.net> ha scritto:
>>
>> On 10/8/21 1:14 PM, Gianni Pisetta wrote:
>>> The data role check in tcpm.c cause the port manager to enter a loop with a
>>> hard reset on some chargers.
>>> By the spec in a GoodCRC Message the other end does not need to comply with
>>> the data role, so ignore a data role mismatch in a request when the message
>>> type is GoodCRC.
>>> >From the USB PD spec:
>>> "If a USB Type-C Port receive a Message with the Port Data Role field set
>>> to the same Data Role, except for the GoodCRC Message, USB Type-C error
>>> recovery..."
>>>
>>> Below are the log of a Pinebook Pro attached to a PinePower Desktop Supply
>>> before the patch:
>>>
>>> [226057.970532] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
>>> [226057.975891] pending state change SNK_WAIT_CAPABILITIES -> SNK_READY @ 310 ms [rev3 NONE_AMS]
>>> [226058.134384] PD RX, header: 0x53a1 [1]
>>> [226058.134389] Data role mismatch, initiating error recovery
>>> [226058.134392] state change SNK_WAIT_CAPABILITIES -> ERROR_RECOVERY [rev3 NONE_AMS]
>>> [226058.134404] state change ERROR_RECOVERY -> PORT_RESET [rev3 NONE_AMS]
>>>
>>> Fixes: f0690a25a140b

This is not a correct Fixes: tag. The correct tag would be:

Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")

Please run checkpatch on your patches; it should tell you.

>>> cc: <stable@vger.kernel.com>
>>> Signed-off-by: Gianni Pisetta <gianni.pisetta@gmail.com>
>>>
>>> ---
>>>    drivers/usb/typec/tcpm/tcpm.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index 5d05de666597..02ebf7e03c41 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -2887,11 +2887,11 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
>>>
>>>                /*
>>>                 * If both ends believe to be DFP/host, we have a data role
>>> -              * mismatch.
>>> +              * mismatch. Must perform error recovery actions, except for
>>> +              * a GoodCRC Message(USB PD standard, 6.2.1.6).
>>>                 */
>>> -             if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
>>> -                 (port->data_role == TYPEC_HOST)) {
>>> +             if (!!((le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
>>> +                    (port->data_role == TYPEC_HOST) && type != PD_CTRL_GOOD_CRC)) {
>>
>> Unless I am missing something, this could also be a PD_DATA_SOURCE_CAP
>> or PD_EXT_SOURCE_CAP_EXT message.
>>
>> Guenter
> 
> Yes, you are definitely right about that. I thought I had checked.
> Please discard this patch.
> Would you accept a v2 with a proper check also on PD_HEADER_EXT_HDR
> and pd_header_cnt?

Sure, assuming it is correct, but please remember that there should only
be one logical change per patch.

Guenter

> 
> Thanks,
> Gianni
> 

