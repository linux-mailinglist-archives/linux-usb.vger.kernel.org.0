Return-Path: <linux-usb+bounces-10113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78E8BEE7F
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 23:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3075B2861B2
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 21:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3247371B4C;
	Tue,  7 May 2024 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WHrajR/4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724085FDDB
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715115759; cv=none; b=EOpQkEuONF0BjoJQnPjBG3Z8q1U7SOUslaQ+zWX8pu8l83T4/2i2IvTmpofbZbQknUJDu5h065r5Ug+r3Q1eE6P6HiW1ABOGmtC+NB6fp9NpPoQrzufgO2+UP0dTGg0XPbYux4C4NAGXgxxFI5og6abL6mow6pl7lNvDjs7c85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715115759; c=relaxed/simple;
	bh=dcQifiRnXyza9FW3AFxD5R6V5brxDJJNyh8xJafA31M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TJwax/Ce6Ct0H9GtenC+222fL6wyntXzeE7j1c4Omfe8bKK0qKmN5Zxrq35YgsDrM0zyBQToILgQuR3U2I+RYa8L19vFaYwNpNEmry7ZQXGXBahg9t68rnpsYfGDEuimg1RjW/N+MfgyHajmac9q7Li0rixMqwjXM/IetQIXVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WHrajR/4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ec76185c0fso15315ad.1
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715115758; x=1715720558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PXKFoq0ULEX3xHp8L36jXb3EJwEiOL/fywMVJVG9EM=;
        b=WHrajR/4mTPdVWLUxjY7VmaVQHGq6UnoFgvXR2adb1Z0QZXwzqCsyZfuUExndYDV16
         t1gD3WizvKEatxalEFMvWygzuCGy4Ss35y+PRNoTDzOZyQMnOBjrBaRr14KxgK84Wbmp
         3Z1k9MqmALDuXBA1ce6tEWVQDU/vRdxGBfZpUjscoCZVOGvusH5cxeAtHW9bVwG21q2X
         uIShYsQQosvT+06h0HW8U+Rihe9C5ydFNe0uY7Ga75l4u5HuB5DquDynxD05hBR+6KBO
         MDmq80fJyrl8Npec1c+7GAuPdLlPLjKfZI/dYXTXgGS4Lsm3LyJ8kU0EG17pY1VP4KBl
         RBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715115758; x=1715720558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PXKFoq0ULEX3xHp8L36jXb3EJwEiOL/fywMVJVG9EM=;
        b=rteZvmEBnvm+ZzPegZ7P0/ISgFSIlucAn3F6otgBNNnISxziY/+YRwR4Rh4id84dJp
         ysh+moFGg72YmuJ/eu0UtXhqq09gZr3IY8mFlXU3NdcDh3EwyEyjwddFM3Tu77eNNccp
         M7M6IQzvMJn97+sHnsWQSIMxtF+jKWJ29qWy3KW4lgdzyAN5OtrMIWfcpH+aQU2dpMrw
         QQU5fYaSCkT1AwPWMdqjEQfzdSHnAcjNX5tcvor6LOJ2BtirSx3U+4cQBwLAtLJPm6TS
         jkaYjVsuTmKJwfHKicg8HaLgrK0H7nqM5mJptFCgpV1hYRyFDvLkhSyarVkKeh6S5zOc
         FQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp6kj1QbEXZ24QgJJMgIARYUlgONB8/y/0ARysnnMHAXmqEeB6BiQR6H51RvrKg57L6pZIWXKQpQ2INOLfFv2IGpUY6Yr/mSOz
X-Gm-Message-State: AOJu0YzVCgcU0OgqVeH/yt3734DAZoFFXVShDItIq84pgnhr/zNJuCMr
	uIXIipSPoK8hHuv+6Y9v9s47no8Q3ax683P/JDgnbzNhghzNYqhO1gdaXsAdJg==
X-Google-Smtp-Source: AGHT+IFcx/zsGsoDBaEiKVAbBojnCcKrrO7wSjP8pFBrW3hvSPSIk4fhXYgzXGfwU+OuYarW72LzoA==
X-Received: by 2002:a17:903:947:b0:1e3:e08c:5a98 with SMTP id d9443c01a7336-1eebe6a7a10mr95045ad.29.1715115757192;
        Tue, 07 May 2024 14:02:37 -0700 (PDT)
