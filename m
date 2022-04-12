Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74ABF4FE94F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 22:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbiDLUIZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 16:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbiDLUHp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 16:07:45 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED9F60E0
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 13:01:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id k23so39448407ejd.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 13:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dzAtYmmpNLd7sqaUOk8FqxBqdyPrtSZmspQRHKyTfwY=;
        b=QSCwXXaUViMYRzkhS2zhtuojrB5L2+5fQ+w51cqx13N/YHJawodwu1fm5sv8SPd7Yl
         1S7j9nQ+GAZARRFIjmtsTPOPK1HCDsmYGbKYnHfHtvVxuW0g0EzEDEFFg8kfUOKon25B
         BU01BaUSGKjWLRSRfNF38p/ZX0WDY+e1bj3rhs8M09UC6ri81UI3YqvBGDJFNXRBSF4/
         0ud62vFj6c8Da6UQhBfeolwOgu2BP45OJhiooL5ArQE1pGWhvWK/RGhWt4svD8ZSefzx
         0+Q2CiPQK8VvYjkNWK+X0R+L1pNB8NyzGgB8n1H7ovEanvVNauqc5z1t5HJvRc81DCvJ
         moWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dzAtYmmpNLd7sqaUOk8FqxBqdyPrtSZmspQRHKyTfwY=;
        b=mAK4C4P5ZvTy65ert20rAS6jRUnOoL8GiVWng3M+X60c1LRhWHmm/PaCzQUYK8VkUK
         pwinlB7J7E2zXYNyuV5vO1aNikil/l4ezzKCPAAwz7FVRXBr47/FB6CU4WX/4DQ8B+Na
         dJuzkFK/lLNBboiEQq9mmTv1LiuX+ZjcJqLH6GLwHzf6rqMG90zAcOl71Epz53AWPtFW
         qBz6TuBcX/5mmG+Dexsit6N7xXNsVE9oPCXqhxyQA2XbJmaKgwZvCTg3+n+2DqsHmavi
         YijdYrZh9DX+GmnU6uQq9nsIDHBmNAZs/cp47MSK/85Tfzi/+1KTMhQ6jZbgHDA/7JR4
         n4ew==
X-Gm-Message-State: AOAM532fIzfX4AcivQs0VX6YCfZjXz3pimlzI1v74g0IXX07f79c9Hw5
        GOL7v9Bf1XtDwxgZFQfVQ2zkeWwmsks=
X-Google-Smtp-Source: ABdhPJx/mMTloCm4HbrcHUb0L1jJemg++NqW+29AXyw9f2+RG8yALXl+K3C76Pw/1B4Y7ncnGmFeNA==
X-Received: by 2002:a17:907:7e95:b0:6e8:968c:8ecd with SMTP id qb21-20020a1709077e9500b006e8968c8ecdmr9897410ejc.187.1649793701381;
        Tue, 12 Apr 2022 13:01:41 -0700 (PDT)
Received: from [192.168.0.59] (178-117-137-225.access.telenet.be. [178.117.137.225])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm204749edl.22.2022.04.12.13.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 13:01:41 -0700 (PDT)
Message-ID: <0fccca9a-c11b-fc26-0d01-606c2fa60dc9@gmail.com>
Date:   Tue, 12 Apr 2022 22:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] usb: usbip: add missing device lock on tweak
 configuration cmd
Content-Language: en-US
To:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220412165055.257113-1-dossche.niels@gmail.com>
 <4cd1d9ab-de37-f596-e0c2-f4042d22eb94@linuxfoundation.org>
From:   Niels Dossche <dossche.niels@gmail.com>
In-Reply-To: <4cd1d9ab-de37-f596-e0c2-f4042d22eb94@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/12/22 21:45, Shuah Khan wrote:
> On 4/12/22 10:50 AM, Niels Dossche wrote:
>> The function documentation of usb_set_configuration says that its
>> callers should hold the device lock. This lock is held for all
>> callsites except tweak_set_configuration_cmd. The code path can be
>> executed for example when attaching a remote USB device.
>> The solution is to surround the call by the device lock.
>>
>> This bug was found using my experimental own-developed static analysis
>> tool, which reported the missing lock on v5.17.2. I manually verified
>> this bug report by doing code review as well. I runtime checked that
>> the required lock is not held. I compiled and runtime tested this on
>> x86_64 with a USB mouse. After applying this patch, my analyser no
>> longer reports this potential bug.
>>
> 
> How did you run-time check that the lock isn't held? Also x86_64 with a
> USB mouse - did you test it over loopback?

I checked the lock isn't held with lockdep_assert_not_held and also by
checking the return value of usb_trylock_device to be equal to 1 in my testing.
I checked my USB mouse over loopback yes, binding the mouse for remote use and
attaching on loopback.

Thank you
Niels

> 
>> Fixes: 2c8c98158946 ("staging: usbip: let client choose device configuration")
>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
>> ---
>>
>> I'm developing this tool as part of my master's dissertation in order to
>> obtain my master's degree. If you'd like more information about the
>> details of the tool, please let me know.
>>
>>   drivers/usb/usbip/stub_rx.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
>> index 325c22008e53..5dd41e8215e0 100644
>> --- a/drivers/usb/usbip/stub_rx.c
>> +++ b/drivers/usb/usbip/stub_rx.c
>> @@ -138,7 +138,9 @@ static int tweak_set_configuration_cmd(struct urb *urb)
>>       req = (struct usb_ctrlrequest *) urb->setup_packet;
>>       config = le16_to_cpu(req->wValue);
>>   +    usb_lock_device(sdev->udev);
>>       err = usb_set_configuration(sdev->udev, config);
>> +    usb_unlock_device(sdev->udev);
>>       if (err && err != -ENODEV)
>>           dev_err(&sdev->udev->dev, "can't set config #%d, error %d\n",
>>               config, err);
>>
> 
> Looks good to me with the above questions answered.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Greg, please pick this patch up.
> 
> thanks,
> -- Shuah

