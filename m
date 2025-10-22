Return-Path: <linux-usb+bounces-29520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 528EEBFC294
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 15:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2A5D562B26
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 13:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE67A33F8CD;
	Wed, 22 Oct 2025 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6uSYBi/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A63128D4
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761139565; cv=none; b=gA0cUQC/rS7Iu8HDiyUc9AKxIKF8Ez+q/spNWrfbbIam+q/uUG9hn8ptO0CrvZ398nEn0yXZh8YaYbQzn6FPwrdGT2Gu5iXpbnyaJ1TYnwCx7jbt4KC03wRh0kb7Hivvy7bvDUQwrcbYifKPaO4UZrI5aTngd+FAZgR106IHVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761139565; c=relaxed/simple;
	bh=TIHoagb9nmBBo3qzFiNpF9kRv+YbgaOnk7dZHlHe3gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBiOiqnNrXyXjNIgKGQnLI4nEZsAHgZFXCZ0DmPnJssTgVyLmQoKlgooW7iE0mSaIDrhIv7SygbDwSRdUNb1UpgJaEabli57O5E25WcTyMU+jTchY6bxVMIIVeVflzOXFEHG8IfF8H7Qj0lk2B+40ZlG8mGfiqBZ/XXpFVgU38c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6uSYBi/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1522183766b.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761139561; x=1761744361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZlZLmDPyiYciANeW9KKBJMV54Xan/JRRo1uMwZ7l90=;
        b=V6uSYBi/nkrWr2aLLfs6kXRrlU9I718Gmywct8uujc9Q37BL7DqfuwlOoD08LcvUhw
         DAxqh3SHdkGzMNfsHgLWj7IhNlYt2grL7yjMuGr1dILizVpoCfWiomx01xlF6bZCEQEW
         4KIpp/q+Jbnl0YAkCxChvqrBrU+X9fyy3kSKstnXwR6rpnXE5feO1NcFkWJmZG4qLxgh
         CX73TyYN1QjI6l08nHHGUtKejY3J0hcR00otDNkgXhfuaYPgwqN7pNy8Fvb0lj1MMXO2
         lWNGjlBXs3YF7zyqvCFM1Zp1GUXPXcTzkCVLPiIe6l1d3G1yQV6/g0WCv3Fo55vb32Xb
         WHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761139561; x=1761744361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZlZLmDPyiYciANeW9KKBJMV54Xan/JRRo1uMwZ7l90=;
        b=ZE0oOownynhVvS74BbTJiW6vc0oSi2pWVSyPWlrHR+r4rJvEtYdVEEulDLGMQnppI1
         fCviVIImwQT+1lSjWKEuCX86u+uBu58Tt0hd+/IDAgJrhd9CuhA8/30h7VEc9mArzKi3
         sTOAqiO4sJDNwwt+LOX5Yoi9ejLJYsPYWxNCaXOw/tZ/r+1QYZ2ahGGYhVShXB5ISiXk
         NTkIYWQOcTd+5jngqMN7DLIZV002DGduEIAmR+J4Qf4khJYkc7xQstHmTnf8RHifsZsF
         KwFSg9qatePnqj3Ma8hiDZkxYVJz/hppo5w5xmvLLk8vLjPpSJL9Q8WaRIqlIhUF7dve
         pEUQ==
X-Gm-Message-State: AOJu0YzJVjNdAPamLEAgsmHQNazayoyhTasUteg60qSclOELQ6oiiQ5v
	XVUEM96C8FHFp90gMuk+mlx/34SAXChOQw3sg8AoAu4Am5Dsq2hgmACIq5i7dA==
X-Gm-Gg: ASbGncvl6gE/qDpDNhIZv5QRr8UYcDjezvWvb/jY5TkMfhXmxaFQkw+yFBPP2ltPK7v
	/dvpsImQakhWFxLLx1/cU33cu1UCohLgXUbyJ9A7NkN12IXMw3hFtbz+mK5yO/SJL+dXicajvtG
	yh/GrpNAO4/qKaCuiKHNWfo1A1tDWWEzUv6U6ELAsm9xl0peCGciV2OCUVIshgzV+IPvWtGzDdN
	p+nzcoXCelODzRIk99CEnSLwa+eGYhqiBt3C0pHtriGV0NA4P7rnQyi6DSqZNOulBV6xpEontgU
	nZChQAS2Wey8PuwuSmyxdIT7iBaxijo7EUlalQakVao0fMCsRbOIRhVQiYXN10Y1xJuFVmCVErb
	YAqNt331rB2vs+L/YogsXsT+E+lrejSH/XI/GkUdglXf0Tpnw+w8FX/fYr5v68CCUoL/PU+VGMM
	x15AGDOnewInvhOtvu9GgMyfXUkfmikmRR/wb+X5YmN8YF
