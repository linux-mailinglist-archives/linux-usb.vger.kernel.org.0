Return-Path: <linux-usb+bounces-35637-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNUVKtrpyWmP3QUAu9opvQ
	(envelope-from <linux-usb+bounces-35637-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 05:11:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6B354FA4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 05:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 811133011859
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 03:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E8C375AA0;
	Mon, 30 Mar 2026 03:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jnSPogx1"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4122E63C;
	Mon, 30 Mar 2026 03:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840275; cv=none; b=elQ/ja0lEXFPw9X7tpoR9FIJpt6R3hCBxzQgUyCiGUvhl1GuGee4BfkC0yDGa9hS+MjxaX8/V45tOvH+286B6Gytk5f1i3Kh9Ht20VSYylWqJR8yy4T+G48Bf4s4TMgZ4xiguyc+Gosk9Fa+ts1+QgHW++H6WdlhgGNMiTLI6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840275; c=relaxed/simple;
	bh=9g3lYPIkBiTVh69vF1AoJ0I3OYmHoBugeghCsGC9UPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXBhaIRniAbuoZIfl571hTgbDltefYwxZXllN3iy300RqPOugepuwtTOw9KS6kM7lTHb49aZEgYFTz2SP4GnCj/uu1q2yQc09vPwHNr7aR4v4pOFPb5tvAzE7w5lBU+oh7x9Jffkgmy66WO1oRtuhxfy4hPYX28pjHd5PyB4Uto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jnSPogx1; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=6zild5xX9VvMBHqZ216GX60MinP072mzKBuGcqZe51A=;
	b=jnSPogx1M+aW22s0uf1vH7q2UD3CM/Eje7BZAjiTEj5uQfoFzEmvT+buRFchw1
	XAkRmG2fNVyadiQGQteSet2aARPUIuwLD0iWrY7lLAswEeQGEkmbcUQ4Ga9L2bwb
	0zhz6DWmBR0u3KDc1fYM3sVpqTGRdEBNqUoJOmIp0pqmQ=
Received: from [10.42.12.46] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnXqy+6clpbHqyUA--.125S2;
	Mon, 30 Mar 2026 11:10:57 +0800 (CST)
Message-ID: <1667ddf5-e36c-4cba-87b4-9cd3d34032e1@163.com>
Date: Mon, 30 Mar 2026 11:10:54 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Greg KH <gregkh@linuxfoundation.org>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
 <2026032615-donated-chaps-9eac@gregkh>
 <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
 <722d5e64-a4d8-4ab2-954d-22f9b67f8f4e@163.com>
 <28dd623f-43f6-4d43-bf7e-41b8c771a954@linuxfoundation.org>
 <3b0aad9f-b424-41b0-9efe-60a1252153f6@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <3b0aad9f-b424-41b0-9efe-60a1252153f6@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnXqy+6clpbHqyUA--.125S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW7ZF13Gry5GrykZr4fKrg_yoWrZw1xpF
	W5XFyUtrZ8GaySkw1qvF109F1jgws5Aw1rXrnxJw1jkwn0vFySqry3Kr1kCay2kr4rJa1j
	vrZ8JrZ7G3yDXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uf-BiUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9AF3I2nJ6cF7AwAA3R
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35637-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[zenithal.me,vger.kernel.org,gmail.com,kylinos.cn,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[min_halo@163.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BE6B354FA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2026/3/28 02:29, Shuah Khan wrote:
> On 3/27/26 11:51, Shuah Khan wrote:
>> On 3/27/26 02:39, Zongmin Zhou wrote:
>>>
>>> On 2026/3/27 02:43, Shuah Khan wrote:
>>>> On 3/26/26 02:43, Greg KH wrote:
>>
>> [removed text]
>>
>>>>
>>>> The problem Zongmin is trying fix ish when usbipd starts, it looks for
>>>> exported if any - if it doesn't find any it assumes there aren't any
>>>> exported and doesn't detect that usbip_host driver isn't loaded.
>>>>
>>>> refresh_exported_devices() doesn't have the logic and it shouldn't
>>>> include that logic because this hook is called periodically to
>>>> refresh the list of exported devices. Starting usbipd and loading
>>>> the driver are distinct steps and without any dependencies.
>>>>
>>>> This patch he is trying to add that detection so a message can be 
>>>> printed
>>>> to say "load the driver".
>>>>
>>>> A message can be added easily to cover two cases:
>>>>
>>>> 1. usbip_host driver isn't loaded
>>>> 2. There are no exported devices.
>>>>
>>>> refresh_exported_devices() will not find any devices in both
>>>> of the above scenarios. It isn't an error if it can't find
>>>> any exported devices.
>>>>
>>>> An informational message when refresh_exported_devices()
>>>> when it doesn't find any devices could help users.
>>>>
>>>> Zongmin,
>>>>
>>>> Would adding a message that says
>>>> "Check if usbip_host driver is loaded or export devices"
>>>> solve the problem of hard to debug problem you are addressing here?
>>>>
>>> Shuah,
>>>
>>> Your suggestion makes sense.
>>> Adding an informational message when no devices are found would be a 
>>> simple
>>> and clean solution that helps users debug without being intrusive.
>>>
>>> However, I plan to add the info() message in 
>>> usbip_generic_driver_open() instead of
>>> refresh_exported_devices(), because:
>>> - usbip_generic_driver_open() is called only once at initialization.
>>> - refresh_exported_devices() is called periodically to refresh the 
>>> exported device list.
>>
>> refresh_exported_devices() isn't called periodically - it is called
>> from usbip_host_driver op: refresh_device_list and it will be called
>> whenever usbipd (host side) calls it whenever it receives a request from
>> user-space via process_request()
>>
>> For example running "usbip list -l" command will trigger a run of
>> refresh_exported_devices() via usbip_host_driver op: refresh_device_list
>>
>> I don't think it will that noisy to add a message to 
>> refresh_exported_devices()
>> when device list is zero. Currently the logic doesn't detect device 
>> list zero.
>> You have add that condition to print informational message.
>>
>>
>>> - When the server has no exported devices, having zero devices
>>>    is normal and not worth frequent info messages.
>>
>> That is correct. Zero exported devices isn't an error and this could
>> persist until devices are exported.
>>
>>>
>>> Theoretically, we only need to prompt once at startup. Is my 
>>> understanding correct?> > I'll also remove the existing error 
>>> messages like below,
>>> since they cannot accurately determine whether the driver is loaded:
>>>
>>> if (ret)
>>>      err("please load " USBIP_CORE_MOD_NAME ".ko and "
>>>          USBIP_HOST_DRV_NAME ".ko!");
>>
>> Leave this one alone, because it gets called from a couple of places.
In usbip_generic_driver_open(), the only path that triggers this message 
is a failure of udev_new().
This function fails due to system-level issues like memory exhaustion, 
not because usbip driver module is missing.

Furthermore, since refresh_exported_devices() doesn't practically return 
an error here,
the message is never seen during actual driver loading failures.
So I think it’s better to remove this inaccurate hint to avoid confusing 
the users.

This is the reason why I previously wanted to remove it.
>>
>
> Better yet, why not change the usbip instead - usbip_list for example.
> This is the one that prints the device list and the change can be made
> there when the list is zero to say, "Check if driver is loaded and
> exported devices"
I think placing the check/message in refresh_exported_devices() would be 
more effective.
This function covers all scenarios where the device list is refreshed, 
including:
usbipd startup, usbip list -r, and usbip attach operations.

This way, users receive helpful feedback automatically without needing 
to explicitly run usbip list -r.
>
> thanks,
> -- Shuah


