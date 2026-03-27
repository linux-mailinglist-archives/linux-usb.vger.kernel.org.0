Return-Path: <linux-usb+bounces-35577-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNnkCqfMxmn5OgUAu9opvQ
	(envelope-from <linux-usb+bounces-35577-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 19:29:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D531349096
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 19:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF3373009E22
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 18:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20A94035AA;
	Fri, 27 Mar 2026 18:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dfUlr+7y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49599378D79
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636153; cv=none; b=EJMkIbpLpZ3odWxHOdHslmqwxMtqRPOriJNRK4y/nzTJWEmFNZoGKqBK42Dbx6BvMDGBTVybrHtZEwXKHXZowhLsnhA0/n2CPVuxIRaROm8iJL90vUVND2nEO+tPW80wuaJnzwiVh1zh4piqqHXmnSR44r16z9LnVdUFsD/8nBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636153; c=relaxed/simple;
	bh=73dudT28ohOwp+pTTc9O+i9WChCARZpw9xHP2Y8aeLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQ7I+sXbHHOMWk6WdLyKWasDbGKAyaopAb/6qg9zEIuWGoFSOMrNct+hcH0NwuSl49mI56gVhUxZI80EibQtuZa5ro+msco8OstwrlDQz/psb/JLcvsM2l2tf0+4/CTjZT+pfYe6q2zvrhIig4aGRF8NIz+X6b9lVoThk5DbwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dfUlr+7y; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46702742c99so1605741b6e.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774636148; x=1775240948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bP3JPj5F335Oxaly6YkXO9Lq7ry1WLTVoeRDAW7BUVw=;
        b=dfUlr+7yq17FK8rEvzT8piTwJUXE2Job4EWiThMmiiEXu1hEmWuuuCFFRbB8I30iql
         9afisJKTYs2V5XDSXfsRT/mteQpCfkrAQuwUAJArqynbP7BKuI0Rxl2vK5Xg9ub5xwpq
         D+PwHq80DzHZ8QmZisotdddk8wZ0NwnRYGNGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774636148; x=1775240948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP3JPj5F335Oxaly6YkXO9Lq7ry1WLTVoeRDAW7BUVw=;
        b=VfNF0u43gaGOLtk1QWNHXqWdULCccFFNNaX8SQjzYn+0amjKThnQMCdDkZOOSKOy3Q
         nOHrgaSR7PK0ltqPQLqplL0BL3Kn6QpISR1m+4EDDKjAQfuuTIBN0SzozcFVtNUC20fc
         221qhYqLcHJlFkQ7vjTVQpDhoOQnyKswMbUMYp0NLRK9j+2gYM8Ultg58pZ5zGfRf8RP
         RLAb+3tGz7ps95hb5sRbihVZmbFV5ohOJQZaX5vU6zkatJzorcVnuYN9xY1fCf3pryb1
         Ya+q+w2/yRRYwAifmhlHhSFbQiaxQWTpdHE8ObF9Eu250WGBhM5J5r7mMCiq7RmRcb70
         zr9g==
X-Forwarded-Encrypted: i=1; AJvYcCV+aDoXyXWkTDUroxjmo5T5Ixi//0SJqWpdN1ABtluyhHgc93fWe5PddYHeXk60sLW8BnvVk7O8aTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YydfQvAb1g+MEsR+WZkg9bd8sqOdemXBnXwAXDLOoujOhwHSaG6
	bkLLkkU0DtEqy/6m2hPkvP8deBf9Xef/VsqnF3vRwPSrZGxzE6zKvIGgzSn8YmHL8h2Ibl5gBnf
	OUw9/tQo=
X-Gm-Gg: ATEYQzyepkF6zQh4UiE1Pyo7hWYNDSLRQ3gkBPqWiXqQSDSnzYoNbM0vC/Dw6v2rP15
	ADKvhPMsQHcWOUODKJ6FM9Fi3HuAp2/HXwj/cj7TexuN5mvrBCo5NyuCkFogNwkIcdkm5QXCHt3
	vKQ3ZjIwMszuu9jcKlRpTorBTsFHXaJnxAM9IIJrBmqjzJEX48AZnp1wxCMS7hST0snmbbDnSF0
	ZwE5tBjrPzrJ1Lhejua8EeCwVpNuTUFhBH+paB/DWuIjV0IGUc25QVV/F9w6EdEcA1bfhKmWIqf
	9xMb5eBSgt3T8LzGKm4f1l9wYMg+ApCF95kPkFFEkwFuNd0YdH5ugqimG2jPPscvCMVagcldCI9
	BV7kh/PErnp+dvSxYm6HFkAM2egHEevi5gKSlu6uF4B8zsrX85V8FURmqI/iX83DipolMYtEH0R
	4DnlGHBV78KVIGfgkIiCU7Q74XS8qPvMNrSXE=
X-Received: by 2002:a05:6808:309e:b0:467:1212:46fd with SMTP id 5614622812f47-46a8a588675mr1483551b6e.33.1774636148607;
        Fri, 27 Mar 2026 11:29:08 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04958090sm78071fac.7.2026.03.27.11.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 11:29:07 -0700 (PDT)
Message-ID: <3b0aad9f-b424-41b0-9efe-60a1252153f6@linuxfoundation.org>
Date: Fri, 27 Mar 2026 12:29:05 -0600
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
 Shuah Khan <skhan@linuxfoundation.org>, Greg KH <gregkh@linuxfoundation.org>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
 <2026032615-donated-chaps-9eac@gregkh>
 <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
 <722d5e64-a4d8-4ab2-954d-22f9b67f8f4e@163.com>
 <28dd623f-43f6-4d43-bf7e-41b8c771a954@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <28dd623f-43f6-4d43-bf7e-41b8c771a954@linuxfoundation.org>
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
	TAGGED_FROM(0.00)[bounces-35577-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 2D531349096
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 11:51, Shuah Khan wrote:
> On 3/27/26 02:39, Zongmin Zhou wrote:
>>
>> On 2026/3/27 02:43, Shuah Khan wrote:
>>> On 3/26/26 02:43, Greg KH wrote:
> 
> [removed text]
> 
>>>
>>> The problem Zongmin is trying fix ish when usbipd starts, it looks for
>>> exported if any - if it doesn't find any it assumes there aren't any
>>> exported and doesn't detect that usbip_host driver isn't loaded.
>>>
>>> refresh_exported_devices() doesn't have the logic and it shouldn't
>>> include that logic because this hook is called periodically to
>>> refresh the list of exported devices. Starting usbipd and loading
>>> the driver are distinct steps and without any dependencies.
>>>
>>> This patch he is trying to add that detection so a message can be printed
>>> to say "load the driver".
>>>
>>> A message can be added easily to cover two cases:
>>>
>>> 1. usbip_host driver isn't loaded
>>> 2. There are no exported devices.
>>>
>>> refresh_exported_devices() will not find any devices in both
>>> of the above scenarios. It isn't an error if it can't find
>>> any exported devices.
>>>
>>> An informational message when refresh_exported_devices()
>>> when it doesn't find any devices could help users.
>>>
>>> Zongmin,
>>>
>>> Would adding a message that says
>>> "Check if usbip_host driver is loaded or export devices"
>>> solve the problem of hard to debug problem you are addressing here?
>>>
>> Shuah,
>>
>> Your suggestion makes sense.
>> Adding an informational message when no devices are found would be a simple
>> and clean solution that helps users debug without being intrusive.
>>
>> However, I plan to add the info() message in usbip_generic_driver_open() instead of
>> refresh_exported_devices(), because:
>> - usbip_generic_driver_open() is called only once at initialization.
>> - refresh_exported_devices() is called periodically to refresh the exported device list.
> 
> refresh_exported_devices() isn't called periodically - it is called
> from usbip_host_driver op: refresh_device_list and it will be called
> whenever usbipd (host side) calls it whenever it receives a request from
> user-space via process_request()
> 
> For example running "usbip list -l" command will trigger a run of
> refresh_exported_devices() via usbip_host_driver op: refresh_device_list
> 
> I don't think it will that noisy to add a message to refresh_exported_devices()
> when device list is zero. Currently the logic doesn't detect device list zero.
> You have add that condition to print informational message.
> 
> 
>> - When the server has no exported devices, having zero devices
>>    is normal and not worth frequent info messages.
> 
> That is correct. Zero exported devices isn't an error and this could
> persist until devices are exported.
> 
>>
>> Theoretically, we only need to prompt once at startup. Is my understanding correct?> > I'll also remove the existing error messages like below,
>> since they cannot accurately determine whether the driver is loaded:
>>
>> if (ret)
>>      err("please load " USBIP_CORE_MOD_NAME ".ko and "
>>          USBIP_HOST_DRV_NAME ".ko!");
> 
> Leave this one alone, because it gets called from a couple of places.
> 

Better yet, why not change the usbip instead - usbip_list for example.
This is the one that prints the device list and the change can be made
there when the list is zero to say, "Check if driver is loaded and
exported devices"

thanks,
-- Shuah

