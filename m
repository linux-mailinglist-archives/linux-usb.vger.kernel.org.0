Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83C82C017F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 09:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgKWIeB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 03:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbgKWIeB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 03:34:01 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161FFC0613CF
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 00:34:01 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 131so14239265pfb.9
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 00:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=0A4rASELU5+xlUlaKp7Y1f4kgDQSlAUFy2uSvXnNK2I=;
        b=fXFKU7fx0Ikmiy0bl2qWPUn4rtveXVtV/Qj82WP51J0KXgQCVq5/JB9FwOriYQVh2u
         5a+oXdC027DUw157YklaNEXiela6N5fdk0d5IvL0ooVV5dDd/yxq//jdbZI9pmZu6pEa
         VpTGjQGqBPIwUPK+8Mvxbz1jQi4wGcsfKfX9MUBYKbAbz9CqG0QVo9fvijuCEoFX+h2t
         cyGGuE8lyhKyCqT6kJu0gnZVtJAC0E1Pq3FLGNZcfCwvSPllNyAlEax1xg7Kf1x+hFYk
         sNEAl6e528HO7e/cQWfDjv+Ralb5ckuiDewP+G2dejZo0rTmCxje09pVPBKLr/9fRVFg
         dtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0A4rASELU5+xlUlaKp7Y1f4kgDQSlAUFy2uSvXnNK2I=;
        b=jmoic0vHMKA0VbC5ZFn76lqEbrrRPpr1lypFqnXpxC5WOiUfLLYnFM6MWq0mFxVrQr
         4SkP6I2sQ0fOZKkK7NEDTi8jkjsUkbSBapTbaWEVnkkUtulu5YuF8xwH8or5+hXEBcQZ
         jeyVcQyQV7KsfTLDjAgXqkhFL0rZR9d8mQ9ORyL1/6toNjRXxENH/zy3Eg8HtCmdrNiU
         Pp2IRf9fW4MWHUSKQKGcJ/yyrWMZqjt5MK9grZggY3TUb3OTLJdh/hCKA16FKR7uPyOp
         5HIQYC2hQNNm+OthG3qwob8IUtt4fAWVkba5J0J44mgrbNrH7AjRiLAqbE0SokogS4bt
         Ts/w==
X-Gm-Message-State: AOAM531BSuTERmkJjC0gYWwLaDhx937JaSlGAHdra9E0hcKmGLVoAING
        gwqE2Pb7KKPHtLD29GUkplM=
X-Google-Smtp-Source: ABdhPJzchPLUlW2AF8pSSha7jNZiAqiNLRjQFAcHmUqQQdPCtJNfAtwSyLLpQd+4jXY/TvXpKk3OfQ==
X-Received: by 2002:a17:90a:9f85:: with SMTP id o5mr22880689pjp.63.1606120440746;
        Mon, 23 Nov 2020 00:34:00 -0800 (PST)
Received: from [192.168.1.5] ([159.192.85.80])
        by smtp.googlemail.com with ESMTPSA id t12sm10936208pfq.79.2020.11.23.00.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:34:00 -0800 (PST)
Subject: Re: [PATCH] option: added support for Thales Cinterion MV31 option
 port.
From:   Lars Melin <larsm17@gmail.com>
To:     Giacinto Cifelli <gciofono@gmail.com>, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
References: <20201119115931.19050-1-gciofono@gmail.com>
 <981fe0c1-58be-21b8-0e6b-bd19d0b26ce5@gmail.com>
Message-ID: <75d9e32b-416b-d084-9718-7b766e8ce1fc@gmail.com>
Date:   Mon, 23 Nov 2020 15:33:57 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <981fe0c1-58be-21b8-0e6b-bd19d0b26ce5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+ johan

On 11/23/2020 15:20, Lars Melin wrote:
> On 11/19/2020 18:59, Giacinto Cifelli wrote:
>> There is a single option port in this modem, and it is used as debug port
>>
>> Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
>> ---
>>   drivers/usb/serial/option.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
>> index 54ca85cc920d..3ad86a6e8487 100644
>> --- a/drivers/usb/serial/option.c
>> +++ b/drivers/usb/serial/option.c
>> @@ -424,6 +424,7 @@ static void option_instat_callback(struct urb *urb);
>>   #define CINTERION_PRODUCT_AHXX_2RMNET        0x0084
>>   #define CINTERION_PRODUCT_AHXX_AUDIO        0x0085
>>   #define CINTERION_PRODUCT_CLS8            0x00b0
>> +#define CINTERION_PRODUCT_EXS82            0x006c
>>   /* Olivetti products */
>>   #define OLIVETTI_VENDOR_ID            0x0b3c
>> @@ -1908,6 +1909,8 @@ static const struct usb_device_id option_ids[] = {
>>       { USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDMNET) },
>>       { USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) }, 
>> /* HC28 enumerates with Siemens or Cinterion VID depending on FW 
>> revision */
>>       { USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
>> +    { USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, 
>> CINTERION_PRODUCT_EXS82, 0xff),
>> +      .driver_info = RSVD(1) | RSVD(2) | RSVD(3) },
>>       { USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD100),
>>         .driver_info = RSVD(4) },
>>       { USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD120),
>>
> 
> There is only one interface in this device that should be driven by 
> optiom, the first interface which likely is a diag interface.
> All other interfaces are driven by CDC drivers and they will not be 
> taken by option so no need for the blacklisting of them.
> Remove the .driver_info line from the patch.
> 
> thanks
> Lars

