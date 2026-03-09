Return-Path: <linux-usb+bounces-34256-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGguH4c4rmlyAgIAu9opvQ
	(envelope-from <linux-usb+bounces-34256-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 04:03:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B12336F9
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 04:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D973026172
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 03:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0705727816C;
	Mon,  9 Mar 2026 03:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EyjJwkFV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED025B305
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 03:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773025375; cv=none; b=jctTgBZYGakbkyMVEm2oSdl1+IBCUzry3VB5WdpAXESp3yGnkvggIgdEjPmQx4/fDeGnng+NZleLzQ7oF77lbC/UfC8hdos4Pd91PfZhnJU/sbGYmWVh7LWeEaN+/qH6uY4t7Uh6pd0SVthxXTkPJMFX+WuzGILlaiHN4YmfNzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773025375; c=relaxed/simple;
	bh=BGjkXwXFeJle68octNDMR19EHMWwrZil3s7gHM3J0bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWoo9JuWnwdRshxakisO6+1CKzBMmZ2fVUYEFboMRoz3GuNqLR2fZ9hcfKbydLDfjry8w+cb6kw1oB6Kz7UweD7CL8y9uPGdriRZKfcfSi4nLa/XhepwOuwb0wgTJxuuQZDrXuI3rADKKpkW3r8JUfLzINlruUNVWrKuzqhvj2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EyjJwkFV; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso13740859d50.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 20:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773025373; x=1773630173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=;
        b=EyjJwkFVWzJNjMAd6yOjTRBmZI7d9gOhHIWC21TOHKITr6YTn9n4l80Xu7Pv18+KyU
         kfWBI6ymCmL4PPjGirEcqKsY4XEHfQ+nt2VQwUr5YItaGNOJNOpIzLggBVIP4zMt5Exy
         gt0gHwPViT7fTLnvyFaqp80/4bj6v3USQOkZr3LbykPGuBMqRF5NSX+IZerO/8k1qPrM
         wph0+noQ0rCJyoiBOpuaE1cEaGDY3fDA0Fh7DCydJN4afYBApqo080AIjY7REwMFbghg
         YPZAmb7nF1afmRviKdDmGihbZWLeodHLdKmQSrywDUC1oea6A9eyaDCXwYVmWvcuwSEw
         3WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773025373; x=1773630173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRC/SSBoLNJpBv7w3HXObuyQkJlK3e7PgCYEr0NFv4U=;
        b=VMu+pBDMpIkBPVjcHeteJKLpbdjMSXez1spKTfmZdV3LVS9gUja32J9fsV/jKpnJ8/
         p96Nsn8FDb1I+USdl6xfrMDjkmT1Edu5lsnhCcUtdfzDJW8Itue0C/U3/hiOvQslTec2
         Pjp9Ki5PDaKl8UdqE+bG+UQDan1pQBz7BJad+xEQUPUvUssoryd69D8cQ92FPMYWhyNn
         aEqX0UCfzDZImIXOO/8wFXKhHrkkrBeoeslxSJowHdl/Z581i70cQiV4PS/AdHrg/lkD
         GtvssSGcWdNR9vT9qSxaw+weHzNjziA7e6Vu2sJ21d6Nr6ej1Y5XkZQ5u/EtGFV9915j
         b8dw==
X-Forwarded-Encrypted: i=1; AJvYcCX+kpi1UGd/wRbFHjkM1tAPaA0Wa2qBWzsUY67Jrl7f4SPNwVra44wgqbeOdThcmm528sZyh4iC9w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfU09lG5e/NpbPeMmEdu9W6GXKeXhn6cBcRJ0M0Q5G1QiIARV
	t++LenmGTCET9fr9vlF0ytO0d6r0FTW3zsIV7cSHGG861lNWsRFe6kLm4fuAgqLw8w==
X-Gm-Gg: ATEYQzzaYXgCkdjLBEkd3RRsrbCfiWlX9+CUvXh5OBuke3HTiyCUfOcHrci+eMtGPSR
	mVZtIj1wwhGrJCPX3M4060IeJOXTYmmBQ3A2UPGHqgVcRvnOt/Q56GiDoFCs6uYUiV5TpeqRNGG
	th2nWg9wMS5TSFH7I1mKLDonQBgLIf0S1k5l7tPCflktWLCCA6KDud71t1uC7EkSl+NRBttdsMV
	zz2kAI8xaHmqxjz9xllO9Szx3UXn5jIhp+/G0B6Nm/lm7d4W+LrVTGDI2G8CVMtP0+EOuXkjMny
	Gcz01Rw+mehnZyTfqY1A5L5fK/Xfxlfu+FL2m7hCULt/g9yT8YpDGeA6CHTjQFNV8L6efgto4/T
	VXiI1mM3C7ukn8gSZXgzqruJ/NcHye2QS7a8mcZqEmbvKklDCy6+OXYjr7vCtp1q0UknutPI0Ca
	44QYE1TmIvRqNur2LeDBAcexl56Mg2hi0tIdaiiGkvF/Rd/dbO9Xb/PKFUMWYktq6MaalvEvI=
X-Received: by 2002:a05:690e:1186:b0:64a:7bf2:3afa with SMTP id 956f58d0204a3-64d0715a07dmr12447389d50.28.1773025372369;
        Sun, 08 Mar 2026 20:02:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:3329:ea09:3c41:e7ec? ([2600:1700:4570:89a0:3329:ea09:3c41:e7ec])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176c59dbsm4094408d50.11.2026.03.08.20.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 20:02:51 -0700 (PDT)
Message-ID: <103a2828-c567-4b95-8583-e2358ccfc1f6@google.com>
Date: Sun, 8 Mar 2026 20:02:42 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
 <20260224-max77759-charger-v8-3-eb86bd570e9c@google.com>
 <20260306130031.GK183676@google.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <20260306130031.GK183676@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0D8B12336F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,gmail.com,linux-foundation.org,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-34256-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Lee,

On 3/6/26 5:00 AM, Lee Jones wrote:
> On Tue, 24 Feb 2026, Amit Sunil Dhamne via B4 Relay wrote:
>
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> ---
>>  drivers/mfd/max77759.c       |  91 ++++++++++++++++++++--
>>  include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++++++-------
>>  2 files changed, 230 insertions(+), 37 deletions(-)
> Does this patch have any dependents or dependencies?
>
This patch does not depend on any other patch.

The patch that depends on this one is:
https://lore.kernel.org/all/20260224-max77759-charger-v8-5-eb86bd570e9c@google.com/


Thanks,

Amit



