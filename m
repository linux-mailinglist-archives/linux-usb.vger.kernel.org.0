Return-Path: <linux-usb+bounces-25937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2CB09540
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 21:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC331A6189B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 19:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8669D21C16B;
	Thu, 17 Jul 2025 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hBn+VloK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78301799F
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 19:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752782118; cv=none; b=Q8Frq4hHd9HeFmIZFtT//3NglQsYkG+lZLlOsjxwCY4F83h/LOuIOKGVF1atiLQJMgNoDLgtH0fPUWc987Y4p1ZIs8/oYQ5V+UP0po2KPwdZVy7bkBdcA+W0DiF2mEM1LKjFmmiiKfioMlXkQkqtrK0DcGmujoPn68/N/QP4gFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752782118; c=relaxed/simple;
	bh=+Q9RKHTHvCAIkCwob0N05RgnvskVzJ6/1kxlNGU0ULw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsvDpR+e0ciAh4Kvs0xN2uvoy6gsNp4bjA++UjodbnYkbPvThXjzoj5926kmRUQnHCyRieHdiFqPcatjCs3/vjhuD/n5BECS5qMq4NV3m0pxomIkv89wuMk+rovRHC6qZwmnkTKOZeYHH2vwjZ1lfj/dXyBNa3M16caeKWhNXWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hBn+VloK; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3e293a3b426so4850985ab.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 12:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752782116; x=1753386916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnGpwrpCqI1VlGpJfKbQwgcrq4rzy8zYYAzVgnVuWmE=;
        b=hBn+VloKOXCXkhCAfNOYIfCW4KtIquD+TYWdMEwuz84qotlVLB2PkIKFQ8FZuSuzbi
         dfmyE5xCDcYuEBE0rHc6ZcY3LECqhGhYRpCnF8bqoRCdIaBG+jLWTtA7Q4FMNzkpo2i3
         gErw3/8Cm20/kQ7/1TZJo/DHTYgJHYYrial20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752782116; x=1753386916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnGpwrpCqI1VlGpJfKbQwgcrq4rzy8zYYAzVgnVuWmE=;
        b=uLqNyMcnAABhNa9gwRvMaD8xSlNTb+v2gGMkl8uMwP14BewH7pX56DYT7jZeFnEoMA
         +9d01VEMRHdNS5+Hvb07CWb+Mz7+KdZWBjjah5EloMgfER9KFYsutnBdMO7ed+F2goCt
         ae8GyE0AzsANBaDECHuvd1+TEWECk2CoVh1I3hfrgmoK1QKQ206gZtVkUuxI1doH6maF
         Xxra5QWkzDPkf0Lbsogde4g+a0IO37pjNUkU37UR5k3zIaSZZpuI2T0J1gN6B+p68PbJ
         zVZ6q1snO2qjlKwkEm3UnverSxN3t8J7vnFh7Geu6f6YXkPvf7ZLf/PKSa7O3BkbZlvq
         Po6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzjASjVXZcld2dHvgh1jbVVr6RPRU9f0Eyqfk5BgPpy/SND0S98Ij97RW6lQ5mpc3Y/lPUy2vgQL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3tPpuc+AbY5VAix9D7w7gOCdyOWWbphJGJJ3h0wexL6yjF6v
	Gs5I8ybhaVJvvAh86KiZAmBvYyB8MRdv2GzeUC+xaZyjvaO1xa5tCGA1gvHoh9B/ulw=
X-Gm-Gg: ASbGncsjzpR8REowJmDKYQZVEchg5skjJZgqkOsL/6IYnh2PYx+Cqm3tDxtdlqncGEO
	7n65OfQoxr6i1QZ0Ev0ReC70Fzy0Hv4tTOcHEF9YNXZ+eAZ0Vx0bv05kpsRPbMR9ZTW4+76u/d8
	ONqJGde0XPiWSMq6v581VYaR15+NPV1FiJ4jo/8zkOarP21kbqZ2mjI+GvpdR0kTpPSsw0FNbH7
	Kv5u4Uw9GdAkRY3BTMqk14/0jaDpZw8xE2AS5FdKVbR05kELoia696NkGWSbaw26oZnVBXy7MAN
	kuGrhKkX7wS3ilD225twAuWilMuJi5d28ixveoT9ABkw5K5N82SyP24KyvrphcWFOUm10VNqvpg
	xIaC9pyuJMeR1fEJigNmO1Fdf8v/CcKbVOg==
