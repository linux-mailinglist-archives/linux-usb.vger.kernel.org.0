Return-Path: <linux-usb+bounces-35910-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMeELzG7zmmTpgYAu9opvQ
	(envelope-from <linux-usb+bounces-35910-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:53:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CF38D74A
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AA3130712CD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2413EFD13;
	Thu,  2 Apr 2026 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="owql1B9m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9005837BE67
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155656; cv=none; b=t3xDqZdI5+hLAjL0LfavxOVX1f9GbFTJYCkdCTHMzBCx4QOD0dldN52UN4uE80nGeUAFkGMrrvAWBtV35Te5/2e9dKTGhvipQjSuA8Pgyj08Vdaub2aWKdMIYyZE8c+T4quF/aOAszP9bTI7fyeH+xAzjIFGfSmNJ9kOX0CR9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155656; c=relaxed/simple;
	bh=OVudXei1XMX+Hk0vFE/KI/maetr0rgXz6TaXIWcvCYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3VtgWBHWAWUMrgUd+YjMhGSne4sdhHyzA8185iuQ0YtQirEdg9X5k+vLWRPJjBNjo928uWobV5hw7W93YpSsoq8vtuF57fOSpXmMLZeY8S8jz2Gkcu+Fs1qg30FzCUbI9fd7F9JUJO+qX3riAqiTQ/bqHU7KiBLGUuy5simfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=owql1B9m; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c56aa62931so2681590eec.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775155654; x=1775760454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpykImWK6bjT2nlpOYqPcIo7o07mstIYTD+Wq8ULKFw=;
        b=owql1B9mcaC0eOg4VNCiuhWkg/5iwr+DNvkHZxi74p7vcNh9DPI4i07VvHU+En21OV
         JAUuKT0JDx6TZuVOtXRpCE/0xDlh2MVYPJrILlRAb3k81bHYVpWhwptxA3ZVwbDuR5VX
         gy8HWzaysceZNknsMiL2bEF9dTt7vz6FrbuFZhbaZTjgxx69m7YgQi/ARDsBSy/PqAf8
         o1EreyeoCam0/B0LrFd3QvOysLr3QcU0hoyPo0mTnfm16nHWic0BNWhXFe8jU/9nDi96
         giuIi/h5SowRAI2FEma/5EgETouteSIOZiszBjvyro1Y7U9XLZkD0p4glfnsrjYkRSPC
         h2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775155654; x=1775760454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpykImWK6bjT2nlpOYqPcIo7o07mstIYTD+Wq8ULKFw=;
        b=kdM4dOuDgopSAB/gV+0mZ6y9BRg67JpOFbzqXu7eHrcENVnz4qsPTbXFb33Ucsw6qg
         keR4olAAk9LJd1yMEdTTrcOzp0BHb1w9+IDxlI8drr/75kLoghvwL4bmoQo1QqpDPyu7
         iEYpNfNImSzjFp+l0Jupj9pTQiiQ6qBaUlf1fPUOEkUcmhfe4hDNu9bxj5M1b+XRNdeI
         QgKYylvWi3Rodrw8pM2wZrg/GmYLfY5JxMeJoNWkCQIB4rGS0Iul3VXbruckxJBaQ8O+
         7YMmiYiM8quylM9qyQVoVYG+La/HJkGDyziypbmeODm2F+2r8Xfz4j28waY7Bmc3uMJm
         Zd+w==
X-Forwarded-Encrypted: i=1; AJvYcCVMu8PNE56/js17Rgo9sp9iFl+CtoAAV0RcHkRB/qTpXFRTcHqW2bWDCrCrvbW7g6zRPV5mdD1NsQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTML2avG4BIv62A8p9LJcJeZG72Lso5fiw54RzSRLWD5yEBuNV
	QjcMr74g45jtBzdiOlOvtCdEIavkSq+pKzqsw+o0BbDlL1UqXjEVukiqPzfcisZgvA==
X-Gm-Gg: AeBDies8WQktip+W1o8xQpDoIB5DUL0wkGp3Hq/gFPmaVjkLD4tYNeGdEFvAkWaHs5i
	8vD35Ltftp+vWi0ghxTIIwIdvIo3GM5XCD3aVxjp+wjVrw9BsAkhL/vXIoJuLpzEKd/ihR98RrN
	32lnIn27bSKMLPGT/1Slb24mhDdpMdmKUXPYs1bl0JRjH8hWIsd8MPrPsPeyrszB+EuSzwe0Qpm
	gIABZ3V6zS4s1cNvFXT+ZWhk4oZ0D2thExiUhfDt9EbLMVMMmfLNRz5xvl+yBaTGNzVOAXTjwhf
	cii2u67cwAOqboZKXsSRQAxB9tHDLmR74dkK2kqHuW0xY0lH/hI34Tkv4d5jOrrEGKOie5YYG3g
	XtwaTQp1EjOSBjIVSXl3H1uS5VuBm7mZrF3F0WCHmdBF4761521WON30mmwOaRHW9QmLRM+oqKM
	zfKTj/LCsqDj9qpbHHT0kh8f1+bedrKbDyLFCB4ftvuzthKRaflIZrPt1xa5Up6l4F9khXFNWSb
	1NeVepOJVS9kM+Z+k8hvPhKhw==
X-Received: by 2002:a05:7300:e8a7:b0:2c6:31f0:a025 with SMTP id 5a478bee46e88-2cbfc4623eemr138794eec.27.1775155653050;
        Thu, 02 Apr 2026 11:47:33 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:2412:bdd2:9fa6:2acc? ([2a00:79e0:2e7c:8:2412:bdd2:9fa6:2acc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b2b1sm3319049eec.18.2026.04.02.11.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:47:32 -0700 (PDT)
Message-ID: <017b8552-87e2-4409-ae34-9a3ab7365a68@google.com>
Date: Thu, 2 Apr 2026 11:47:30 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sebastian Reichel
 <sre@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-6-76f59233c369@google.com>
 <ac5-OzwQkczTWtMg@kuha>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <ac5-OzwQkczTWtMg@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,linuxfoundation.org,google.com,gmail.com,linux-foundation.org,samsung.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35910-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F8CF38D74A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Heikki,

On 4/2/26 7:33 AM, Heikki Krogerus wrote:
> Hi Amit,
>
>> +static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
>> +{
>> +	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
>> +		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
>> +							      "vbus");
> Sorry to go back to this, but why can't you just get the regulator in
> max_tcpci_probe()?

Thanks for calling this out. This was an intentional design decision to 
break a circular dependency.

The charger driver is guaranteed to probe after the TCPC driver due to a 
power supply dependency (the TCPC is a supplier of power for the Battery 
Charger). However, the charger driver is also the regulator provider for 
VBUS out (when Type-C goes into source mode).

Because of this, the regulator handle will not be available during the 
TCPC driver's probe. If we tried to fetch it in max_tcpci_probe() and 
returned -EPROBE_DEFER, it would create a probe deadlock, as the charger 
would then never probe. Therefore, I made the decision to get the 
regulator handle lazily and on-demand.

Thanks,
Amit

>
> thanks,
>
>> +		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
>> +			dev_err(chip->dev,
>> +				"Failed to get vbus regulator handle\n");
>> +			return -ENODEV;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}

