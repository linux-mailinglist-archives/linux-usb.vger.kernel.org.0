Return-Path: <linux-usb+bounces-12325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3A938D95
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 12:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 593A91C20D6D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 10:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9092716B3B4;
	Mon, 22 Jul 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de header.b="ne119DNJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from shout02.mail.de (shout02.mail.de [62.201.172.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536E23DE
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.201.172.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644822; cv=none; b=Hn79sN7dFf1wqGKc7HpkJWKQyB0KxYqAdgF7sggDJwJoZRaWVAZ6Qk+pAk3ih/NKuN+98hlBCDoNC6qQx7Lr6ym+OHtxzHySmPQYRBIplhgqRg8XkBjlA7U+BDZAxC6z3vS/0kkhntQAnZs1istK2uvvGjGd65Eeq8/wFdABje4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644822; c=relaxed/simple;
	bh=SqtNZnuW2gR78k2rGZMoEBZXvw1ttDgtpHz45LmZ0wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6JqOa/A6X6C6WYuuRhjX4RrCtkD051eyNIOVSyERYO/jC+3XbPJyvH8mv/n7cJgvXKvrcYD71kGy91B6bYdAsKN9pXeZPyz0nLCuIWiDfuD+qJTpdBrh79QjGq4CHnH4u5LkI8ce/Fvn/Jz0TEPxLJL8FWcDglhMzG2IMh47RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.de; spf=pass smtp.mailfrom=mail.de; dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de header.b=ne119DNJ; arc=none smtp.client-ip=62.201.172.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.de
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
	by shout02.mail.de (Postfix) with ESMTP id 2E85C240E12;
	Mon, 22 Jul 2024 12:40:19 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
	by postfix01.mail.de (Postfix) with ESMTP id 1538580158;
	Mon, 22 Jul 2024 12:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
	s=mailde202009; t=1721644819;
	bh=SqtNZnuW2gR78k2rGZMoEBZXvw1ttDgtpHz45LmZ0wA=;
	h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
	b=ne119DNJ/uMoMqKVQiGrqvyS6HLYgx3Jn2eB7yhHjl+MyVIUHXBQkRlqWQiShHra3
	 C0/prQBsqT43kKRHGCLr00LfP1k/AJXcJeMR3zaGNX8JYpOxG3SIIwzMiwstPurDhP
	 c70epZceEiIUmQf4uEhG+JsEFAQXW0+wRb4GV7YhZHpPIQxKwe9j4mvriCUyiqW4Zb
	 i2raJ/p3lYsBr2FZOsAvDRXzuMU/aZexZDkVcr8MV3MqhPPnZNgEb5CVoUg1pqvbeP
	 B1s3CF3tB/jdAWLXUrH/w31m0RIp99AE7s5v0zbWqEj7avXY7cCxJpGyUnM1llqQxE
	 Ym/LHCyokyn1g==
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp01.mail.de (Postfix) with ESMTPSA id 7C17B240CB1;
	Mon, 22 Jul 2024 12:40:18 +0200 (CEST)
Message-ID: <44ac4246-14d4-4e40-a071-55b155b429af@mail.de>
Date: Mon, 22 Jul 2024 12:40:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: cp210x VID and PID of my device are missing allthough the should
 be there
To: Lars Melin <larsm17@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <fbde5b4b-6640-4cc9-b39a-7eafcc0d29ba@mail.de>
 <2024072207-overstay-counting-8e61@gregkh>
 <db42e639-4d7e-4970-903c-0aaf688ba71e@gmail.com>
Content-Language: de-DE
From: G4bandit@mail.de
In-Reply-To: <db42e639-4d7e-4970-903c-0aaf688ba71e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 4502
X-purgate-ID: 154282::1721644818-BED2B878-615E1A49/0/0


Hello together,

the statement is completly correct. The device is a HID and not a 
usb-serial Device.
I am not sure how but one of the most reason was that I have installed 
the Software "Oscar" which supports PO-300 and there is a direct Link to 
this homepage:
https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers
And I have tagged the PO-300 Model with the fact that it has a 
usb-to-serial Chip, which is not completly wrong.
Because in fact the manufacturer changed the inside of the PO-300 from 
USBToSerial to the "more modern" HID. Whereas the product name stayd the 
same.

