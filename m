Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCFE4FE95E
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 22:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiDLUNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 16:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236914AbiDLUMv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 16:12:51 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519836E8FA
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 13:10:32 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id r11so14345928ila.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Fx5eSr213KwpvepDfvdU7WttF9JpZIPuAQa3PQibJo=;
        b=bkxSxqgmCDKI5kxj2ytfRamj2aNEb/cjtymMDZPg+x3YuFj3K7AHSx2RkKNq1jCqTB
         caDXvSWrIs93+pwKQdrHlyPfqptpcBoajk996Yz+N9RwOZtB9gyOpwtY1uJj3pDph2A4
         XGRikuDrlL0GDY03KqAvw2ERCIfQd0sXm4vTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Fx5eSr213KwpvepDfvdU7WttF9JpZIPuAQa3PQibJo=;
        b=spT2y70mZuHh7MQtiBJwue4475rN51Wq5OHNEpcC+4tzf25iIrcjNHyHi/liG34xxv
         mfwc7h0EUIni++FakAGVmDkEAwTdb7RqS86gmbxUXYeGHb/eFDdJylU7aGfQpL1zqjko
         eEd2FOU8cJhQVtRpxd1+GPU6CIA+bWohEGYilLIn+sdq/uLv4e82mj5z5UivG6NOMa2g
         meL59f+ddMgd92ua6cyoYF98afakKq1Vb65NXDkz3pccKMw/m4mo5Qav3diE12/ExYBJ
         C9Ly8dAG06iHaS9n28VLqjyIZlh9e8ZTBEkJIOE01OfaD/0MabiCMjTlO9c/ityG/XwU
         khjA==
X-Gm-Message-State: AOAM532bnnVnZRJ0Z78DlAKnE98ogFPPRACsroRLtTQII1hYIEZWg3U3
        iMCRRKy6eQX5IhHiQQBHqLdn6Q==
X-Google-Smtp-Source: ABdhPJy8JLLx0X+vL+iT3wSf2Wvie2g/laJ0h4T8IKqe6a1xRukC7YUe+cDEr6hIkrfek/45UBVepg==
X-Received: by 2002:a05:6e02:1b0f:b0:2c7:9a3f:6e84 with SMTP id i15-20020a056e021b0f00b002c79a3f6e84mr15837970ilv.32.1649794042016;
        Tue, 12 Apr 2022 13:07:22 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id o15-20020a6bcf0f000000b00649c4056879sm22168958ioa.50.2022.04.12.13.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 13:07:21 -0700 (PDT)
Subject: Re: [PATCH] usb: usbip: add missing device lock on tweak
 configuration cmd
To:     Niels Dossche <dossche.niels@gmail.com>, linux-usb@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220412165055.257113-1-dossche.niels@gmail.com>
 <4cd1d9ab-de37-f596-e0c2-f4042d22eb94@linuxfoundation.org>
 <0fccca9a-c11b-fc26-0d01-606c2fa60dc9@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <24cca71b-cce7-74ea-7a64-975baa2f1be9@linuxfoundation.org>
Date:   Tue, 12 Apr 2022 14:07:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0fccca9a-c11b-fc26-0d01-606c2fa60dc9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/12/22 2:01 PM, Niels Dossche wrote:
> On 4/12/22 21:45, Shuah Khan wrote:
>> On 4/12/22 10:50 AM, Niels Dossche wrote:
>>> The function documentation of usb_set_configuration says that its
>>> callers should hold the device lock. This lock is held for all
>>> callsites except tweak_set_configuration_cmd. The code path can be
>>> executed for example when attaching a remote USB device.
>>> The solution is to surround the call by the device lock.
>>>
>>> This bug was found using my experimental own-developed static analysis
>>> tool, which reported the missing lock on v5.17.2. I manually verified
>>> this bug report by doing code review as well. I runtime checked that
>>> the required lock is not held. I compiled and runtime tested this on
>>> x86_64 with a USB mouse. After applying this patch, my analyser no
>>> longer reports this potential bug.
>>>
>>
>> How did you run-time check that the lock isn't held? Also x86_64 with a
>> USB mouse - did you test it over loopback?
> 
> I checked the lock isn't held with lockdep_assert_not_held and also by
> checking the return value of usb_trylock_device to be equal to 1 in my testing.
> I checked my USB mouse over loopback yes, binding the mouse for remote use and
> attaching on loopback.
> 

Great. Thank you for a detailed answer.

> 
>>
>>> Fixes: 2c8c98158946 ("staging: usbip: let client choose device configuration")
>>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
>>> ---
>>>

>>
>> Looks good to me with the above questions answered.
>>
>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>
>> Greg, please pick this patch up.
>>

thanks,
-- Shuah

