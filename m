Return-Path: <linux-usb+bounces-34580-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BvGFgeCsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34580-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:53:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB0A265D0D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67599309E2B6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457B03CA4AA;
	Wed, 11 Mar 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCUMOnsQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37217369215
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240657; cv=none; b=Lk1EJD4hX5kVo5Iq3Kxe13NbNNQ/mWNVNqY+Y3zquogyd9MVF65fde/Ja/FTsttmpTP7dLKcIx8aYmqaqA+qcF/8RsVFi40uxSsDF+DT7t5J50amwP0Z4iQEt8/j9x4pEonQJZutfVt8rVagX80iksrErxd6jDTXw+yh98R1FKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240657; c=relaxed/simple;
	bh=jKbAvVQOjgD/Ud8EqCpGD6nwWtn4pXSkFQ8CMyx8GP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSW/uVk7/TDeZKwGz5gcQrye53hDI7/OxmQ8XmuLLbXsYqbyGhCAGGrpfIN02K3YSn9sRms66hCnnBOBKAEVL6V4TJrYhbdFB67oiA4wZPGPPN6iihUGJN7j7jym0WJVh9h3hn3LBjfS9neogCuKn6ois33/Wiv7UMUcsAcc0ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCUMOnsQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so7148367f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773240655; x=1773845455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46AZDUVDC2zlHBW8HDcQlKNvp6YJxjOzfmV0vqTX9ds=;
        b=gCUMOnsQyrLd9Rg2VGP9wKSJUfBuiW/7n4hSB234qp8CiTL/zOMT05RgzCzljtyc7R
         7KTv5gSBiMZ5aRFUWAdpql3NIwghoL3J5bhA/WA/ARlXiMWSaD+8l2Qi8NdDr+7nBdiX
         Ftkj39WUw1F9ylYLubNCQaWmDWEPBUGP8WQO7vur9tGY8m1RLtjejLIywZGe5fgEWXjd
         tpAIE0i3K8EC9tX1WW8LC6Unu9n9TceLujIRHqQWs+Mg7IuMK4k/9+JlCrzro0VOSV/j
         +r0Y/C/OF7YXobFoSksgNT6PH64E6SFwnUy13/lpME0duq10oGV5RUBW1eVup89NJTrJ
         g9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240655; x=1773845455;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46AZDUVDC2zlHBW8HDcQlKNvp6YJxjOzfmV0vqTX9ds=;
        b=mQdfUPtdmTXsPETie2PpxfQt0i+4L7xtuOHukddezReVNnmC7P4aHDsUC41qzuMQdO
         gc/gUHks/kQzK4Bv9wQlWvy2y9V0qA7OCk8NALYe7ckbynjZap+uMNjuBuDo8r/9wWCY
         KVQTpL0Dh48hu8Ds24zpP0gM5qy0DCL1V+Qkp8O9PFYbwOKUo5KPf0a6b1oLrE3GNlB8
         B7q2Ku17UNPc2LQr2vXm+XVNjVO+ZXNb10ZbX/+J/1AIGirAuHXGAkFlK00wx6XK0/x9
         uNR2150VaukXaClbHubefUsuS8ZyQflqGz0ioAE89DqlSoyW4PB6GTTVN3v+omz4mxhX
         H3wg==
X-Forwarded-Encrypted: i=1; AJvYcCVt3D7UQ2c+S4ls2GR/kW23BgPsdGvMQiSU9iuqQRahICy4oh/D3w1e0245b3OYT9JjSjGZ9aZOZto=@vger.kernel.org
X-Gm-Message-State: AOJu0YymoNJ0PVFIfeeBYnuKjAoSfGvdqzeT2ERYvMCsYRshTK5nfSuT
	UpmeWl5UBBqbm4t26G5zZM68D96DoPQEuHVdjnGDzj6kO6XilF7eGkZnEc7VEsw0WHE=
X-Gm-Gg: ATEYQzzSyz0C41a5LrdZAx+gU3QA3jEV5r+HKvZ3CplJXYbKuE1M6bSwUYTlg1vDLH3
	iySWeoRIYW+xmijDnxwjc2jttRO79N0a71n08jQzlzRB2mk5cki2eKx4ZxXaTzyIRJwHcxNz/6K
	qfxQ3UUlz7Km2iN/sXKu8xrRfqtRog/gEdqLxa5We5iQFBafGL4KMMUa7v+kMHFVJURQB2o17tF
	XiBbxWGWdfEBofHVS7X26EE8oMemyq44SZa8xrIbYKp5HHn9Bm+TVWu6OGTZoUvbQVM+98VCbio
	NvtgywoTlKPotT9sJ37zUBt5x9CJlQOdxbZ7pFGde7mjP2cINBYBqugvV9T1qjWoQjAmZVWQTcl
	hy0dEUG2EAHIgcMWoECcDHTkv1u1Pjx2IseRs/GXkzVIu5t6cpJ3UbybI/rZbcKrlVeX0S7/Oxm
	aLgkXTQnfk8BHzM6IQS6Aesf0D8jjzge6wqvHF
X-Received: by 2002:a05:6000:40c8:b0:439:b506:e430 with SMTP id ffacd0b85a97d-439f8200663mr5664693f8f.17.1773240654582;
        Wed, 11 Mar 2026 07:50:54 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.250.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f8104515sm7264681f8f.0.2026.03.11.07.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:50:54 -0700 (PDT)
Message-ID: <920ae606-3d7d-4f61-9d11-bd970abc5177@linaro.org>
Date: Wed, 11 Mar 2026 14:50:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] usb: typec: qcom: Add shared USBIN VBUS detection
 via GPIO
To: Alexander Koskovich <AKoskovich@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34580-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 9CB0A265D0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/03/2026 23:20, Alexander Koskovich wrote:
> The ASUS ROG Phone 3 has two USB-C ports whose VBUS lines are both
> wired to the single USBIN input on the PM8150B PMIC. This means the
> Type-C port controller cannot distinguish which port is providing
> VBUS, causing one port to be unusable when the other has VBUS present
> from a charger or PC.

Hrmm..

If you have a GPIO for VBUS detect then who is sourcing VBUS in host mode ?

There should be a GPIO to switch it on aswell ? And in this case both 
ports will become "hot" at the same time.

How does VBUS work in host mode here ?

---
bod

