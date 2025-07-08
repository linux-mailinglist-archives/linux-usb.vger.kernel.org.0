Return-Path: <linux-usb+bounces-25566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D7CAFBFA3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 03:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92FED7A4132
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 01:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F541E32CF;
	Tue,  8 Jul 2025 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qjZv90y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614593770B
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 01:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751936707; cv=none; b=nuxO6yC2XR2drGijtJo6Ga1+eUCDJcZgIybVvdGHnR5WEDl32X2/1JZWn8yfZlaBCwwy64/zhfx85BgvTyLbOckw27SLJ+xnDF8DuqSDZJbYrxqTiSlhCrU5ywohTfPXy3M/W6Eb1ZYLgyIchlhcszXJSfTMBWtAFaxnmFCzhK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751936707; c=relaxed/simple;
	bh=i84yZfnml941z8sD89nX4ooEHdytXw1Osqc2CBQFlo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0gcF3C7gAxGoN7U03LppUHkbyaq6jVCvHr07IAAQCJYxnrZ0+NU9xDtdpK51DUz/XwT5PmyvXe9dS7z1BOcfKysjGogI/qQyQry3v9t75oYmYrpJ6B+kU4oA9g8LWIk5THGtD6sx2PgZg2rXf0E54P6UbX0v+ZlinCicu5hedU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qjZv90y; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3137c20213cso3672850a91.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 18:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751936706; x=1752541506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fces0U4vBTah/txjkL1uaWJbDbXttpdltEcQXNSodqI=;
        b=4qjZv90y0ynjfqTR5Dyat894ViEK3Li0ZYt6AisylDs6Auyxq3RTPdS8F07pslUn0B
         B6KHtcc2DBIWSe8qqNqn/bTWlhRrbu61pzIB7DA7xPaA3A2SO/OjR290EDT0nEmPGWqw
         wbnMHSiKMe8+Xc9AZlIsRXRZxaTwc8DDU8xLA//pab85mTfrinspj6ylV4bB11n1ctoC
         U48DhQHddzACyPJwk6GpP/CerbXomn4TeKPnwTXw4JuHx0o2kjgglRyJWc5reH/SYN/m
         C0Rrhj5kAlaf//5YtWi7aruDEOJHvSQn9FANpvLnHqrB1f915c1Nb6U2+C9b8ibIghfC
         sftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751936706; x=1752541506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fces0U4vBTah/txjkL1uaWJbDbXttpdltEcQXNSodqI=;
        b=udyoDS38mtmpiFNFK9u+pvSrn79fMe5yUThsTCIxnuwEhGBZ/QGrK2KGwVUB1DqvfW
         g0MTO7xn7IMcueQW2DyrJrWy45C8YsNFLXZvYVPMUXBN/WMZHekPwaVMn2sgGJXzfKvM
         dwmJZbE7SZUmfdgrfgNI8uB9NoJZ41bEbPG+Ullon4r9CvzLbGS5NBKMbrp19sDjZRyr
         QPNI0MqWJuvTDu3rXoWJHCi4JzGCNF7AttCBWZtforGrZvmshAdLeqfll1gDH4R34Mif
         G+FomJN1Xf51rWk4McsDXgVuxyvzs5npHDy98eWzIGS564UDfbLex/Ua3DHf5g3KkQQC
         QsUg==
X-Forwarded-Encrypted: i=1; AJvYcCWreZ/6I0OHOJebti+dqhn/pTm4pVPAlMO8TCbyRkf/7z/Bh6kBB/aLoe/T1GsNF6TbRQd2ZcvO4CU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCS/gl6UlWeCAtVdk3JSKlEf2R0ReW15aqPXaIMSNhH+h/iPDz
	x8xGhRAynEKmt07uWa6XdJBLn0SeSXT3XlDYwN06ZrTKJuZsGYdIk1R9HD0Mx02COQ==
