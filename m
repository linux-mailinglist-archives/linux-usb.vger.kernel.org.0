Return-Path: <linux-usb+bounces-35690-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALqGIxepymmx+gUAu9opvQ
	(envelope-from <linux-usb+bounces-35690-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 18:47:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515535EFCB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 18:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D3A13006039
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 16:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C8338F22A;
	Mon, 30 Mar 2026 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BnWTMAa0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C338AC6F
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889083; cv=none; b=QgPl7v9TnNhHPYI6RloJwe+u52hEaLkGw/usve+rWbT7AlNIxFo/VkIHhZUv17u8qqAPPbz0CXh/m2h4pAO2vAmJJyrmSfFV3e/rIvvWi26Dc8m3kU1dI9AI7WcG1FyefESWHN4BFousCRPuKiQYibkRpMDhe8enrW/otYGgplI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889083; c=relaxed/simple;
	bh=9KOb+RZHVFJ2EaZRPSwZwSh1Y0taxAgxUtq+Zg6MX6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3HUjt1L5rmVADAWNqC/CJyy36D2D+chiPUgnYu3Rybq2fnZZl3022vJP3OpGUCVF9PK9bSlIPVvdR3A4wIyg3Xl+jjNGmVvnNitcGCEIgr1FVDryBhiLmwg8IKJcxFuZPFBmaeVvoCUUGMcylLzQOfjuKTXpCcO+LPZ/sciEGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BnWTMAa0; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d9c98e437cso4010627a34.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774889076; x=1775493876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxXxbY8xzicR6hLqShUw79XEjm+2Vp5GVDMH3NyNKXU=;
        b=BnWTMAa0BMM+1QAqHyZsk+o2xPZ8AznsAn+IKv2LW1qv3HiubQDq3QOxYTmTSnhXxr
         mOZ8Fh2KObbnzUC7uxm2GYURbulxPpK/PUm2zWjoNr+Mzu58pOhf3bfFe6u43Hsf5oo2
         iUBjSUFqcshi8Fr7zDrwWNfFulvLibPnys1PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889076; x=1775493876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxXxbY8xzicR6hLqShUw79XEjm+2Vp5GVDMH3NyNKXU=;
        b=J3c8ai2mTU6vT1Cs26GmCIXqz4Qf8VQ9HYQXH40pfBPVB1VMIzzSZgv+oQWiWseYvQ
         gyahuTbxhWtwL4tbzxJsz7Xdd5oNi4lqD7kdJZ81hIZhF6ASeFPujwe+PpD6U2vWKmOw
         xOqezzWYDTLrq+I/NcrQ5pUCQrensaAHlf7BJ23GiV1nsd33trhqgeEDXMaCl7sRhSDh
         6V9DSU9d4W2o2HRkcDAvt9p8vt3gbo25R882iGJDvwV24hsnE9Jy4XTUwuDC1eDC0EPx
         2WyklFuwEqIVkecO7waPvwA3JUAwlMPU+rpXb+n8zMEJx0fP2SgNu1gFqD/lF8ZN8r8o
         a6ww==
X-Forwarded-Encrypted: i=1; AJvYcCU1LMjNrSuLBU+XDSySGMX/vOed15+cGuE8MS2jKp9PAcXNcZKVNPphVCAwNWVMrB+LckWn8uvQLjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdN1BfWJbWoYH7xVyfbeybLOLQw7yWllYtQI6Ku/VzfIZTOROn
	8nbt2xjG7Q8zb4wWsWNlcwh9d+9T8GF+jrX4aZsk8L27zPwJY/4tWyNRe6YHYkYvFW0=
X-Gm-Gg: ATEYQzxnxXDkRXl5JwsbD+gFEU9fIaGXAICwkac+73slI78lBfn7XIlx0zR57NEfxXv
	7Yhq+xe8FU80BpZ89MUfOqZMKEAfXJx9iWCp+I0zmtBfoPPOMg1waAFsfWftliQ5RQEJMFCvJgR
	X2nBMTWG1pglveEUHEaIEzTrond4Bcj61RYnHEZCshIrDvuw3HXDEMmZX7H/GEr7VMWrN3j2Aax
	5tguRki54MIJFvgzK/c/2a7Wt/M0qjZOKMAm4NHkreZKnltCCIubDSPe/qE3vNMDBzMeVM2aKoh
	DLb7g2kbAq/c6PBIRd9Uviteypj8QEWi3mSjzvEQv9cQNcYNi7CTHhJ4tOekiNkw0aDwUW/KItr
	vAHsY05+IWuN+GyZQ5nOWxnHhoMIaTvvUQ2RD0fujvMPFfuAiTbEGq+LouvpjplltjbsDbtLJ2h
	9/8QHoF69ij2F1yO8UKCfD1SmGFfsPcmd4z8A=
X-Received: by 2002:a05:6830:6a11:b0:7d4:4af4:b7d4 with SMTP id 46e09a7af769-7d9fad9ab41mr7509025a34.1.1774889075924;
        Mon, 30 Mar 2026 09:44:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a821746sm6601977a34.24.2026.03.30.09.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 09:44:35 -0700 (PDT)
Message-ID: <3ff00e2e-1c45-45be-a65c-16da9b2ae5a5@linuxfoundation.org>
Date: Mon, 30 Mar 2026 10:44:33 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
To: Zongmin Zhou <min_halo@163.com>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Greg KH <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
 <2026032615-donated-chaps-9eac@gregkh>
 <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
 <722d5e64-a4d8-4ab2-954d-22f9b67f8f4e@163.com>
 <28dd623f-43f6-4d43-bf7e-41b8c771a954@linuxfoundation.org>
 <3b0aad9f-b424-41b0-9efe-60a1252153f6@linuxfoundation.org>
 <1667ddf5-e36c-4cba-87b4-9cd3d34032e1@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <1667ddf5-e36c-4cba-87b4-9cd3d34032e1@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zenithal.me,vger.kernel.org,gmail.com,kylinos.cn,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35690-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 9515535EFCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 21:10, Zongmin Zhou wrote:
> 
> On 2026/3/28 02:29, Shuah Khan wrote:
>> On 3/27/26 11:51, Shuah Khan wrote:
>>> On 3/27/26 02:39, Zongmin Zhou wrote:
>>>>
>>>> On 2026/3/27 02:43, Shuah Khan wrote:
>>>>> On 3/26/26 02:43, Greg KH wrote:
>>>
>>> [removed text]
>>>
>>>>>
>>>>> The problem Zongmin is trying fix ish when usbipd starts, it looks for
>>>>> exported if any - if it doesn't find any it assumes there aren't any
>>>>> exported and doesn't detect that usbip_host driver isn't loaded.
>>>>>
>>>>> refresh_exported_devices() doesn't have the logic and it shouldn't
>>>>> include that logic because this hook is called periodically to
>>>>> refresh the list of exported devices. Starting usbipd and loading
>>>>> the driver are distinct steps and without any dependencies.
>>>>>
>>>>> This patch he is trying to add that detection so a message can be printed
>>>>> to say "load the driver".
>>>>>
>>>>> A message can be added easily to cover two cases:
>>>>>
>>>>> 1. usbip_host driver isn't loaded
>>>>> 2. There are no exported devices.
>>>>>
>>>>> refresh_exported_devices() will not find any devices in both
>>>>> of the above scenarios. It isn't an error if it can't find
>>>>> any exported devices.
>>>>>
>>>>> An informational message when refresh_exported_devices()
>>>>> when it doesn't find any devices could help users.
>>>>>
>>>>> Zongmin,
>>>>>
>>>>> Would adding a message that says
>>>>> "Check if usbip_host driver is loaded or export devices"
>>>>> solve the problem of hard to debug problem you are addressing here?
>>>>>
>>>> Shuah,
>>>>
>>>> Your suggestion makes sense.
>>>> Adding an informational message when no devices are found would be a simple
>>>> and clean solution that helps users debug without being intrusive.
>>>>
>>>> However, I plan to add the info() message in usbip_generic_driver_open() instead of
>>>> refresh_exported_devices(), because:
>>>> - usbip_generic_driver_open() is called only once at initialization.
>>>> - refresh_exported_devices() is called periodically to refresh the exported device list.
>>>
>>> refresh_exported_devices() isn't called periodically - it is called
>>> from usbip_host_driver op: refresh_device_list and it will be called
>>> whenever usbipd (host side) calls it whenever it receives a request from
>>> user-space via process_request()
>>>
>>> For example running "usbip list -l" command will trigger a run of
>>> refresh_exported_devices() via usbip_host_driver op: refresh_device_list
>>>
>>> I don't think it will that noisy to add a message to refresh_exported_devices()
>>> when device list is zero. Currently the logic doesn't detect device list zero.
>>> You have add that condition to print informational message.
>>>
>>>
>>>> - When the server has no exported devices, having zero devices
>>>>    is normal and not worth frequent info messages.
>>>
>>> That is correct. Zero exported devices isn't an error and this could
>>> persist until devices are exported.
>>>
>>>>
>>>> Theoretically, we only need to prompt once at startup. Is my understanding correct?> > I'll also remove the existing error messages like below,
>>>> since they cannot accurately determine whether the driver is loaded:
>>>>
>>>> if (ret)
>>>>      err("please load " USBIP_CORE_MOD_NAME ".ko and "
>>>>          USBIP_HOST_DRV_NAME ".ko!");
>>>
>>> Leave this one alone, because it gets called from a couple of places.
> In usbip_generic_driver_open(), the only path that triggers this message is a failure of udev_new().
> This function fails due to system-level issues like memory exhaustion, not because usbip driver module is missing.
> 
> Furthermore, since refresh_exported_devices() doesn't practically return an error here,
> the message is never seen during actual driver loading failures.
> So I think it’s better to remove this inaccurate hint to avoid confusing the users.
> 
> This is the reason why I previously wanted to remove it.
>>>
>>
>> Better yet, why not change the usbip instead - usbip_list for example.
>> This is the one that prints the device list and the change can be made
>> there when the list is zero to say, "Check if driver is loaded and
>> exported devices"
> I think placing the check/message in refresh_exported_devices() would be more effective.
> This function covers all scenarios where the device list is refreshed, including:
> usbipd startup, usbip list -r, and usbip attach operations.

Right changing refresh_exported_devices() covers all cases. Think about the
following scenarios:

- Where will this message get printed when usbipd is started on the console and in
   background?

- Where will this message get printed when user runs various usbip list commands?

Ideally these commands should tell the user what happened without looking
at daemon logs.

thanks,
-- Shuah

