Return-Path: <linux-usb+bounces-38092-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDvZB6etFmpHoQcAu9opvQ
	(envelope-from <linux-usb+bounces-38092-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 10:39:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A75E13AB
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 10:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD9883009B15
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2903DFC88;
	Wed, 27 May 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buYKQNrc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABCB383C7C
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871052; cv=none; b=P2XReldcTdjGN4DSkJuf40WutjCW6iLvtIdw0HjLUhTQpSZhom1MtALd/3H1ExiDq941nqEpV5Oe/In7l4gYE3thrcuArdBYX7p10YtfMkijhEbRR7051x3XAqZlY+uWdcGipu/gqf7Q5yImI3F8ATOOD6Z8gdsA3MYFgMy/4Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871052; c=relaxed/simple;
	bh=KqmcM5wjpzIIpE7M9ZJHP3JYmC0sdYhOOdrFBUm6YhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/UusS1mzhkZ8NghZ2a/KabM1KwtbNGGI0JGsf6UH/V69K4qLn09T7ZtaiOTSSQq8U+DHSXtlsQvCcWt5mrLgHjzJ0i4oXWR65yn9nP8AaidtVRVG/4JfCOV3rTeHUryIBDLqKQ1gb9gT3D3M6vXALZdhsqzoUhbGL7v7k2LymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buYKQNrc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso29768335e9.1
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779871049; x=1780475849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dd63B64j/8tYt7JtZPFcGeZ7Eicxm9sULbtAClwSATc=;
        b=buYKQNrcX1Jf8lnDxw/fm2hmChhKjvpkbm1nRtLAe9x2ya6OqEgR4F4TD6lDtqDP2l
         F3zourjfBDw0BXcsLTePrLn0+cMPLPNUmO7FjWVrSGHJnE5tFlpAZhY7z9n8ks7aC3Cs
         IHp6OB/7E4zYEVWoELHDV5/Kg54QK72yyPfKyfQOK9wN5TDBZNkcOErAtFXKtlfXYPvs
         ajb/DeI4pZqhrMjJHZ8HCwHpwDiOAbTFT++1kdRRJJsxKdJToQ7NON325Pgi7jo23Ww8
         m7Vnli6WiVvKt7eSrqH7svbXBJVXZ92QjJqjyR35dSkQXZQZsNDjHove4NZWHmM/fJ6E
         ztgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779871049; x=1780475849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dd63B64j/8tYt7JtZPFcGeZ7Eicxm9sULbtAClwSATc=;
        b=SumRbDBJtsbJUiEPAEa62P+WNIxKEx9bfI1MN9xDFXnNGAROh59D9OQ1qsDWlWbr2G
         anf/AqAEb9c6mgvhCXa0QNW803zl07n1k1P4Fm+rrKUD8dwbCurJQ4gZZvZNYHSDN8si
         RyLCqU4rDcAHXG4NcVaEPu/bAuUxp+krJn53EqoMmGgRaJdf776FIPHyMSvncq3Ju1+1
         L3YbwfV4tktWnfl5wLgEscId5GYCbzLA76Qfb/U9kPkVxLvHNHz5cf8mha94YmNZD84e
         k1CmN13IrAWkV2LIM0fcxXZ0YcxhwE5x+6i7BuLLKhV90EuaZm1YKjypL0Sq1kJazRTh
         hMlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qxneP4opVq7zdqfecCdyf8IQC/fq7FnizeFme21vbi5bAoLS1MPO5wb+1NGN4M5lbTOvfmxHvkI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGZottuxdbR9ZwJ979BcJnZparlVOQWnXRsGX7Y3dG7UVX2PR
	vIHpK1JVZOUlwIX4rB88/icNgbYNMQvV51mRTrkmV/19AP3+2WB01L87AfEoOQOG
X-Gm-Gg: Acq92OESNRtx3RerRJNiQYVBe3hZ1BvI+NNm7oFdyHBxFcSLLY3YQfsE4GOFcGAeQMb
	DAY0go2+ZdfhvN0rj867u/VA8rdOWsrgIhLqaUDH/fEuQzS8FG33tGGdyCZ/QoGMCuOtWN01+v5
	sL+Rj+VJroVXrfuWFqgQkICO31afpLHRnwWcjEYf77Ya9QQtXXodxe01XLuGK0Nux4HuyAMxwNV
	z06KPGE58oxP7xULQH0EIeSvz1qd+zGyw0/FrhXPE80es/VfGg5COS/NW+Yu8HiQtz3DXwhyqDo
	LjOUoUawjDU4H2MeZ5i2Q3dJpgZw4H+athlhrh/OUbrsfd5BSZ3B36GXRb0XgX3KjyfCSnzywW5
	HQSy39vZI5nydrr82oBi8ElFqMB4wSvKJCmeSoi+f5KggP/iBa4rYIbOd1GiPdD1ESnrtLFdP+F
	UJ6GAzPD74UOSk0BMSYZPqqRGvtwKpX+1sXWU=
X-Received: by 2002:a05:600c:1992:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490426bc7dcmr362225525e9.16.1779871049109;
        Wed, 27 May 2026 01:37:29 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm682068395e9.1.2026.05.27.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 01:37:28 -0700 (PDT)
Message-ID: <f44f2c8e-accd-4ea8-8184-7da610340a9f@gmail.com>
Date: Wed, 27 May 2026 11:37:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: gadget: u_ether NULL deref in eth_stop after
 gether_detach_gadget
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: khtsai@google.com, sashal@kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
 <2026052726-vagrancy-lilac-bf72@gregkh>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <2026052726-vagrancy-lilac-bf72@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-38092-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8C6A75E13AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27.05.26 г. 11:03 ч., Greg Kroah-Hartman wrote:
> On Tue, May 26, 2026 at 08:56:15AM +0300, Ivaylo Dimitrov wrote:
>> on linux 6.18.31 I am seeing a NULL pointer dereference during RNDIS gadget
>> teardown.
> 
> Does this also happen on the latest 7.1-rc release?
> 

I didn't test this on current -rc (this is a mobile phone and not 
particularly easy to run latest Linux on), however this looks more like 
an object lifetime contract issue than something specific to 6.18.y.

Also, the suspected patch was backported to 6.18.y together with 
e002e92e88e12457373ed096b18716d97e7bbb20 ("usb: gadget: u_ether: Fix 
NULL pointer deref in eth_get_drvinfo"), which fixes a similar issue, so 
I strongly suspect the issue exists in current -rc as well.

>> I suspect the reason is commit:
>>
>>    usb: gadget: f_ncm: Fix net_device lifecycle with device_move
> 
> Do you have a proposed fix for this issue?
> 

Not really, as checking whether dev->gadget is NULL before calling DBG() 
looks more like a workaround than a proper fix to me. I also don't know 
the subsystem well enough to judge whether switching to netdev_dbg() 
instead of DBG() would be appropriate here, or whether that would defeat 
the purpose of the existing debug messages (or cause confusion by mixing 
gadget and netdev based logging).

I could use some maintainer advice on what they think the proper fix 
should look like, and then I'll try to put together a fix.

Thanks,
Ivo