Received: from ?IPV6:2620:0:1000:8411:3fc2:a19c:5e57:eee5? ([2620:0:1000:8411:3fc2:a19c:5e57:eee5])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902e80a00b001e826e4d087sm10453005plg.142.2024.05.07.14.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 14:02:36 -0700 (PDT)
Message-ID: <d174e5cf-402d-48a0-b077-89740b873b73@google.com>
Date: Tue, 7 May 2024 14:02:35 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: typec: tcpm: unregister existing source caps
 before re-registration
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 badhri@google.com, rdbabiera@google.com, linux-usb@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20240424223227.1807844-1-amitsd@google.com>
 <y4lla7vqsrl75qhesmyexq7yvcu6hl6kryh3ctwq5ci3r4mlpw@rsnhfkmlmtt7>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <y4lla7vqsrl75qhesmyexq7yvcu6hl6kryh3ctwq5ci3r4mlpw@rsnhfkmlmtt7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ondřej,

On 5/7/24 09:19, Ondřej Jirman wrote:
> On Wed, Apr 24, 2024 at 03:32:16PM GMT, Amit Sunil Dhamne wrote:
>> Check and unregister existing source caps in tcpm_register_source_caps
>> function before registering new ones. This change fixes following
>> warning when port partner resends source caps after negotiating PD contract
>> for the purpose of re-negotiation.
>>
>> [  343.135030][  T151] sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
>> [  343.135071][  T151] Call trace:
>> [  343.135076][  T151]  dump_backtrace+0xe8/0x108
>> [  343.135099][  T151]  show_stack+0x18/0x24
>> [  343.135106][  T151]  dump_stack_lvl+0x50/0x6c
>> [  343.135119][  T151]  dump_stack+0x18/0x24
>> [  343.135126][  T151]  sysfs_create_dir_ns+0xe0/0x140
>> [  343.135137][  T151]  kobject_add_internal+0x228/0x424
>> [  343.135146][  T151]  kobject_add+0x94/0x10c
>> [  343.135152][  T151]  device_add+0x1b0/0x4c0
>> [  343.135187][  T151]  device_register+0x20/0x34
>> [  343.135195][  T151]  usb_power_delivery_register_capabilities+0x90/0x20c
>> [  343.135209][  T151]  tcpm_pd_rx_handler+0x9f0/0x15b8
>> [  343.135216][  T151]  kthread_worker_fn+0x11c/0x260
>> [  343.135227][  T151]  kthread+0x114/0x1bc
>> [  343.135235][  T151]  ret_from_fork+0x10/0x20
>> [  343.135265][  T151] kobject: kobject_add_internal failed for source-capabilities with -EEXIST, don't try to register things with the same name in the same directory.
>>
>> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
>> Cc: linux-usb@vger.kernel.org
>> Cc: stable@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index ab6ed6111ed0..d8eb89f4f0c3 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -2996,7 +2996,7 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
>>   {
>>   	struct usb_power_delivery_desc desc = { port->negotiated_rev };
>>   	struct usb_power_delivery_capabilities_desc caps = { };
>> -	struct usb_power_delivery_capabilities *cap;
>> +	struct usb_power_delivery_capabilities *cap = port->partner_source_caps;
>>   
>>   	if (!port->partner_pd)
>>   		port->partner_pd = usb_power_delivery_register(NULL, &desc);
>> @@ -3006,6 +3006,9 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
>>   	memcpy(caps.pdo, port->source_caps, sizeof(u32) * port->nr_source_caps);
>>   	caps.role = TYPEC_SOURCE;
>>   
>> +	if (cap)
>> +		usb_power_delivery_unregister_capabilities(cap);
> This certainly looks like it's asking for use after free on port->partner_source_caps
> later on, since you're not clearing the pointer for the data that you just freed.
>
>> +
>>   	cap = usb_power_delivery_register_capabilities(port->partner_pd, &caps);
>>   	if (IS_ERR(cap))
>>   		return PTR_ERR(cap);
> This can easily fail if caps contain invalid PDOs, resulting in keeping pointer
> to freed memory in port->partner_source_caps.

Makes sense. I will send a fix for this. Thanks for the review.

Thanks,

Amit

>
> Kind regards,
> 	o.
>
>> base-commit: 0d31ea587709216d88183fe4ca0c8aba5e0205b8
>> -- 
>> 2.44.0.769.g3c40516874-goog
>>

