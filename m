Return-Path: <linux-usb+bounces-12084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30892C3E3
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 21:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E2AFB22028
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 19:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0AC17B056;
	Tue,  9 Jul 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D1gwj913"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269771B86C9
	for <linux-usb@vger.kernel.org>; Tue,  9 Jul 2024 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553261; cv=none; b=bh6wu3l/AwjvYYy8gez0Ah5BxXIdp6SbLFupA5kOYaZRN/ugmHK9IW0BgUXXlMW8mf6uyavV8OW81pGQ0+JVdsBDHHYjrMwdZ9dh1JvKC/6Hp/6PXlw1nobuvAV9uE+Jm0ZjUQi9scZBhABzcXJyocEeX+0xieqCEqkZWrNM8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553261; c=relaxed/simple;
	bh=6eNrhfxirk6EsjP5LudO3W1/PKxF9UiRPAgYYEOcEsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DibYzQyVvaBWu3d6BPkQDdctk17f12sTZYAEEyDPaK9mLgefgbqTgLx/mabEQikgHDuoiv6NJOwybP10JOcpTm4A1exNwQJzX5vA/fxSORhq5+DoX0sZHaDhEVBnNGzhVBIyysnN+AWvzBCp/fXZAzSZdwW2VaaKdcmBL+Zm0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D1gwj913; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7fb3529622dso9941139f.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Jul 2024 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720553259; x=1721158059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8oX2WJR3WCrnAfII/hx7aHMaH88yrCDDlT2hslJNukM=;
        b=D1gwj913kPgYOpX8GU/ikD84RpEq5dwoIvy6xelSm2ZME5aeBvyXf9ckfd/kfSTgBg
         MauxjjmCkyyFm2NfO3QRJEoGJ0LafezS3gI9YgQSNyBk2f1+X9sYthXYbWW6G1wqNm38
         j2DYdPfG9qrxsjGy7ImldYliLIzN8pPOWqr5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553259; x=1721158059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8oX2WJR3WCrnAfII/hx7aHMaH88yrCDDlT2hslJNukM=;
        b=LUCwbGYlXOm4lINg8khZpjaD2caatZs4DduhA8lPzXDlPyX5DyER4YSSrbGeeNTAon
         bj8pIXwL78WbOnpuRQgof+wFteNP3gPLvFbzkJceo9EP6EaWm19HTeYyHjhhx6iHSC6Q
         rjRClVbk2pDPTiqV5oQDv4mm4NTicD6MrBPNfFgsyTmh2RH93RxRC54259PomWuOc7oU
         PZ8meClFsiVPxkdlGBSqvq8BJMWQxNjPg/CZ7yW10pQKwvb5UdEWjlkMl6Hcu30FoUG6
         d/ukZ6RyOg/Bm7hJ1JryOv9K7Wio8l4lTEZjZDXLe3BGBqxTQSj6AXqiz6jkUyGY7KRt
         lrLg==
X-Forwarded-Encrypted: i=1; AJvYcCW6yoXgJVBGHgxM7HIgsizX1ht1OO21zEG4Hqifs3O/X+8rdCMpZfW10FTMbTO/KKpt/dntrOAni5xiDIR2OINMOjoP5ZedhbQE
X-Gm-Message-State: AOJu0Yyh1ClSxK0FEu9h7ZZ4Oh5I/nbK3eDsBuvfOxADPhStKYGEPGcl
	iUXRg5luF5a2CmgaUhSmICwIk0r5Mlek10DoZvaSckvrwkycIpTiq3i9tKF9f6M=
X-Google-Smtp-Source: AGHT+IGnqZNy41MCB7GyaPX8gKqxKSmH6HOtl71ROw10ZeedFOegtu0JTSWE8R7Aivc5vZJPGb4CjA==
X-Received: by 2002:a05:6602:160f:b0:7f9:444e:4918 with SMTP id ca18e2360f4ac-80003120d96mr428261539f.2.1720553259215;
        Tue, 09 Jul 2024 12:27:39 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1bf82c9sm639488173.115.2024.07.09.12.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 12:27:38 -0700 (PDT)
