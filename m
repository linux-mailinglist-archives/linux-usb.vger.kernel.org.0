Return-Path: <linux-usb+bounces-12160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7562E92ED72
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 19:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8C81F23214
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 17:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C4516D4ED;
	Thu, 11 Jul 2024 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e7i8KamD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0B450FA
	for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717665; cv=none; b=PB/9J2dBIdBYC+VZftTRDaBQzGLmed9s9LLJIMOWQPx0pB0ORB00qKctdA7E8oONpG/e/g2f2kCBS6IcFQoJkrpX/N+eDuaHPOG/mOk1tw9/Ce+7FXe7e2yU3JwbVXktd9eonkw01I10/xzZFqSRe77BbmX+sEZUhiYMTWlII1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717665; c=relaxed/simple;
	bh=Hhd3ojOGTTgHpOvaGKhK7MvcUfGq2Nyal2Kl375BA7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJuuQwf0kfKs/eVh9UgDq0iB3QzawKP7JvB9A3znJyeS0n4d/udmq1pdhDuDn7PZxYmBkFs1LpgGtgTWcFWnNjAneE5jcdROw6GyVkWXn2rT4/a1R/ebkvrs6E3CVFGQQ4P31bg3akOvBgr5Q17kBAUFruHK4wQ13eLpAIkun0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e7i8KamD; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-804bc63afe2so4262839f.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720717663; x=1721322463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=An08rRhrhJhB7bf/IvxT+wmTxYRUICZmPhbaIqcpp7M=;
        b=e7i8KamDVmMdRbFuA0hX+MLZjvzksTIfUH8fbYnBlINAXT0TnE0g4qpMX7T5BRRfnw
         RZlWCv1J03XO4tgGStoTegvg8iWbnPQIwfR1Eq46BsFp0eL/vgnd6Tu5QNsMvBtuQYvH
         q9R5tmI2JG/hko3k/93SHDapqkqSU233fKHSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720717663; x=1721322463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=An08rRhrhJhB7bf/IvxT+wmTxYRUICZmPhbaIqcpp7M=;
        b=VdzHXaiHlvvMqm2pAxBXVjZkdOK0u1UWK9lY463I3gsit3g6Mub4Lb9SokAmiHmkHp
         RGPWVtSy5XzjXGUqtMsFM83EyPBp0PQg+74KQT86iqPdwtCgZZiCM7/6Te1XBXpWVEkt
         NSbyrnUR8+CfQRWTQBSQYh1ohYIWq5bdwSr9cdVeHS1VQ0+WBkpHqqSzdlkNVkzrBrpJ
         5yJhi4L9keo1yfy25c8UU6+Lmqscl5Kb6WnhdBjYR/D0oQcO33Zc6zPoEBA6vBI48b3t
         Q2m2k9SXw5qCpOVuwgGboPXBCJ9dmppYJBxTIK7X3pP8Did4Df7WYxvHr1743QARGesb
         HyEw==
X-Forwarded-Encrypted: i=1; AJvYcCWPUSSkhKIw3TBtMDYMrCp+1ixigbn46ZM8lc2fndhCk5hGevJX5R4y2+4eZC+sVAeZkf/f9v9h0cmmqq6Nfd7a4IOqf/+ox134
X-Gm-Message-State: AOJu0YwtHaOhJ60dtyqxJNoE4y5ILKtM7lfp+1gzR51JVjQgm0BszpBX
	OuY737x8bGQcGad02GQWRvU9c9xvHG1QoEQgHUop5YUVIKhH+/AWNICd/xrYYCo=
X-Google-Smtp-Source: AGHT+IHqoLg56yT2gi2Uy85KWpBQaIPD/Amh6eUdTyJccERl1zHSfvNnHQO0XEuEkmiEL9EAm/00vg==
X-Received: by 2002:a05:6602:6103:b0:7f6:85d1:f81a with SMTP id ca18e2360f4ac-80004dea088mr1009106539f.2.1720717663326;
        Thu, 11 Jul 2024 10:07:43 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7ffed680f78sm192970039f.50.2024.07.11.10.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 10:07:42 -0700 (PDT)
Message-ID: <36d991df-2a25-42d5-be44-d731e962c6d7@linuxfoundation.org>
Date: Thu, 11 Jul 2024 11:07:42 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usbip: Add USB_SPEED_SUPER_PLUS as valid arg
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240705091902.789643-1-ukaszb@chromium.org>
 <2024070534-sculpture-spooky-daa6@gregkh>
 <CALwA+Nakqb1re4H8YO8FnaYGOKP-jWLhvtnkvYAvdkRato-cRw@mail.gmail.com>
 <5cea8570-318d-47af-a669-cc89253de803@linuxfoundation.org>
 <CALwA+NYjE3REBAJR6y+UMdZC2otozBtrFZ_eFY4yN2DjOboP1Q@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CALwA+NYjE3REBAJR6y+UMdZC2otozBtrFZ_eFY4yN2DjOboP1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/24 04:50, Łukasz Bartosik wrote:
