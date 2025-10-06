Return-Path: <linux-usb+bounces-28916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD66BBEE58
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 20:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A1A3C135F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 18:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C3527FB05;
	Mon,  6 Oct 2025 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LhNX4cAs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD82D73A5
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759774492; cv=none; b=J5KcjEbhYMSUz1u6o3lRAHdHr4qK4XIncwR7DQndYyjehPirXuDLEvW0aObq28xMDj5WWr58Rp+LjPJIHoVxstAKHQSNaLOKXXogztTAqQatnoPBieL4a3VmxrQiHhougbB/c7822/YVLPKCS+DQFvDl3SCfqifkKl30YkJ4nw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759774492; c=relaxed/simple;
	bh=trbH+RBHFbMSvHNJb80X6sMHHCbIbStqa+XO3jg9VJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqhAQoHualOmos7fwgs5ceUMj/V+/Qo9dpgfRkD48AzksGlY9l3s27aXsP030qw7LdktEEXfuUsndrkh0ylp+q+QsFAjhke8zv0XM5zn5DxHGPnwSfv/w6IVXqZ8i6RrwBIsyLNJeImvEer9EZ0eTFEnYN5oKCXFLS4dQ1nY2S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LhNX4cAs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso12165940a12.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 11:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759774488; x=1760379288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5zKELJjnoMWXTwflSb9pZCyL0jJ8a2504V57HVgxI4=;
        b=LhNX4cAsXfgwOHcyx5DZ8lQhY3pUHNUUV4MH2m4zH3AxW5AgZ6lgBVMmgMrEF0bb5W
         0/fWxMpzzSjC+ZmAfh02MVwBF8qqkY8orE+RLrZPnR7/usraDy/267MnKHJBBk9Z2ZTZ
         cAAKvMTn36vhWZJYVDfMgOexm51kuzRE0O/xuKtoxFe0EYJGeKZwwCcO3iHdIhDq5AQl
         CjRYXNssooNpHGqV/dXYyYrUCyQiIh7HWXEBLy6vHOlw0qgR7jWKshRHbB670Sudn6h9
         LjXazs7xIZGQeKc2hxLSd6WIujdRNSYFp/2LhuPTXV+Tt0UXuUU+vG/yWj+AuTF5YsBj
         mqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759774488; x=1760379288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5zKELJjnoMWXTwflSb9pZCyL0jJ8a2504V57HVgxI4=;
        b=crqyD9Ew2Jap9XVsFHpv8RinXc+/kK7/qsaQLZWWNUWpdzUoqoRR0jdKPz81xWMdeM
         2odNZEnbMqO6kDJWQaPr3TXZ8Dj/xVKEafa2V/3kNl+STYcsJoNmw+tpa9Yul0IaXoVh
         jMO1OsHega36XaZth6fxmbeg34moMdPxnqYOX6jl7s7O3j9eW0ldYCBn8ex2yU5xIYXX
         vAIVk0KrtVqAiTPIOV5Y9/MVOtbFN6LPp/ev8NVD653PehJR3YqHOx7sXZEP0EyFYx2M
         wNVsq3s6Sigy0rYSPybL8rQUu8fhX9Gb6gtY237+2r0HPyZyo/EZmhFQj/puXg2d3WT1
         rEPg==
X-Forwarded-Encrypted: i=1; AJvYcCWANyVC6H8VATMyCKiJwvw+qagZnzINMbf0XlukC6eP1tLfWWsbrsBLC4ZnmIdzosWY3i5NdajQC/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0qnY4k9nFqlCaGmiln5Kbd1CPMD+2P71CDG0aWXRmgO/ujHC
	KfNky4uRD/2eGSlQF73J91S9+/zVs7rnOhgcNSvfh6peZontr81EABzn+iD+HJL1uZI=
