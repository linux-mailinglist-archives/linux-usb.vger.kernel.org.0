Return-Path: <linux-usb+bounces-25382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C3AF06BB
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 00:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F7773ABBEF
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 22:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0FC302048;
	Tue,  1 Jul 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZrkImfTs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD627EC7C
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 22:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751410590; cv=none; b=uM7b4wcVT0uMvLOhBYPf334wFUj0Cu5uWPL6g6eN2ZBMqsIkI/t8WgQOcFTQSyXqsxUcQ0UidA1cbvPg10eSkJ+U0ymBambBqvW/DJwvGs51JYP/QyqPUxTRibxsuLSgLCHMLcFnUzYcpyOA45n9/AnPOAKDJbxcnsyhxs7OkKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751410590; c=relaxed/simple;
	bh=BgZU7wVmbYt0bjtzW1FLF5K27xcxn8bgt1AOUJ7yHKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQ6nd29o5/nXGEZQugJL9m/ZIRbRl/vAmjACaZqhYLyhJBfpapRZIducB69dluzsn2yio1tYLGwxWxnf9s3Ye+NZaO58A0AtumAdUp7v49QvKDPB8eHDLlIgTfo7eNt3DassIXu4o0rTl15G336Ptj6o22LD7TyLo0anPpqxFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZrkImfTs; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86d0c598433so113734139f.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751410588; x=1752015388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+724LxPcgQ3n//latAGxva7GWNUREDCq52D1yJkNOU=;
        b=ZrkImfTsAVagpCjnJCYzWro6Aw710ZNJxPkW4x2M8L4NWywTWFu2oRxsWTb6/N5Hgu
         +YtDb6IFVLAECWcXAka2fseYkff5UNKRotnnQgdvXVR0YOOftwZRE+ivUXGooQnMymK9
         UU0RsIt+KtUeH8BpaFJ0KuzIo42OOSEPv85vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751410588; x=1752015388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+724LxPcgQ3n//latAGxva7GWNUREDCq52D1yJkNOU=;
        b=HZs+cuuq2V05vs4kYCeeNhpA9E6MkoDRbxR0N7tFMf2QecGhlQvui5GdWbXIJQu6Fn
         kMYk5l2j9NMGq7PMZg2PzGUu+FTj3WcV2WI0UOQ3U8nwAtGX49qC8DYxY4Q022ANli40
         UZm8foY6gH5gnIObSHZ9WPqwIAk81Sbl0R9Wx4IO8Z229yMyvLuV/7AQkDQQaUgmFEwx
         VPNig9dGWJ2gfGK6KkhGI5voI55gJtZwzkFEY2MEHbZa7qFJAm2siNQvDZPMovFTC3OV
         GpxLreEXWhOn5yJtMimRLEw6xVCJIXIHmmoFj+41mjGo1dQr7qzLrOXo72UXrnfHlMsS
         3nIg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6oip0P4SsFNbXbZbonIjUaEijs1Rtf+V96rk9gucmNxgLPaSHWVfFkqOOvZW5MdZ5S8fkueFAHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfhVqG68nVQJ3gfdYVBlGHQZo0ie3y7SBjs5bgoMZuxu5j+3bS
	xobEIwjVvL2IkU9l1LxTF9m2i4HUuE+qvYulXGYjNJXTrK6NYkaWHiten8vG6NcpM5M=
X-Gm-Gg: ASbGnctsLoRi6CHib1aqxIgahQ2AJLHasKecDuO1UTwVmr/RaUC+EirgcqONpusVVxE
	VhJjQIt7d0upy8d3SprYnNY3kqM/Qiqgy+GsdizKGysbwKNDv/pmSKkPR2D9yy4w1j/IZhAgUg9
	d+dhq3o4oUVj423O6xLKqlmqEAfBUs0kLUQjXn5fF3qycCFnMV8HmWHvqAK9AJltbZy0IdbJQxB
	gj4EgT75SSST472Cwq3GhOGP9lktRwfz4ZwQj5IssY/c0nECe9/X0BL40TktnD5Q+f/l28oxNST
	NVFtW3IfYvTOVU3I4/gn3OJLP31nKy+eq/vqh104I7yaBLPWBlPj06OAR1be04+eK2zh8sLx6g=
	=