> On Tue, Jul 9, 2024 at 9:27 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 7/5/24 04:43, Łukasz Bartosik wrote:
>>> On Fri, Jul 5, 2024 at 11:40 AM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Fri, Jul 05, 2024 at 09:19:02AM +0000, Łukasz Bartosik wrote:
>>>>> Add USB_SPEED_SUPER_PLUS as valid argument to allow
>>>>> to attach USB SuperSpeed+ devices.
>>>>>
>>>>> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
>>>>> ---
>>>>>    drivers/usb/usbip/vhci_sysfs.c | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
>>>>> index e2847cd3e6e3..d5865460e82d 100644
>>>>> --- a/drivers/usb/usbip/vhci_sysfs.c
>>>>> +++ b/drivers/usb/usbip/vhci_sysfs.c
>>>>> @@ -283,6 +283,7 @@ static int valid_args(__u32 *pdev_nr, __u32 *rhport,
>>>>>         case USB_SPEED_HIGH:
>>>>>         case USB_SPEED_WIRELESS:
>>>>>         case USB_SPEED_SUPER:
>>>>> +     case USB_SPEED_SUPER_PLUS:
>>>>>                 break;
>>>>>         default:
>>>>>                 pr_err("Failed attach request for unsupported USB speed: %s\n",
>>>>> @@ -349,7 +350,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
>>>>>         vhci_hcd = hcd_to_vhci_hcd(hcd);
>>>>>         vhci = vhci_hcd->vhci;
>>>>>
>>>>> -     if (speed == USB_SPEED_SUPER)
>>>>> +     if (speed >= USB_SPEED_SUPER)
>>>>
>>>> It's an enum, are you sure this will work?
>>>>
>>>
>>> Gcc (gcc (Debian 13.2.0-13) 13.2.0) which I used to compile the patch
>>> does not complain about this change at all:
>>>     make
>>>     ...
>>>     CC [M]  drivers/usb/usbip/vhci_sysfs.o
>>>     LD [M]  drivers/usb/usbip/vhci-hcd.o
>>>
>>>
>>>
>>> Without the patch I was getting the following error when trying to
>>> attach a device:
>>> vhci_hcd: Failed attach request for unsupported USB speed: super-speed-plus
>>>
>>> With the patch USB SS+ device attaches successfully:
>>> [248223.654445] vhci_hcd vhci_hcd.0: pdev(0) rhport(0) sockfd(3)
>>> [248223.660701] vhci_hcd vhci_hcd.0: devid(65538) speed(6)
>>> speed_str(super-speed-plus)
>>> [248223.668540] vhci_hcd vhci_hcd.0: Device attached
>>> [248223.936363] usb 2-1: SetAddress Request (2) to port 0
>>> [248223.941698] usb 2-1: new SuperSpeed USB device number 2 using vhci_hcd
>>> [248224.138020] usb 2-1: LPM exit latency is zeroed, disabling LPM.
>>> [248224.331984] usb 2-1: New USB device found, idVendor=18d1,
>>> idProduct=0010, bcdDevice= 0.10
>>> [248224.340416] usb 2-1: New USB device strings: Mfr=1, Product=2,
>>> SerialNumber=3
>>> [248224.347805] usb 2-1: Product: Linux USB Debug Target
>>> [248224.352984] usb 2-1: Manufacturer: Linux Foundation
>>> [248224.358162] usb 2-1: SerialNumber: 0001
>>>
>>> I hope this will resolve your doubts.
>>>
>>
>> What about the other places that check for USB_SPEED_SUPER?
>> take a look at attach_store() that checks for USB_SPEED_SUPER
>> and picks the correct vdev.
>>
> 
> This patch already updates attach_store() to select the correct vdev.
> Please see lines:
> -     if (speed == USB_SPEED_SUPER)
> +     if (speed >= USB_SPEED_SUPER)
> 
> Also there are two other places where USB_SPEED_SUPER is used:
> 1) vhci_hcd.c:1158: hcd->self.root_hub->speed = USB_SPEED_SUPER - IMHO
> no need for a change as it is ok to attach USB3.1 device (taking into
> account it is backwards compatible) to USB3.0 HC

Let's update them all.

> 2) vudc_transfer.c:34: case USB_SPEED_SUPER - this seems to be
> unrelated to this patch

This isn't related - however feel free to send the patch if you are
bale to.

thanks,
-- Shuah