X-Google-Smtp-Source: AGHT+IF4dDu9+rlkqU97VxdWRxdKrgkioFszjrxbkp7wO3Dm7UW4E/GlDrWh5EXEiZ9nYNI3x+we4Q==
X-Received: by 2002:a17:907:1c28:b0:b2d:e514:5348 with SMTP id a640c23a62f3a-b6474940f3amr2524708266b.33.1761139560376;
        Wed, 22 Oct 2025 06:26:00 -0700 (PDT)
Received: from ?IPV6:2a01:41e3:502f:e200:4a9:7423:73cd:3b4? ([2a01:41e3:502f:e200:4a9:7423:73cd:3b4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4942f63dsm12071352a12.20.2025.10.22.06.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:25:59 -0700 (PDT)
Message-ID: <1a960051-b1e8-49a5-bdea-1ddd719cd0ec@gmail.com>
Date: Wed, 22 Oct 2025 15:25:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
 <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
 <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>
 <4c6bbcd1-0ed2-496d-82c4-3fc9a1c2660e@rowland.harvard.edu>
Content-Language: en-US
From: Julian Sikorski <belegdol@gmail.com>
In-Reply-To: <4c6bbcd1-0ed2-496d-82c4-3fc9a1c2660e@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 21.10.25 um 18:01 schrieb Alan Stern:
> On Tue, Oct 21, 2025 at 04:44:24PM +0200, Julian Sikorski wrote:
>> Am 19.10.25 um 17:43 schrieb Alan Stern:
>>> On Sun, Oct 19, 2025 at 08:34:27AM +0200, Julian Sikorski wrote:
>>>> Hello,
>>>>
>>>> disclaimer: this is not linux-specific as Windows 11 also fails to recognise
>>>> the devices, but maybe someone has ideas regarding the causes here.
>>>> I have two TipToi Pens by Ravensburger. These are recognised as
>>>>
>>>> 04d6:e101 Mentor Graphics usbdisk
>>>>
>>>> when plugged into USB C port via USB C to micro B cable. When plugged into
>>>> the USB A port, the following messages are reported into the journal:
>>>>
>>>> Okt 19 08:19:08 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>>>> is bad?
>>>> Okt 19 08:19:09 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>>>> is bad?
>>>> Okt 19 08:19:09 kernel: usb usb3-port2: attempt power cycle
>>>> Okt 19 08:19:10 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>>>> is bad?
>>>> Okt 19 08:19:11 kernel: usb usb3-port2: Cannot enable. Maybe the USB cable
>>>> is bad?
>>>> Okt 19 08:19:11 kernel: usb usb3-port2: unable to enumerate USB device
>>>>
>>>> I have two pens. I tried two cables delivered with them, as well as a
>>>> different USB A to micro B cable I had. All exhibit the same issue.
>>>> Does anyone have any ideas what could be the problem? My first guess is that
>>>> both the laptop and the pen are slightly off-spec in some strange way, which
>>>> causes them not to work together. The USB A slot on the laptop works fine
>>>> with other devices, and the pen works with the laptop if connected to USB C.
>>>
>>> Have you tried using the pens on a different computer?
>>>
>>> Alan Stern
>>
>> Hi,
>>
>> I did, I just tried again to be sure - with the allegedly broken cable. This
>> is on my ASRock Fatal1ty B450 Gaming-ITX/ac front panel USB:
>>
>> Okt 21 16:42:00 kernel: usb 1-3: new high-speed USB device number 4 using
>> xhci_hcd
>> Okt 21 16:42:00 kernel: usb 1-3: New USB device found, idVendor=04d6,
>> idProduct=e101, bcdDevice= 1.00
> ...
> 
> That certainly indicates part of the problem is in the laptop.  What
> happens if you try connecting one of the pens to the laptop through a
> USB hub?
> 
> Alan Stern

Through a hub (Dell Monitor) the pen works as well:

Okt 22 15:18:53 kernel: usb 3-2: new high-speed USB device number 7 
using xhci_hcd
Okt 22 15:18:53 kernel: usb 3-2: New USB device found, idVendor=0451, 
idProduct=8142, bcdDevice= 1.00
Okt 22 15:18:53 kernel: usb 3-2: New USB device strings: Mfr=0, 
Product=0, SerialNumber=1
Okt 22 15:18:53 kernel: usb 3-2: SerialNumber: yyyy
Okt 22 15:18:53 kernel: hub 3-2:1.0: USB hub found
Okt 22 15:18:53 kernel: hub 3-2:1.0: 4 ports detected
Okt 22 15:18:53 kernel: usb 4-2: new SuperSpeed USB device number 3 
using xhci_hcd
Okt 22 15:18:53 kernel: usb 4-2: New USB device found, idVendor=0451, 
idProduct=8140, bcdDevice= 1.00
Okt 22 15:18:53 kernel: usb 4-2: New USB device strings: Mfr=0, 
Product=0, SerialNumber=0
Okt 22 15:18:53 kernel: hub 4-2:1.0: USB hub found
Okt 22 15:18:53 kernel: hub 4-2:1.0: 4 ports detected
Okt 22 15:18:54 kernel: usb 3-2.4: new high-speed USB device number 8 
using xhci_hcd
Okt 22 15:18:54 kernel: usb 3-2.4: New USB device found, idVendor=0451, 
idProduct=8142, bcdDevice= 1.00
Okt 22 15:18:54 kernel: usb 3-2.4: New USB device strings: Mfr=0, 
Product=0, SerialNumber=1
Okt 22 15:18:54 kernel: usb 3-2.4: SerialNumber: yyyy
Okt 22 15:18:54 kernel: hub 3-2.4:1.0: USB hub found
Okt 22 15:18:54 kernel: hub 3-2.4:1.0: 4 ports detected
Okt 22 15:18:54 kernel: usb 4-2.4: new SuperSpeed USB device number 4 
using xhci_hcd
Okt 22 15:18:54 kernel: usb 4-2.4: New USB device found, idVendor=0451, 
idProduct=8140, bcdDevice= 1.00
Okt 22 15:18:54 kernel: usb 4-2.4: New USB device strings: Mfr=0, 
Product=0, SerialNumber=0
Okt 22 15:18:54 kernel: hub 4-2.4:1.0: USB hub found
Okt 22 15:18:54 kernel: hub 4-2.4:1.0: 4 ports detected
Okt 22 15:18:54 kernel: usb 3-2.4.3: new full-speed USB device number 9 
using xhci_hcd
Okt 22 15:18:54 kernel: usb 3-2.4.3: New USB device found, 
idVendor=0451, idProduct=ca01, bcdDevice= 1.00
Okt 22 15:18:54 kernel: usb 3-2.4.3: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Okt 22 15:18:54 kernel: usb 3-2.4.3: Product: Texas Instruments USBtoI2C 
Solution
Okt 22 15:18:54 kernel: usb 3-2.4.3: Manufacturer: Texas Instruments
Okt 22 15:18:54 kernel: [35B blob data]
Okt 22 15:18:54 kernel: hid-generic 0003:0451:CA01.0004: 
hiddev96,hidraw1: USB HID v1.00 Device [Texas Instruments Texas 
Instruments USBtoI2C Solution] on usb-0000:04:00.4-2.4.3/input0
Okt 22 15:19:57 kernel: usb 3-2.4.2: new high-speed USB device number 10 
using xhci_hcd
Okt 22 15:19:57 kernel: usb 3-2.4.2: New USB device found, 
idVendor=04d6, idProduct=e101, bcdDevice= 1.00
Okt 22 15:19:57 kernel: usb 3-2.4.2: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Okt 22 15:19:57 kernel: usb 3-2.4.2: Product: usbdisk
Okt 22 15:19:57 kernel: usb 3-2.4.2: Manufacturer: anyka
Okt 22 15:19:57 kernel: usb 3-2.4.2: SerialNumber: xxxx
Okt 22 15:19:57 kernel: usb-storage 3-2.4.2:1.0: USB Mass Storage device 
detected
Okt 22 15:19:57 kernel: scsi host2: usb-storage 3-2.4.2:1.0
Okt 22 15:19:58 kernel: scsi 2:0:0:0: Direct-Access     Tiptoi   ZC3203L 
          1.00 PQ: 0 ANSI: 2
Okt 22 15:19:58 kernel: sd 2:0:0:0: Attached scsi generic sg0 type 0
Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] 7013632 512-byte logical 
blocks: (3.59 GB/3.34 GiB)
Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Write Protect is off
Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Mode Sense: 03 00 00 00
Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] No Caching mode page found
Okt 22 15:19:58 kernel: sd 2:0:0:0: [sda] Assuming drive cache: write 
through
Okt 22 15:19:59 kernel:  sda:
Okt 22 15:19:59 kernel: sd 2:0:0:0: [sda] Attached SCSI removable disk

Best regards,
Julian

