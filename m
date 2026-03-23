Return-Path: <linux-usb+bounces-35344-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OWNI/OYwWlNUAQAu9opvQ
	(envelope-from <linux-usb+bounces-35344-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:48:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50B2FC97E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2AB131497A4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 19:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A514D33F58D;
	Mon, 23 Mar 2026 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KBc7PUoT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC342352C39
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293461; cv=none; b=A5aLUrRf8FbWC1frwAQa9ldM/UzSXyRhExeQ8VsVfMhkhRc1JNRiCzUbh5saBCv0U7ZOprNYyCKBMqUaZTVxHv8xs3DRibBMfge+qqBmFA7ge1zzLjvJXDrj9MttxpPpNfbv72MVvQ8oNvkUBDH/K4SrGcKyqGcuC/BVmKDz2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293461; c=relaxed/simple;
	bh=f+NiDH+HhxjfBEd93H8IUyTtzrdC7ZrcHeqPtPmp+hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfhrQtl+IkH3hjhtp3+wq8ET8dhK/+fg3xPVvywq9aAMlucAGH7dlsPqdBybypCcksvS0ZDc0tUj44Yr2dgQrdFc2dGZ2+4b1mMRIq+eTmAd6ldk63Ora+BOAzqFNs7f/4uKX3hZa6HI7AVZNAiaNAUjN6t4fQbnLwV6oj5zX+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KBc7PUoT; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d7e565c877so1772401a34.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774293457; x=1774898257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4h0KeXt0HnJYGKiG0FvkZEq4UcA/U1HoyYUgZQTD/nk=;
        b=KBc7PUoTfzhNMx/HXHjGM6JlziIY+Afw4MrIAdI0m1xvNn8YExJzoqsbX9abuAiQbv
         AQh1hKFl9dDNgjdkgBCZrnmSwxfLcdb3Hz/yrnZqY5eG4USz+GrSTCtiYP4xSwwEBHjc
         1wWEhWxpVLPphJBhnWvckP+n0pZX2NWiFkYD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293457; x=1774898257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h0KeXt0HnJYGKiG0FvkZEq4UcA/U1HoyYUgZQTD/nk=;
        b=rxzIAmsPgRwq7qJVPlR7lS64rc/eUV/FtSUyuycKIOOIhxeojKWXjpW+fGcU6tStGP
         lUDg4aYAFB4N4tBPCeB4+EE7H8vb5tAmDJwOrsF8ys6jNejOE1aQT6etErapQKOfO7yb
         e45tXU77OhjegPVhB7YNzkLf0BgaPMbLKctaDti9fCgPaXUDomzRLVAdTfdExJRaTaKv
         Kq/VXMdM1lbV01cN6Cjj+/6PuzZk4CjMiybefxlZJ2gqCdVikrPsAx0BZeiFJB/UXKxH
         5+uPbWlr1XWxVBdumIpFRtJGraB1Lrcyh7C7h3Xh0T7n8hvdFibbBMQkehxbAaEW9/Ak
         Qknw==
X-Gm-Message-State: AOJu0Yz27J2MzgybxfvM25hnNKgaKKTzh25Y8aMdyrlnNv129+tzjj6K
	EI8A8LU9dqvRAzjisphDEFTZOWUIRm/3NtX9RsSHtanWSw726DhnFoUFMNIW6IJFN8Q=
X-Gm-Gg: ATEYQzyP096Rg6oXZ0PwBVKSbON91wcvvM7MrSWPkDGSAfaKp1bYrNDDfjjHDrJ5ZlL
	V7UX3gVNGLtAqt79D4F0RYzyAwTI0K+SSj8e+8+ZJy9L8M2Eo7gqqjyItAnyB+J+OzKS7punBY1
	8N+VCP8Ugs2PnpPcUw++iPfMZsWsPGklUmG9p7/UXhxnXl56C8PURPeKNnILQYtDL8y2EXLk4Sw
	oOhkP9icyEUIVxgsZCrKpY+5y+/IInaPVBuRF1wJlMs2aJN8AeVNU1YfvQeF6vw+bqeJxLA3kHb
	jEcqIU0CIvRJYPH+M5uchGYSXGJLVED5O5eQLoLi9954p4H5cafbe2XpguHVx5TXCK1RiP2C9Q3
	QPT29sxjV+aEVJI7pr3/yj3t3Xxo8AEEGRQQWp3qgaldtO2PCkFZv6+wUbBflVSTqx1J9p9B45S
	Ff2jWxse+z6IrHlHZWJ2HzO6NTOBFuNDryZwM=
X-Received: by 2002:a05:6830:264c:b0:7d7:d216:2b26 with SMTP id 46e09a7af769-7d7eae5d1a2mr7882861a34.4.1774293457499;
        Mon, 23 Mar 2026 12:17:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eac17b0asm10146229a34.9.2026.03.23.12.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 12:17:37 -0700 (PDT)
Message-ID: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
Date: Mon, 23 Mar 2026 13:17:36 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: Add usbip host driver availability check
To: Zongmin Zhou <min_halo@163.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260303081720.84868-1-min_halo@163.com>
 <190cf50b-7b1d-4b97-9f9c-86242cff1391@linuxfoundation.org>
 <bf5faa3f-6b59-4977-a29f-811049289b14@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <bf5faa3f-6b59-4977-a29f-811049289b14@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,gmail.com,kernel.org,zenithal.me,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-35344-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 3B50B2FC97E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 20:17, Zongmin Zhou wrote:
> 
> On 2026/3/11 06:28, Shuah Khan wrote:
>> On 3/3/26 01:17, Zongmin Zhou wrote:
>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>
>>> Currently, usbip_generic_driver_open() doesn't verify that the required
>>> kernel module (usbip-host or usbip-vudc) is actually loaded.
>>> The function returns success even when no driver is present,
>>> leading to usbipd daemon run success without driver loaded.
>>
>> Doesn't usbip_generic_driver_open() try to refresh exported
>> device list and fail? It returns error if it can't find fetch
>> them.
>>
>> usbipd starts and the when usbip_host is loaded it works correctly.
>> Doesn't it?
> Actually, refresh_exported_devices() does not return an error
> when the driver is not loaded,it consistently returns 0.
> It only results in hdriver->ndevs being set to 0 if no exportable usbip devices are found.
> Consequently, if the driver is missing, usbipd will start successfully in silence,
> but subsequent usbip attach operations will fail.
> The lack of explicit error messages makes it difficult for users to troubleshoot the root cause.
> By adding a check to verify if the driver is loaded during the usbip daemon startup,
> we can prevent these silent exceptions and ensure users are alerted to
> the missing kernel module before they attempt to use the service.
>>>
>>> So add a check function to ensure usbip host driver has been loaded.
>>>
>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>> ---
>>>   tools/usb/usbip/libsrc/usbip_device_driver.c |  2 ++
>>>   tools/usb/usbip/libsrc/usbip_host_common.c   | 31 ++++++++++++++++++++
>>>   tools/usb/usbip/libsrc/usbip_host_common.h   |  2 ++
>>>   tools/usb/usbip/libsrc/usbip_host_driver.c   |  2 ++
>>>   4 files changed, 37 insertions(+)
>>>
>>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
>>> index 927a151fa9aa..6da000fab26d 100644
>>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>>> @@ -147,6 +147,8 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>>>   struct usbip_host_driver device_driver = {
>>>       .edev_list = LIST_HEAD_INIT(device_driver.edev_list),
>>>       .udev_subsystem = "udc",
>>> +    .bus_type = "platform",
>>
>> Why are we adding this here - user-space shouldn't need to
>> know what kind of driver this is?
> The reason I added the bus_type and drv_name fields is to
> construct the specific sysfs paths required for the availability check.
> Although usbip-host and usbip-vudc share the same usbip_generic_driver_open() interface ,
> they operate on different bus types and have different driver names.
> These fields allow the generic open function to dynamically verify
> the correct driver path in sysfs based on the specific driver type being initialized.
> If you prefer not to expose these in the this structure,
> I'm happy to adjust further based on your suggestions.

Have you tried a simple system() e.g below:

if (system("/usr/bin/lsmod | grep usbip")) instead of adding
all of this code?

Take a look at other examples of driver checks in cpupower
check_msr_driver() for example.

thanks,
-- Shuah



