Return-Path: <linux-usb+bounces-35068-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGEfJ1PYumkycgIAu9opvQ
	(envelope-from <linux-usb+bounces-35068-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 17:52:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CE2BFAAD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 17:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE1A931452A2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66665340A59;
	Wed, 18 Mar 2026 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J9SdwoJg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DD33EB10
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851480; cv=none; b=uVnvMin+PHJmCfFYZ0YnGECYf56r6xjTmX9gxnyqamxZVGf0/QSQOtrToArXHhskEsj8bDwze72SOhsADkuqvfsVyGjtqqdU8Tavx6gG6LKGdZOpJwjyqW1pbUEk02XJeftQN2GL0Qn0qw2p5IOmQ35k+o8GeTGbKEdfFZwhAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851480; c=relaxed/simple;
	bh=MEv/WlD+rcv5wTooW32b9ZiJ9vyx50B5PB553LliTpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ep4xr8Li5rPa6RJyikHY+1PxkoFOkRvLGR3md5/2n/X5GGT0Jng0PMyR4gBzvjMwqEqrR28hzpaC69atkT9430/xuYalOsXtfp89wWqsLYA2gpeQMw0SfuLmjPF75/GMfNMpoorBXRoShMD/J6uIw0jWM0HSHqyfuJDcNEj7q10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J9SdwoJg; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-35b98def50bso117548a91.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851475; x=1774456275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jO3gU4CP+kDmJHjIMEAG5dIFF9fQfB/wxjxMJB3538c=;
        b=fV7JKpQVx9H00s3U5VW/+iOsDr4FeIcRLPy8SqBx9U51Pjf84z32wDNa4+SXY7vPL1
         kRVOneJSHtwuEMQl+7VEKwqmTsQY/WzI+Kggl9c8ZAK6nxhMHLlInaimw5lZSeWU8R/G
         wHbvhwXtrADW3gJ4xrFloN1VLg2ws12eCgmm6JzleKasR1/8w9JiUUm1I/sGo/TrKwcT
         8B87KzUMAINYdXSkFR6YO71MY+u/x4EEHGQhXbIDwYUoLrO4wn2U9qr4qFGbNHsAx+EJ
         jVKc9wB/ACdv7oeExy/y4I/tgNI8pSabAaVs72Nz1UHtQtmlyJwdX0AQfqrvpm9wDqSB
         YQKg==
X-Gm-Message-State: AOJu0Yztb4DajpBMRJxqJ3gGKZxyzDniE4XmFBQJOFPH3c4B6Yvd6hmy
	xscElPR4RVrKx3C71lHNxr8iYfamjxhmWmG5qSz7VEUaFgY9yIqYRAxmgWsKs0jh/rUjhxLVZBE
	DjYTnI/qgeMSAdr5wC2l/r1TWnyESBu8o9FhDtWBM1Y2X0VUnxTDyFDIozNfss4xN1M7zEFxHxp
	JpywmW863TVKCOm2/vpJMbMidB0VRQoXjUQtWbEHQcgnQfiw+CyuZb6+MxWXCFu0Jr42R2vmh2Y
	pTlLcY7UIaxsw==
X-Gm-Gg: ATEYQzyu6oKN6xztOvik0w4k0MK3+ARubNTnaM07QGO+ohHagY1yjz0ftgEK7lJFGMS
	YpvISQQreklqnZ/M0ay6B4K3JZtPVFEvzm8atg4MQfLPQoaP2N08YN1+qV2vethKxEqTHKdB6B6
	WHqZFUyL9b6pKmlMnvsEhm3KN/zk6Y3D2P+oYyZxV+B3cGRBGk68hD7X7R9RypTU1pYdf+UdPJN
	3oNZ389uaE7NqDp93a898S7Lyb/3v8g1JrWP5ew3XkMkWn31ma6WRXHI+UQk3YeQbizX6B9g1ca
	Jf60z2FhJUCqDIGHZoP3vx8JBRY6H2+ZpfLqf6fLscwPI8v9VOnFOKPxmJwj0u94B1EZnOY4cJG
	KbUgjcKCBp4ahoS0awAhhIJJS55EksrGZFdmZOUBSY99K8PL0Lhrbd9o2U+P4qbCuXrGGRvSdIb
	V39FS32/YcSkyJw2LmfT47CVZ1YBuxG9oEU+kbxinfh9Pgexjy0lR0yuGixQ==
X-Received: by 2002:a17:90b:528b:b0:35b:929f:7e92 with SMTP id 98e67ed59e1d1-35bb9f0e220mr3485805a91.18.1773851474505;
        Wed, 18 Mar 2026 09:31:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35bc63207acsm6546a91.8.2026.03.18.09.31.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:31:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-798531a0f58so4452477b3.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773851473; x=1774456273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jO3gU4CP+kDmJHjIMEAG5dIFF9fQfB/wxjxMJB3538c=;
        b=J9SdwoJgNYb0LN8SV1LixPg2qsfPpb+hD8ehKzk5kYiZF84EJySCX3sP1x55UFW2M3
         apYSD7geIR/QkIrgTgSTqro1U6yJMey0EtmBQvJVvs4UYpEADWZHqV6oCN7wEIqd8Z8Q
         jjclfYw2F+uNxsItXmIVCMPpTkhxIk8Nn23q0=
X-Received: by 2002:a05:690c:4483:b0:796:2fde:5dfe with SMTP id 00721157ae682-79a71c48d8fmr39300637b3.38.1773851473282;
        Wed, 18 Mar 2026 09:31:13 -0700 (PDT)
X-Received: by 2002:a05:690c:4483:b0:796:2fde:5dfe with SMTP id 00721157ae682-79a71c48d8fmr39299927b3.38.1773851472615;
        Wed, 18 Mar 2026 09:31:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:3f50:2990:9d0f:48b0:9d4b:a7de? ([2600:1700:3f50:2990:9d0f:48b0:9d4b:a7de])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a7136cecasm19881027b3.5.2026.03.18.09.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:31:11 -0700 (PDT)
Message-ID: <df80ab6c-69fd-4473-ac1f-2819e5d01e1a@broadcom.com>
Date: Wed, 18 Mar 2026 09:31:10 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci-brcm: fix sleep during atomic
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 alcooperx@gmail.com, stern@rowland.harvard.edu
References: <20260312190825.3596757-1-justin.chen@broadcom.net>
 <2026031801-spinster-scraggly-7504@gregkh>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <2026031801-spinster-scraggly-7504@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,broadcom.com,gmail.com,rowland.harvard.edu];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35068-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:dkim,broadcom.com:email,broadcom.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.chen@broadcom.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 331CE2BFAAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 7:14 AM, Greg KH wrote:
