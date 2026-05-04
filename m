Return-Path: <linux-usb+bounces-36901-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDmzGezg+GnM2gIAu9opvQ
	(envelope-from <linux-usb+bounces-36901-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 20:09:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3904C2524
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 20:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90520300AD7F
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 18:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7BF3E51F5;
	Mon,  4 May 2026 18:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g41+Js8t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A3C3A5E92
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777918180; cv=none; b=boMF1kKQjOa6WhVTcd1N5RhnFk991WFCbAlzB+GHtDTJgF9cjGzcAXvbKIy2LNNMhMFgSc2+i5aUa9aJRTpjMEEfIYuti4bSqqrWUCHMOSxxavwJqnpmm/ule92xIuKpBrKWamX8OOd32QZzrffk7VSxhV5IjxOvT0gWbWLe6Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777918180; c=relaxed/simple;
	bh=zrdfpnzV395yK4H9FKGGBZswGo2p1cuxa003EiaAwbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQ8ji52D8ueO76R5ubDqup/djSWcmVBUz2zcq9rzRWjpqq5TH3y4taAFTVKQFgZtO/LVykHw1X8EpexhErE/eEXVnoOQYkxO53DjOVUtTDNXhpcr3SDimvO1xwMPZ4EKl1GG40ry4c7fqnEj3aKahBhRdwfAD5Z30DA30KIh5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g41+Js8t; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-799001d73bdso40228567b3.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777918178; x=1778522978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDrEC/bbBf8LmPd2aHj2+GbHdkESbtD2hxIp9kN8Yo4=;
        b=g41+Js8tH0agPoZyJmNqeqlkiwsnw71jXhHLSIWosl+Ks6uXMbTYujUqgjqi1sxFUY
         J2iMCqtSknetCke0AYogq/sReOdYo2exexmRrvMXjrr/dIPEY/6DfLuk6qwA4urm9zgn
         k7m4LHXYRAKneNCWvMsVg2NRi5n4Ry4/rVXsgfmWAHJTilbjhZnD9Kc0ZDMeVcQaqnYN
         Bvq/JPZJnMns90b5Z3JuplwdnTz3uaHNorvIqwK9FTM9D9j/7sQ4dYbWTrSgGlA9Q1ms
         XDVwpk8cPU9o5ssJ6ndO/13CBq2iUxbYP6ld8Yb6CMO8URNyCqUlt4oGJywZicKrq/3Z
         KMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777918178; x=1778522978;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDrEC/bbBf8LmPd2aHj2+GbHdkESbtD2hxIp9kN8Yo4=;
        b=tVIKYh2Q8/WD4K4d6IAyZhItQJdA7Y1JRg+iPowkIMqkgiwNLHu+mBOdHHAFnle5kD
         Upep6Id5AYLeAXxbCL+2bbvzTGbNHqu+3t7fp0BHUia9mhgucpkGSbl6+U1HjesIBZbu
         j+qqOki54Oa6fNUooM+RM1iMA/MLsaVsyDufkejXmlYSaupUGEigKS9XFntBXreTJ/r+
         NDn7hZ1I7lS5PFSeyCPuteApc7SdprZtp55S7T+6d4hJjVN3n3YR8s3qG9KQnBRRF1RF
         BFG4Kp4kckKeA2JxE4C26ZePsJrDutoXDapIr6DPu8cSktl0Ucou0HvJweCYrfkAWx7/
         7nKg==
X-Forwarded-Encrypted: i=1; AFNElJ+dnBve84vAnfFIeRBaXhzJYshN3GzD4KYFVJ5TGNjwYONSDUcNjHVngwW3ZD+D0nH2wQTcS0MufE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHoWwrW/LztPuex9X9UOhv0apJANK8MH7CQiaqK1aQ3UvHq6JA
	tD9CgM7Y0U1l0ww8lpthfovW7cSuZ+79SnHim0Ctn2JwIVYpR9B610bp7KjITDpekg==
X-Gm-Gg: AeBDieuPkyfH8eQctdF9/QPqQ9caE8DB3gdb08+XfQV8YM8cLi3CUe0scAbAsTmK3a0
	Ze0RLs9w1LWm+AUvNlQKIi3x8uRIO8ajIJQuL0RlEQEV66easDHxeck/k4Rua2VR6ROpTomlaEF
	LA9Tt8u2DAZoWbSsaj/SAOUSjRQX7dofbcXgWkO7YvItFYBu4DoTyZR+xw5l5eoK26Eb+QSysFk
	7qu/W5vh2eUIrbl3DRtvG39FkUyehja50WSK/RQDh7aQNtzJhAZzswNHiD2NV5Zk+2CI7rYmem9
	g0OMjvZvgAk12N+kKPCMBQDacxnAZMXS8uBIFCyAAYK9uyLpXAASXzMitcBk/wc7hwphp3wbfXb
	heAa5xrRGHi9yovy308Fp/IHA/05DDRxolJPgRBszjkN8JofYfgEvzOmbJcYR2Q5YdtP+AHonac
	VeJQ9MKckDfO21XPvBjFcAgY1Uu6y2N0cZwk9EaP0GkoGbW4s0+66qiGq246Ckg5yJvClobXM++
	CyL0B+Q+gu8ZOYzld3P
X-Received: by 2002:a05:690c:a018:b0:7b8:9418:7605 with SMTP id 00721157ae682-7bd7710e854mr105008447b3.38.1777918177380;
        Mon, 04 May 2026 11:09:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:8a86:6cfb:83b6:4f09? ([2600:1700:4570:89a0:8a86:6cfb:83b6:4f09])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66885907sm53217837b3.43.2026.05.04.11.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 11:09:36 -0700 (PDT)
Message-ID: <ad51b3a7-341b-4549-bb14-04260c35f999@google.com>
Date: Mon, 4 May 2026 11:09:25 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: replace strcpy with strscpy
To: David Laight <david.laight.linux@gmail.com>
Cc: Maxwell Doose <m32285159@gmail.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260419213638.38291-2-m32285159@gmail.com>
 <0643586e-e665-4592-b941-2868fca84322@google.com>
 <20260429095445.11b7302e@pumpkin>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <20260429095445.11b7302e@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6D3904C2524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,linux.intel.com,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-36901-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]

