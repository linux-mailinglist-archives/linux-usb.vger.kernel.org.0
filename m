Return-Path: <linux-usb+bounces-37775-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CYrM/iYDWoMzwUAu9opvQ
	(envelope-from <linux-usb+bounces-37775-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:20:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09958C42B
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A931A30E7EDA
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC00237187E;
	Wed, 20 May 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQKhyyiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRfPS8Wn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306C35200C
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275715; cv=none; b=m3P6lRbIo9dBXNot+jxSjPS6ZXGw/KfFN6PxzFX+C/GIUtgD1Rc3Ppc6KViLUDcv7BZUAhURM0MvI4vTv/jaRRGCtktetr5gxFi8sYks+8mzAkHShvNa2AkibnMkJH9IELfcqNqi1n2ZMdy3UXPZM+R88zNDiqifqCNDEu9V+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275715; c=relaxed/simple;
	bh=DQn5wkZ5evtF2xsA7fVKvrXRFubdEbruQnpuwMWCwRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBaPRowuNpNE91KwwGlWz6KTz+4Ze/xqyxvCVPY9003QkkJydonrzVz2vamYmAOMafwnebzzuMtahsymIrJSr08X6vyKMWbPyq0emL5Qtaliac1YaMGCZfzgiP1syqwcEqiOT/n4xjoafQF3Gud7nZbUodzRTKMRYdW0bJKnEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQKhyyiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRfPS8Wn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K78x6K1725401
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 11:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9ZCGpGKO/dzQP/sIYxBMZ+crs2O49Dfxdra2zpXf84=; b=kQKhyyiHYYxQwA0R
	6MxcmvLCW+wrwyNunAi95JsgsmC/yskTyq8Fc4ndmWBPZTftQci91VJYUANrZxoh
	DoDGwxI+aRyuZSqtuolycTVrvhxBhsSwjB3SEhRkE7fH+ywAN90XlNZAMiPqHwoQ
	5tjGyFaT7ooXp+Xpe/Md/YV0wjITc807WSyFvIhmLYgucXTSaLW7ytG9aLV8xOWE
	6PQf1CsfXHUnFGvVg0gSDSV0OqI86Sn9ORUaRf1nsMEKZTMpjIYXCyA8yDKZFUS6
	weJ3hiqFCuoChdQcDO0mfC11lG/Bv9ycsoNjlqubR8cljrFA7UFZP6SL4W6ou7TZ
	PvnfMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmf2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 11:15:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fcac6c56fso96176185a.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779275712; x=1779880512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K9ZCGpGKO/dzQP/sIYxBMZ+crs2O49Dfxdra2zpXf84=;
        b=hRfPS8Wnkl0IW12xTK0Ctgzo5CV8WUjgBFEf4G6TQSjOyFakUWA8ngs/2YXrjNyd0P
         8bAjPvJCOTfh36mW0+dBXGNcnBWw/4xjSjhtO+/tuBgfhCd33oVGk6dJ5+5rGspRmxYM
         Z9LqKE9mhNWBeqYP9wJttjpGLWQuqG9Lfs9lm1k0/6XZzytpuC6J1jOozyVQ1DMC3URF
         sE/DpLdYqi2IZZOzl8sihGVlaJKxb7wTa0GFanAfTqZYth1xN5YEsZLHhrwWpE+/vhnk
         i8fGCbjUxkoxap5+DKV1qCJkwHWe+phOrmZoH54QYjGZnlBCD1E3fHvKnoQ+GPnXzOZ7
         IY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275712; x=1779880512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9ZCGpGKO/dzQP/sIYxBMZ+crs2O49Dfxdra2zpXf84=;
        b=DaX5evM4nIG/rExr1Fj8rnudhRA7pAsePTnzgbb3awUzOBK4TWbULdK+oUD9LeMA3o
         1OTW21pW1L7XO13fQwdnYaDsXabU3WUAzMAgF546uUGif8A92f+gSEcO9dE1lWXG4hkM
         Mk19+v8s8nQ0cdR5bfklPw91uzr3qE2MvLkrYKvNLkJ3WuTxQp2z32A2RLrbt0mBRPRy
         xr7V5Z4N4LsgrRXvIJOHNf+gkvt233cDpjPKQc8cZzY51HQ6xUv5XB5NzbNIYDk+QtiR
         28tOSpNfhtuy5HpvkEDMlm7dQiJmS5BAzaaDKHDE01ClGQlWjs5WfpaiXd9mgZ4WSecu
         X3ng==
X-Gm-Message-State: AOJu0YzhGzBVwcB7KdYxWhfGcOblHJ3+SehhWYwt8AgdJt20xqiRSYLj
	VCMQDp71nVsE8NbCkrvWC/R2ns10lgD8XujVOKOqC6jaT4eef2AF6v7M5dFfquzqMBmCKGjA4jq
	6wyf5tuQot2q7YEUY8tX3fXbGDi4RkPP2QvbPOm/+RxxiTXqVi6DmcbhBAI3Ey2U=
X-Gm-Gg: Acq92OE+tb260n0fJoSEyLzBTqKe42wkXr3cDiKwxnvWZQnm+yzv2OG8UWCLzh/if61
	xpReeoH6XZBp9Lvc0ImbAeyg4EKCPinuvN4Aq4bzT3eLqJANkzahtIHko2XGNhpw+J8XLqP01Je
	uOOVqKXVUPa+CVUnDzQkamy3ecMpvm5rNP/bEHyWMylD4z9sE3kAAYV4XvAlzJjxyVAFr0yOowj
	7oyO/oSa8IwFOiYdJhsv3TmiNV0/0HehPZStxrb5GYFFpdNJ1EW6N05lNs42OcbZS7g7Pf0cR3G
	S8eZDQI51Mvpyhpt4Y7OcM/B3saM9i9ZxMBi1DOR7CMZwvHI2/W+pFNczQrHJ9BOGQlbuyR4Gyj
	Or65K/botqietjZnErDBdhRX2XjN5R250fK6Zp3l9L7l8wf1Bo14b2ieN1UEVm3CNj8IW+TZJmZ
	C6ecsROoHnBFZRrw==
X-Received: by 2002:a05:620a:17a3:b0:8d7:a89d:958a with SMTP id af79cd13be357-911d05967b6mr2361725985a.6.1779275711997;
        Wed, 20 May 2026 04:15:11 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8d7:a89d:958a with SMTP id af79cd13be357-911d05967b6mr2361721785a.6.1779275711450;
        Wed, 20 May 2026 04:15:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm850249666b.1.2026.05.20.04.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 04:15:10 -0700 (PDT)
Message-ID: <d20ed9b8-18aa-4901-ba49-f24e3c79e36d@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD
 mode
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwOCBTYWx0ZWRfX1jhcantH+syu
 zgSfcKHZZYsdr0719ms4pl19djOPbbMRGrRTGSlAUSbwlgbbkRi/lP/V0U2dQaQmo6qXHX5ENCF
 75DAki2LeUxyVj03he8ULqgWAaPy3Nz1taASUkyEoyKeEl5dgTHLXHRU8Vgf5mvAnRH+ahuD0J+
 654i63sPTxAZb6eYX4Klg73KkiKqPDOJqOkme9tiF1sV4E5T3gqRvLeDk86kzz095+i6wWSsSeb
 5Vunih4iw8FYqsszHvc3Qn8Lgkuu0qBI/fKvxh0nfxLftKnF45V8Y17DYiQPmf78nL3Xsf5BjVM
 QpJ2dX+xrCbtjzkLK6wqRNu8iIfC7bgSYeoc7RmjDzM9OPak0BU7/KBtDVgbmQrEwg67WUXUum/
 RFXDOr5vi7K6VdPPTWpHrmksr2r5A7VY28k2rdCqATtBZwGIsHSnsPdo/RtpbpCcSjL1x97vJbx
 LWO3i0X2GvSp34OTnWw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0d97c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=028NdSF9W1XUqDdDnWcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1-Dq_19k6BeHSwyy_DsgdJ4osqaYorYW
X-Proofpoint-ORIG-GUID: 1-Dq_19k6BeHSwyy_DsgdJ4osqaYorYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-37775-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.8:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A09958C42B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 11:37 AM, Akash Kumar wrote:
> Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
> controller.
> 
> Switch the controller node to I2C12, configure the required pinctrl and
> interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
> connector.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> index 9b5ed55939b8..8e3af6018dfc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> @@ -194,6 +194,52 @@ &iris {
>  	status = "okay";
>  };
>  
> +&i2c12 {
> +	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

Let's keep a \n before 'status'

> +
> +	typec@8 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;

interrupts-extended = <&tlmm 3 IRQ..>

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";

This is unnecessary, nodes are enabled by default

Konrad