X-Gm-Gg: ASbGncsjtsJRFYkaMMw6Xxm1zrtjV67CiwshuDBH6OB9JsR1Vmqw5Qt0LIqhOoNX43o
	1HxzRJuuJutEVjsxf8oGsM7FFB0j5iI8IcCbggLvgdSt+BeGCknM+Ol9p3HywWGNTHfwOGpCEY6
	T08vp5oxdfc0S6Hl0CnkDTNOWTRvqzxCtL9aqv9WF8BEpb51Rd0DWCyJievO9u/13Gn/RTAjToX
	tgHIks5jJFX6oOEP+Ey9ORaLbwJ1YO5Opso3o030UoaB8wXzY+9bm87cnpXYBJWgmfLofAqRrDF
	/BjoBCi1XOe5/eSSCAG1n0achTYX2v1lTHmXgRGGZpcYV6CZ5UUvcge5BQ2lU4MK793Ukdi4M72
	A3uMu2jKdQq99jVSMvJTKC67fgrFv/wSHWvxtn+Ga4HWAmm+SGDPCGIRUFaslGF/SrHYQpM0=
X-Google-Smtp-Source: AGHT+IGLNKYmGe1JyOgmsT56Z5FG9Cik3JHHYN0Bra0/4AUj+wLy8xc/9t+rwkpUYrPvw07PkZPv4w==
X-Received: by 2002:a17:90b:57c7:b0:311:ffe8:20e6 with SMTP id 98e67ed59e1d1-31aac432932mr20537013a91.3.1751936705207;
        Mon, 07 Jul 2025 18:05:05 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:990d:1c2a:935c:f693? ([2a00:79e0:2e14:7:990d:1c2a:935c:f693])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c220bfbe3sm524860a91.46.2025.07.07.18.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 18:05:04 -0700 (PDT)
Message-ID: <4dba5e10-9a8d-45bb-b1cb-8b4d563e7f97@google.com>
Date: Mon, 7 Jul 2025 18:05:03 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] power: supply: core: add vendor and product id
 properties
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@kernel.org>, Kyle Tso <kyletso@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250507-batt_ops-v2-0-8d06130bffe6@google.com>
 <20250507-batt_ops-v2-4-8d06130bffe6@google.com>
 <5zjoseyepm3tnqbwrh77liwuuqgmghn4kcj43urnk7z4yrttlx@yqqpnnlifdk5>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <5zjoseyepm3tnqbwrh77liwuuqgmghn4kcj43urnk7z4yrttlx@yqqpnnlifdk5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sebastian,

On 6/23/25 2:44 PM, Sebastian Reichel wrote:
> Hi,
>
> On Wed, May 07, 2025 at 06:00:25PM -0700, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add the following properties:
>>    * Vendor Identifier (VID): Assigned to the battery manufacturer by USB
>>      Implementers Forum (USB-IF).
>>    * Product Identifier (PID) assigned by the manufacturer to the
>>      battery.
>>
>> This info is required by USB Type-C PD devices containing batteries.
>> This enables the USB Type C devices to respond to a Battery capacity
>> request from the port partner by querying for the PID & VID assigned to
>> the batteries. Refer to "USB Power Delivery Specification Rev3.1 v1.8"
>> Chapter 5.5 Battery_Capabilities Message.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   Documentation/ABI/testing/sysfs-class-power | 19 +++++++++++++++----
>>   Documentation/power/power_supply_class.rst  | 11 +++++++++++
>>   drivers/power/supply/power_supply_sysfs.c   |  2 ++
>>   include/linux/power_supply.h                |  2 ++
>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>> index 2a5c1a09a28f91beec6b18ca7b4492093026bc81..5495e82885b2294cdfd5ace0e7e5fcbeadfccb5f 100644
>> --- a/Documentation/ABI/testing/sysfs-class-power
>> +++ b/Documentation/ABI/testing/sysfs-class-power
>> @@ -814,11 +814,22 @@ Description:
>>   		Access: Read
>>   		Valid values: 1-31
>>   
>> -What:		/sys/class/power_supply/<supply_name>/extensions/<extension_name>
>> -Date:		March 2025
> Why does this remove existing Documentation?

Oops. I think that probably happened while resolving merge conflicts  I 
guess. Will fix.


>
>> +What:		/sys/class/power_supply/<supply_name>/usbif_vendor_id
> I think we can use USB_VENDOR_ID and USB_PRODUCT_ID for this like
> everyone else?

Agreed.


>
>> +Date:		May 2025
>>   Contact:	linux-pm@vger.kernel.org
>>   Description:
>> -		Reports the extensions registered to the power supply.
>> -		Each entry is a link to the device which registered the extension.
>> +		Reports the vendor id assigned to the battery manufacturer by USB
>> +		Implementers Forum (USB-IF).
>>   
>>   		Access: Read
>> +		Valid values: 0x0-0xffff
> If I haven't missed something the formatting will be in decimal. I
> think the hex format is more sensible, so this needs some extra
> handling in power_supply_format_property() in power_supply_sysfs.c.

