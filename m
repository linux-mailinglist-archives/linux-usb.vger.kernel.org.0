Return-Path: <linux-usb+bounces-35760-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB2xLOqIzGlXTgYAu9opvQ
	(envelope-from <linux-usb+bounces-35760-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 04:54:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340F3740D9
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 04:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50EC930D94AD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 02:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB17310651;
	Wed,  1 Apr 2026 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OWCmJXjL"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82034846D;
	Wed,  1 Apr 2026 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011655; cv=none; b=dMJkfWY2NfWPfWahSNTOXqpo0ly5Jvmn5tpwQsZpdhrykZqVRADpg7XljbB/lNElcbzqF4qk4YU4NwqQYK6vCNLrfMoRBR3TUD0lQDcoDuigN3yvh4JkW2Bxba5p2GOykt0wXRQQziNVLEjLWGo5HgoWUFdS5iyr5EMkq8NvpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011655; c=relaxed/simple;
	bh=J+rk4k8xyfttTZayZNAtTjkfoXIEb4Fkg1nRQOp7Ul0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgi8YOLCQOkpX8p7PSchGn/DDfEELXsNmCFvoSTHq09auVp/TxbLATbEJH8OMw+RY+NqntNKD4kh8HGak62FD5Ub0S24bC5kF5KDlpVNG/ODCMX2BUQZsvwDA7IxlIDoxmU1ZlszNb8DdkDdDYqTNA+5BnifzcDxj62ecvvyY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OWCmJXjL; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=gt1ludKOtJQEZkOkeEaqWz8adzU4nANfRK9f736xiXE=;
	b=OWCmJXjLyxOrhwuWZDDpjGzTkZFnUsvVKQ3ekhudbaKs+GFhyCZjSvSWR92MA2
	DBLETqNsO+wLmadSjDiV3WLEmiF0O0/cNA43DqreqBwo1Z7MRaUtqjCco5GRfaQ1
	v0TCMcZ3j1dJ8cewdIAMZ27Gc1dHMayMekMomW5F6NeFE=
Received: from [10.42.12.46] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD398cth8xpbcJuCg--.959S2;
	Wed, 01 Apr 2026 10:47:09 +0800 (CST)
Message-ID: <6ed1738b-9d15-4311-a0f5-9b1a7db69f8c@163.com>
Date: Wed, 1 Apr 2026 10:47:09 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usbip: tools: add hint when no exported devices are
 found
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <3ff00e2e-1c45-45be-a65c-16da9b2ae5a5@linuxfoundation.org>
 <20260331095830.124543-1-min_halo@163.com>
 <d72e7bf6-a0db-4984-8a7e-31d898190c28@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <d72e7bf6-a0db-4984-8a7e-31d898190c28@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD398cth8xpbcJuCg--.959S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw4fJr4fAw18Zr1xXF1UWrg_yoW5ZF15pF
	WUtFW5KrZ8Ga47uws2vF1jgFy0gwnIy3yFgrn3Jw1jg3Z0va4I9ryfKwn5u34rJr45Ja4I
	vFZ8trW7CFyUXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uf-BiUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9A56JmnMhy6S0wAA3r
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35760-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 4340F3740D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2026/4/1 08:27, Shuah Khan wrote:
> On 3/31/26 03:58, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> When refresh_exported_devices() finds no devices, it's helpful to
>> inform users about potential causes. This could be due to:
>>
>> 1. The usbip driver module is not loaded.
>> 2. No devices have been exported yet.
>>
>> Add an informational message to guide users when ndevs == 0.
>>
>> Message visibility by scenario:
>> - usbipd (console mode): Show on console/serial, this allows instant
>>    visibility for debugging.
>> - usbipd -D (daemon mode): Message logged to syslog, can keep logs for
>>    later traceability in production. Also can use "journalctl -f" to
>>    trace on console.
>>
>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>> Changes in v3:
>> - Just add an informational message when no devices are found.
>> Changes in v2:
>> - Use system calls directly instead of checking sysfs dir.
>>
>>   tools/usb/usbip/libsrc/usbip_host_common.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c 
>> b/tools/usb/usbip/libsrc/usbip_host_common.c
>> index ca78aa368476..cd92baee310c 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
>> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
>> @@ -149,6 +149,13 @@ static int refresh_exported_devices(struct 
>> usbip_host_driver *hdriver)
>>           }
>>       }
>>   +    if (hdriver->ndevs == 0) {
>> +        if (!strcmp(hdriver->udev_subsystem, "usb"))
>> +            info("Please check if %s driver is loaded or export 
>> devices.",USBIP_HOST_DRV_NAME);
>
> Check coding guidelines and match the new code to the existing. Need a 
> space between
> the string and the next argument.
>
>
>> +        else
>> +            info("Please check if %s driver is loaded or export 
>> devices.",USBIP_DEVICE_DRV_NAME);
>
> When will this be true? Isn't refresh_exported_devices() called from
>
> Thinking about this more, since you have to differentiate between
> host and device, it makes sense to make this change to
>
> usbip_device_driver_open() and usbip_host_driver_open()
> There is an err() message already in both of these routines.
> that prints the right information.
>
Shuah,

Regarding your comment about the existing err() message in these routines:

The existing err("please load *.ko") message only triggers when 
usbip_generic_driver_open()
returns a non-zero value. Since refresh_exported_devices() always returns 0
(even when ndevs == 0 and no devices are found), usbip_generic_driver_open()
only returns non-zero when udev_new() fails.

Therefore, when ndevs == 0, the existing err() message is never printed,
so it doesn't actually help users diagnose the "no devices found or 
driver not load" situation.

This is exactly why I previously suggested removing this misleading 
err() message.

Best regards,
Zongmin
> You can check hdriver->ndevs == 0 and add an info that says
> load appropriate modules or export devices. This way you
> don't have to add logic to refresh_exported_devices() to figure
> out which driver.
>
> thanks,
> -- Shuah


