Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EC532FC77
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 19:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhCFSSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 13:18:00 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60963 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhCFSRm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 13:17:42 -0500
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIbUi-0005ga-Mt
        for linux-usb@vger.kernel.org; Sat, 06 Mar 2021 18:17:40 +0000
Received: by mail-ej1-f70.google.com with SMTP id si4so2492329ejb.23
        for <linux-usb@vger.kernel.org>; Sat, 06 Mar 2021 10:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g6bMYZr4IYJb49CfbN85Rd9NqLc1iESc8dgtSRtoAGo=;
        b=aFv8DmgYniFDqpK1FXWF354azj7vv13z9o+BJYoMxtdYHAl8cnpm4cDiCGDLsritHX
         nJHYae/w8KWVCrCguUM+sbgWlKVUbXZ9W/eOgW5EfbXHWbVfjfyexb4Yj1BKEaczeV/u
         PvPstUeQs9jG5RA12f4QNrV2+8D3M9889BNL12V9TjFWJ9FcTN0aEe9y+PegUw6Rk7JJ
         cHwiq5SU74KW0JDqY7mVeBxhkhk/eVDGn1XtPxdgAMxnbVIlk5c/+22wJtPC7CL1ArL4
         xK27fl28E5aXTWVe4/6MkVWzcKmoz0nU46HPNnRe2vv4d0CHm4a5SSyShbc8mRkdCtA5
         RjfA==
X-Gm-Message-State: AOAM532kDiljT9bV5PxeqiBFqV85AjBpo7Z82aC8ZjQSd/YC/reVjYGz
        H29AVPxbPNHdLTsvDA/GpXKsVY+gXo2Xfi2C+GDi5ue2RuNMIDI7jxg3UXoKU5gq1vs5EBy9E19
        lMKgJ73yj7VHTb2cKIxeJZKcF0WhqlR1qxRffWw==
X-Received: by 2002:a17:906:ae96:: with SMTP id md22mr7580992ejb.409.1615054660383;
        Sat, 06 Mar 2021 10:17:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzyGs+Nxo2sFfxp1gHm5M91NoaPL/OtuRamdi2dx6jcRPRH0A02SzA8eLG1btGURV9Y6QD4A==
X-Received: by 2002:a17:906:ae96:: with SMTP id md22mr7580976ejb.409.1615054660202;
        Sat, 06 Mar 2021 10:17:40 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id m7sm3696800ejk.52.2021.03.06.10.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 10:17:39 -0800 (PST)
Subject: Re: [PATCH 2/2 v2] usb: gadget: s3c: Fix the error handling path in
 's3c2410_udc_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        gustavoars@kernel.org, arnd@arndb.de, ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210306142145.3490-1-christophe.jaillet@wanadoo.fr>
 <64c3ca58-639f-95af-35e1-7d5ba240a7c9@canonical.com>
 <1fb088c0-c94c-908e-e607-796f834f45f3@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6b73a1cd-b4b7-baec-1062-b9f1a1634cbd@canonical.com>
Date:   Sat, 6 Mar 2021 19:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1fb088c0-c94c-908e-e607-796f834f45f3@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/03/2021 18:22, Christophe JAILLET wrote:
> Le 06/03/2021 à 17:16, Krzysztof Kozlowski a écrit :
>> On 06/03/2021 15:21, Christophe JAILLET wrote:
>>> Some 'clk_prepare_enable()' and 'clk_get()' must be undone in the error
>>> handling path of the probe function, as already done in the remove
>>> function.
>>>
>>> Fixes: 3fc154b6b813 ("USB Gadget driver for Samsung s3c2410 ARM SoC")
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> v2: Fix a stupid error in the hash in Fixes:
>>> ---
>>>   drivers/usb/gadget/udc/s3c2410_udc.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>
>> Do not ignore received tags but add them before sending a new version of patch.
>> https://lore.kernel.org/linux-samsung-soc/36ef897b-aedc-fcc3-89c8-c602d9733a9b@canonical.com/T/#t
>>
>> Also somehow your 2nd patch is not in-reply to first one. Don't change
>> the settings of sending patches. git format-patch and
>> git send-email default settings are correct. Look here:
>> https://lore.kernel.org/linux-samsung-soc/
>> Only your patches are not threaded.
>>
>> Best regards,
>> Krzysztof
>>
> Hi,
> 
> sorry for missing the typo in the first patch.
> 
> For your other comments above, however, I use standard settings only.
> My patches are generated by commands like:
>     git format-patch -2
> 
> I use cover letter only if it looks useful. In such a case, I use:
>     git format-patch --thread --cover-letter -2
> 
> I've never seen that threading series was the rule and/or that cover 
> letters were a must have. If I'm wrong, sorry, I was not aware of that.

The cover letter is not needed. The threading was missing which is a
default so you had to configure it to that.


Best regards,
Krzysztof
