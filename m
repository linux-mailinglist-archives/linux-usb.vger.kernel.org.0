Return-Path: <linux-usb+bounces-35520-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM18DmR+xWnw+QQAu9opvQ
	(envelope-from <linux-usb+bounces-35520-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 19:43:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4BD33A508
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 19:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F3FC3034521
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 18:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BEE39D6D2;
	Thu, 26 Mar 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="felgqF8S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B939768C
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550619; cv=none; b=aXQhkCSBWjwYM1N4BRyrDRFdWiyIl85wHgAwTSzQw08r8KqA8fudcYUT4aTl4jQackghz8kCoawcowfSWXHAna4aOb/iLFbygR+J+mykN2A7P8nxQrvwv3VQHaPll0RoRfqgx0D4BU/O2sJ6eMrUIe46c6JtUm4VeNKrM3ZK6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550619; c=relaxed/simple;
	bh=InXSrhRJSMDGAdbor7H8X1jrD9DikbaAHcnldY6jQ+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpbUtLb/A3pOFpomWy8TIJmehzbUBU4IzbTHe8FusotzRegjSDddJ8VOenfpEEHGUVP+bQUQKXoJjMk7jkhPTDgyVX+xnxxPz9/4bxyIAMcWNQcU/2IdByWZ+8FtcmhulWdyTNWfe1xreTtnmSbU9hho7/FOTbtGtPmXm083V2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=felgqF8S; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46703fb602fso474635b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774550616; x=1775155416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRkfsmO5ysCB/VQlJ8SAYpDp5OzoDNr1Qv+WT6tm4Os=;
        b=felgqF8SytzfUZUD93wAV6EirE8TL1+BB3cD5GWodwVQ7zO0E+Lte/j+6izit1/nls
         xnH+hdwe7dupgGPjSkS7YyU4EK3LPdOrxbK6Zk+sYCXIdbmOZRaUO8TZLyGhzHRma0wQ
         kn8SdlhUnxTX4CXesuGzmfLbYkzwxUdlaJjy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550616; x=1775155416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRkfsmO5ysCB/VQlJ8SAYpDp5OzoDNr1Qv+WT6tm4Os=;
        b=gDpxlAeRrMzeHBtXBhsGpZUwOg8OHCqHSWJLO4a8y4Tuy8Kv7uVgfcz3mQ5wzpMOqQ
         o9Qh+TCirU7UNFj+f1P2ng+NeughN4hbV5ASFDIhSVGoc1lvDMXsGlJ3VXiGWupjBPnI
         qx/zDJuj8gjSs+Y1FhWL0AnqgRCFYXPvykSzIRT1wCTLOxr2EDKrhKQO7tBS2JoeHqC0
         OijqIUo8UDUqYXNMGvhrVWydc3g6fKkLJdzumsk+4ZSa8gkgQ4If3hcfw+cNTTncfDSH
         y8/yaXffj559R4QDANrFseSxs5MFPbiYtQRmm21jL0ytRgi858cKnp2cJNtRlCUJBRy2
         G9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgvCJD4RJVGLYorAsM0AZx5ep4tAAXMSQqpd0YDq8mS5u5uPzK0PYPxGJ/9QrtNiRtHr8FN6kjuUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcRK9ra8B1etUV2QR6QIcIMlS8hNC7dT7KOw9btZxvfWZIR9eX
	XaxF9T+l5nWGjhfQQlrPGDBwWbuXC2VaHDnDfzsSxgaqQwVst2VTu1BxvH8ojFWuEJI=
X-Gm-Gg: ATEYQzy3DO8GRrycFckUsUGbwO75Hsu4EzvTfstF2P1bjKym+vZFawOJd7krnzO6dGI
	XfjeLRTTLCQYa7V8OUXJJ6ca8qiR5MOBPAbCHahxIv6nooH8v9Q+2t4u4T1n1Lta2tfPayBhDsR
	IqPfDhnseFk0ndBIDvyV8Nb8Kly9dMzj7faWahJmjBe1+ADFpi/fGkHRalHWeHnwynuYf8vhAXB
	XnKo39VDAjSdycFIGdj1ga2l58P/VyNnUCFvNPAb3yeo3mEYHHF+xHSbC6edo70J0tuHwLZIrfa
	HpwXLg2xk/Degrg2NmWO/1KMifVyCIkO6Lh6yTtHRuBd9mNAnTa6iVErjHiXJPP5qZLpW/m1oNu
	Oh151WkPX5jJIAq8oTqB6iE6oMaaZIdhpsuSB6H1GIy5fXoY9tj+J4oDHhrXTkrHVubfjO82IbD
	Mjw/rVpUleqwN4zxqNgzaNacHmPbkJb4WirEVgdqb9tC2uoA==
X-Received: by 2002:a05:6808:1582:b0:467:14c7:a8ba with SMTP id 5614622812f47-46a5c6e70d1mr4401455b6e.32.1774550615648;
        Thu, 26 Mar 2026 11:43:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a7099df08sm2139529b6e.15.2026.03.26.11.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:43:35 -0700 (PDT)
Message-ID: <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
Date: Thu, 26 Mar 2026 12:43:33 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
To: Greg KH <gregkh@linuxfoundation.org>, Zongmin Zhou <min_halo@163.com>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
 <2026032615-donated-chaps-9eac@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2026032615-donated-chaps-9eac@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zenithal.me,vger.kernel.org,gmail.com,kylinos.cn,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35520-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: BC4BD33A508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 02:43, Greg KH wrote:
> On Thu, Mar 26, 2026 at 11:10:02AM +0800, Zongmin Zhou wrote:
>>
>> On 2026/3/25 16:58, Greg KH wrote:
>>> On Wed, Mar 25, 2026 at 10:26:34AM +0800, Zongmin Zhou wrote:
>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>
>>>> Currently, usbip_generic_driver_open() doesn't verify that the required
>>>> kernel module (usbip-host or usbip-vudc) is actually loaded.
>>>> The function returns success even when no driver is present,
>>>> leading to usbipd daemon run success without driver loaded.
>>>>
>>>> So add a check function to ensure usbip host driver has been loaded.
>>>>
>>>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>> ---
>>>> Changes in v2:
>>>> - Use system calls directly instead of checking sysfs dir.
>>>>
>>>>    tools/usb/usbip/libsrc/usbip_device_driver.c | 7 +++++--
>>>>    tools/usb/usbip/libsrc/usbip_host_driver.c   | 8 ++++++--
>>>>    2 files changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
>>>> index 927a151fa9aa..45ab647ef241 100644
>>>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>>>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>>>> @@ -136,10 +136,13 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>>>>    	hdriver->ndevs = 0;
>>>>    	INIT_LIST_HEAD(&hdriver->edev_list);
>>>> -	ret = usbip_generic_driver_open(hdriver);
>>>> -	if (ret)
>>>> +	if (system("/sbin/lsmod | grep -q usbip_vudc")){
>>> What happens if the module is built into the kernel?
>>>
>>>>    		err("please load " USBIP_CORE_MOD_NAME ".ko and "
>>>>    		    USBIP_DEVICE_DRV_NAME ".ko!");
>>>> +		return -1;
>>>> +	}
>>>> +
>>>> +	ret = usbip_generic_driver_open(hdriver);
>>>>    	return ret;
>>>>    }
>>>> diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
>>>> index 573e73ec36bd..f0ac941d4f6e 100644
>>>> --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
>>>> +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
>>>> @@ -31,10 +31,14 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
>>>>    	hdriver->ndevs = 0;
>>>>    	INIT_LIST_HEAD(&hdriver->edev_list);
>>>> -	ret = usbip_generic_driver_open(hdriver);
>>>> -	if (ret)
>>>> +	if (system("/sbin/lsmod | grep -q usbip_host")){
>>> Same here, what happens if it is built in?
>> Thank you for pointing this out.
>> I apologize for not considering the built-in module case.
>>
>> You are right that using lsmod | grep would incorrectly fail when usbip_host
>> is built into the kernel (CONFIG_USBIP_HOST=y).
>> Usbip has always been built as a loadable module (.ko) by default, which led
>> to this oversight.
>>
>> To address this issue, would the following approach be acceptable?
> 
> Wait, what "issue" are you trying to fix here?  Why can't you just check
> for opening the correct device node when the host opens the file and if
> that fails, report an error?  Doesn't that happen today already?
> 

The problem Zongmin is trying fix ish when usbipd starts, it looks for
exported if any - if it doesn't find any it assumes there aren't any
exported and doesn't detect that usbip_host driver isn't loaded.

refresh_exported_devices() doesn't have the logic and it shouldn't
include that logic because this hook is called periodically to
refresh the list of exported devices. Starting usbipd and loading
the driver are distinct steps and without any dependencies.

This patch he is trying to add that detection so a message can be printed
to say "load the driver".

A message can be added easily to cover two cases:

1. usbip_host driver isn't loaded
2. There are no exported devices.

refresh_exported_devices() will not find any devices in both
of the above scenarios. It isn't an error if it can't find
any exported devices.

An informational message when refresh_exported_devices()
when it doesn't find any devices could help users.

Zongmin,

Would adding a message that says
"Check if usbip_host driver is loaded or export devices"
solve the problem of hard to debug problem you are addressing here?

thanks,
-- Shuah

