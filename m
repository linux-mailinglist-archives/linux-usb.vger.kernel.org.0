Return-Path: <linux-usb+bounces-35671-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDR/AnZ8ymlo9QUAu9opvQ
	(envelope-from <linux-usb+bounces-35671-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:36:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B0D35C18A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB7A23040E0B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514403D522F;
	Mon, 30 Mar 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmQoRjvV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4201B4F1F
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 13:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877433; cv=none; b=Gg6sUqaS9+alrTiqQoFbeZ5C3RQ8R+3fzRw+OogSJ/tMBxXQtwiyUav35Bm9AAUwA0SKAtPtgih1sOeiq5B4oG9tksIRRQwLu3CTcUWW9Tw2hRupwnSjZlPmz7gg0ZvGYITQrnRg+Ue+Yi1E2ZaIw504FElcS0Q25NHM06T7kug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877433; c=relaxed/simple;
	bh=PWI9pxJMUliAWSxOIp1fSPLGEwUcRFIYY006I5gutzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZFVMDBwGaNzHngALzjSS7Wf9eOm5STknsg19Jx/onPXx2Nd06X/m6SHaFnKmR8WfBjIO8ObwvELJRMNAbCrIIorIB6GE4vjTy6gw/Do0K8HqjyEyU/gCDqx4j30vHwX2dvfoWwRoOw6KRtw11vZdsDK/nY2HAw7+wSvgytS0cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmQoRjvV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so5579168e87.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877429; x=1775482229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77WeHT8C34JNWFQ0DtWQQvXMSZXQxoGR8B6oehAckGQ=;
        b=jmQoRjvVwOVvx6r72QPQI64ow/RiqnyE+p5PAwu+jdfvFRleymitXjvksg+5siCqJH
         po8FCgj25Yf1EZYgLbW8KaFPpDgrziD/IWpi5OoxsnbtB/hKoOfHvtxMUgCPtqZzSfe+
         T+h3DamHNJeRsMyZUaZAExSx8PZh5UuKWacCRTuftDMDxLxBtGiluNAHIku5TE7a4CKv
         /sYauYVYYqgiGfnmCsdnq7dm4f7awud3DmqHAyfKVwxekQRTG4JE53vFA9Owllt33DcZ
         wAM9dJRB5D1l1HZ2Ht7sZaBp/LLjeElXSWkV3kMbiqj9Ipk+rzHpFUqhng8UKLmUVDU9
         D8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877429; x=1775482229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77WeHT8C34JNWFQ0DtWQQvXMSZXQxoGR8B6oehAckGQ=;
        b=XExxbGiO8xQOhLCwfNCgY6kIu2h23MFZNU3WTRiHcY/tB3ebtFk7L7UpOBvIs0txiK
         mJuGWXMpAFJM50snA4kMIbXh8kmxXkLjWvSRMtljZJjpTIFAa6mIoVV9/TvyA3Xh5aPl
         NkrWVdEUpocL3TiVVpbltd51glMUCfc11C3GdLbkTRtzgQC0btFor2Rt8zwjzn3k+xBo
         RKSYnne9TPp6YeS/1MZP7aKbo31t/kkg9HYpIh/GYYuxJ4jDx9PRlDv6Gq4mg2LHfjDd
         Omdz2JQmw3JolYSg/NqRM1y5o2QvUwqXi0zDS5slNfYAuhjKgc4mL5gdBti1MK4S16fv
         wt9g==
X-Forwarded-Encrypted: i=1; AJvYcCUdVvkog6RiyN3pr+yMPxRFll2wVycisThK3ejsumGPZLsgGCuRpf43erblRWahhTdhlJyJTlbxRhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvZd2+x66jjVDEjGsG24FWJwMHj9DGG3BnSPiWbmYXhE7296NK
	OFnxXKrAHP/E3gY04pqQwdioyE/SMQQ+DDVcx8DDHm0tXwBtEqMOw3SW
X-Gm-Gg: ATEYQzzeQTu3xJBIwMn2goxP+eBOK4/ZVSSYn+htumD6/3xWjk/FXnIKveCQ+KiXrWz
	DNFSFh2sqRvUbhKP4yb1Rn1+++R/0tLmGuo6Abdiko0lp8kt7d5C17bYm0uJx7pBQCtbZOxZNYm
	wZAvp03YiySyub0tGsYEm0Ah/OsVei8Wol0dC2/aGtRJbZY9kiPlG+VsZKFLsyCyjvyVcapwHWY
	ZQpbmqDn96o4n+VmWEG4A6OtA9HWhJYeEm8alf+cWKFxfL1cwgeG+53PqeHs784QZpp5aOB1Ymu
	uKqgvGR+xcbg1KINpHP946tKnVNLJ6iVS2aHZigUo3EJ/EFhYVU+epBj7YRKnI98xNiLBiwlmd5
	3tXOsN/vbYCb2DkOIr2mGSnA5bs6JdGxcsf4GfhOoAwERKqGW2Fpr6V4RJ/8GobFyzPQWTCmnsH
	UOGFl2TC3eVHhc39it7gvxlXYUr9xLgVYyztz8gBRe1fVWFAtU5lGh3T/eE81ZTnQ+ExQTXv17s
	18kxSSo1ZGmHNHqaQ==
X-Received: by 2002:a05:6512:3b8f:b0:5a2:a355:aa4e with SMTP id 2adb3069b0e04-5a2ab927773mr5628324e87.31.1774877429070;
        Mon, 30 Mar 2026 06:30:29 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:2c2:728e:63f1:6154:c8be:fcb7? ([2a00:1fa0:2c2:728e:63f1:6154:c8be:fcb7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f549dsm1643949e87.14.2026.03.30.06.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:30:26 -0700 (PDT)
Message-ID: <e370860b-4ad4-485e-8ad6-30fea2241547@gmail.com>
Date: Mon, 30 Mar 2026 16:30:25 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdns3: gadget: fix NULL pointer dereference in
 ep_queue
To: "Peter Chen (CIX)" <peter.chen@kernel.org>,
 Yongchao Wu <yongchao.wu@autochips.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260328143842.57315-1-yongchao.wu@autochips.com>
 <20260329013404.116481-1-yongchao.wu@autochips.com>
 <acpAmimXvxD+WXA1@nchen-desktop>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <acpAmimXvxD+WXA1@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-35671-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07B0D35C18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 12:21 PM, Peter Chen (CIX) wrote:
[...]
>> When the gadget endpoint is disabled or not yet configured, the ep->desc
>> pointer can be NULL. This leads to a NULL pointer dereference when
>> __cdns3_gadget_ep_queue() is called, causing a kernel crash.
>>
>> Add a check to return -ESHUTDOWN if ep->desc is NULL, which is the
>> standard return code for unconfigured endpoints.
>>
>> This prevents potential crashes when ep_queue is called on endpoints
>> that are not ready.
>>
>> Signed-off-by: Yongchao Wu  <yongchao.wu@autochips.com>
> 
> Add Fixed-by tag and Cc to stable tree please, others:

   I think you meant the Fixes tag. :-)

[...]

MBR, Sergey


