Return-Path: <linux-usb+bounces-36831-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICeQMoQC9WnAHAIAu9opvQ
	(envelope-from <linux-usb+bounces-36831-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 21:44:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E44AF4B6
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 21:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 427D6300C257
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 19:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D3D42981E;
	Fri,  1 May 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ra2U3c+0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2374279E7
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777664433; cv=none; b=tnlrTIpWMKiEXVykNTHFAHQDeMcFHR+cF4PFzctTSDSS0W637+6yyP0Z2QkikYFiLx0HECkTMBcwgDyp8xwS+8t4ZinFt8qDMsc5FeDygr20i0NotCT5ZYtGH3er1eJ9jmMqrKi4L2/3Yv1/GA4ZdY4gLBHiJf4dMOzGULkhCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777664433; c=relaxed/simple;
	bh=E9GFsmnekKsH/6xM/QZ53TOVyqAnriWM8ZLZsUdfH0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RolIw5fgvyGD1OpRXEzIEe93U6RXWb90dyCDtOsnLAOn6m02T/UmBTzVbultcGyy+gtLjyZukxJILzwMOWpLJx3HDebkdZjQ/XAa9jrO3xIT7PTkGPQ6c0f+j/sIMZX3+QQzhlaNtPDtNi3382N+bY4GXDpDUe2MNYsu2ob3//M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ra2U3c+0; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d832f2f44cso2200105eec.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777664430; x=1778269230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=;
        b=Ra2U3c+0J/UdYQhUkAJV2m3CpiNxw6yLz25j3pF9agkdm07D/EcHmWEmiXKoY106cx
         PAKOJdhnlkTaCEsFAoXNCCd2t7lsi7llhbbi3YiaJ7/8hl2vH4q8Q0j1HXdax2DQWd9c
         Qgl9JaFD5/ydcqtef1w8gIM6sxS5JOitIisQRO6wsVMP9JrSqn8f96/0miffMH3Tf+F0
         yL68d1ITCeItoNEWu9m5wOsq6EGY3jn46TCxDE7kehrESPT8FaI0Ljs6srR/npKKecwo
         wsltWoF/bT5jaSU/gYYqz1REZ+Kt1HhikcXQhbQKizB6dMPObb7574y6Ssn4gBAv1lOK
         +kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777664430; x=1778269230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8+F67fOWD2tr6DD1heUFiUUyHmOTJ/tbCdix11hm8s=;
        b=ispw5zJqsDJCAsseX5xm00Pt2h7TQtD4UbxrQ8OBIWeplJ5jvP/StbiDczt0MXjv0R
         8KBSWib71MDWH3XCbdomELVDN9o4s5EAuRa27FA+Vy+z4LtJ7drt9wqG3xB8n+RfBFAt
         OlrCppSHiH+NHfhvD/yPx172FBoARrrXflaP6kx9UzksY7AqdjplC7kId/JyVOmbYKOC
         KFMzy0m3FWmXrX0mHjLEWrmGGNb1JvDI/T8GWpSEUzEVbUlOcLQq1MtT28pc8VTtQo3O
         ShfVs0cUPbGMNqEA7DCWZf1xrW7MKVf9z8vPplJ0uawO2YHBWiR8CMZDB3Ii0dshqV8g
         ANGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+R811nPJRf4vyJBBgfcuQeistiZl9aRZ1dzj1XJAIl/dGnTAtdR1qDa/Fu9duNwMyAiseyli02YPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6Gi5HuHhyW3vNnh+lDEstIiH72cVKnk3wSKJdDS8CO4XQso+
	2fl6GjORUV3KHgrCLaOl/5WZaWahxS7aq3KW6TXPHDU/1BN2KqNQq8uc5Gvp5POing==
X-Gm-Gg: AeBDiesmiudEkEzI06/PR7+FP4AxZv938aL33qkR52DO4JxeoXNTA5XHTonQAuiVEqj
	yDfM/1XCaYXrNTvRAmkPrJ6ogOwRMmSY8v0NWcBj1tHG4GCXYfckp2UQCx/1AsBudxfoR1Frrl1
	ntk7OwUDzH9w8+RZFBdF0AZXoC4J852r2M6e8gvVZieTPyWG5Cn04b1y0A7OdlE+d7YnkSwjvE4
	8qLJ/D5wgS3v7OySWZa4/9AvzdesM5e98R05M8uRTsLtyG7p0HtQMQB0sJA5VV/UotKJnPQbgFw
	KhEI9f5Jxx84vU8TlIjl/TItkFJhYSHghahNjtAMkE+qcLuNsn5MASWqApIUkQtXxLddvjq77nY
	4d9eSGX22nh0bgmgHUO0UsvUU8NtRfDTZXH3hAQeBNHw0ahTOprFHSyKXlgFV3BaRMeYEE0gJ/J
	tudIOGWMYFBswyh0fCDq45cbgzSVvlfyduCCBQ1qa77FeEck8htoDV/liLhPFMcGa2jo/GiV9S2
	Tn7nNQAoJNPZ7+pMZrOOzpkGDXHaie6on7jRptA65jWU5I=
X-Received: by 2002:a05:7300:6c12:b0:2ed:e12:376d with SMTP id 5a478bee46e88-2efba5a7316mr301846eec.35.1777664429125;
        Fri, 01 May 2026 12:40:29 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:5e5b:112e:7ef4:6fe2? ([2a00:79e0:2e7c:8:5e5b:112e:7ef4:6fe2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b390df0sm5587081eec.17.2026.05.01.12.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 12:40:28 -0700 (PDT)
Message-ID: <d5d36882-5356-4b7f-a73f-70b8edba28d7@google.com>
Date: Fri, 1 May 2026 12:40:24 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Reichel
 <sre@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-3-76f59233c369@google.com>
 <20260424082639.GI170138@google.com>
 <fc767096-f39d-4088-b3ad-cc85bdedf36c@google.com>
 <80599996-00e9-4e6c-9215-cf1c33a861bf@kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <80599996-00e9-4e6c-9215-cf1c33a861bf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6A3E44AF4B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,linuxfoundation.org,google.com,gmail.com,linux-foundation.org,linux.intel.com,samsung.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36831-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Krzysztof,

On 4/29/26 9:59 AM, Krzysztof Kozlowski wrote:
> On 29/04/2026 02:29, Amit Sunil Dhamne wrote:
>> Hi Lee,
>>
>>
>> Thanks for your review.
>>
>>
>> On 4/24/26 1:26 AM, Lee Jones wrote:
>>> On Tue, 31 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
>>>
>>>> From: Amit Sunil Dhamne <amitsd@google.com>
>>>>
>>>> Add register bitmasks for charger function.
>>>> In addition split the charger IRQs further such that each bit represents
>>>> an IRQ downstream of charger regmap irq chip. In addition populate the
>>>> ack_base to offload irq ack to the regmap irq chip framework.
>>> Please reword this commit messages.
>>>
>>> Using 'In addition' twice in such close proximity reads a little awkwardly.
>> Thanks for pointing it out. Unfortunately, this commit is already part
>> of the linux and linux-next so I am not sure if I could fix the commit
>> message retrospectively.
> I don't understand why you decided to put this with USB patchset. We do
> ask not to mix subsystems all the time. You made it unnecessarily
> combination of at least three subsystems.
>
> Do not do that.
Thank you for the feedback. I understand the concern regarding mixing 
subsystems, and I apologize for the extra overhead this caused during 
review.

The decision to group these was driven by tight functional 
inter-dependencies that I felt would have caused build failures or 
regressions if split:

MFD & Charger: The charger driver relies on new macros and symbols 
defined in mfd/max77759.h. Additionally, the MFD driver handles the IRQ 
chip initialization and defines the named IRQ resources that the charger 
driver requires to register its handlers.

Charger & USB Type-C: To avoid a regression, the charger driver needed 
to take over charger mode programming from the TCPC driver (where it was 
previously handled as a workaround). Merging these separately would have 
created a race condition or left the hardware in an inconsistent state 
during the transition.

I see now that this made the patchset difficult to manage across 
subsystems. For future cases involving such dependencies, would you 
recommend providing an immutable branch for maintainers to pull from, or 
is there a different preferred workflow you'd suggest?

Best regards,

Amit


>
> Best regards,
> Krzysztof

