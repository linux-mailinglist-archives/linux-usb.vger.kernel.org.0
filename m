Return-Path: <linux-usb+bounces-32558-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG1FF9YEcGmUUgAAu9opvQ
	(envelope-from <linux-usb+bounces-32558-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:42:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8814D239
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6D73A2E824
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 22:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FFA3D1CDC;
	Tue, 20 Jan 2026 22:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfzsJA2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANQJJnpe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6A3D1CAF
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947516; cv=none; b=O5E0/LGAFpDBuc4PT3jszeGoFPDgwmBYszwirPFbpulhEIPGavOoof2NaxM2ArLNoXA6RYPLKBbaz4rSAbI6Wp/mfOsT0Y7q1B2qyYfPPqiqJMTQkDiC5S6Nys7jTUNYWcB4W68QgOGy59QCaGZxRAcWL2U+NiUeqcEN7g0aEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947516; c=relaxed/simple;
	bh=X0xq+2x0cuDFdLEDtHl2/w8L8r2rHmGx6ypFfG9ToiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBCPn7wuqj3orImYjJW3fC1yPF3OrTsvlnwf7jseVe452co9v2FNlvLKjfHkztGRzudOz0MCzrWr1N31TH79QqFEs23fxTpsB7vrzs9zUJv4eVnq5j548mtg+mVVtaVTBg46tc5ySy32bvvdPe9DkPntD3qoVSYDiZC9JPXnDZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfzsJA2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANQJJnpe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KEmhH4428514
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=syt2oTWmuBZkZ6H9zV1EYBqf
	BC4eRoEyR3BUJW+lFds=; b=UfzsJA2XmfeOYPWwu9ew4T3lWVUOsiZt3EjBAohe
	atRv/C7tZyupkyBQPAu4PrTDUSW8TghW/7tN673j1VybbKmf+EhXZ1ITKKs0AdY4
	AtD8drZVvn1fgVa5783nPlHQ2nZ97NOqoMEALq53hXK2bN5FAkRzna0U9oNyIL/P
	l0BiDzkXxvlHMg6tC8dfPEMsvKcLdTqNpTwCTdptWgLbg3Cg35utFEa4wKSzPx3S
	YHab/kNvIkBfIpJ8aMDRninj+/LXa3fFSEcfYd5P1B/uHBI7yhb1Ap+dfUHI+Hox
	DgXm4FHo0C73v5Igfb5oqm2wVfwPukCkvEHRhZdri6pepg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps2wxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:18:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52fd4cca2so1475537285a.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 14:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947508; x=1769552308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=syt2oTWmuBZkZ6H9zV1EYBqfBC4eRoEyR3BUJW+lFds=;
        b=ANQJJnpegkeOVbP59SBjyzhEnLUhGUsLCSc6HyFNfIJ04osICBBsHHSazxdDnKvsvI
         2kvtH4kdPNmEsB/uordtA+eoCQTDhvK//5QJucKC15ooJ7nOxR/xYDvug+MFasq16l/H
         sw/ETEJkE+Kl6tAHH+WTwMkITzx8if8G+c/CQyEnfr+4YZWbgo3ZNhfZd4ojLI5DLRBq
         0QP079Ry1zaC1fa0VVWTgV2b6nFFoh5WBS3Il4TaV/0ltkRh6Y3E4r/pHkramAfjZHzj
         3Nfrfj6CwQQuxx/UlG9L1F2Ob8ZnHzrsJibytQOUUjq1+cKf3+qYRjC+/0oJyxBneJwv
         YCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947508; x=1769552308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syt2oTWmuBZkZ6H9zV1EYBqfBC4eRoEyR3BUJW+lFds=;
        b=majbLzsnWRHwgvIpu+NxpvO+v+vD97EBJI+5m5EehGj8ozjgt5zY4ty6M1ZoeDOZwN
         rHTlTQnNNowKg9b0VbOm6wkX9p0uI5v96lGL2mJmUewPnszHA/p7YRCG9ukCkB/3S86a
         EWP/oab5zmvKVhPsbZZvHuP/fu864mfl8mND4v8JCh1oasF47/cEs6979MCFNO5dN8mA
         jqDdme0EJrYNyAFg8fYne/s430CdoESMeAdsUvDk00mGI4v7C6T8Grze5GquoVb8oXGM
         BWBRx639MAwqy+oMvCdPkah2gRCKClsgMEA0EewmWenqp6yf1K8pLw2ykhyf4sOHRZr7
         HPRw==
X-Forwarded-Encrypted: i=1; AJvYcCX0BIXABo7GU/clmmJrIYga3E02FZe7RSmu3BdegOQ5IYPp2qseASFB6N8Cxc31c40+8imxd5dt3NU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwwJI5z2FwFvyqpz9Q3D4WtHThUzn7TIsj1UWD4nanDOlBUVK
	zMLW2NrGcs7ykR9GcglEs1mI9zhmoEBoJtSt01VFi3JbbEJ5f0gyEKIrbLxIyETda1rrmaZcyLL
	VboLvRvsH431+G+OSXC72XJAeogHWAn3A6O6JMQbnmFpG/Z7idXcWaiaL5a9XE7M=
X-Gm-Gg: AY/fxX6U+s1E63YoznFdwU+3lN3o6HdNd5wFIknz70Tr5OmLe80uBac9OGP6ShAlFsG
	Hvo1y9E1GWKurplFr2tsEn/2Igu/vOZDjT+DjuF0j+StepR8rD2G7F3TDdbC8V8qdRat6OgZ2u7
	pzqswsXjocKx3B++9rSv4FHXX3klpHLdCHqSULPfbh/WD38v7sdvFB7/reA2uIP3V/6rRAAxaG8
	46IMp7hWNp1mtLtse9r8lf0qQ/1BYVk/6gr7sWwTxOALPkvw722dfbfmxDPM2/a5A17HALOvG+W
	UUaDoX87wZnBXyMcMYmUFxoCxF2YZAoVlw5NZR7vRfAZbl7EV5zX0kK6EwVfyL73wKoggT7himd
	9DYQqNekz00eTW4dKhexlM1mu8bKUNxdvK6mqvtJD/8NWQWnCDWqEjc0QTIfgVsGr5G0EKfydId
	b1VhLb1q73Ztf+Yn24Mhq0Bbg=
X-Received: by 2002:a05:620a:199a:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8c6cce504a7mr418062885a.71.1768947508054;
        Tue, 20 Jan 2026 14:18:28 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8c6cce504a7mr418059585a.71.1768947507636;
        Tue, 20 Jan 2026 14:18:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3544c0sm4305916e87.44.2026.01.20.14.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:18:26 -0800 (PST)
Date: Wed, 21 Jan 2026 00:18:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <3hdaz7x3t66bwqrcwny6iuuk2zzit7pcqev5ri3gawftsfxtru@fhlcf3xbchar>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
 <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zRMq6MwIEACkteVgOhUM3PHQKE876GCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NSBTYWx0ZWRfXw6Af61gIIC49
 fqgXVW908FThQGgp5mrxf0HFnjFNLjO7gdQ7+P8ClrrvZsI8QZxszj/mAX5lrZ3SzOdO0QAezuw
 vl/IKv6Xm/wnWApitjdPtzkqQO/cf7A+qm/4ZTE0odm6x4X9Wj1nqQ7ybwpwrDBqpGvTGRnCjPn
 W05eiIEfZ+M5gX0xa+iWtQypLOS6WMtPTkvD2G2Pdb0q0c0vP1bF/+O7UQ/SjMsGCrvPF7ZylTH
 aTP5nYtt1+xuxh6AQdwMOz02LKr8R+p16gcFJb3U4aWzULn9ojLWsTnBwy7oRkSIWMfRS+/qQ5w
 Ji0aovQWePbPKuudNiDUSXfhOsElSgXHiZCLhQscgYPmm+v7s1vYaw4dBhln1wP6EfXONcfb8WU
 2jrMOKF3+7VrqE8HVzadljv5l/BpUGQ7GkwzWGqqOP5x11r0W7K96nLp5M80dVq+UQ0sh+7V95T
 THJCMiP7GpG35Overiw==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696fff34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DB3wwMCoT05eveMYl1AA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zRMq6MwIEACkteVgOhUM3PHQKE876GCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200185
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32558-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,0.0.0.47:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF8814D239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 04:03:12PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports The ports of hub that are present on lemans EVK standalone
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> for Bluetooth. This port is to be used only if user optionally replaces the
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
> 
> Remaining 2 ports will become functional when the interface plus mezzanine
> board is stacked on top of corekit:
> 
> 3) port-2 is connected to another hub which is present on the mezz through
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
> 
> Mark the second USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-c connector for controlling vbus
> supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 209 ++++++++++++++++++++++++
>  1 file changed, 209 insertions(+)
> 
> @@ -536,6 +585,32 @@ hd3ss3220_0_out_ep: endpoint {
>  			};
>  		};
>  	};
> +
> +	usb-typec@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +
> +		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> +
> +		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};

This wasn't tested against bindings. Why?

> +		};
> +	};
> +
>  };
>  
>  &i2c18 {

-- 
With best wishes
Dmitry