I see. I will add special handling for these in 
power_supply_format_property().


>
>> +
>> +What:		/sys/class/power_supply/<supply_name>/usbif_product_id
>> +Date:		May 2025
>> +Contact:	linux-pm@vger.kernel.org
>> +Description:
>> +		Reports the product id assigned to the battery by the manufacturer
>> +		(associated with usbif_vendor_id).
>> +
>> +		Access: Read
>> +		Valid values: 0x0-0xffff
>> diff --git a/Documentation/power/power_supply_class.rst b/Documentation/power/power_supply_class.rst
>> index da8e275a14ffb9f84bae9ae1efc4720a55ea3010..6d0a6bcf501e719fa4454845b583a8b38d371bb4 100644
>> --- a/Documentation/power/power_supply_class.rst
>> +++ b/Documentation/power/power_supply_class.rst
>> @@ -213,6 +213,17 @@ TIME_TO_FULL
>>     seconds left for battery to be considered full
>>     (i.e. while battery is charging)
>>   
>> +USBIF_VENDOR_ID
>> +  Vendor ID (VID) assigned to manufacturer or device vendor associated with the
>> +  battery by USB Implementers Forum (USB-IF). This property is described in
>> +  "USB Power Delivery Specification Rev3.1 V1.8" Chapter 6.5.5 Battery
>> +  Capabilities, Section 6.5.5.1 Vendor ID (VID).
>> +USBIF_PRODUCT_ID
>> +  Product ID (PID) assigned to the battery, such that if the VID belongs to the
>> +  manufacturer then the PID will be designated by it. Similarly if the VID
>> +  belongs to the device vendor then the PID will be designated by it. This
>> +  property is described in "USB Power Delivery Specification Rev3.1 V1.8"
>> +  Chapter 6.5.5 Battery Capabilities, Section 6.5.5.2 Product ID (PID).
>>   
>>   Battery <-> external power supply interaction
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
>> index edb058c19c9c44ad9ad97a626fc8f59e3d3735a6..534ed3cd049866fa747455bb6dae1ec2dc5e2da6 100644
>> --- a/drivers/power/supply/power_supply_sysfs.c
>> +++ b/drivers/power/supply/power_supply_sysfs.c
>> @@ -211,6 +211,8 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
>>   	POWER_SUPPLY_ATTR(TIME_TO_EMPTY_AVG),
>>   	POWER_SUPPLY_ATTR(TIME_TO_FULL_NOW),
>>   	POWER_SUPPLY_ATTR(TIME_TO_FULL_AVG),
>> +	POWER_SUPPLY_ATTR(USBIF_VENDOR_ID),
>> +	POWER_SUPPLY_ATTR(USBIF_PRODUCT_ID),
>>   	POWER_SUPPLY_ENUM_ATTR(TYPE),
>>   	POWER_SUPPLY_ENUM_ATTR(USB_TYPE),
>>   	POWER_SUPPLY_ENUM_ATTR(SCOPE),
>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index a35b08bd368e9305554e1a608dc8e526983cfa12..100eb559dcede938595ffbf83bc5ef3645a5a172 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -165,6 +165,8 @@ enum power_supply_property {
>>   	POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG,
>>   	POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
>>   	POWER_SUPPLY_PROP_TIME_TO_FULL_AVG,
>> +	POWER_SUPPLY_PROP_USBIF_VENDOR_ID,
>> +	POWER_SUPPLY_PROP_USBIF_PRODUCT_ID,
>>   	POWER_SUPPLY_PROP_TYPE, /* use power_supply.type instead */
>>   	POWER_SUPPLY_PROP_USB_TYPE,
>>   	POWER_SUPPLY_PROP_SCOPE,
> Neither this series, nor the Pixel 6 one seems to have any user for
> these new properties? This becomes part of the kernel ABI, so we do
> not add new properties without a user.

I realize that there's no current driver that supplies these values atm. 
I plan to add it for 
https://lore.kernel.org/all/20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be/ 
driver once it gets accepted.


Thanks,

Amit

>
> Greetings,
>
> -- Sebastian

