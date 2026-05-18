Return-Path: <linux-usb+bounces-37640-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIg9HiqLC2p1IwUAu9opvQ
	(envelope-from <linux-usb+bounces-37640-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:56:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD30574288
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7680D3017E4E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 21:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2073339D6D2;
	Mon, 18 May 2026 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNrFffrh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE039B4BB
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141412; cv=none; b=E2fH05XyNthVwzJWJqU0fL4Z9FQhjsHHwBnCLK8KtnEsmTPCa9T9WTkifDSKIPF8RnbvkqMvMiP66W+bX3gkgtHcTOV2xwxcEEZPXJzz7WWoJS+IATwVHT+beIAdecEp4PI1Oei1gHI90dpahFf5/mCOg9bw2ialC/gZeSZWsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141412; c=relaxed/simple;
	bh=Izd+ajGb6hhShbhE86/HUzaqPbJZjDWmI8YZcDks5uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgWIgsNQnV2nqcImaVnwl9aV1DZBWvN/b2J+F9+XLA2NcPtFx4NT3puWo/Jf8Pc2ntBViVX23WHO2XJX3YdCsRqneV7UXYf0etk7CbKmnQTDkM6MT0Cuhrh9nWt6Zjw/OZXLcjJqz1CVsE/eLLmd3Ac7kIotXUyvHIYi5NC/NZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNrFffrh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so2554353f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779141409; x=1779746209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJv2EIPjGK3glu7utsDpkLohNn1a3Ary13YAALySZ3c=;
        b=yNrFffrhTQicJDkxQNZjHKD7cPqdOo1u2a043wNdE5j9BJmW2kpOahJJcZ8FBrHzfb
         qdB0KaCS5m4kBY7RDrUZOGgHMZrgqNZCU2LxEAT/mDKJ678HSqlzagaE576fZOPFlaeU
         K0XPQrXT/xxqFfzoaAkVnpaZkkCFbhJX6yXym7EMKORwLi8g4+QtEw/vPhh9mQt+CkK1
         nQ0T+eOaJaqUil+fYfu2Fcvmxeoq/I7B+xITtwZ6v3gW9btGQ5xnJcnn4kZ58bs8tYPY
         sBvvqoKY+A5w15z2ay2xpscwe2Jm1LTgJLluwJomAQvBCvVfcJ0rWGye7A2/t60uakKK
         SBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141409; x=1779746209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJv2EIPjGK3glu7utsDpkLohNn1a3Ary13YAALySZ3c=;
        b=TauFXLTcx8uwpI24ZRO+RKrrh6dAszLGez1+olByhAa9A/TiR3kKLmwYVd9UoZIIzX
         47kG2qXZj3B7fHsV9AkochqQZMG9gRKmH753hv2NlyLnVAnEq9ffrxfjpXAAqaujfve5
         Vk5/o3dntMxj8esoNohFRFeeL8EUk2fjvu5R2v+2OnKAMF7YVdxntNtutUOA4IteqGLy
         4ZNoFsuU/O8DTjgs+vHLFHPiXEebRL0vxANNo7z02KJGhBrR9IiEf++gzIXnsr2yfils
         9zaQwI8/FKfHFrfdfEf5NiFYMhND0L5l11LBSiZVXiDVdErAiVmVeDzVS+Fa+MzIlsUx
         RNFw==
X-Forwarded-Encrypted: i=1; AFNElJ+aVWTUnyk/aa7pnNq/jcqeCVmKZt8jBBjmYmSCfx0x5qAc3DHbgJ8m8b8/ZpsEOmPzgh+uUbo2weM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNNQ9fiRsRvH7J1tYjXYwusd4nksOcGLbuodI0yG8r3Hh1WSd
	GKZ+7N42DoHR+2Tx3g6P2DK6O/64oOjqpJ4QF/BB093ExLLdx7KcBS+tTB/dWpVoIaM=
X-Gm-Gg: Acq92OGNxXJZpNsC07wtEJ7jGcTcSpqtrePqGfTbGjG6LjGwyzhOHZbC6P0OPcM4LE7
	xKg7627ZeYjhoUkWiA4DiNTnAa3UMUzpOC9m8ROPoPWjJVrLOUnReYxQ/9AMUCrkB3+V5vkJ2hp
	7P/oYWxAz320ddEz0cgOSWJno4Ag1Mic/9wFGH4cZ+P/g2Nv4fSVySZ/vBqTej4g6Pg/fyiTiMY
	jYFIejs0P3HfIMqsJYJY0E8BsuP5yZaC5eGNy/V9K9mtSv4YeDys22YbqHDg+Lx0BfVE8gnYyk3
	hQ3rEVeqSxaGCKhmcV9yJQXDluen4GyqZzxGLTlZDoTz0BIPKw+zA6GUxW0zco4cfA9gpqv8OdE
	a5nshC42lM3/4kOnuK6BkaoMKaaJbIhKoD5uLEAT/XpxYVnmz4cqTL+cD56nAdkC0LftL9YqjBL
	1+A6sDlQ8I5MMizsI21ZZ76KPAuarT5aYa
X-Received: by 2002:a05:6000:22c1:b0:43d:7606:5a47 with SMTP id ffacd0b85a97d-45e5b73a043mr28591671f8f.2.1779141409371;
        Mon, 18 May 2026 14:56:49 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm40379314f8f.8.2026.05.18.14.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 14:56:48 -0700 (PDT)
Message-ID: <3170e034-5780-4b85-9d25-f55126f4a2cb@linaro.org>
Date: Mon, 18 May 2026 22:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 PMI8998
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
 <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37640-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 1DD30574288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 21:22, taygoth wrote:
> The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
> inside its SMB2 charger block at offset 0x1100. The OTG control
> register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
> OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
> qcom_usb_vbus-regulator driver can drive it without code changes via
> compatible cascade.
> 
> Verified by inspecting the downstream qpnp-smb2 driver and reading
> live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
> mainline Linux.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>
> ---
>   .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index fcefc722ee2a..9e2e2c8f9539 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,pm6150-vbus-reg
>                 - qcom,pm7250b-vbus-reg
>                 - qcom,pmi632-vbus-reg
> +              - qcom,pmi8998-vbus-reg
>             - const: qcom,pm8150b-vbus-reg
>   
>     reg:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

