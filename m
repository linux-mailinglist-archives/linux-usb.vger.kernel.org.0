Return-Path: <linux-usb+bounces-35575-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF6dGtDDxmm8OQUAu9opvQ
	(envelope-from <linux-usb+bounces-35575-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 18:52:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1086A348A78
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 18:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEC4E3059AD4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 17:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F103FEB1E;
	Fri, 27 Mar 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dAvgQ1vy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3317F3FE67B
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633897; cv=none; b=fyTrZjAF3HPECrlDIEgDmBCiw6HnFPX4C7ODsY8IlZLmI2fMJUGEtityMj2qytlyHQOG1GOnNCRpAbcuNc4vAa1VM6kzGM1aGxpucWcwsC7hRL1UfpoJmhLQK2G+9STzjki5kGquxJpkPEKo5PYAELJ7h0hrQuSl/AcxDx1x2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633897; c=relaxed/simple;
	bh=6dvKrKmkak8ATPLkEYmgP3R55cJ1kt9/4AYxcNX/tzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJfQyoCv+Zev/u/VAQrrju0t7PReb/fLghf5H3GQ/3VH6ISeU34W31vHxA2mDZIzOV+FpLEWA5ylGO7dXfUAGD8iVkIG5ZCNyoJWI2kXOx4Jofpw026JkPnRaAT0whoEBAhKIA0UIwtX+Z7xc6vJZWcPfZcco+wSz0Mdq27zpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dAvgQ1vy; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82c2239140aso1011313b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774633895; x=1775238695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpqybzqqhB2MoQ2BAD3bJ2UJHtB+MkMas0fVHP2RkHo=;
        b=dAvgQ1vyrgSf+Zq00k+R87MiulUe047P3Jy/1tj0AJMISo5pcJcu0kdtihxfCfHBEk
         2agv0J7NwZByAkEX06ZgsxRXRXfrmsBqfFpkq1FFfKpw9UM7vnyyILP+VG12m3I3KjFi
         NrZdRW+aHoVSy3RJXsUehaqiCETWis6xP2k90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633895; x=1775238695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpqybzqqhB2MoQ2BAD3bJ2UJHtB+MkMas0fVHP2RkHo=;
        b=l1a0aZBUsH4CL2YhNa25Y5Ugnk4TFdWCBIGjdHjzT0C65TqvqWvLz6gwZ/kN7IP6yM
         If8qC5vFRSfh/RbINmOGs2LHFTjlYog/M+IO/8AgHONEBFx34mTUs/13lCzNuj7o7Qeu
         39rF1GLb7i3BZncwW1cIAnm6wLwhIj3MuA5RsFqCYdO3t7IUDogwcB6S4NqCAJhuMX4j
         HVp+Bq7SOmyPrIzxRmtemibIhOnerreDcI9TFfIytK3v2swi5CyexaC0gOW7rsSqOFGa
         YKeLi3UlDjPecKkPeO9suG3eeDyGmxSTlNdj0c66Btlfa24ff1Z0xDRbclvIJw0pRH9W
         v5NA==
X-Forwarded-Encrypted: i=1; AJvYcCVsz5xG6mfDv09PWI/ttyGhPSoG8jLJTEnIbTgrSAPWsGp9hx3NihgXKluywtE2mjbtoLEhOeUmpjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUeBQxdhIHqtK7dxPbR3xw0QKtsGsoVe7yeHW+UjmbFAoKYGES
	+gp0Jvas+DirkU1kp5THhpwDLCefO3HGPlNxpGfQ2JTk/Qu4sZz2H3mzXb0rPsr+glA=
X-Gm-Gg: ATEYQzywpkpx/PZJEffwdYXARcH7+qMFIIk3ddlJSlZ85zAhSuqCwp4r7TlqlnCfMk/
	nbciaO4woQoFzF/9d5vgfpehXgq+N/peQZxSNZtM8Q24hgYIO59fTwa+tJuGeKM99TW7D1J4sOF
	Iu7s8txnkAMTz7I5sZSAQ/IyjuyFDEAemsT4QUzWuhRNpf1kiK6p/1gkXU4++HNoNKJNb+Ihe1a
	kQ+/drPPFarewLsstTncXoJKC1PqY/sd+ZkRNrfTfzNMMNOlGV0cX0sjRCoiiVX/KGWX3zDZfih
	kzfb1A+vANGEohes3U9LPbUPxSKyepm03VXoOMERUztIMG2vwytfdqIwK6W5v3BZKvLIj39ANPx
	9P8HHDbcXJPHDiuAeByAWshOt/1XmUo6LiieNiv6fzPBi9X0aFU4MDu9nd55hVINQl0vjyx3BJg
	1UKrRB1/eij0YSr2rlDOzjW8NPikTLebIXIH0=
X-Received: by 2002:a05:6a00:4191:b0:82c:70a8:faec with SMTP id d2e1a72fcca58-82c95eaa436mr3211849b3a.21.1774633895370;
        Fri, 27 Mar 2026 10:51:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3fa0a8sm5953548b3a.58.2026.03.27.10.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:51:34 -0700 (PDT)
Message-ID: <28dd623f-43f6-4d43-bf7e-41b8c771a954@linuxfoundation.org>
Date: Fri, 27 Mar 2026 11:51:32 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
To: Zongmin Zhou <min_halo@163.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
 <2026032615-donated-chaps-9eac@gregkh>
 <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
 <722d5e64-a4d8-4ab2-954d-22f9b67f8f4e@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <722d5e64-a4d8-4ab2-954d-22f9b67f8f4e@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zenithal.me,vger.kernel.org,gmail.com,kylinos.cn,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35575-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 1086A348A78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 02:39, Zongmin Zhou wrote:
> 
> On 2026/3/27 02:43, Shuah Khan wrote:
>> On 3/26/26 02:43, Greg KH wrote:

[removed text]

>>
>> The problem Zongmin is trying fix ish when usbipd starts, it looks for
>> exported if any - if it doesn't find any it assumes there aren't any
>> exported and doesn't detect that usbip_host driver isn't loaded.
>>
>> refresh_exported_devices() doesn't have the logic and it shouldn't
>> include that logic because this hook is called periodically to
>> refresh the list of exported devices. Starting usbipd and loading
>> the driver are distinct steps and without any dependencies.
>>
>> This patch he is trying to add that detection so a message can be printed
>> to say "load the driver".
>>
>> A message can be added easily to cover two cases:
>>
>> 1. usbip_host driver isn't loaded
>> 2. There are no exported devices.
>>
>> refresh_exported_devices() will not find any devices in both
>> of the above scenarios. It isn't an error if it can't find
>> any exported devices.
>>
>> An informational message when refresh_exported_devices()
>> when it doesn't find any devices could help users.
>>
>> Zongmin,
>>
>> Would adding a message that says
>> "Check if usbip_host driver is loaded or export devices"
>> solve the problem of hard to debug problem you are addressing here?
>>
> Shuah,
> 
> Your suggestion makes sense.
> Adding an informational message when no devices are found would be a simple
> and clean solution that helps users debug without being intrusive.
> 
> However, I plan to add the info() message in usbip_generic_driver_open() instead of
> refresh_exported_devices(), because:
> - usbip_generic_driver_open() is called only once at initialization.
> - refresh_exported_devices() is called periodically to refresh the exported device list.

refresh_exported_devices() isn't called periodically - it is called
from usbip_host_driver op: refresh_device_list and it will be called
whenever usbipd (host side) calls it whenever it receives a request from
user-space via process_request()

For example running "usbip list -l" command will trigger a run of
refresh_exported_devices() via usbip_host_driver op: refresh_device_list

I don't think it will that noisy to add a message to refresh_exported_devices()
when device list is zero. Currently the logic doesn't detect device list zero.
You have add that condition to print informational message.


> - When the server has no exported devices, having zero devices
>    is normal and not worth frequent info messages.

That is correct. Zero exported devices isn't an error and this could
persist until devices are exported.

> 
> Theoretically, we only need to prompt once at startup. Is my understanding correct?> > I'll also remove the existing error messages like below,
> since they cannot accurately determine whether the driver is loaded:
> 
> if (ret)
>      err("please load " USBIP_CORE_MOD_NAME ".ko and "
>          USBIP_HOST_DRV_NAME ".ko!");

Leave this one alone, because it gets called from a couple of places.

thanks,
-- Shuah