X-Google-Smtp-Source: AGHT+IFj/92g3whVxpQw6epJ8erxr41B6yeOCvcx7GO6lf54G69SSlkGJYeTUltMLbQjoibNN4lnuQ==
X-Received: by 2002:a05:6e02:3005:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3e054964204mr8903415ab.9.1751410587674;
        Tue, 01 Jul 2025 15:56:27 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a537b3sm2634438173.69.2025.07.01.15.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 15:56:27 -0700 (PDT)
Message-ID: <fac026d8-12c8-4c1f-96a7-264ced8391f1@linuxfoundation.org>
Date: Tue, 1 Jul 2025 16:56:26 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: convert to use faux_device
To: Zongmin Zhou <min_halo@163.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 zhouzongmin@kylinos.cn, Shuah Khan <skhan@linuxfoundation.org>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
 <20250604065410.76069-1-min_halo@163.com>
 <2025061926-paycheck-footnote-a2b8@gregkh>
 <c7a2cc26-794e-49e1-bf8c-35617bb8060f@163.com>
 <2025062010-hardiness-flashily-cb0f@gregkh>
 <9d95bb75-586c-48dc-9e34-432cc13fd99f@163.com>
 <2025062004-navy-emboss-4743@gregkh>
 <2e0bbc5a-e74a-4fb5-884c-686dbaf99caf@linuxfoundation.org>
 <48ab511e-2847-4daa-98de-a234b8584b78@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <48ab511e-2847-4daa-98de-a234b8584b78@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 21:21, Zongmin Zhou wrote:
