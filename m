Return-Path: <linux-usb+bounces-37701-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKUqCixODGpIeQUAu9opvQ
	(envelope-from <linux-usb+bounces-37701-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:49:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B6857DFF6
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE4F43020933
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E43494A0C;
	Tue, 19 May 2026 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6OwhVIj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B3B3FADE0
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190677; cv=none; b=j+WeC9AmHo3Tu1CMyWBqrHDg0D+8LkGR8xsRtzU5ub7MkmidPc6a0/tFQpWFf9NUIGipMzJAQaTOkJehvaab6w/xTG+0itmBSlDeRXBc2YwMAjkUh/7zmYxwZsfyyZv4tiAW93mnlXgyIBOka5K3qgxOfEqMVYYFDVqMkUL6pqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190677; c=relaxed/simple;
	bh=qpWIOWTlOhe/O3Zu6wqaA+1dFbPPZ6kberD6gTt2KsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g89k8h8D67LiAqEbp4VqJUUfTyYfqkd1o7Zmod/bbtCAk1Pl8Kfx/CbSVv9GiEwQaYi+S2JEiWk3oGLdUdOp9JgLtEM8SMyPj8DQ0JiKyJmAab+xkRy9MGnFuLkD7grek/MOyOf1Cx1nsVOHubTWPx3do4cnaDU7ssciTJcx9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6OwhVIj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso29134485e9.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779190674; x=1779795474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HABIrpORxD5O07tQlPwky6QpY+uvpmKET6RnXALAtVc=;
        b=N6OwhVIjk5ZrmCiwJvsVbihju88mflNTZ8bT81mGVqkgWVmOEWf0o42dRTaEOl7Cfx
         THg1+bh9PalWx4GiyjeGMSTnDoVsMf1L5Q8zlNF5cadEGEpalQp3wIW2cX22lSPTw4H5
         FSYSB9jKJg2ytNAsRPlQH+kCpARqHX6lXnBq856viZr0cK/mphUsjHVcORPgGgIjL3nq
         inwuyAr0TseG+sox70HBMRwmta5p5A4QkId6TaDI+BNNfdbc0Yo/40NTaSN+9Ry9THsN
         E19ST5+8/cxD/FffPUfRygEPaboO6+nUDmDyAXux9Tbc7FqBrfbnJhPvoj2JZjMKnFWK
         65VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190674; x=1779795474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HABIrpORxD5O07tQlPwky6QpY+uvpmKET6RnXALAtVc=;
        b=NPKdGADgkkFuk63SP+FxUPs+oUlzuK8v0pMW64YtvB2lcCTD7OIT68jACwqC/Q+tcE
         caQ/9Mt3R05hmU9NTKabqxbPe8gKkNwsKE4kvsBWtJyD9/vSuc2czOlxGCSknHznJ7Ej
         iU7zSdnDp5RVOTDiXcvhleZjH1XnpP4XeQFd/TGVBIwBrKzRt4/RNVQ72XXyHnjWU8GF
         lO/pA/a3x7hNUAe9QwNGtNWK+0QkjqVfauHSVWiWnb/t8U3FtkVYtxG02IgOEjSh3/9h
         Ps0S+qHOa/8sa8Gv3k9sNhErcQPrVbmFrtPVsbKxsl7A6tK6skzdB9AOM+5UF+Vu5UT9
         cc0A==
X-Forwarded-Encrypted: i=1; AFNElJ89nHT9INsuO9aJ4Huwm1B/fjyA+U6BunTGQ+mrm5B3/V7B+4YRRts/xtb65WeEUuci1N30IZx51gA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc86rCx+G6HNfQAzeEGTd4dqZcCJXQlyhZIVOC+3q8gkeNwBVT
	9/6qyZkziaXm5447NCdmktUPVAA4Sc6LuvFXJpMNWrSetVDJvZxaoGtU1wlH22+VS6U=
X-Gm-Gg: Acq92OHgxtyHwGVC4q4Sbi+JFeqYL8yB5QrY7vXK3Cg6U0/VnoPdJcbbUwVD0C01nFw
	UXlGOC5xyQDw3J94i5hR5O6Ki/DXB945wXKzPWGBf7tJTeY8Wg9ch6TN98dghggda9ArIm4F8k6
	T53rB/3nTYJtJIfGpFWicSSOT//pUrdFuhqB1VguZem1iM5Bensh7VgFq0sLOtDf80SIhECDYh/
	7PfH64+PcuOyTOIaj13/4XfWvQbR7dcIjHfHlWP36pwwBUHMi7kAzbABub1fjj/2yFEun1ueTAj
	5oKwVLPC36BbOSAZTR0ZSgqrZp2CPRJGWqQo/e50b8ZXaeUzAGxwKEiU3lVEqj2svoBbIb6IoRs
	1/QyCaxpwYZ4vQ5IeMAZaGINKcL8ZfAkIxTl1YR/CZ1Drb823xweM4qIbIFsDU0gkdci+q+hqze
	zkrjHwFNH5ngM8b6FHaA4+B0whP9LgxGfTwg==
X-Received: by 2002:a05:600c:350b:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48ff3346102mr221572545e9.19.1779190674395;
        Tue, 19 May 2026 04:37:54 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe582e3sm120045195e9.15.2026.05.19.04.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:37:53 -0700 (PDT)
Message-ID: <7dca70f4-6e03-42aa-afc8-be5c2e015a74@linaro.org>
Date: Tue, 19 May 2026 12:37:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: qcom,pmic-typec: deprecate
 device-specific VBUS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37701-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 63B6857DFF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:48, Dmitry Baryshkov wrote:
> The Qualcomm PMIC Type-C devices historically provided their own way of
> specifying the VBUS regulator, via the device's vdd-vbus-supply node.
> This is not ideal as the VBUS is supplied to the connector and not to
> the Type-C block in the PMIC. Deprecate this property in favour of the
> standard way of specifying it (via the connector's vbus-supply
> property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6d3fa2bc9cee..7a68423fb97c 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -79,7 +79,8 @@ properties:
>         - const: fr-swap
>   
>     vdd-vbus-supply:
> -    description: VBUS power supply.
> +    deprecated: true
> +    description: use connector/vbus-supply instead.
>   
>     vdd-pdphy-supply:
>       description: VDD regulator supply to the PDPHY.
> @@ -94,7 +95,6 @@ required:
>     - reg
>     - interrupts
>     - interrupt-names
> -  - vdd-vbus-supply
>   
>   allOf:
>     - if:
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

