Return-Path: <linux-usb+bounces-12311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099793887D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 07:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BA2FB20D46
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 05:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E88C17993;
	Mon, 22 Jul 2024 05:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgM46YTs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0E217580
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721627454; cv=none; b=LfzXGchfHfUHJVcwTccBOeL/kQWLrPh7YX9m9uk2VkHUZwVTDVASXoQrv6Zx0tpIYfwkMm176hxWFPvfexT/tIPa3YzxaKFxIS4e/IbwU1fO3DpdkTgbF6tyvuod6Saftzi2xrlhl14kyuuiEcm3ghcR6TEtHqId/OFf1l1K7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721627454; c=relaxed/simple;
	bh=e6RuvdcL7YUHlWFaq/ivM85WO7SQz7pbAf7sRf1qAMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxDjDt4zNglbKJe6zDIVgiMG/QV4htOqqv3i0/q1VhLGRG45/tmsfPYCmNvFnoA0k5LCsYqbP+poSUd86nxRzv8A/A0nhOlwyVvnEZWcJIvIT87T0YXL4/4y9rrWuT9k71z9riM38icmWgW+sO6M1GKGG5B8tiFQIKASMHFJqY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgM46YTs; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e05f4c63de6so4026986276.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Jul 2024 22:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721627451; x=1722232251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v18bjqwEkoyTKT/DsJbDzOqaIOFjuWn/pR1NzBIlEnE=;
        b=ZgM46YTsPWp+Ld9DaWUPp7RwzleVKLnNtVhd3HTOpErDVtCdc+NRrm7xzRhw41HTOM
         0iqC1ytWW68IdHp9g8xQ9i1sq3nzzv5m0z1hc+L8l9FXf/5hXXQDYOIXFgvKP8BeaBuJ
         tZ/xHp/jtXpq3nGFQBTiHh1nRIKpTEoIbqeuZJtUo1I3IQFUky2lHaR+8UcrvOTyp6ur
         5QReeRhvMKRO4Fy9DWeIezV2jEUX6TqK1P+JsddAqaDC+Itsz/vPni84gNDGJd9lZMc5
         W4914Wq/oitJoTnO3VkeXR35ntiqyrDgJArJzjDXeqb3vMnI5hrKfIxqhi0RpO/N/y/X
         kZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721627451; x=1722232251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v18bjqwEkoyTKT/DsJbDzOqaIOFjuWn/pR1NzBIlEnE=;
        b=BWbFgB+QhQLWmGMv35CxNAW1fw4n6c2dctUiLcbSOSA+qgTscP5y/qJxuFf9l6fIf/
         6V3c7+smVLU7bRcUx39P3YCWMOjo6icBqdNrAQjy80Nm8IzjC5mfierqusVOMeaPIdEV
         +ei/9kwbUa/btS7u2UOLrfdQaTWTB/N2dRgDijQc9VLcecPY+jAYQbL/5xnEaQp2C08B
         RY9GI3YaUcQ9vVVPAz9nZdP5HWgb5PG2KMhRDPV9Rd5SfD4tq9r5c+pULVFdh65bo3C1
         g5l5lWblKpY6TEEIwdvuclaW+MdnOTY2qFz2n6kLuqBQcgNdUt0NtYfaYf/QxWAQ5UJG
         ghxA==
X-Gm-Message-State: AOJu0Yxr5fvs8NKFAE6hX5mtH+9vsPej616vM/qB5rdFuAndxSPdA03e
	6bMmA3yELmGB5wI1ujeLfdkDm/JGJ25/v+gNHbAfXqQF8ekp0C1H
X-Google-Smtp-Source: AGHT+IFGhBq9hM7PenYVeuheDiV/JbpYpihiOgH1nD0oR8/00If89neQs3Hx9aLrea/2qoDA0Nd5dQ==
X-Received: by 2002:a05:6902:2311:b0:dff:2ce8:cc1b with SMTP id 3f1490d57ef6-e087067ad91mr7513186276.35.1721627451373;
        Sun, 21 Jul 2024 22:50:51 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.85.174])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-79f0a4d3cdbsm4052249a12.9.2024.07.21.22.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jul 2024 22:50:51 -0700 (PDT)
Message-ID: <db42e639-4d7e-4970-903c-0aaf688ba71e@gmail.com>
Date: Mon, 22 Jul 2024 12:50:47 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cp210x VID and PID of my device are missing allthough the should
 be there
To: Greg KH <gregkh@linuxfoundation.org>, G4bandit@mail.de
Cc: linux-usb@vger.kernel.org
References: <fbde5b4b-6640-4cc9-b39a-7eafcc0d29ba@mail.de>
 <2024072207-overstay-counting-8e61@gregkh>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <2024072207-overstay-counting-8e61@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-22 11:48, Greg KH wrote:
> On Sun, Jul 21, 2024 at 08:09:12PM +0200, G4bandit@mail.de wrote:
>>
>> Hi
>> my device with the
>> VID = 0x28e9
>> PID = 0x028a
>> should be supported by the cp210x driver. But in fact this VID and PID does
>> not appear.
> 
> Why do you think this driver should support this device?
> 
>> See the output:
>> alias:          usb:v3195pF190d*dc*dsc*dp*ic*isc*ip*in*
>> alias:          usb:v2626pEA60d*dc*dsc*dp*ic*isc*ip*in*
>> alias:          usb:v2184p0030d*dc*dsc*dp*ic*isc*ip*in*
>> alias:          usb:v1FB9p0701d*dc*dsc*dp*ic*isc*ip*in*
>>
>> The manufacturer recommends to use the driver maintained in the linux
>> kernels.
> 
> Which driver exactly?  Do you have a link to that recommendation?
> 
> thanks,
> 
> greg k-h
> 

This device announces itself as a HID device so should
not be handled by any usb-serial driver.

Bus 004 Device 002: ID 28e9:028a          Pulse Oximeter
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x28e9
   idProduct          0x028a
   bcdDevice            1.00
   iManufacturer           1
   iProduct                2 Pulse Oximeter
   iSerial                 3 Pulse Oximeter
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0029
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower              300mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      0
       bInterfaceProtocol      0
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.11
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      39
          Report Descriptors:
            ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               1
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               1
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
   (Bus Powered)

thanks
Lars

