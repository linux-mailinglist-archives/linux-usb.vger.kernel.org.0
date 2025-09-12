Return-Path: <linux-usb+bounces-28002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E5B54363
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 09:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7813C1B26953
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 07:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BB63FFD;
	Fri, 12 Sep 2025 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b="p5g6gSgO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.wyraz.net (mail.wyraz.net [46.38.234.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C76323E
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.234.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660492; cv=none; b=NJ+ejfZ6HIyN5iSh+dn/q5g+Fcq5OMhflWm3bJQroB87TSpzA1NnvBz3Oq3HK8EKQHAIpWLrlQR2y9n2vixU86Peej73VtqMTlQ/UvlKsvEenRnOaR7p8QibtcTQmf2To7QIu03JyEf7jFKYES69mbzB6rJ0eTMTpHzG/mHJcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660492; c=relaxed/simple;
	bh=PH/HGfCULVJOgit529o7v2lhhjZu5jWzgs4hyJl9MFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cp0o3tWKRYg1rKFvTWezxVjsAieciO5IDxDHbUuTrEc3vRRC7FgneeIj7kx+1fzpOe7HXIWNVC+sL4DaH4uzACxbnjLIGMZbgjXmqFHaxVWwBj1ryYbjwZ0yJ96yWWYhwIEl0a1bR9fScm5vm/rQBNMNw4mN4vdSlb/E+FKbxkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de; spf=pass smtp.mailfrom=wyraz.de; dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b=p5g6gSgO; arc=none smtp.client-ip=46.38.234.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyraz.de
Message-ID: <d12635f9-9706-4dbd-8adb-d673c6a77202@wyraz.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyraz.de; s=dkim;
	t=1757660092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9g4cSXuxYRp0rdSLRLAXIbO1yTQFeU5KJnkDIVxhG4=;
	b=p5g6gSgO9DvSApxRDD5zx36YbzTtqulE2EAI17cMdN14ZiuuefT2mP5iwAGtZGixPlrDj1
	RQx97QiALlqttPLoeLuOtoRC9CGQ7o+iIixJpxgzTXYELakWwRjOnCqtBbMiMRhmDgb/mb
	E/y3fujTqXeHaRt8VNoO5DBEOFV4a1EPHmvUPfRt2bgWfaACFFM6Dew6xJOvAgIbcyXUkl
	9kdDr+zn9rqTR02JvrJbAwYt4XF1LmGFQLijcJawuAzhzlv+pzORTqH8C9Ic7myADG9qiN
	nUlnB77qebgt9bEDLR7sP0s91kMZEsycN82i0iLAC4chTQtd+RS+A/qO2QdMTQ==
Authentication-Results: mail.wyraz.net;
	auth=pass smtp.mailfrom=michael@wyraz.de
Date: Fri, 12 Sep 2025 08:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Add Marvell ML352 to drivers/usb/serial/option.c
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
References: <aFJzdxe_ykNw6cP_@homebase1>
 <aFLM7jZBEk6a7W-k@hovoldconsulting.com>
Content-Language: en-US, de-DE
From: Michael Wyraz <michael@wyraz.de>
In-Reply-To: <aFLM7jZBEk6a7W-k@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---

Hello Johan,

sorry, I totally missed this mail. "usb-devices" is not available on 
that device. Hope this does it too:

lsusb  -d 1286:4e3c  -v

Bus 001 Device 002: ID 1286:4e3c ASR Mobile Composite Device Bus
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239
   bDeviceSubClass         2
   bDeviceProtocol         1
   bMaxPacketSize0        64
   idVendor           0x1286
   idProduct          0x4e3c
   bcdDevice            1.00
   iManufacturer           1 ASR
   iProduct                2 Mobile Composite Device Bus
   iSerial                 3 200806006809080000
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x00c4
     bNumInterfaces          5
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         2
       bFunctionClass        224
       bFunctionSubClass       1
       bFunctionProtocol       3
       iFunction               5 Mobile RNDIS Network Adapter
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass       224
       bInterfaceSubClass      1
       bInterfaceProtocol      3
       iInterface              5 Mobile RNDIS Network Adapter
       ** UNRECOGNIZED:  05 24 00 10 01
       ** UNRECOGNIZED:  05 24 01 00 01
       ** UNRECOGNIZED:  04 24 02 00
       ** UNRECOGNIZED:  05 24 06 00 01
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x85  EP 5 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval              16
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass        10
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              5 Mobile RNDIS Network Adapter
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass       255
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              8 Mobile Diag Interface
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       255
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface             11 Mobile AT Interface
       ** UNRECOGNIZED:  05 24 00 10 01
       ** UNRECOGNIZED:  05 24 01 00 00
       ** UNRECOGNIZED:  04 24 02 02
       ** UNRECOGNIZED:  05 24 06 00 00
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x8c  EP 12 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval              16
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x8e  EP 14 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x0d  EP 13 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        4
       bAlternateSetting       0
       bNumEndpoints           3
       bInterfaceClass       255
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface             11 Mobile AT Interface
       ** UNRECOGNIZED:  05 24 00 10 01
       ** UNRECOGNIZED:  05 24 01 00 00
       ** UNRECOGNIZED:  04 24 02 02
       ** UNRECOGNIZED:  05 24 06 00 00
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x8a  EP 10 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval              16
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        16
   bNumConfigurations      1
Device Status:     0x0001
   Self Powered

Am 18.06.25 um 16:27 schrieb Johan Hovold:
> On Wed, Jun 18, 2025 at 10:06:15AM +0200, Michael Wyraz wrote:
>> Add the device id of the Marvell ML352 to option.c so that the
>> device is recognized as usb-serial device.
>>
>> Signed-off-by: Michael Wyraz <michael@wyraz.de>
> Thanks for the patch. Looks good, but we may not want to bind to every
> interface of the device.
>
> Can you please post the output of 'usb-devices' for this device? I
> assume it has more than one interface, do what each interface is used
> for?
>
> If you end up resending, please use the common prefix in Subject, for
> example:
>
> 	USB: serial: option: add support for Marvell ML352
>
> (e.g. as can been seen by running 'git log --oneline' on the files
> you're changing).
>
> Johan

