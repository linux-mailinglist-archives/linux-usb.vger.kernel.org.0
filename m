Return-Path: <linux-usb+bounces-35799-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHamFqdGzWkkbAYAu9opvQ
	(envelope-from <linux-usb+bounces-35799-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 18:24:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F437DDE2
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 18:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F42430C4D2F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 16:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DDE44D685;
	Wed,  1 Apr 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WfvM/HP8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E203D6CA4
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059587; cv=none; b=LGQ4i+wDYXznjfeC/Z+S9VPhy7lZEh6gmA43gWv2cB3uiljnj+9OK0CCFGQUukfkvSV4EUAhLWIMcvrBw3izqhaGKWZ2yDfvOe9klNz/RlKphT2B97J8R2D44oIH8lRKFYxkNJH9OHUUeBSxuFZ4VKKWpGJxj81yKh+0derI+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059587; c=relaxed/simple;
	bh=6LdhDgXuA2Ka2rLh8KrXng3dhEvau1aDwfZLzxn+JYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRYFa07BIsyzmVZgwaCcQCZ3a90hQDb7XuSDEgSqtuGnd43h22rpX3i26CDpnB/5vCZpeSZJrv4KGwbWVOd1c+xsBJ+ApeR6DA4yC410dFC6k0J7xD8n5R2/HgtEVxLQtfhZ7A5UI/L4/+aOVCPZ4FH+KdKMQV0ivJXWS1fiYvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WfvM/HP8; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d750eeaec3so3142352a34.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775059584; x=1775664384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9vtejKV+n/AnqzwqKmW8RD+vTXqQVuVAPaAcB1DYq4=;
        b=WfvM/HP8vEiwmbmhfqxIRnP02iZz6rCKIscL5+9X3L+l0uBV0L9QI597UvyVl62OUS
         eX/G0AH5TzPcz9IHkAPHYR5BlJ/SIgvmDYaXLUt8ObOPRK1T4WrCCZsZwrChdqlCyhNE
         GSw+/rEC15YY5V0NysBvCSNqDUkB10vqmBEi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059584; x=1775664384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9vtejKV+n/AnqzwqKmW8RD+vTXqQVuVAPaAcB1DYq4=;
        b=EFRffiRB5tfXt4JQHqIsr3OszgafZLieCb2nFvD7Gt+2xdkZsMbipcTRvKND9soLqR
         NPjiEgnUKOfemoQa3WPwnfDK+unztek8SXjBG40zQZrSmKmv1/kH3+CYOw6ZPbJvcmDZ
         0p1Lkn0gTwPaMV/dR71OkMQ9RFXRmezBfUpmrvzrz08burS87H4iUzNj3C/qMBGOlyYa
         8EuQu5v0HI8UyyviVUFNug3YWBILBtIRQY2x0umqcWMi48xEpRmImIE/Ln8JVm3tk7fV
         xUp2pRnhYXnqSPIjh+4BwqmibJ9BwAiJjvm+VoRq3QE8hV1m8Lj6QLtHhGrVS4TUn753
         Jnig==
X-Forwarded-Encrypted: i=1; AJvYcCXC1VNkqlzInYp+ryP7OsvrCHQ8xRCUjtyATrbqhg8VxCJ3EyW3c3Ybl57rULFBbFG6AeuESjsL0LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnEbbLK/3zKn99jugbpFBV5hl/rofIrFWtigBwxNsO0fBoFI6
	+rqMDxzpC44LPZD/x37QsAvpnNugQPx3z0GBxpMv1mCHT4R3noakujFaHVKafdZp+2Y=
X-Gm-Gg: ATEYQzwiHmt1Vv5hbKwtQi8PVaKbkjv7T7a1OJjR13PFzFhr4ZyllsesdycRqg+OgIE
	2tHkiDLlzbH7LVmUtEDsjw1oOKTiewYlxgpj6grWyBpBNshkYxWtSMknDiWhxvx6CrGcF/LOdPF
	1VNNqDTKUbfrgNB98ZxS5umK5n7cbK0jNA/VUaXI02cxqPT+2KRqU/9EmBB8gqM3BdBN2O4wo2O
	AAFMDpB9K9PZ4UCkfeJ76XTFQP+o/FuEdrhuHrcEoxZgBq5bXhrkwKtcDsxEg9kTVO81rQ0X3do
	uUs7+z1Xvkt4n9S760t/qhQ5znCNvR1VFJ0aLxp+QCvXyyQsMBW+nBuVUhE1XPc1MLRAPPQn0HG
	nn/BAy7/nq1v26g7JtX3sH6g25ve9Yp1qJueq6W2yn5fMDjoMTycPtWIEMzTg/b9qHk9CfEMGKZ
	enZKCfcB5PaumNtScrWPJ9KmNCbQ0DorEq7Re4Mf+9sg1f9w==
X-Received: by 2002:a05:6830:3c8a:b0:7d7:d097:96dc with SMTP id 46e09a7af769-7db99257eb5mr2504282a34.5.1775059583748;
        Wed, 01 Apr 2026 09:06:23 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba71256a7sm177994a34.2.2026.04.01.09.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:06:23 -0700 (PDT)
Message-ID: <8d7000a9-981c-468a-bd4b-60111e0b77e9@linuxfoundation.org>
Date: Wed, 1 Apr 2026 10:06:21 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usbip: tools: add hint when no exported devices are
 found
To: Zongmin Zhou <min_halo@163.com>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Shuah Khan <skhan@linuxfoundation.org>
References: <3ff00e2e-1c45-45be-a65c-16da9b2ae5a5@linuxfoundation.org>
 <20260331095830.124543-1-min_halo@163.com>
 <d72e7bf6-a0db-4984-8a7e-31d898190c28@linuxfoundation.org>
 <6ed1738b-9d15-4311-a0f5-9b1a7db69f8c@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <6ed1738b-9d15-4311-a0f5-9b1a7db69f8c@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-35799-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 603F437DDE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 20:47, Zongmin Zhou wrote:
> 
> On 2026/4/1 08:27, Shuah Khan wrote:
>> On 3/31/26 03:58, Zongmin Zhou wrote:
>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>
>>> When refresh_exported_devices() finds no devices, it's helpful to
>>> inform users about potential causes. This could be due to:
>>>
>>> 1. The usbip driver module is not loaded.
>>> 2. No devices have been exported yet.
>>>
>>> Add an informational message to guide users when ndevs == 0.
>>>
>>> Message visibility by scenario:
>>> - usbipd (console mode): Show on console/serial, this allows instant
>>>    visibility for debugging.
>>> - usbipd -D (daemon mode): Message logged to syslog, can keep logs for
>>>    later traceability in production. Also can use "journalctl -f" to
>>>    trace on console.
>>>
>>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>> ---
>>> Changes in v3:
>>> - Just add an informational message when no devices are found.
>>> Changes in v2:
>>> - Use system calls directly instead of checking sysfs dir.
>>>
>>>   tools/usb/usbip/libsrc/usbip_host_common.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
>>> index ca78aa368476..cd92baee310c 100644
>>> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
>>> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
>>> @@ -149,6 +149,13 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
>>>           }
>>>       }
>>>   +    if (hdriver->ndevs == 0) {
>>> +        if (!strcmp(hdriver->udev_subsystem, "usb"))
>>> +            info("Please check if %s driver is loaded or export devices.",USBIP_HOST_DRV_NAME);
>>
>> Check coding guidelines and match the new code to the existing. Need a space between
>> the string and the next argument.
>>
>>
>>> +        else
>>> +            info("Please check if %s driver is loaded or export devices.",USBIP_DEVICE_DRV_NAME);
>>
>> When will this be true? Isn't refresh_exported_devices() called from
>>
>> Thinking about this more, since you have to differentiate between
>> host and device, it makes sense to make this change to
>>
>> usbip_device_driver_open() and usbip_host_driver_open()
>> There is an err() message already in both of these routines.
>> that prints the right information.
>>
> Shuah,
> 
> Regarding your comment about the existing err() message in these routines:
> 
> The existing err("please load *.ko") message only triggers when usbip_generic_driver_open()
> returns a non-zero value. Since refresh_exported_devices() always returns 0
> (even when ndevs == 0 and no devices are found), usbip_generic_driver_open()
> only returns non-zero when udev_new() fails.
> 
> Therefore, when ndevs == 0, the existing err() message is never printed,
> so it doesn't actually help users diagnose the "no devices found or driver not load" situation.

Correct. There is no need to remove this. What I am suggesting is these
messages from usbip_device_driver_open() and usbip_host_driver_open()

What I am suggesting changing usbip_device_driver_open() and
usbip_host_driver_open() like this:

if (ret || hdriver->ndevs == 0)
                 info("please load " USBIP_CORE_MOD_NAME ".ko and "
                     USBIP_DEVICE_DRV_NAME ".ko!");


This should solve the problem for you ...

I don't like the idea of adding string compares to refresh_exported_devices()

if (!strcmp(hdriver->udev_subsystem, "usb"))

to differentiate when you can simply leverage the existing code by adding
one more conditional and changing the err() to info()

thanks,
-- Shuah