> On Thu, Mar 12, 2026 at 12:08:25PM -0700, justin.chen@broadcom.com wrote:
>> From: Justin Chen <justin.chen@broadcom.com>
>>
>> echi_brcm_wait_for_sof() gets called after disabling interrupts
>> in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
>> to fix the warning.
>>
>> Fixes: ("9df231511bd6 usb: ehci: Add new EHCI driver for Broadcom STB SoC's")
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>> ---
>>   drivers/usb/host/ehci-brcm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
>> index 888e8f6670d2..5e3156f94cc6 100644
>> --- a/drivers/usb/host/ehci-brcm.c
>> +++ b/drivers/usb/host/ehci-brcm.c
>> @@ -31,8 +31,8 @@ static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
>>   	int res;
>>   
>>   	/* Wait for next microframe (every 125 usecs) */
>> -	res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
>> -					 val != frame_idx, 1, 130);
>> +	res = readl_relaxed_poll_timeout_atomic(&ehci->regs->frame_index,
>> +						val, val != frame_idx, 1, 130);
>>   	if (res)
>>   		ehci_err(ehci, "Error waiting for SOF\n");
>>   	udelay(delay);
>> -- 
>> 2.34.1
>>
>>
> 
> Why is something that has been around for so long just now suddenly
> being seen?  What changed to trigger this?
> 

The edge case occurs in rare occasions and predates my time maintaining 
this driver. So we just so happened to run into it recently in our 
tests. Guess in the past we just never hit the edge case with the 
warnings enabled. I had the same question when the warning was reported.

Will fix the Fixes tag in v2.

Thanks,
Justin

> thanks,
> 
> greg k-h