So sry for bother you with this issues.
I wish you a nice week.


KR
Gulam

Am 24-07-22 um 07:50 schrieb Lars Melin:
> On 2024-07-22 11:48, Greg KH wrote:
> > On Sun, Jul 21, 2024 at 08:09:12PM +0200, G4bandit@mail.de wrote:
> >>
> >> Hi
> >> my device with the
> >> VID = 0x28e9
> >> PID = 0x028a
> >> should be supported by the cp210x driver. But in fact this VID and PID does
> >> not appear.
> > 
> > Why do you think this driver should support this device?
> > 
> >> See the output:
> >> alias:          usb:v3195pF190d*dc*dsc*dp*ic*isc*ip*in*
> >> alias:          usb:v2626pEA60d*dc*dsc*dp*ic*isc*ip*in*
> >> alias:          usb:v2184p0030d*dc*dsc*dp*ic*isc*ip*in*
> >> alias:          usb:v1FB9p0701d*dc*dsc*dp*ic*isc*ip*in*
> >>
> >> The manufacturer recommends to use the driver maintained in the linux
> >> kernels.
> > 
> > Which driver exactly?  Do you have a link to that recommendation?
> > 
> > thanks,
> > 
> > greg k-h
> > 
>
> This device announces itself as a HID device so should
> not be handled by any usb-serial driver.
>
> Bus 004 Device 002: ID 28e9:028a          Pulse Oximeter
> Device Descriptor:
>     bLength                18
>     bDescriptorType         1
>     bcdUSB               2.00
>     bDeviceClass            0
>     bDeviceSubClass         0
>     bDeviceProtocol         0
>     bMaxPacketSize0        64
>     idVendor           0x28e9
>     idProduct          0x028a
>     bcdDevice            1.00
>     iManufacturer           1
>     iProduct                2 Pulse Oximeter
>     iSerial                 3 Pulse Oximeter
>     bNumConfigurations      1
>     Configuration Descriptor:
>       bLength                 9
>       bDescriptorType         2
>       wTotalLength       0x0029
>       bNumInterfaces          1
>       bConfigurationValue     1
>       iConfiguration          0
>       bmAttributes         0xc0
>         Self Powered
>       MaxPower              300mA
>       Interface Descriptor:
>         bLength                 9
>         bDescriptorType         4
>         bInterfaceNumber        0
>         bAlternateSetting       0
>         bNumEndpoints           2
>         bInterfaceClass         3 Human Interface Device
>         bInterfaceSubClass      0
>         bInterfaceProtocol      0
>         iInterface              0
>           HID Device Descriptor:
>             bLength                 9
>             bDescriptorType        33
>             bcdHID               1.11
>             bCountryCode            0 Not supported
>             bNumDescriptors         1
>             bDescriptorType        34 Report
>             wDescriptorLength      39
>            Report Descriptors:
>              ** UNAVAILABLE **
>         Endpoint Descriptor:
>           bLength                 7
>           bDescriptorType         5
>           bEndpointAddress     0x81  EP 1 IN
>           bmAttributes            3
>             Transfer Type            Interrupt
>             Synch Type               None
>             Usage Type               Data
>           wMaxPacketSize     0x0040  1x 64 bytes
>           bInterval               1
>         Endpoint Descriptor:
>           bLength                 7
>           bDescriptorType         5
>           bEndpointAddress     0x01  EP 1 OUT
>           bmAttributes            3
>             Transfer Type            Interrupt
>             Synch Type               None
>             Usage Type               Data
>           wMaxPacketSize     0x0040  1x 64 bytes
>           bInterval               1
> can't get device qualifier: Resource temporarily unavailable
> can't get debug descriptor: Resource temporarily unavailable
> Device Status:     0x0000
>     (Bus Powered)
>
> thanks
> Lars


