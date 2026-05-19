Return-Path: <linux-usb+bounces-37677-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDTKGUw6DGp8aQUAu9opvQ
	(envelope-from <linux-usb+bounces-37677-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:24:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E14ED57C281
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19B723109449
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264714B8DF9;
	Tue, 19 May 2026 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXmQU5YN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486EB4D2EFE
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185762; cv=none; b=kTyUBPVq/Gip7GvGAnPe4mvxk62/rilGFur9mrFi0eb2x+qun0VVbvJzd0NVHHLpXqXOniDlHHLU4y5UGr2iOK3UMpH0GrA5EyzxF2EoYrX3BXI3PygOoQFmFPog9IzRUjxiiByZSHN4C0eY9ZX98280kTqLwurHhU4XFiaK6ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185762; c=relaxed/simple;
	bh=f8ALR0y3q5fP6vwtXgP9hBGv5oAQokxYrhtup0bsRmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o8NUKf5W1WQBkP/Gijp6gwl8O/3P8BH6JRKkY/mnEOB+BSe3cz9dOno+oPVn+Iqs3OEFQ/wgM02AhbM6dY2NddDx/4/qrBmeNaTIceo7JWaR0hsKc2JVmqHw6KZWyyad1nq3k/MYuDP/+SKnrmdJK0KI3bf+YplE7NxPVivsdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXmQU5YN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso27014535e9.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779185752; x=1779790552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5UZMUsOIuR/r+RRcuKln7+BwOOWAw5VkzUXX1sCtOA=;
        b=AXmQU5YNNvOnLnq7VA31jNKiWyi5cHbCjQO1E8NGxEk2GQ4/GjhXcxyUg5kDwy29r4
         OZdwzC61iM1F7qYqhnOKbgY7mfGBtcz5KY7o4jUgw64pt6+xgUsY50KPU2HuuVcJnN6X
         /wiav/XRokBbp4CJsYiRVVcfo51BgbNw0ghEDa6foVFnAbZJ1o1JWnjRfhmF8rJ6+fSa
         ECFHJx8hvv4yEvAVgHlPj05uhv+P7EmCUb48HlQEM/9jZVPzTQZ/ID0ihhGl7HDsvAr9
         +rAZilb6/AeaKO5NOOwc102YwWRveM0itRs3wb3EEGfvzetpm5QXkOAWn4AlZbKk12G8
         9CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185752; x=1779790552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5UZMUsOIuR/r+RRcuKln7+BwOOWAw5VkzUXX1sCtOA=;
        b=JyxgGHZ8u1f0gGfi+CQCAqTkXlbLRflIfRwTi9sWIqcRQNUn0x3bWsArAaW/vjBluC
         Lt9BpXI5YOTr2cprihLvbLKwlNE9sb+UwUP2i+/yjV/3pR7ZusrCqwvM45b/P3stnkRE
         dyE0/bWpXPQfzoT9oHj0C+tcTl5PKGSzDgw565k5ibtgwD5wRprC34a1QJqw5s6nk2+U
         7Gpowu1IMmf9iwKryLseQ89vyV7A7oEU7XrxwhLAR+xFolF1zSehtUN9H3/bT3SttfGL
         iiVEfy0cJCo/TdURG9O2P1qlFAjpv/JvUiVMUr4qb+T7gTzYZNH5NCQuL8uNEKJKNJUl
         lqRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vmRBoTFQsXe0LkhEg+gN0lX5pnih9hapquc4WARE3D3suviHGUz35l/xdVXREPHxdcg8hrXHoP4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUGLcnDsphuZOPC9wrgT5/b6xq2cgXqb9sgy6PjASPojeHh99
	FgM0RXAC/h+z5uxYXUulMT1tVHXQ29a6T7X8ml5WdfX0McojXJyzONUDvP7g7E4HxSs=
X-Gm-Gg: Acq92OHxRx3n4FKxV9kYZr3FfLl4goocmbO2+vvI4qajzSeQGGSkfHpo/KEmW1/iK25
	L/FPkl3oIDWiWW/77HczCRs05W9w4gPgA1sMxTmjq1BLAkg4XZOTmc63IuEkl5r2JtLqJzR2G2g
	stCb6Y+bDKfFR3VxorbCa9UhSRfEwXRW7U3WrRpv4htFr7teWrHISt2LAzrHUzrEIrVJshvmYG6
	+Sf1E5yiDo9eh35ou9KHCDCnrgjg38aDaWsPkpWMRIdZWqFnZjGtI1kX9VcblGMp+wNGC+CLmKy
	rjYZ+BjTm0BiVP7FV/TqOB+pJBYkYvZt/nNW6zM+MfbyPyFRrUhWeCXfQ5U7zohVycxp/YP+R1j
	zE6oY/9rKgRPNMOB+pTNyhEOeBXUyYpHlYUZp9PCeGRfI71mVHJzU0U/XW48gS5oxo9eQwQ/xsp
	CuRs71cYZG33qlD5J99jkKs+vBS6OZU3rRYA==
X-Received: by 2002:a05:600c:34d4:b0:48f:e245:394e with SMTP id 5b1f17b1804b1-48fe631f631mr307476515e9.27.1779185752498;
        Tue, 19 May 2026 03:15:52 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm311206415e9.14.2026.05.19.03.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:15:52 -0700 (PDT)
Message-ID: <48daef97-de8d-452b-9f1d-e3306fc46ffa@linaro.org>
Date: Tue, 19 May 2026 11:15:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37677-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: E14ED57C281
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:00, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 3766790c1548..35320f89dad2 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -4,19 +4,14 @@
>    */
>   
>   #include <linux/err.h>
> -#include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
> -#include <linux/usb/role.h>
>   #include <linux/usb/tcpm.h>
> -#include <linux/usb/typec_mux.h>
>   
>   #include <drm/bridge/aux-bridge.h>
>   

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