X-Gm-Gg: ASbGncsyZeodPnsqOOMf6lBGuNH5WFlBhb/62VGm60I/kvUa28R1eMWZYocYj0oI84W
	ouKPc5O9KwHD4R2fmhyt1cLU5op4PMYskOo8otlGblTHgJl47y2RZ5O5kKWbXZx2Jaf/mNWV4Pg
	fmf0s+JHV9RmTT/zQcarznTMX0U/b9DI1dDsZ6yh0Du+X46MGcB3Y9n+G48QNJ7Optv8GH88lPU
	HoNSx2/yiLaxPHjzoMT5bFHuGxVsKCc+2yxyBplGMBRSLj1o1mHZrYiA0QDlPTHNVW8UQRCpbcA
	/QAKk3189KXplY5WqeaFdca+L2Jj6sLYHcXDzWhqNq39blnM6EpgwGhvFIyBarNQA6kk8bmUxbP
	YsyTdV6idAwEi4ncOYJdNBMZw2Kz9PssCGK31PznxpeYQZACvYVR7a4iFQRJ6dEOa8ebfmz9SKg
	W2qMpc4JQoSbd2ZR07C54Grks=
X-Google-Smtp-Source: AGHT+IH7YtQv94BVFCzmZW0eZWkb269xR5m6QB9pGAtwp0pLMy65rk43nW1eBqNxN8nnz175k9povQ==
X-Received: by 2002:a05:6402:1ecc:b0:61c:db49:aec0 with SMTP id 4fb4d7f45d1cf-639baf1bbc5mr580637a12.5.1759774488179;
        Mon, 06 Oct 2025 11:14:48 -0700 (PDT)
Received: from ?IPV6:2001:a61:13de:9201:18a:22d7:431f:aa60? ([2001:a61:13de:9201:18a:22d7:431f:aa60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788100129sm10732203a12.24.2025.10.06.11.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 11:14:47 -0700 (PDT)
Message-ID: <692e4565-507e-430c-ba97-dc6d6539f800@suse.com>
Date: Mon, 6 Oct 2025 20:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding ISO
 transfers
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Oliver Neukum <oneukum@suse.com>
Cc: "amardeep.rai@intel.com" <amardeep.rai@intel.com>,
 "r.kannappan@intel.com" <r.kannappan@intel.com>,
 "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20251006164500.131899-1-oneukum@suse.com>
 <20251006180610.lhlzfeo5z6zxgekm@synopsys.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20251006180610.lhlzfeo5z6zxgekm@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.10.25 20:06, Thinh Nguyen wrote:
> On Mon, Oct 06, 2025, Oliver Neukum wrote:
>> eUSB2V2 devices use a bcdUSB of 0x0230, not 0x0220
>> to identify as eUSB2 devices, yet their endpoint companion
>> descriptors must also be parsed.
>>
>> Fixes: c749f058b4371 ("USB: core: Add eUSB2 descriptor and parsing in USB core")
> 
> This is not a fix.

It is backwards compatible to eUSB2V1, isn't it?
So we are failing to treat an eUSB2V2 devices as
an eUSB2V1 device when we should do so.
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>> ---
>>   drivers/usb/core/config.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> index baf5bc844b6f..c96ef5e9b74d 100644
>> --- a/drivers/usb/core/config.c
>> +++ b/drivers/usb/core/config.c
>> @@ -455,7 +455,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>>   	 */
>>   	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
>>   
>> -	if (maxp == 0 && bcdUSB != 0x0220 &&
>> +	if (maxp == 0 && bcdUSB != 0x0220 && bcdUSB != 0x0230 &&
>>   	    !(usb_endpoint_xfer_isoc(d) && asnum == 0))
>>   		dev_notice(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
>>   		    cfgno, inum, asnum, d->bEndpointAddress);
>> @@ -507,7 +507,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>>   	}
>>   
>>   	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
>> -	if (udev->speed == USB_SPEED_HIGH && bcdUSB == 0x0220 &&
>> +	if (udev->speed == USB_SPEED_HIGH && (bcdUSB == 0x0220 || bcdUSB == 0x0230) &&
>>   	    !le16_to_cpu(d->wMaxPacketSize) && usb_endpoint_is_isoc_in(d))
> 
> eUSB2v2 supports isoc OUT also.

Noted 
	Regards
		Oliver


