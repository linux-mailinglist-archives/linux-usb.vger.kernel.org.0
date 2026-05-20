Return-Path: <linux-usb+bounces-37766-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H5cATOIDWpdygUAu9opvQ
	(envelope-from <linux-usb+bounces-37766-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:08:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FD58B5EF
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DCC2303833A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 10:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9806C3D45E9;
	Wed, 20 May 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EU1kbSXa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UN/o18uv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92173D3CFB
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271692; cv=none; b=m+UCwHU46fJR50dEeHGxL3czB9yhSwiaXbEjYvIoJTlPTHfLd4hMka0kkzO72OtbmmSf/6fJARnLr0DDJ2+GQuan84ygzdgz5GP7ruhFMsu1CmLJf9zYkmJnSjkOEljp8HFDd5tZr0i5irLWPeQukZcwIu1Pxo9o+AtjkmKEpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271692; c=relaxed/simple;
	bh=5fbnBvWi+lTHcB1CMAP+kXzI6sA/MMAvO1oj8KtXlug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecVM3BIpQ32EGNuZMXkQ1NaUya5ua+EAKv6yHgxOGXxekjxn9rv9u4fWJRo8r2Nu3Q/5/cECipXzs/1rg/u9YSyeOhrO6w9h7t8Zft6UgxwaNLxxSJgTIposcf0629eRGsNX+FL9uaauaSSQoGMv10smEFbPCpNE5oqt0JSMyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EU1kbSXa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UN/o18uv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6bpk61237954
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b0jt1WrNfwmf+YLbPjq2bHxh
	n5Z57n/uD+wlyxusIdY=; b=EU1kbSXao65YToB0+Pz8kmmULOAQ4VXHx4nZI2mg
	xn9PS1mMzMl/hMFJObsziqMasn5bhEpxTUAGZh8COmYkzFY0JfjDToHbJ9vDTm5Y
	VG0+XKuwoLVWfPnFne5tPXYvqmR1dlF26AhrF3JFbrVnEpI/l89jGbmM3XwbCwBk
	Pf2LfDzMB7ALP7QmL9riSaGsAf4Tyb/+KXcm4gB1dRztLCD/xV+fRIF7tLOgJuXh
	dCNlRGXCaJUb9p4ALJz56PdaVO6kltTZmxavhaAaWBKmdAe8cdWJ8ykfG2RqzkHQ
	vekMCPHgCrfLw7fT5pMsM8xhDJFjdnp7S1o03mZ46be6pQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sv9b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:08:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51605cf3c60so27450631cf.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271689; x=1779876489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0jt1WrNfwmf+YLbPjq2bHxhn5Z57n/uD+wlyxusIdY=;
        b=UN/o18uveJJx82VjIrZSU81SVfmNmGNvuuh2qpaAEBPDo8EIDA+Gv16llmRK/TVG/d
         nwXupFruI6pa8QEeY75Q2EugOQBEgzJERByPiQCtnQU+TE1gesW/5IU8YIphJUKOlFD5
         lNptZ3o3P/2oHLMCwy723miBB6AMoaoeBZtkt+rv3AjYk8XPGbNAVEvFoVZWSinepztN
         D7f6Ci3c1PS84ooXgB21MCF0jbtfWQEdOk+X/ZhvcpM6Pdo5LD0ZuljuyjQQMjdCza2H
         RMXRofMKbzWqzNhXx3VtIJLtFwqn7UQ0QqIoo+YEQiDWz+YlY1bR1KcbkknMRm6mB89F
         /OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271689; x=1779876489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0jt1WrNfwmf+YLbPjq2bHxhn5Z57n/uD+wlyxusIdY=;
        b=Ql5r/PfDn05iQThXIFI17CdlChZIbyXDbn0HRMi1WguTpnvWEtuyxGQSxD1doGF+Dn
         +NqGUIaGp9twbWvT8kIE/++EXxtWX0rTqSSMjTwn25bLa3S3CVNy1rjOoh+BVg7HNKAK
         W5djEZGqpFWeKTb057dz1HT63ZWULS0JQYzaeO4Rg9wgfPFnMsF/tB6JtalT3Q3E1vDa
         xxrLE8H6iJOxFhwu9VwFJfId4nfkLLOhsnK/v9XWv9dTBZsLH2K5Og5Q+vEQ8UJ6l1Zi
         J+8mXXMCcfgzcPz/m/rgU897urcLbwujeJNN0djO+5hw/gfBvT5Thtn8iCC+3s2IyhYh
         3h1g==
X-Forwarded-Encrypted: i=1; AFNElJ9IHcamUsnsMsEz7v8NfTplhTcjhWT9rYo33FGK1aLdg02Ckidf4PyKrURpqnZuVbJCDqYHlaWaFs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCiFJew8ot3K6Byzo5Iyp9aruXpispYb3C1ibMdb86UAAbgYXk
	Qpv2Q8pr8RSs0T/Efu3Ca+STVEDzECJ3zmXhSgy/kXAMN0G5sx8D3vhHR/duTgB8Mn//ouKPQAP
	3k3F4OcOKJUrWRrryRLMRvXf8blNJihkrtVg9P0fJQZ2Mkqn/WeHoWd/UWtnqrJw=
X-Gm-Gg: Acq92OHYvBr3cnTR4TcTNO/qpayeKmCDFUf/pLOQN/eAFj0Rlqm/1A+DC3EhYU8Tysw
	cgfoJxc7VcaOM7BrCihrbeoQizT+mvGWKDXfdajQ5A2zqd3rl2kubsoXfdIyneCckAzhurzMgSS
	K93fkZZVAUBojTGjMxrcdv788CCoCvS3p4jivAjDzfuvi2SIeAsMpCs7ZiNp7riD9l4twCv5nqQ
	0Mij4+4pPUl7LZ4un6nHjzLeJerjFNwgQAB9W0a7HQRlwEhLjU5piueqoSgPghI0aYEtr2z0pBW
	B1jDVPug2TC4hXIyLL8+iyXDxL7NMm4jRmdPXEZ4nSmL7V7JvcskIdm5wEZUvO1emWvgF97fvD6
	2NNL2OSC0OODIkeeTuv1DGBTkoQ+pK0ZqOwkMOpK9MkwU1DB0yhVr5tz8PunBqLilJFvqLo5g0f
	6EUTuKkkszR2oSxRrCeRFhAarqQ+YMweLpYiA=
X-Received: by 2002:a05:622a:1a90:b0:50f:c2f8:4075 with SMTP id d75a77b69052e-51659fde983mr300690541cf.1.1779271689306;
        Wed, 20 May 2026 03:08:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1a90:b0:50f:c2f8:4075 with SMTP id d75a77b69052e-51659fde983mr300690201cf.1.1779271688921;
        Wed, 20 May 2026 03:08:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b3c3esm29210711fa.34.2026.05.20.03.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:08:07 -0700 (PDT)
Date: Wed, 20 May 2026 13:08:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD
 mode
Message-ID: <a6fj22ojpdp6edac2vquor5n3ehm5xvc62gofi54jpsg6u4k6b@gomg7n5ktmp7>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: 8w74Lnh60QGpGJlDqLk0ji-ou9A04nAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX2qzUOlDPBtwD
 RmA9udiaazJVjUIkc75/aeKXs5TJjZGUN72iGg4N+U/J6cRvp95MUvinrrvxh/5DUBnUDgVHRq8
 9DFCiru+MhjZlYb8kMNa93xY5nmBsE/ay9ySfKWPWJwoa69evrfSyM0gBQI8N4IOfqGxLFjWM4a
 irKIzYGGDSipEwSzkwqg8nKS/q0NmbO5IKGFmlO1ISYCOjNYC9SZgyTgtzCZN1zJUX7s+gk/dX6
 lt7gjDgK/wGLvNjwqeNO/TOSu8HVoaQtmUnCu8AQVlTJsJ6Prx/MGEcqOq2pnP6eB5rLjvEv3XA
 nOTO4SAqm4aYFKR11KtwyfZ0Z+pGL4qwsX5UtYRJJu93oHf/e57YOhMNLsEkyuPZxhvjkZzJ/nP
 jC3TQN399rSB0yjn5ajiFlkzkMPpo5jJk2C/y8VhY5ppxd2zizl1kYbb5Np6xGZGc51yEZAtjo6
 2qb9yAwc7njk0jH4vIw==
X-Proofpoint-ORIG-GUID: 8w74Lnh60QGpGJlDqLk0ji-ou9A04nAV
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d880a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=028NdSF9W1XUqDdDnWcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37766-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.8:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 288FD58B5EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:33PM +0530, Akash Kumar wrote:
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
> +
> +	typec@8 {
> +		compatible = "cypress,cypd6129";

Missing fallback compat.

> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;
> +

-- 
With best wishes
Dmitry