X-Google-Smtp-Source: AGHT+IGptDM8XPxxprOyVs4kILAhbRPCYCZSt2H7kbObkiEmZYSJLbKxHFVOcoaLqqZdbUSAThJFAA==
X-Received: by 2002:a05:6e02:1a66:b0:3df:3bdc:2e49 with SMTP id e9e14a558f8ab-3e2824ca25amr98433675ab.12.1752782115824;
        Thu, 17 Jul 2025 12:55:15 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-505565324e2sm3596031173.25.2025.07.17.12.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 12:55:15 -0700 (PDT)
Message-ID: <2a87101f-6bee-4bd1-816a-1dfbe7b4a578@linuxfoundation.org>
Date: Thu, 17 Jul 2025 13:55:14 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] usb: vhci-hcd: Prevent suspending virtually attached
 devices
To: Alan Stern <stern@rowland.harvard.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Brian G. Merrell" <bgmerrell@novell.com>, kernel@collabora.com,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250717-vhci-hcd-suspend-fix-v1-0-2b000cd05952@collabora.com>
 <20250717-vhci-hcd-suspend-fix-v1-1-2b000cd05952@collabora.com>
 <42bcf1e1-1bb2-4b63-9790-61393f780202@rowland.harvard.edu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <42bcf1e1-1bb2-4b63-9790-61393f780202@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/25 12:26, Alan Stern wrote:
> On Thu, Jul 17, 2025 at 06:54:50PM +0300, Cristian Ciocaltea wrote:
>> The VHCI platform driver aims to forbid entering system suspend when at
>> least one of the virtual USB ports are bound to an active USB/IP
>> connection.
>>
>> However, in some cases, the detection logic doesn't work reliably, i.e.
>> when all devices attached to the virtual root hub have been already
>> suspended, leading to a broken suspend state, with unrecoverable resume.
>>
>> Ensure the attached devices do not enter suspend by setting the syscore
>> PM flag.
>>
>> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   drivers/usb/usbip/vhci_hcd.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>> index e70fba9f55d6a0edf3c5fde56a614dd3799406a1..762b60e10a9415e58147cde2f615045da5804a0e 100644
>> --- a/drivers/usb/usbip/vhci_hcd.c
>> +++ b/drivers/usb/usbip/vhci_hcd.c
>> @@ -765,6 +765,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>>   				 ctrlreq->wValue, vdev->rhport);
>>   
>>   			vdev->udev = usb_get_dev(urb->dev);
>> +			dev_pm_syscore_device(&vdev->udev->dev, true);
>>   			usb_put_dev(old);
>>   
>>   			spin_lock(&vdev->ud.lock);
>> @@ -785,6 +786,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>>   					"Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
>>   
>>   			vdev->udev = usb_get_dev(urb->dev);
>> +			dev_pm_syscore_device(&vdev->udev->dev, true);
>>   			usb_put_dev(old);
>>   			goto out;
> 
> This looks very strange indeed.
> 
> First, why is vhci_urb_enqueue() the right place to do this?  I should
> think you would want to do this just once per device, at the time it is
> attached.  Not every time a new URB is enqueued.

Correct. This isn't the right place to do this even if we want to go with
the option to prevent suspend. The possible place to do this would be
from rh_port_connect() in which case you will have access to usb_hcd device.

This has to be undone from rh_port_disconnect(). Also how does this impact
the usbip_host - we still need to handle usbip_host suspend.

> 
> Second, how do these devices ever go back to being regular non-syscore
> things?
> 
> Third, if this change isn't merely a temporary placeholder, it certainly
> needs to have a comment in the code to explain what it does and why.
> 
> Fourth, does calling dev_pm_syscore_device() really prevent the device
> from going into suspend?  What about runtime suspend?  And what good
> does it to do prevent the device from being suspended if the entire
> server gets suspended?
> 
> Fifth, the patch description says the purpose is to prevent the server
> from going into system suspend.  How does marking some devices with
> dev_pm_syscore_device() accomplish this?
> 

We have been discussing suspend/resume and reboot behavior in another thread
that proposed converting vhci_hcd to use faux bus.

In addition to what Alan is asking, To handle suspend/resume cleanly, the
following has to happen at a higher level:

- Let the usbip hots host know client is suspending the connection.
   The physical device isn't suspended on the host.
- suspend the virtual devices and vhci_hcd

Do the reverse to resume.

I would say:

- We don't want vhci_hcd and usbip_host preventing suspend
- It might be cleaner and safer to detach the devices during
   suspend on both ends. This is similar to what happens now when
   usbip host and vhci_hcd are removed.
- Note that usbip_host and vhci_hcd don't fully support suspend and
   resume at the moment.

thanks,
-- Shuah


