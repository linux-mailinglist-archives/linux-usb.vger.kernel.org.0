Return-Path: <linux-usb+bounces-14393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F15DE966443
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A661F21839
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AA81B2ECE;
	Fri, 30 Aug 2024 14:33:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from pasta.tip.net.au (pasta.tip.net.au [203.10.76.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386612F59C
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.10.76.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028437; cv=none; b=OQ6kIAZTTuDJAcdozLYEiYY0/HIJD4paYdgVlLgWt7OMEiO6MJX1Rd+9AzZj27v29nPEqtX/uEQ+4czHiabzoBZ+uikVExY7VFC5nAhXekt3dtbCosV+SSJY1b5lLuYPnL8d9YGAkyVnKMajF2UJICIUL9k3P8t65rKF0vYoyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028437; c=relaxed/simple;
	bh=WyA64nMpHP05IsFAJkQf3eHxgYGMugavSkiV5zghqi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oTM1fvGcmVMP6hx/c9ntvEX5k+qoNg+yiH6qzD1c05ssOzn7yYU3UYAHWMm7OVmhCGQvNvGAY+uCDspCD4rSlhADafNZQ5Nq0TiQDpvZFcSlZtgKwp+xqxEllef1g5ZYr4qgOB2ho8G5BT0FEeTBE5yWRvsOLtmdeoWVyS+UUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au; spf=pass smtp.mailfrom=eyal.emu.id.au; arc=none smtp.client-ip=203.10.76.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eyal.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eyal.emu.id.au
Received: from [192.168.2.7] (unknown [101.115.81.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailhost.tip.net.au (Postfix) with ESMTPSA id 4WwLHh4pgcz9RCP
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 00:33:52 +1000 (AEST)
Message-ID: <81e0f4c1-ef41-4106-ae70-2f11f7276703@eyal.emu.id.au>
Date: Sat, 31 Aug 2024 00:33:52 +1000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eyal@eyal.emu.id.au
Subject: Re: Understanding 'lsusb -t'
To: linux-usb@vger.kernel.org
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
 <2024083057-charger-lustrous-d434@gregkh>
 <f700f792-929a-45e6-bdfe-8600b92e97d7@eyal.emu.id.au>
 <4e3c79f0-9f06-4da2-b479-1300d4890786@eyal.emu.id.au>
 <2024083013-rentable-matador-050b@gregkh>
Content-Language: en-US
From: Eyal Lebedinsky <eyal@eyal.emu.id.au>
In-Reply-To: <2024083013-rentable-matador-050b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/8/24 12:27 am, Greg KH wrote:
> On Fri, Aug 30, 2024 at 11:43:39PM +1000, Eyal Lebedinsky wrote:
>> On 30/8/24 11:41 pm, Eyal Lebedinsky wrote:
>>> On 30/8/24 10:32 pm, Greg KH wrote:
>>>> On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
>>>>> I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
>>>>>
>>>>> I note this output:
>>>>>
>>>>> $ lsusb -tv
>>>>> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
>>>>>       ID 1d6b:0002 Linux Foundation 2.0 root hub
>>>>> [trimmed]
>>>>>       |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
>>>>> [trimmed]
>>>>>       |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
>>>>> [trimmed]
>>>>>       |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
>>>>>           ID 2109:2817 VIA Labs, Inc.
>>>>> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>>>>> [trimmed]
>>>>>       |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
>>>>>           ID 2109:0817 VIA Labs, Inc.
>>>>>
>>>>> I removed some content that is not relevant to my question.
>>>>>
>>>>> Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
>>>>>
>>>>> I verified that both are for the same (one) device. They do not show when I disconnect it.
>>>>> The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
>>>>> Nothing is plugged into any of the four ports.
>>>>>
>>>>> Is this correct? Why does this device show twice in the list?
>>>>
>>>> That's odd, as the same device shouldn't be on multiple busses.  Busses
>>>> are a "root port" on the system (i.e. a new PCI controller device), so
>>>> are you sure you just don't have multiple devices with the same
>>>> device/vendor id?
>>>
>>> The hub is on an extension cable, and I just unplug it the hub.
>>>
>>>> What is the diff between running the command before and after removing a
>>>> single device?
>>>
>>> $ lsusb -tv >lsusb-all.log
>>> $ lsusb -tv >lsusb-less.log
>>> $ diff -u lsusb-all.log lsusb-less.log
>>> --- lsusb-all.log       2024-08-30 23:39:09.782062079 +1000
>>> +++ lsusb-less.log      2024-08-30 23:39:22.608987407 +1000
>>> @@ -48,8 +48,6 @@
>>>                ID 0c45:7401 Microdia TEMPer Temperature Sensor
>>>            |__ Port 004: Dev 018, If 1, Class=Human Interface Device, Driver=[none], 1.5M
>>>                ID 0c45:7401 Microdia TEMPer Temperature Sensor
>>> -    |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
>>> -        ID 2109:2817 VIA Labs, Inc.
>>>    /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
>>>        ID 1d6b:0003 Linux Foundation 3.0 root hub
>>>        |__ Port 004: Dev 002, If 0, Class=Hub, Driver=hub/4p, 5000M
>>> @@ -58,5 +56,3 @@
>>>                ID 0bda:0411 Realtek Semiconductor Corp. Hub
>>>        |__ Port 005: Dev 003, If 0, Class=Hub, Driver=hub/4p, 5000M
>>>            ID 05e3:0612 Genesys Logic, Inc. Hub
>>> -    |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
>>> -        ID 2109:0817 VIA Labs, Inc.
>>
>> Also, here these the log messages when I reconnect the hub:
>>
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: Product: USB2.0 Hub
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 1-6: Manufacturer: VIA Labs, Inc.
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 1-6:1.0: USB hub found
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 1-6:1.0: 4 ports detected
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: new SuperSpeed USB device number 7 using xhci_hcd
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: New USB device found, idVendor=2109, idProduct=0817, bcdDevice= 0.50
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: Product: USB3.0 Hub
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: usb 2-6: Manufacturer: VIA Labs, Inc.
>> 2024-08-30T23:41:52+10:00 e7.eyal.emu.id.au kernel: hub 2-6:1.0: USB hub found
>> 2024-08-30T23:41:52+1G0:00 e7.eyal.emu.id.au kernel: hub 2-6:1.0: 4 ports detected
> 
> Extension cables are very wierd, and you are right, this is two
> different hubs on two ports.  Is this a thunderbolt device somehow?
> 
> Anyway, as long as everything is working properly, all should be good.
> 
> What happens when you plug a device into this cable at the other end,
> does it show up twice?  Or just once?

I connected another hub directly to the mobo and it shows twice (1-7 and 2-7):

2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 1-7: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.04
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 1-7: Product: 4-Port USB 2.0 Hub
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 1-7: Manufacturer: Generic
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: hub 1-7:1.0: USB hub found
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: hub 1-7:1.0: 4 ports detected
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 2-7: new SuperSpeed USB device number 12 using xhci_hcd
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 2-7: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.04
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 2-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 2-7: Product: 4-Port USB 3.0 Hub
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: usb 2-7: Manufacturer: Generic
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: hub 2-7:1.0: USB hub found
2024-08-31T00:29:38+10:00 e7.eyal.emu.id.au kernel: hub 2-7:1.0: 4 ports detected

> thanks,
> 
> greg k-h

-- 
Eyal at Home (eyal@eyal.emu.id.au)