Message-ID: <5cea8570-318d-47af-a669-cc89253de803@linuxfoundation.org>
Date: Tue, 9 Jul 2024 13:27:38 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240705091902.789643-1-ukaszb@chromium.org>
 <2024070534-sculpture-spooky-daa6@gregkh>
 <CALwA+Nakqb1re4H8YO8FnaYGOKP-jWLhvtnkvYAvdkRato-cRw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CALwA+Nakqb1re4H8YO8FnaYGOKP-jWLhvtnkvYAvdkRato-cRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/5/24 04:43, Łukasz Bartosik wrote:
> On Fri, Jul 5, 2024 at 11:40 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Fri, Jul 05, 2024 at 09:19:02AM +0000, Łukasz Bartosik wrote:
>>> Add USB_SPEED_SUPER_PLUS as valid argument to allow
>>> to attach USB SuperSpeed+ devices.
>>>
>>> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
>>> ---
>>>   drivers/usb/usbip/vhci_sysfs.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
>>> index e2847cd3e6e3..d5865460e82d 100644
>>> --- a/drivers/usb/usbip/vhci_sysfs.c
>>> +++ b/drivers/usb/usbip/vhci_sysfs.c
>>> @@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
>>>        case USB_SPEED_HIGH:
>>>        case USB_SPEED_WIRELESS:
>>>        case USB_SPEED_SUPER:
>>> +     case USB_SPEED_SUPER_PLUS:
>>>                break;
>>>        default:
>>>                pr_err("Failed attach request for unsupported USB speed: %s\n",
>>> @@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
>>>        vhci_hcd = hcd_to_vhci_hcd(hcd);
>>>        vhci = vhci_hcd->vhci;
>>>
>>> -     if (speed == USB_SPEED_SUPER)
>>> +     if (speed >= USB_SPEED_SUPER)
>>
>> It's an enum, are you sure this will work?
>>
> 
> Gcc (gcc (Debian 13.2.0-13) 13.2.0) which I used to compile the patch
> does not complain about this change at all:
>    make
>    ...
>    CC [M]  drivers/usb/usbip/vhci_sysfs.o
>    LD [M]  drivers/usb/usbip/vhci-hcd.o
> 
> 
> 
> Without the patch I was getting the following error when trying to
> attach a device:
> vhci_hcd: Failed attach request for unsupported USB speed: super-speed-plus
> 
> With the patch USB SS+ device attaches successfully:
> [248223.654445] vhci_hcd vhci_hcd.0: pdev(0) rhport(0) sockfd(3)
> [248223.660701] vhci_hcd vhci_hcd.0: devid(65538) speed(6)
> speed_str(super-speed-plus)
> [248223.668540] vhci_hcd vhci_hcd.0: Device attached
> [248223.936363] usb 2-1: SetAddress Request (2) to port 0
> [248223.941698] usb 2-1: new SuperSpeed USB device number 2 using vhci_hcd
> [248224.138020] usb 2-1: LPM exit latency is zeroed, disabling LPM.
> [248224.331984] usb 2-1: New USB device found, idVendor=18d1,
> idProduct=0010, bcdDevice= 0.10
> [248224.340416] usb 2-1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [248224.347805] usb 2-1: Product: Linux USB Debug Target
> [248224.352984] usb 2-1: Manufacturer: Linux Foundation
> [248224.358162] usb 2-1: SerialNumber: 0001
> 
> I hope this will resolve your doubts.
> 

What about the other places that check for USB_SPEED_SUPER?
take a look at attach_store() that checks for USB_SPEED_SUPER
and picks the correct vdev.

This change is incomplete and will break things.

thanks,
-- Shuah


