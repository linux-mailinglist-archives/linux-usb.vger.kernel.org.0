Return-Path: <linux-usb+bounces-26825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B5B25959
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 04:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723E31C26941
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 02:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34071E2602;
	Thu, 14 Aug 2025 02:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b="SJBVl1IM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.valdk.tel (mail.valdk.tel [185.177.150.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5062BD03
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 02:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.177.150.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755136993; cv=none; b=b02qSiVQosRoTUQszTk0cgQc7i/X8/elDg1JW/8Cmzi8C2ynSSBU9hdY0iP2xl2ITJeeGJ15OkEcoSxuV/cI0yIquAkUTfxbI2wzpv6OoYMxcZmYQ3qfic/z4f+xQVsZV9GF6CLmVlJo5KVqiSf6r3bC32ghxUw26rqqTt/mugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755136993; c=relaxed/simple;
	bh=0WPoeGZD9iG20n5CyTax+WMKZmNaOwhPuNTvpO/VIOE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tvHtDOb9+n1YclowiQMZcq/fzM+lSnyZs4pvml9fAiRGKP28vLcpdXhHGyqnG9XpwLR3+BFDqoNR7UZkhnn5QRqqRVd+9nQookidKlKTrcfJdrkF4wqedrwx0rjVH3JzAFNphT+4Jp85t87XdKZJbOuQgkT3At+ZfrC/Jcb0j70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru; spf=pass smtp.mailfrom=valdikss.org.ru; dkim=pass (2048-bit key) header.d=valdikss.org.ru header.i=@valdikss.org.ru header.b=SJBVl1IM; arc=none smtp.client-ip=185.177.150.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=valdikss.org.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valdikss.org.ru
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E58A01BBCA10
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 04:56:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
	s=msrv; t=1755136601; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:autocrypt;
	bh=mG1vKACkNVF40tDBzEEnYcT7X3oGIxn9emFAfB6hJ+o=;
	b=SJBVl1IMcXEwjR2DbyTq8m+uGyvWqItTIIDEg2ubxlvNqAnMISb+5HWWfzRZPodk2fmirO
	Gyo2Lt6bvB4RIFmyvy/PkCvkGlrHO2JQ0xLPb8aNUdP3UlNvHKTlJiifIaLCeyFZwzb7K6
	l1NiF3YdsHCENmte/Mq+cqa/DYYh3S+IdnYqaHUzhdAkqaoo7yhO3tT9KeiZ9eQzIeAGax
	QvDxMHpUaq1HSGAbGfyOx+7wc1wC7IYv6NNAab6OaR6vcAcGVfgfbQ2XzAhwmuQIYMpE6c
	ywAl9foHedzb2rY/plTiCxjtTX/5hOknTIT6eHdzuvO5jXWgclp1d/DcOcEQZw==
Message-ID: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
Date: Thu, 14 Aug 2025 04:56:40 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru, en-US
To: linux-usb@vger.kernel.org
From: ValdikSS <iam@valdikss.org.ru>
Subject: USB 1.1 Full Speed OHCI slow/high latency
Autocrypt: addr=iam@valdikss.org.ru; keydata=
 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
 OEcVmRU/pw5/zoQyQg==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

I have an old USB 1.1 Full Speed printer (Canon LBP1120) which can't 
print large documents due to insufficient USB 1.1 transfer speed/high 
latency on Linux.
I believe this may be Linux OHCI bug or deficiency.

If I connect the printer to USB 2.0 port (uses "companion" OHCI 
controller), the printing engine reports data underflow using its 
proprietary command protocol, and the full-page picture fails to print 
(only 1/3 is printed).
However if I connect it over USB 2.0 Hub (EHCI, hub does internal Full 
Speed conversion) the printer works fine.
Same applies to USB 3.0 XHCI ports, via which the printer also works fine.

The issue is seen on Orange Pi Zero3 (Allwinner H618) and Radxa Rock S 
(Rockchip 3308) boards, with different USB controllers.

There's no USB-level errors (captured with tcpdump -i usbmon0), all URBs 
are success, but they are much slower in OHCI than with EHCI Full Speed 
via hub.

Here's a speed comparison using simple Python script with asks the 
printer status 10000 times.

Direct connection, OHCI:

# python3 speedtest.py
Opening printer at /dev/usb/lp0...
Testing 10000/10000...
Avg delta: 1.916 ms
Min: 1.443 ms
Max: 2.891 ms

Connection via the USB 2.0 hub, EHCI:

# python3 speedtest.py
Opening printer at /dev/usb/lp0...
Testing 10000/10000...
Avg delta: 0.696 ms
Min: 0.590 ms
Max: 1.072 ms

The printer is from year 2002, with USB 1.1 full speed, and was designed 
to work via USB 1.1 controllers.
Any ideas what could be wrong?


# lsusb -vvv
Bus 003 Device 004: ID 04a9:262b Canon, Inc. LaserShot LBP-1120 Printer
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x04a9 Canon, Inc.
   idProduct          0x262b LaserShot LBP-1120 Printer
   bcdDevice            1.00
   iManufacturer           1 Canon
   iProduct                2 Canon CAPT USB Printer
   iSerial                 3 0441BFZ2
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0020
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         7 Printer
       bInterfaceSubClass      1 Printer
       bInterfaceProtocol      2 Bidirectional
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               0
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
   Self Powered



# lsusb -tv
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=ohci-platform/1p, 12M
     ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=ohci-platform/1p, 12M
     ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=ehci-platform/1p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=ohci-platform/1p, 12M
     ID 1d6b:0001 Linux Foundation 1.1 root hub
     |__ Port 1: Dev 4, If 0, Class=Printer, Driver=usblp, 12M
         ID 04a9:262b Canon, Inc. LaserShot LBP-1120 Printer
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-platform/1p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-platform/1p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub

