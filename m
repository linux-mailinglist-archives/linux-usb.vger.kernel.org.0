Return-Path: <linux-usb+bounces-28790-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B6CBAA073
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 18:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C3018978EA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 16:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A41030CD84;
	Mon, 29 Sep 2025 16:40:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from framboos.boetes.org (framboos.boetes.org [185.69.247.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95D305968
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.69.247.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759164059; cv=none; b=jEnjlgQmBhUgS3nnHAKc/ytUn4RzN0qQLFjohFq/ibi1rK11hEU3J8qMn1CW5gCBZNVPJYfoXthLXNMoRu7ffD13EGDiLhb8kO1EnZPXOMho0Gl/kZNwdeZiW7AUHDmJ8gICncZwisBn4zVmHetU9WRCvPALFyILNTQKqLvmcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759164059; c=relaxed/simple;
	bh=w/aGy1L7Wtn8TZuIsPMYR1wkvwgNYB8pVO1gOwKPWjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oApKzQ91pCizQOnNG6Co/On0nf5ar2XZ/U4YrXx3MxHLa64BUEXY0kMo6vfzpboj4j4o0RP6E2cE8Tbad3JbYGUmEpaXxFwb/N1fdNMEmaIKhOUb02NDGivZIhZwewOYHgi9LJ7fSv2FThFkoIJGRqhlBXZsyxJZKdlTuQ6Zrlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=boetes.org; spf=pass smtp.mailfrom=boetes.org; arc=none smtp.client-ip=185.69.247.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=boetes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=boetes.org
Received: from [192.168.254.99] (unknown [192.168.254.99])
	by framboos.boetes.org (Postfix) with ESMTPSA id D1A257F548D2;
	Mon, 29 Sep 2025 16:40:34 +0000 (UTC)
Message-ID: <6e5d2ec5-f747-4905-89ef-45796104421d@boetes.org>
Date: Mon, 29 Sep 2025 18:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: As per request
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <7c7d0b10-9969-45e8-9440-563960645c36@boetes.org>
 <e31f129f-1119-4a22-a71b-d0d559ac2a07@rowland.harvard.edu>
From: Han Boetes <han@boetes.org>
In-Reply-To: <e31f129f-1119-4a22-a71b-d0d559ac2a07@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Most certainly.

%  sudo lsusb -v -d0603:8611

Bus 001 Device 006: ID 0603:8611 Novatek Microelectronics Corp. 
NTK96550-based camera (mass storage mode)
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0603 Novatek Microelectronics Corp.
   idProduct          0x8611 NTK96550-based camera (mass storage mode)
   bcdDevice            1.00
   iManufacturer           1 Cycliq
   iProduct                2 Fly12 Sport
   iSerial                 3 966110000000100
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0020
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     80 Bulk-Only
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
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
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0000
   (Bus Powered)

On 9/29/25 4:13 PM, Alan Stern wrote:
> lsusb -v -d0603:8611

