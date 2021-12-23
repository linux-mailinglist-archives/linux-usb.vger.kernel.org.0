Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB19147E843
	for <lists+linux-usb@lfdr.de>; Thu, 23 Dec 2021 20:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240458AbhLWTWo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Dec 2021 14:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbhLWTWn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Dec 2021 14:22:43 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A730C061401
        for <linux-usb@vger.kernel.org>; Thu, 23 Dec 2021 11:22:43 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id y16so4981900ilq.8
        for <linux-usb@vger.kernel.org>; Thu, 23 Dec 2021 11:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4iH/ml7EmO+HH7C6oP49UaEGvfCw0PP8EVJ/mtNvgMw=;
        b=ZrqrhZr1c70B7cBJKX3YWEIOIOtx5RGcURsXW7kA0CW4Ax2gDPa6E1BmOwk/kqnFD6
         uvo52kUOVYh+ATS1AGJ8TbGDqgYVHdULAeswa8wS3DQ7WelRCy+IGKK+PK2OD6Y/I9wd
         T5N7/zFmFBVMug2hKMWCf+BYs3Q3C61/auh2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4iH/ml7EmO+HH7C6oP49UaEGvfCw0PP8EVJ/mtNvgMw=;
        b=lYRMf4pMYDjdVZvU8DcxvV6axWFP9AS1CGgrjTRH7dCQjpeZBwp/KgHQv7ltkaLAgv
         722i/8/JnLtSrTJhHcQ5PeiwqVCwJaT/TKpGYI9G1h0qNkY5/cjNf5dvn4x8lyjdiN3K
         Qui/hBhpIMwzIWGNVY++CbcI5P604RShb1ntrE842La1iSnBHPCXEG4D8PKEBF9PERwc
         Oj/lLHPJHt7SUZiGJNDnvqrMUCgekvnw3LHZKaYsb4OIwy6AryHIUQvsRa3nvLZwuYAG
         ORjtxRreoejRVKSo5xP2oLIQ4L+pLEf9HJzWzDyAdU8YtqJH03W5SNR8ItfExmWYOcKP
         nKeA==
X-Gm-Message-State: AOAM530Kv0laK+DiirvMDfE7jt+Z2STSnmLk3F2JuZMdY0puPacjM+IX
        7tf61uFU3kgl5MJwU8B9sSokgpyNUtgXQQ==
X-Google-Smtp-Source: ABdhPJxQrvIlHlezSzpUGp7EVnwdGG7HVmuK5nk1Al+Iw0e+UOiLk47CkCr+1PFbRPJOKJlOaM8GZA==
X-Received: by 2002:a05:6e02:2145:: with SMTP id d5mr1793698ilv.309.1640287362311;
        Thu, 23 Dec 2021 11:22:42 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o22sm4779596iow.52.2021.12.23.11.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 11:22:42 -0800 (PST)
Subject: Re: [PATCH v6 0/5] tools/usbip: Patch set summary
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211130222254.GA16447@dell-precision-T3610>
 <ea85cb17-69a1-6f6b-d1ab-a75eb73991e1@linuxfoundation.org>
 <20211209211134.GA12115@dell-precision-T3610>
 <475637fb-6636-aaa5-39e4-ec7eed0ee995@linuxfoundation.org>
 <20211216210116.GA5743@dell-precision-T3610>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <62c768a8-c947-d8ed-4857-d6db11e4b460@linuxfoundation.org>
Date:   Thu, 23 Dec 2021 12:22:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211216210116.GA5743@dell-precision-T3610>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/16/21 2:01 PM, Lars Gunnarsson wrote:
> On Tue, Dec 14, 2021 at 03:22:57PM -0700, Shuah Khan wrote:
>> On 12/9/21 2:11 PM, Lars Gunnarsson wrote:
>>> On Mon, Dec 06, 2021 at 01:02:35PM -0700, Shuah Khan wrote:
>>>> On 11/30/21 3:22 PM, Lars Gunnarsson wrote:
>>>>> To forward a remote usb device over usbip the following steps is required:
>>>>>
>>>>> 1. Execute "usbip bind" on remote end.
>>>>> 2. Execute "usbip attach" on local end.
>>>>>
>>>>> These steps must be perfomed in above order and after usb device is plugged in.
>>>>> If the usb device is unplugged on the remote end the steps above needs to be
>>>>> performed again to establish the connection. This patch set implements a feature
>>>>> to persistently forward devices on a given bus. When using flag "-p|--persistent"
>>>>> on remot end, the USB device becomes exported when plugged in. When using flag
>>>>> "-p|--persistent" on local end, the USB device becomes imported when available
>>>>> on remote end. Thus it is only required to run the usbip command once on each
>>>>> end, in any order, to persistently forward usb devices on a given bus.
>>>>>
>>>>> This is sent in five separate patches:
>>>>>      tools/usbip: update protocol documentation
>>>>>      tools/usbip: update manual pages
>>>>>      tools/usbip: add usb event monitor into libusbip
>>>>>      tools/usbip: export USB devices on a given bus persistently
>>>>>      tools/usbip: import USB devices on a given bus persistently
>>>>>
>>>>
>>>> When -p is used, the command stays in foreground. This is a very
>>>> different use model compared to current model. In addition, once
>>>> persistent flag is set on a bus, all devices even the ones that
>>>> are inserted in the future get exported. What happens if one of
>>>> the devices shouldn't be exported?
>>>
>>> Yes it's conceptually more like exporting/importing the physical usb port,
>>> rather than exporting/importing a device plugged into the usb port. Using flag
>>> "-p" on both ends will behave like a "virtual" usb hub, a device plugged in on
>>> the server (on a chosen bus) will automatically be available on the client.
>>> Using flag "-p" has no dependency on the other end though. Using "-p" on one end
>>> doesn't enforce usage on the other end. It is only for exporting and importing
>>> devices automatically when they become available.
>>>
>>> There might be better choices than naming flag to "persistent" for easily
>>> communicate this concept. Would "port" be more intuitive?
>>> "usbip attach --port 3-3.1" and "usbip bind --port 3-3.1"
>>>
>>
>> Terminology isn't what I am concerned about. My concern is the idea of
>> automatically making devices available for export at bus level.
>>
>>>>
>>>> There are several conditions to be thought through:
>>>>
>>>> - What happens if if the command that is running on the foreground
>>>>     is killed on either end?
>>>
>>> If "attach" cmd gets killed (client side) it will stop the foreground
>>> monitoring. The device will still remain imported if user exit at imported state.
>>> The user then needs to manually unimport the device with "detach".
>>>
>>> If "bind" cmd gets killed (server side) it will stop the foreground monitoring.
>>> The device will still remain exported if exit at exported state. The user then
>>> needs to manually unexport the device with "unbind".
>>>
>>
>> My concern is the persistence nature of these exports/imports through
>> reboots. I have to give it some though on how this can be implemented
>> addressing my concerns.
> 
> Can you elaborate on your thoughts about "the persistence nature of these exports/imports through reboots"?
> reboot as in exit from foreground and run the command again?
> 

Sorry for the delay in responding.

I have been thinking about this more. I am not convinced that
supporting these use-cases requires usbip changes.

Can we not accomplish the same via scripts/crontab? Monitor if
a bound device is removed and rebind. Do the same on the client
side?

Have you explored if this can be done with existing tools and
a shell script and make use of crontab?

thanks,
-- Shuah
