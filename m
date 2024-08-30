Return-Path: <linux-usb+bounces-14382-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A204996633C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7A9283CE5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 13:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3BA1AD5CB;
	Fri, 30 Aug 2024 13:43:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE71ACDE8
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025424; cv=none; b=O4UPw//ysNd7MzMGLBJxWnvAV2Hrfl6aaLrsHJLY/6vOAkLJ1Aq/yBlM1ktCXq11HsoN//IsiWNrWQjI4g4XyprGEfZBxBPMR+WjjL8dVChOJZr9dNQrj8AUREHY/B15+97VjQzQeLRjuR+0YiSMymNvB+nR0t84t/Yy0ec990s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025424; c=relaxed/simple;
	bh=TeYYVbSiEw/X6xVnqOqkEInZQDdbZ3rtVy4FfyA+rd8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UtHfRV5/Ot4d/nhGrVdkHbUQ6NyFhulKaYt83cj6fYIQuMLlAzGl3/niooTsMNw3cmlwdkrngyHqWg3Q4M/6XlXhJUv2KwyngIPRQjGCT7EMtdWLEXbM2AICDLyWk3lCpRNwwFCqwX+dgMqJ1ut41HzTlgn5Bu3eX88cJSspPeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.81.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4WwK9m0Xn7z9RRj
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 23:43:40 +1000 (AEST)
Message-ID: <4e3c79f0-9f06-4da2-b479-1300d4890786@eyal.emu.id.au>
Date: Fri, 30 Aug 2024 23:43:39 +1000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eyal@eyal.emu.id.au
Subject: Re: Understanding 'lsusb -t'
From: Eyal Lebedinsky <eyal@eyal.emu.id.au>
To: linux-usb@vger.kernel.org
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <2024083057-charger-lustrous-d434@gregkh>
 <f700f792-929a-45e6-bdfe-8600b92e97d7@eyal.emu.id.au>
Content-Language: en-US
In-Reply-To: <f700f792-929a-45e6-bdfe-8600b92e97d7@eyal.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/8/24 11:41 pm, Eyal Lebedinsky wrote:
> On 30/8/24 10:32 pm, Greg KH wrote:
>> On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
>>> I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
>>>
>>> I note this output:
>>>
>>> $ lsusb -tv
>>> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>>> [trimmed]
>>>      |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
>>> [trimmed]
>>>      |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
>>> [trimmed]
>>>      |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
>>>          ID 2109:2817 VIA Labs, Inc.
>>> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>>> [trimmed]
>>>      |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
>>>          ID 2109:0817 VIA Labs, Inc.
>>>
>>> I removed some content that is not relevant to my question.
>>>
>>> Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
>>>
>>> I verified that both are for the same (one) device. They do not show when I disconnect it.
>>> The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
>>> Nothing is plugged into any of the four ports.
>>>
>>> Is this correct? Why does this device show twice in the list?
>>
>> That's odd, as the same device shouldn't be on multiple busses.  Busses
>> are a "root port" on the system (i.e. a new PCI controller device), so
>> are you sure you just don't have multiple devices with the same
>> device/vendor id?
> 
> The hub is on an extension cable, and I just unplug it the hub.
> 
>> What is the diff between running the command before and after removing a
>> single device?
> 
> $ lsusb -tv >lsusb-all.log
> $ lsusb -tv >lsusb-less.log
> $ diff -u lsusb-all.log lsusb-less.log
> --- lsusb-all.log       2024-08-30 23:39:09.782062079 +1000
> +++ lsusb-less.log      2024-08-30 23:39:22.608987407 +1000
> @@ -48,8 +48,6 @@
>               ID 0c45:7401 Microdia TEMPer Temperature Sensor
>           |__ Port 004: Dev 018, If 1, Class=Human Interface Device, Driver=[none], 1.5M
>               ID 0c45:7401 Microdia TEMPer Temperature Sensor
> -    |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
> -        ID 2109:2817 VIA Labs, Inc.
>   /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>       ID 1d6b:0003 Linux Foundation 3.0 root hub
>       |__ Port 004: Dev 002, If 0, Class=Hub, Driver=hub/4p, 5000M
> @@ -58,5 +56,3 @@
>               ID 0bda:0411 Realtek Semiconductor Corp. Hub
>       |__ Port 005: Dev 003, If 0, Class=Hub, Driver=hub/4p, 5000M
>           ID 05e3:0612 Genesys Logic, Inc. Hub
> -    |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
> -        ID 2109:0817 VIA Labs, Inc.

Also, here these the log messages when I reconnect the hub:

2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: Product: USB2.0 Hub
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: Manufacturer: VIA Labs, Inc.
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 1-6:1.0: USB hub found
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 1-6:1.0: 4 ports detected
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: new SuperSpeed USB device number 7 using xhci_hcd
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: New USB device found, idVendor=2109, idProduct=0817, bcdDevice= 0.50
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: Product: USB3.0 Hub
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: Manufacturer: VIA Labs, Inc.
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 2-6:1.0: USB hub found
2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 2-6:1.0: 4 ports detected


>> thanks,
>>
>> greg k-h
> 

-- 
Eyal at Home (eyal@eyal.emu.id.au)