Hi David,

On 4/29/26 1:54 AM, David Laight wrote:
> On Thu, 23 Apr 2026 12:23:09 -0700
> Amit Sunil Dhamne <amitsd@google.com> wrote:
>
>> Hi Maxwell,
>>
>> On 4/19/26 2:36 PM, Maxwell Doose wrote:
>>> The function strcpy() is deprecated as it can be used in buffer overflow
>>> attacks. This patch replaces strcpy() with strscpy() to improve
>>> security and stability.
>>>
>>> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
>>> ---
>>>   drivers/usb/typec/tcpm/tcpm.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index 8e0e14a2704e..69574c5e79e1 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -725,7 +725,7 @@ static void _tcpm_log(struct tcpm_port *port, const char *fmt, va_list args)
>>>   
>>>   	if (tcpm_log_full(port)) {
>>>   		port->logbuffer_head = max(port->logbuffer_head - 1, 0);
>>> -		strcpy(tmpbuffer, "overflow");
>>> +		strscpy(tmpbuffer, "overflow", sizeof(tmpbuffer))
>>>   	}
>>>   
>>>   	if (port->logbuffer_head < 0 ||
>>> @@ -841,10 +841,10 @@ static void tcpm_log_source_caps(struct tcpm_port *port)
>>>   					  pdo_spr_avs_apdo_15v_to_20v_max_current_ma(pdo),
>>>   					  pdo_spr_avs_apdo_src_peak_current(pdo));
>>>   			else
>>> -				strcpy(msg, "undefined APDO");
>>> +				strscpy(msg, "undefined APDO", sizeof(msg));
>>>   			break;
>>>   		default:
>>> -			strcpy(msg, "undefined");
>>> +			strscpy(msg, "undefined", sizeof(msg));
>>>   			break;
>>>   		}
>>>   		tcpm_log(port, " PDO %d: type %d, %s",  
>> This has already been fixed as part of [1].
> It is also 'not a fix'.
> strcpy() is fine for copying literal strings into arrays.
> With the kernel headers you get a compile error from strcpy() if the string
> is too long.
> OTOH strscpy() will truncate overlong strings.

Thanks for the explanation :) .


> 	David
>
>> [1] https://patch.msgid.link/20260310094434.3639602-5-aichao@kylinos.cn
>>
>>
>> BR,
>>
>> Amit
>>
>>

