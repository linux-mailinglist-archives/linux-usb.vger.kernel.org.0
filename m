Return-Path: <linux-usb+bounces-33012-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H6sObHmgGleCAMAu9opvQ
	(envelope-from <linux-usb+bounces-33012-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 19:02:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F278CFE23
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 19:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 496A030360B6
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 18:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6124138946A;
	Mon,  2 Feb 2026 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMPagI2B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB538B9B6
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 18:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055313; cv=none; b=YULTKgw89msnD1rXNE43Raqwcs+ZhPbX/Je9MQhivncyAPFpG6i6eNnPU0kq1+OSrf5hsDU0U0Npy9/uIoMFh4vdi4Js3Wl3Gkil1nSkdoKBVgGETnqC+KDhB7lxY5huwOhjUt1JpcVsd5vmD4kulcp81/jZRuoetRUzPuNHAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055313; c=relaxed/simple;
	bh=hTtgkhOWMpNlBXr1nPDMrRziEVVQp/MwMYD4QueQQpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4Vd3NGPAhxxrWlVDcmOXEk29V0JDFu7yrSP8eY5Yo1F8YJxxvJXKElQnM+Rzm6og51rWF7H7BveJn75mYjhOUOwIgQ8tNDz88s1do/b3OXDesaCRB8Stp6rYOqFvNKaR/L2Ir7SWWsb5+QsnypJ3N69nHNrw4TeWr6nbJ6+MZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMPagI2B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59ddb31ddcaso5351245e87.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 10:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770055309; x=1770660109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFABA++ZvkbyuC08URcMyM+fmFe85L0vnPidtUOeUZA=;
        b=jMPagI2BaSTgwApEPadMupRuXGmZULICw2dkfzBIlw/3Y62rJKorbZZdFdP8vQLPpT
         QJ79Q4qLJkKZ6rxEbQAp5yJTJdgGR3sv8hSnIWK2Z/tfor2To5n4bgxEU7v5SuqF0POf
         24J1wQluxfgfE0JT2AV7wZFdwtGyiJ25BuG3CLXth/sauSqYzMmic2EgrlKjSwErQK0P
         aygK5F8dzS06vHtfWn6JmAL43U0nc83sn49e+Lg7RUr3sJ3naSSTF7qA2qdNwP9xib0c
         qSJA1tacedVLWbXYwDwMjbUQOKh1G/pEYLTFNwKUFn+FYjDK+92EFlrSR4Jj1FC9G8as
         +1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055309; x=1770660109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFABA++ZvkbyuC08URcMyM+fmFe85L0vnPidtUOeUZA=;
        b=I0hL1J5B4/l/pw5AEyVeWmowGB6OXO403Qcwsxj2rmRK7UCL5VT9XrYXHZFkRHAoMq
         hlZsI/HqJq8u16TathmjcbCEkcbxRjK2MIHPPPkgBbF6OvHjcBZNQm8kIqbGldwlCko1
         rXDWDwQmiw6D1qBqK3VYLSzgRNKWkNB4bg7kdvlprLbDdIlzKApFJL3HW6Ofch+dV8ID
         GJ+vdpo9O31J4HdblQz4sFnCJ3r7UEIxdhHL+z6ntSS9/DDjhVpO0KlYICVSsS3pfVGF
         WnH+YAY37NYZsepBl/qVBM7TPhjS2EgzF/NcNWEQdLvB3fpcYUk/uIGQGQwfBW1rMMJe
         wjYg==
X-Forwarded-Encrypted: i=1; AJvYcCUPg3HsX18Oydhk1nQ7EjusGIMw53wJt6tHvMV9SwpoJ28raicnEq59g94tok7ypq+r5pmK8rds7o0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLXbaPm22cYXJRXL94IuzQDFTzvRBzg3AqsZfAhYH2M6gUPHy7
	8MforX06VwlQjUKiznjoYW14HyDlJF7tACuh/v9Hyu1gF5XtsgWsnI7O
X-Gm-Gg: AZuq6aKApHvODQKXlO86lVOUVh7m5EpyvppbxFrZj0gD7f4tntZVAaJO0xSOM66/TOb
	Rjpapo1uvdSspZo2OvGPWNhJb0OM6HpUqQFXTV5wWTb1z2kHpFRsCLwbvZoZnIHB07jUifiK7q8
	KEvrrJ2tnAH52cC7+Ql/84dcBAWojJ/EtpHE/q59ZvUrQ04dgJvyl7DXpBwz8LL+k/XPqkQSAN+
	GGgb6lLB94vBbfEgjk+tEzXlmt36YkvEmQ6xVBGhXRztHTAANflGhhqgOgKE3jDunUSDR6MU+S/
	ZB46W2tgNFIXwlonRs1cSGLq2V+8pWb7P4iAx/D0C1lV75w+DhQcp1oZJ2S5v4kNweGPMcYtvXe
	35cNDDg900RjJGVkU9eW2PZiGfFNtj1DFB6/kInBqfIM67q2dC0LkKEZLJ3igXOJ3Oc7YQ9mX0Y
	DzIjUDWLqBlbCOpNQqcsQpCoXlMXBZ7QbNW3ZRKTjjX1WKQQ8mYOLb/Kq5ejiNhFuITegJiQ==
X-Received: by 2002:a05:6512:4023:b0:59d:fd1d:ddff with SMTP id 2adb3069b0e04-59e164304e0mr6191268e87.45.1770055308708;
        Mon, 02 Feb 2026 10:01:48 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe? ([2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bdabesm3761777e87.93.2026.02.02.10.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:01:47 -0800 (PST)
Message-ID: <aabfe8bb-cd04-43f4-b0e5-07aca86c3ae0@gmail.com>
Date: Mon, 2 Feb 2026 21:01:36 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from
 utmi_wait_register
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202080526.23487-1-clamor95@gmail.com>
 <20260202080526.23487-3-clamor95@gmail.com>
 <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
 <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33012-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,nvidia.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F278CFE23
X-Rspamd-Action: no action

On 2/2/26 3:14 PM, Svyatoslav Ryhel wrote:
> пн, 2 лют. 2026 р. о 14:05 Sergey Shtylyov <sergei.shtylyov@gmail.com> пише:
>>
>> On 2/2/26 11:05 AM, Svyatoslav Ryhel wrote:
>>
>>> Return exact error value from utmi_wait_register during HSIC power on.
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> ---
>>>  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>>> index 3a7a74f01d1c..6173b240c3ea 100644
>>> --- a/drivers/usb/phy/phy-tegra-usb.c
>>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>>> @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>>>       struct tegra_utmip_config *config = phy->config;
>>>       void __iomem *base = phy->regs;
>>>       u32 val;
>>> +     int err = 0;
>>
>>    This initialization seems pointless -- the newly added variable gets overwritten
>> by you later...
>>
> 
> So? let it better be initialized and rewritten then later on catch errors.

   I'm not sure what errors you mean here. To me, it (contrariwise) seems to
mask the possible errors when you forget to set err to e.g. -ENOMEM before
returning (when adding a call to kmalloc() or any other function that doesn't
return an error code itself)...
   I'm pretty sure gcc will drop this initialization when generating the object
code and (what's worse) the static analyzers will trip on this code telling you
that the value 0 is unused...

[...]

MBR, Sergey

