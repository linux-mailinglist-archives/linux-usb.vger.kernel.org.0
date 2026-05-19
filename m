Return-Path: <linux-usb+bounces-37703-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHCuIDRNDGrjdQUAu9opvQ
	(envelope-from <linux-usb+bounces-37703-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:44:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF157DEAC
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7F7A3057DB4
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEB74A33E2;
	Tue, 19 May 2026 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+gY1OE9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED44A33E7
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190923; cv=none; b=NKUufr5K8m10I2fHnYOX8UGOSh3DY1FoE8doohbr+UgqAYlbwFKvVEQ9uhb0+lFIwZvZh9UNvQm62qcLEfOfWVglRchUca+OO48BZ32B5mT+okMQM68xyPE/ILcV56fyTKIIOgSLpq7J09Fgg1tz/0LEQSYoOHWtwB40cxSJksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190923; c=relaxed/simple;
	bh=iXaQej+aa3DbMyR4YHSetSZ0oLvnEXqSgtMh+UpQUEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qarGpmZGwgEoqXf/N6s+xW9enaxFH1HIgOOxE1wY2raJzA0G3kVyUljiuxGGD8gLJsI7vv/ips/e+zbDY2OAWTsaTMZtyEQ2FEFJEkX6EpxK2TG2QPhpXwqynIM5Knx8m79gj08vPevby5m2HHEH5w3RRN7VDEuGNkm57L/tyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+gY1OE9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so28398035e9.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779190920; x=1779795720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJoGNxpHwJXF2k7E+m5KPLxypZWZKLTX+aIvO0pTfwo=;
        b=K+gY1OE9DhU903zmTSNokRe4DZws4D7Lxrtt0xgT3FBjwBBgwwZKav+DOrRc65MbL3
         Cpw+pNbs6o/8ADeOcEUtEbiuuhml8q7GMQdIQ/xaOha7IDuxVCboBc6rpHPTFI4llNhA
         3SMUYFP/diYDwHcZDlhrVu4OadZFj/26l9HoBeXqpeNHBvXqOxls0NAehlgg8SkD8xs0
         8WpeZrJsnYn2/NGizUXsRccJvmgCJ8ks7wIoJqaTMp4t/5+tLaLTztYdYY7JWZ43UBIq
         2RRx8UQbQNJ+a8UPSxZpy4DSkxOHtc1MqleoXhuwHLXSKCNHwYreHJsRT638OCK78JAV
         0ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190920; x=1779795720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJoGNxpHwJXF2k7E+m5KPLxypZWZKLTX+aIvO0pTfwo=;
        b=dzZu/xxhX6h93iHPXronnqoPQnyur1ndDh8EMgKn5Yk1alElEMPYwwKJQUcvcJOVDE
         ZozkXQT6n2M7e0mxte1AqoBQV32RGBENe+VoNa7yGxV033paXOChELywzKkfoX48GcTa
         nLVy4HS/bi+N/+C89IpN79mtyEqeIVJfWe9sb+qTDZbgCaYvZ6uEEQmT2A9JopowOoaj
         UWCgj/H3rItUyHvDcrb7tk5UVGMGvODq6GLa/j3357PSTdFzFEt4HsQG/Q/F7W848buM
         +KpeDpMC3zjtNexTZGEkIAxBrQdfD8A6fcs4akttyRviQrlOm75ZxzHmp+tyRoS8WWGz
         Wepg==
X-Forwarded-Encrypted: i=1; AFNElJ9hv72DhMXuQ0cnynqozdxzAuw8IvNZ8RoL7CfQp+kyZpeL07m1CZ3TZClPh1KqtqHw5erc7OT26nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZv2IhpREn59r3UO4fjPKQlVih8o/i12lMFksk6XHWgOA67pM
	TCq6rWGvTPyV9ACxUi4zAJToKXH8UQ2eu3Izc/4WUyaS/qJosPqXhWAstNka9LztQCg=
X-Gm-Gg: Acq92OGLP+4vy0iJJGTSKA8eEqj44fxE9cVBRT+c1Gc4JEW9cwE/NCBMxgiQtK6l3x/
	uync1x5XRZr7+SdOR82k+w531MfjYUx4iLUAfaojHsvxPdobPfBvbrkY+P2zKnr4ramNTOH8/Xu
	Hz35J+9XrPNi3oHthWRlNL1taldxxWYoM0LUJEetAP94V+C0zBL6V5ZxYQXDqw2PKCpryLn0DaM
	xbNp486eedgRa4QmVW9l24xc2YYQ+MgTazhbSw14dCbZGeDcJxeiqqazHXGhB3iN64o5rZIkQuC
	I+68v6nKsy7e77qAkh263H7w4wztimSqj8eOsn1bfE2r/pxapsisiN+8TjY/7uF+RwKur9ass5G
	KqzGZyU0lPKc7FqUYJAp+XZy7WtMdBBanj15gNZPRZAllNcVl9GzRf9itRQpUFuuWuGMuAOp+wg
	ANGedhJ0BZHlHF0dwfnr4pGYB5i0j7zV/jPg==
X-Received: by 2002:a05:600c:848c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fe60e51c6mr296433775e9.7.1779190920505;
        Tue, 19 May 2026 04:42:00 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf8305dsm152745015e9.9.2026.05.19.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:42:00 -0700 (PDT)
Message-ID: <1485d619-35da-48e1-a108-60de1bd8b19b@linaro.org>
Date: Tue, 19 May 2026 12:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: tcpm: qcom: use connector to specify VBUS
 regulator.
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37703-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 28EF157DEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:48, Dmitry Baryshkov wrote:
> The Qualcomm PMIC Type-C devices historically provided their own way of
> specifying the VBUS regulator, via the device's vdd-vbus-supply node.
> This is not ideal as the VBUS is supplied to the connector and not to
> the Type-C block in the PMIC. In theory hardware can use different
> regulators for VBUS, so specifying it in the PMIC DTSI is not correct.
> Deprecate this property in favour of the standard way of specifying it
> (via the connector's vbus-supply property).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (6):
>        dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS
>        usb: typec: tcpm: qcom: prefer VBUS supply from the connector node
>        arm64: dts: qcom: pm4125: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pm8150b: move vdd-vbus-supply to connector nodes
>        arm64: dts: qcom: pmi632: move vdd-vbus-supply to connector nodes
> 
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml |  4 ++--
>   arch/arm64/boot/dts/qcom/pm4125.dtsi                       |  1 -
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi                      |  1 -
>   arch/arm64/boot/dts/qcom/pm8150b.dtsi                      |  1 -
>   arch/arm64/boot/dts/qcom/pmi632.dtsi                       |  1 -
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                   |  2 ++
>   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts          |  2 ++
>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            |  2 ++
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts          |  2 ++
>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts                    |  2 ++
>   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  2 ++
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c         | 12 +++++++++++-
>   14 files changed, 29 insertions(+), 7 deletions(-)
> ---
> base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
> change-id: 20260519-fix-tcpm-vbus-aabde21f339d
> 
> Best regards,
> --
> With best wishes
> Dmitry
> 

It should be possible to use vbus from any source - and that vbus is 
indeed port not controller specific.

For the series

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

