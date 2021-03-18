Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C753406A4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 14:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhCRNOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 09:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhCRNNk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 09:13:40 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B3FC06174A
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 06:13:39 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id l79so1140946oib.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MtD/AZ417xFFop8hkkvXlRJROHMLDlF2TOAnyqCLxvE=;
        b=cpzCnRXL42Tg64mHIpcJS+X4yUwzP2ynkuFgfGaTvUUatmPkaf006LSIrsX9yid4Ii
         DJf1a55kH3KtfOqmImY71kEVo6Hy926yOgaIFPB+xedoQv+WClzobPBi6PXG+fkJ5zws
         DrkZAJ3DSHuCDDei0q0touTTv8+B1BePrIZCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MtD/AZ417xFFop8hkkvXlRJROHMLDlF2TOAnyqCLxvE=;
        b=BO7mtzAAn6czxv6Ax9+sfeKNgTjsgVe4LWvUEsAa3MrAcAbQCwa/6UngfStIhP/0+9
         UpMg5Q0zzM/eQmHIHBm+6Gz0jUsQKTsB0IJ8horIxmT/p9eWQGd70h/EsMG0Ss6KRP1B
         66aAO4NEY+I6QkUye3+PRqcuWr/Z/p1EkenG8FLvoUPYBKNmdspSpEQz5Vb8aJb1Jy2D
         368I2TPJNkMOrUqeS75quYcEgjBGSdCwk8U1mPtSSt4Wl24FeBHQUvn/eemAmXOj7yjd
         gUcoEPMnTewAEGwT+n+RZSL7+Mj1vcS2LXN6zmi38K5bOaKIsFeQ6JAtNMCUdpMgacnU
         dy/w==
X-Gm-Message-State: AOAM531b9ylvIAUFO5x3PmWloYXxxsteDHO0IR4clF0VWJaMAFSDSuqn
        2TKetWKmZ5YqpSGi/CT08Slk5g==
X-Google-Smtp-Source: ABdhPJyaPLVkPsxRtFLYcX+SV53XEIl9x2nEQVW4K1MdZBGw54zYhyjJXRyo3iJHlKw70yVWx2ZVjQ==
X-Received: by 2002:aca:3456:: with SMTP id b83mr3069837oia.51.1616073219303;
        Thu, 18 Mar 2021 06:13:39 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j10sm553822oos.27.2021.03.18.06.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 06:13:38 -0700 (PDT)
Subject: Re: [PATCH 0/6] usbip fixes to crashes found by syzbot
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, shuah@kernel.org
Cc:     valentina.manea.m@gmail.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1615171203.git.skhan@linuxfoundation.org>
 <YEkQ4qS7tkwmjzDn@kroah.com>
 <5baf6b94-72c4-6e69-65a5-35c5cfb8ca0e@i-love.sakura.ne.jp>
 <YEoTw7CoK7Ob0YR+@kroah.com>
 <8dc1e893-4338-90ff-ea61-de727cad1d11@i-love.sakura.ne.jp>
 <afd1341b-2ed1-f781-d6c8-6064fea3aeb8@i-love.sakura.ne.jp>
 <192bdb07-da84-ce96-2e25-7c0df749940a@i-love.sakura.ne.jp>
 <9e089560-388a-a82d-4841-8092578b9d5d@i-love.sakura.ne.jp>
 <465479ca-544e-3703-cf4e-30f5be04fa11@i-love.sakura.ne.jp>
 <fbf64c33-87c3-137c-4faf-66de651243fc@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <41d21338-19f4-ac4f-2aef-e26180f4c573@linuxfoundation.org>
Date:   Thu, 18 Mar 2021 07:13:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fbf64c33-87c3-137c-4faf-66de651243fc@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/17/21 9:06 AM, Shuah Khan wrote:
> On 3/17/21 12:21 AM, Tetsuo Handa wrote:
>> Shuah, this driver is getting more and more cryptic and buggy.
>> Please explain the strategy for serialization before you write patches.
>>
>>> - Fix attach_store() to check usbip_event_happened() before
>>>    waking up threads.
>>
>> No, this helps nothing.
>>
>>> diff --git a/drivers/usb/usbip/vhci_sysfs.c 
>>> b/drivers/usb/usbip/vhci_sysfs.c
>>> index c4b4256e5dad3..f0a770adebd97 100644
>>> --- a/drivers/usb/usbip/vhci_sysfs.c
>>> +++ b/drivers/usb/usbip/vhci_sysfs.c
>>> @@ -418,6 +418,15 @@ static ssize_t attach_store(struct device *dev, 
>>> struct device_attribute *attr,
>>>       spin_unlock_irqrestore(&vhci->lock, flags);
>>>       /* end the lock */
>>> +    if (usbip_event_happened(&vdev->ud)) {
>>> +        /*
>>> +         * something went wrong - event handler shutting
>>> +         * the connection and doing reset - bail out
>>> +         */
>>> +        dev_err(dev, "Event happended - handler is active\n");
>>> +        return -EAGAIN;
>>> +    }
>>> +
>>
>> detach_store() can queue shutdown event as soon as reaching "/* end 
>> the lock */" line
>> but attach_store() might be preempted immediately after verifying that
>> usbip_event_happened() was false (i.e. at this location) in order to 
>> wait for
>> shutdown event posted by detach_store() to be processed.
>>
> 

Please don't review code that isn't sent upstream. This repo you are
looking at is a private branch created just to verify fixes on syzbot.

I understand the race window you are talking about. I have my way of
working to resolve it.

thanks,
-- Shuah