> 
> On 2025/6/21 01:26, Shuah Khan wrote:
>> On 6/20/25 03:27, Greg KH wrote:
>>> On Fri, Jun 20, 2025 at 05:19:33PM +0800, Zongmin Zhou wrote:
>>>>
>>>> On 2025/6/20 12:29, Greg KH wrote:
>>>>> On Fri, Jun 20, 2025 at 10:16:16AM +0800, Zongmin Zhou wrote:
>>>>>> On 2025/6/19 19:01, Greg KH wrote:
>>>>>>> On Wed, Jun 04, 2025 at 02:54:10PM +0800, Zongmin Zhou wrote:
>>>>>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>>>>
>>>>>>>> The vhci driver does not need to create a platform device,
>>>>>>>> it only did so because it was simple to do that in order to
>>>>>>>> get a place in sysfs to hang some device-specific attributes.
>>>>>>>> Now the faux device interface is more appropriate,change it
>>>>>>>> over to use the faux bus instead.
>>>>>>>>
>>>>>>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>>>> ---
>>>>>>>> Changes in v2:
>>>>>>>> - don't change faux create api,just call probe on vhci_hcd_init.
>>>>>>>>
>>>>>>>>     drivers/usb/usbip/vhci.h             |  4 +-
>>>>>>>>     drivers/usb/usbip/vhci_hcd.c         | 86 +++++++++++-----------------
>>>>>>>>     drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++-----------
>>>>>>>>     tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
>>>>>>>>     4 files changed, 72 insertions(+), 88 deletions(-)
>>>>>>> I get the following build errors from this patch:
>>>>>>>
>>>>>>> drivers/usb/usbip/vhci_hcd.c:1462:12: error: ‘vhci_hcd_resume’ defined but not used [-Werror=unused-function]
>>>>>>>     1462 | static int vhci_hcd_resume(struct faux_device *fdev)
>>>>>>>          |            ^~~~~~~~~~~~~~~
>>>>>>> drivers/usb/usbip/vhci_hcd.c:1418:12: error: ‘vhci_hcd_suspend’ defined but not used [-Werror=unused-function]
>>>>>>>     1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
>>>>>>>          |            ^~~~~~~~~~~~~~~~
>>>>>>> cc1: all warnings being treated as errors
>>>>>>>
>>>>>>> Are you sure you tested this?
>>>>>> I apologize for not enabling -Werror, which resulted in missing this error
>>>>>> warning.
>>>>>> I have tested usbip feature use the new patch,but not test system
>>>>>> suspend/resume.
>>>>>> The faux bus type don't add pm function,and vhci-hcd driver can't register
>>>>>> it.
>>>>>> Maybe have to add suspend/resume for it.like below:
>>>>>> static const struct bus_type faux_bus_type = {
>>>>>>       .name        = "faux",
>>>>>>       .match        = faux_match,
>>>>>>       .probe        = faux_probe,
>>>>>>       .remove        = faux_remove,
>>>>>>       .resume     = faux_resume,
>>>>>>       .suspend    = faux_suspend,
>>>>>> };
>>>>>>
>>>>>> Is that right?
>>>>>> Your expertise would be greatly valued.
>>>>> As this is not real hardware, why do you need the suspend/resume
>>>>> callbacks at all?  What is happening here that requires them?
>>>> @greg,
>>>> The vhci_hcd_suspend/vhci_hcd_resume interfaces are not designed for this
>>>> faux device, but rather to
>>>> manipulate the HCD_FLAG_HW_ACCESSIBLE bit in the hcd flags associated with
>>>> the faux device.
>>>> For example:
>>>> During system standby: clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
>>>> During system wakeup: set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
>>>>
>>>> Previously, these two functions were registered through platform_driver,
>>>> but faux bus does not have the relevant interface, so they were not called,
>>>> resulting in this compilation warning error.
>>>>
>>>> This raises the question: Should the faux bus implement PM-related
>>>> interface?
>>>> I'm uncertain whether these functions are essential for the vhci-hcd driver
>>>> or if they can be safely removed.
>>>>
>>>> However, during system standby/wakeup tests with remote USB devices bound to
>>>> the vhci-hcd driver,
>>>> I observed consistent failure scenarios across both the original platform
>>>> bus and faux bus patch implementations.
>>
>> suspend and resume hooks have been in the code from beginning
>> in the CONFIG_PM path. The original authors are skeptical about
>> what should happen during suspend"
>>
>> /* what should happen for USB/IP under suspend/resume? */
>> suspend hook checks for active connections and sends EBBUSY
>> back to pm core.
>>
>> Active connection means any of the ports are in USB_PORT_STAT_CONNECTION
>> state. So as long as there are active connections between vhci client
>> and the host, suspend won't work. So we really don't know what happens
>> to the active connections if there are no suspend/resume hooks.
>>
>> If there are no active connections, then it will clear the HCD_FLAG_HW_ACCESSIBLE
>> bit and returns to pm core to continue with suspend.
>>
>> resume sets the HCD_FLAG_HW_ACCESSIBLE flag to indicate hardware is accessible
>> and initiates port status poll.
>>
>> - suspend hook prevents suspend
>>
>> With faux device since there is no suspend and resume hook, I would expect
>> these hooks are not a factor in suspend and resume.
>>
>> vhci_hcd is a special case virtual driver as it is a proxy for controlling
>> hardware on the host.
>>
>> Zongmin,
>>
>> Do suspend/resume work when vhci_hcd is not loaded?
>> What happens when when system suspends and resumes with faux device?
>> Can you send me dmesg logs and pm logs?
>>
> Hi Greg,shuah
> 
> Yes, system with vhci_hcd unload or just load vhci_hcd driver
> without usbip devices bound to vhci_hcd,system suspend/resume worked well.
> Some logs for you.

Sorry for the delay. I was at a conference last week.
Thank you for sending these logs.

> 1.system with vhci_hcd driver load,but don't bound any usbip devices to vhci_hcd,suspend/resume worked well.
> see dmesg-faux bus-load.log


> 
> 2.usbip device bound to vhci_hcd,and do system suspend action,suspend/resume worked failed.
> I observed two distinct failure scenario:
> Scenario 1: System failed to enter suspend state,and will auto resume;


> the log for use platform bus:
> dmesg-platform bus-device bound-auto resume.log

This is clear from the suspend hook in the vhci_hcd.
When it returns EBUSY, suspend will fail and move to
auto resume.

> the log for use faux bus:
> dmesg-faux bus-device bound-auto resume.log

It is good that the behavior is same with faux bus even though
suspend hook isn't called. I will take a look at the log.

> 
> Scenario 2: System resume failed with black screen freeze,a forced restart of the machine is require.
> the log for use platform bus:
> dmesg-platform bus-device bound-black screen.log
> the log for use faux bus:
> dmesg-faux bus-device bound-black screen.log

That is bad. When does this happen? Is there a difference in
configuration?

The behavior same for platform bus and faux bus. Sounds like
an existing problem that needs to be debugged separately.

I will take a look at all these logs and get back to you in
a day or two.

thanks,
-- Shuah

