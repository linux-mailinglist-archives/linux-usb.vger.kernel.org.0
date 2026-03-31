Return-Path: <linux-usb+bounces-35745-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEFWOGcxzGmwRAYAu9opvQ
	(envelope-from <linux-usb+bounces-35745-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 22:41:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A9371364
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 22:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D810302B389
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 20:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9514F4508EB;
	Tue, 31 Mar 2026 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPBpTV4h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8473A542A
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774989582; cv=none; b=H25+R/cNEPP/N2m00KlOBCXpwwGo1ULveMfPvAztKwWxRJ9Vzj+vGo9X/KirIHF+dDqs9sJhHxrZHeh35eqcNz/d47Crex9+BDQmydaPQhNkMqIX37au9XomAW4dJZTdo/V10fXRsOgASPhcXlM/GuMbW2xqFTv/4qI3qS2jouA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774989582; c=relaxed/simple;
	bh=HP1NLiOIWXUdUXadhKy3DijqQs/PEm5plRHuOWWD/BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5eq3wKOPpj91TrQUGQ3vlSJubcpyxwOAcmCNG4QB6lgAmmIyDP/uo5a8DR0KzfMlfw2V6A+kPW7o/j+gMfvvsxhJsY7gxWfUA64FET566FcSV/KFgVSiWTsOj/qx0DnO8UE/hyGeeMubd4h1uGrM3VVp85IrrWkkoo3oHCpWKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPBpTV4h; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12a74039dc6so4974524c88.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774989579; x=1775594379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=DPBpTV4h5w2BFiOw69qC+snsZ6UIPwzQUE28J8UvFype6PVntmyF2izsLsD3mVkNpo
         hEX0V2St3RZ/fo7/DNSHVdP/nRF2pDhUmS82K+mOK0dKLWg0ZEy1SHHW/KYikQ6jlmg+
         /QRCmbdxAr0z30oIdubZGSvnCXv5vPZiAGAtiIx50CcbCaB5Btz2XYpoebS2eGo1nAtX
         JzST46OlyDicpt9dwVPP7+vuVa4HMyPUXC+3QyUTgQeBHwd89ewVamIHDySTBvH3i+Kx
         puL+W9SyIIYqID6hvy2VtRKnfNMKP0CUzKemuiDoGSRs3jWdKjyStdNPB0ufQutwUP4S
         iufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774989579; x=1775594379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=ANi2fQ/SickEcmEpTrg/9sjvfzVkOKk4U2FeZfyqR9TKAXvZWw4DAaMktMv1DYFOeo
         JURcyPUH17XtYpThnw0XxczAy33oF5ybO/+wjfABLKjb9Ew7OP7/QS0BTgtrh6MpUs4W
         fxmWsCTxX7RmXnwDgp7MihrnXKKpZGheljFOJbtoaZCdFoDyQiV2dkU2Er4JmYrCZYr+
         RywYPF9bz8HqTXlDAmOoC67DEJjHR7mM+IYyF5hbcY2k1C4smI1ej76l3hszxARntcxv
         ebtrjNWk0W0JVmFNJYD07URmhYRzm/Ju1f4e3jf1HCUBugiSMA6+9W4xuCARalLiJ0cR
         HZNw==
X-Forwarded-Encrypted: i=1; AJvYcCUbr9y+znlgPeIudxfQ0KPUY6wrEhUQwWJFMG3HJuKyHUC3Tf2v1kC5oBj7/P8zm1USfWGKtysuz1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJyi0z7rYajoNliTf8ifuh7WSu0zWMQAawJ5ilUSFSrldVVOCa
	PpoSDcibFsxgMxIZ2tXYUEQfmfMGD+ZKlXQzH5J18DmF7GBS+J61HCaj8tJLvn9nFQ==
X-Gm-Gg: ATEYQzwN80gn0jWlmPEAZa/hZWx3+hHVjYl54vnQAmzJJg2OY9V1pJD3C9/jqySrfhD
	B3fApXoxKM8m/GMlYrRpN7jxnlqrsfFyNehqSftftIy2H1YhWshC4RHxUQWecZXiOi5erDoPAtW
	mNSKDSGxyXz+mQEBqF3z/cn384PScYRu/DdoOEuUeWAN5/rJ3R8DonxNECurmq8c2d2CE1klFhr
	k0rM/CWds0JoG80tAp4rj41mO3bgVAMNpb/ectlR7R4Kq1UguniveYmmwyqrb7ERJJkm1ItRWcg
	1wsuQs680LLie2ab6OLgesmP0Sb9hqgzUF/i7iUGA7XNMqTStCsFlFrYZzsPLh1Ng2XguUAc9FO
	8Q9vYvx3bLBVCMRy4IRSckzotB77m1NG23hxpo+A0DneAe/AjREy49cPl6lTdbk/ZMu+P2v9wG4
	bFZfT3dAA5I/dJXOpmoJ3h/xc/ydrFw11e6pQDzbUjKrXZalMf5+9kyEWYhRDZcas9jtZ3XlCg3
	jkQu7mIcszbgg4slmXtn8T7hQ==
X-Received: by 2002:a05:7022:41aa:b0:128:d494:a1ab with SMTP id a92af1059eb24-12be649eb12mr512442c88.15.1774989578723;
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d? ([2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm16792226c88.10.2026.03.31.13.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Message-ID: <e5384261-7a9d-4c24-8387-6002268f5c1d@google.com>
Date: Tue, 31 Mar 2026 13:39:33 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] mfd: max77759: add register bitmasks and modify
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
References: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
 <20260325-max77759-charger-v9-3-4486dd297adc@google.com>
 <20260331123138.GE3795166@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260331123138.GE3795166@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linuxfoundation.org,google.com,linux.intel.com,samsung.com,gmail.com,linux-foundation.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35745-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B8A9371364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lee,

On 3/31/26 5:31 AM, Lee Jones wrote:
> On Wed, 25 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
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
>>   drivers/mfd/max77759.c       |  95 ++++++++++++++++++++++---
>>   include/linux/mfd/max77759.h | 166 +++++++++++++++++++++++++++++++++++--------
>>   2 files changed, 222 insertions(+), 39 deletions(-)
>>
> [...]
>
>> +/*
>> + * enum max77759_chgr_chgin_dtls_status - Charger Input Status
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
>> + *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
>> + *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
>> + *     Vchgin > Over Voltage threshold (Vovlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
>> + *     Vchgin > Vuvlo, Vchgin < Vovlo and Vchgin > (Vsys + Vbatt)
>> + */
> This comment is masquerading as a kernel-doc header, but isn't actually
> kernel-doc.  Either change the formatting or adapt the formatting to use
> /** and use W=1 to check it.
Thanks for pointing this out! I'll fix this in the next version and 
ensure it's a proper kernel-doc block.

BR,

Amit

>> +enum max77759_chgr_chgin_dtls_status {
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
>> +};

