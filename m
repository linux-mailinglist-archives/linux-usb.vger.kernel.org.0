Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04EC474DDC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 23:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbhLNWXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 17:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhLNWXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 17:23:00 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F83C061574
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 14:22:59 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id k21so26856208ioh.4
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 14:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nnlbqnmAl5czdkwUK0tzBn9UV5q4GA/8OJN34hPayHs=;
        b=IRYqSLO9rBYa5e0EmzJCBbBQ9lWIl5Ok+HdYA0mP/xFn/vjyDuIE4oRnuT3ZaWaDWb
         jGM1Pv64NBseAxL9ZxEyaOxzs5H6F2I2vkLaKBT1Wc0UZLHk/8xRIHhDklZvXDsihPvD
         ZTEX4qgpjF0o2loURYDuCDlAGWL4B1jXuQTag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nnlbqnmAl5czdkwUK0tzBn9UV5q4GA/8OJN34hPayHs=;
        b=jNnFeAjw7hpaWT7AmDGTyGcu3Q89WN8AwvVLSa9wFVTKpDbJWvP3xajLdLVmo9CygB
         4sWVo+r5QhF5/7Js0zDOa9u0gnAjqcMATTwjP3FVhtRPrRaLVuQ6EEtuC25HwenM6jbr
         zRdzvILlxGwzpq4fVymrVbQlryOl5DvTF9nHoLNKQMWmuDQx230Yr4IMIV2fIi+h/H6q
         c3+NlZlz4D2xGLP9AIWYtHE7ugkN5mNVJMzI+K16Xb+wNAX1XN34rI/XEvZ5VymqK7Q9
         S1ewrPKkQXeszzdB2RxhvxSvkJw8TDAGJY1Slu3S2ACkcOpg1Sv6Jm595kY1+55ZCCBG
         fLeQ==
X-Gm-Message-State: AOAM533+Hese2skrvtQKXhpMMHvPPItY40jC8K+rwI9F1BMJqqGXaABD
        BmG1GWltHZoplqeMTntZIBCC4y4VbOIk/g==
X-Google-Smtp-Source: ABdhPJzqZ07IOlXH7TN/gbPKBB69jtirzB2rPQJ0LwXxrS4QTy54hnjZXxdkagiJi6c4lW3KMUT6ng==
X-Received: by 2002:a05:6638:2bc:: with SMTP id d28mr4409189jaq.521.1639520579065;
        Tue, 14 Dec 2021 14:22:59 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b13sm40972iof.54.2021.12.14.14.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 14:22:58 -0800 (PST)
Subject: Re: [PATCH v6 0/5] tools/usbip: Patch set summary
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211130222254.GA16447@dell-precision-T3610>
 <ea85cb17-69a1-6f6b-d1ab-a75eb73991e1@linuxfoundation.org>
 <20211209211134.GA12115@dell-precision-T3610>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <475637fb-6636-aaa5-39e4-ec7eed0ee995@linuxfoundation.org>
Date:   Tue, 14 Dec 2021 15:22:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211209211134.GA12115@dell-precision-T3610>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/9/21 2:11 PM, Lars Gunnarsson wrote:
> On Mon, Dec 06, 2021 at 01:02:35PM -0700, Shuah Khan wrote:
>> On 11/30/21 3:22 PM, Lars Gunnarsson wrote:
>>> To forward a remote usb device over usbip the following steps is required:
>>>
>>> 1. Execute "usbip bind" on remote end.
>>> 2. Execute "usbip attach" on local end.
>>>
>>> These steps must be perfomed in above order and after usb device is plugged in.
>>> If the usb device is unplugged on the remote end the steps above needs to be
>>> performed again to establish the connection. This patch set implements a feature
>>> to persistently forward devices on a given bus. When using flag "-p|--persistent"
>>> on remot end, the USB device becomes exported when plugged in. When using flag
>>> "-p|--persistent" on local end, the USB device becomes imported when available
>>> on remote end. Thus it is only required to run the usbip command once on each
>>> end, in any order, to persistently forward usb devices on a given bus.
>>>
>>> This is sent in five separate patches:
>>>     tools/usbip: update protocol documentation
>>>     tools/usbip: update manual pages
>>>     tools/usbip: add usb event monitor into libusbip
>>>     tools/usbip: export USB devices on a given bus persistently
>>>     tools/usbip: import USB devices on a given bus persistently
>>>
>>
>> When -p is used, the command stays in foreground. This is a very
>> different use model compared to current model. In addition, once
>> persistent flag is set on a bus, all devices even the ones that
>> are inserted in the future get exported. What happens if one of
>> the devices shouldn't be exported?
> 
> Yes it's conceptually more like exporting/importing the physical usb port,
> rather than exporting/importing a device plugged into the usb port. Using flag
> "-p" on both ends will behave like a "virtual" usb hub, a device plugged in on
> the server (on a chosen bus) will automatically be available on the client.
> Using flag "-p" has no dependency on the other end though. Using "-p" on one end
> doesn't enforce usage on the other end. It is only for exporting and importing
> devices automatically when they become available.
> 
> There might be better choices than naming flag to "persistent" for easily
> communicate this concept. Would "port" be more intuitive?
> "usbip attach --port 3-3.1" and "usbip bind --port 3-3.1"
> 

Terminology isn't what I am concerned about. My concern is the idea of
automatically making devices available for export at bus level.

>>
>> There are several conditions to be thought through:
>>
>> - What happens if if the command that is running on the foreground
>>    is killed on either end?
> 
> If "attach" cmd gets killed (client side) it will stop the foreground
> monitoring. The device will still remain imported if user exit at imported state.
> The user then needs to manually unimport the device with "detach".
> 
> If "bind" cmd gets killed (server side) it will stop the foreground monitoring.
> The device will still remain exported if exit at exported state. The user then
> needs to manually unexport the device with "unbind".
> 

My concern is the persistence nature of these exports/imports through
reboots. I have to give it some though on how this can be implemented
addressing my concerns.

>> - What happens when one or more devices are detached?
> 
> If user exit from "attach" cmd running in foreground, followed by detaching the
> device manually, it will work as previously. The device will become available on
> the server for importing again.
> 
> If user running "attach" cmd in foreground, while executing "detach" manually
> from another terminal or similar, the foreground "attach" command will detect
> the disconnection and re-establish the import. I don't see any use case for
> this, it's just for explaining.
> 
> If user running "attach" cmd in foreground, while the remote device becomes
> unexported (or disconnected) it will start polling the usbipd.
> When a device becomes exported on the chosen bus it gets imported immediately.
> 
>> - What happens when one or more devices are unbound from
>>    the server?
>>
>> Let's walk through these scenarios.
> 
> If user exit from "bind" cmd running in foreground, followed by unbind the
> device manually it will work as previous. The usb device will become available
> on the server again.
> 
> If user running "bind" cmd in foreground, while executing "unbind" from another
> terminal or similar, the foreground "bind" command will detect the unexport
> and re-establish the export. I don't see any use case for this, it's just for
> explaining.
> 
> If user running "bind" cmd in foreground, while the device becomes unexported
> or disconnected it will restart monitoring the busid. When a device becomes
> plugged in on the chosen usb port it gets exported immediately.
> 
> One option to consider is to unexport & unimport the device at exit, but this
> comes with the cost of creating a source code dependency between
> bind --> unbind and attach --> detach.
> 

How does this look like in code?

thanks,
-- Shuah
