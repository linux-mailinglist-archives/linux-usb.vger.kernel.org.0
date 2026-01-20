Return-Path: <linux-usb+bounces-32557-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGcNFRcCcGmUUgAAu9opvQ
	(envelope-from <linux-usb+bounces-32557-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:30:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1DC4CFEF
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E85E86F235
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 22:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3282F3D6691;
	Tue, 20 Jan 2026 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6F7qVRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el+N5NvE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1CC3BC4EF
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947441; cv=none; b=rkiLvUF+HLJ6muXMMijdJxY2S5XW7zYtWy7vbb9VHVv3dhB3Wmr0icSDuubMQr3Jbt3AC3oGAfC80hmg3Qh0mEXPLa+74SD/+eoPluGiZ23k5jDq3PS4IIJfQiFBqkEZ9k7jf5WeBw6ZWwhIYdORVLdml17gOKk2Mu9RjQsnLGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947441; c=relaxed/simple;
	bh=sxHtcsVnIT9PlHf0fVj9dyTDKvpOYafwuz6Ym6yeKvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTxtiTp2h9LlaOQI2HWUXSq2m3PezX5QjYQjIK3SSgUuvrDxzHyS4uY+99leAL1acLtJIZ7h4hRO7fEd4KCc0EzzrQkjqIx7+7JBLrvp9/vqOXxM80gyTK+9fNTXXP1RRQr7CQcXAtslDQMjWqWozu7WiC9RWAQ+Tu8z1hmRdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6F7qVRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el+N5NvE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KJmAPT800360
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LMgrBojsqlFJeJoL236KYZQ0
	LMM0OzaqMepEeLLT3fo=; b=A6F7qVRkl0XeGMV/Zqjwz60DPf0H0XOqWQOg6UkH
	aDJRGUFxBMlVWMR6ZpTOmF81s0btxOz1Q1fSgQxgD+i68tzFzwxMw1031qpBEQwa
	hNz1ijMOQnxtUu5++BSP8ixiLUCsnaMEJHNKfNIodBLMy5XMyW4dE0ymkjkigxlu
	zFxd+2d9NdOPVoek92pKf1ckVmO+5iHIIScyvZaIoTaIhfVqLKwWvWb8Z0StX2e3
	Iqy/ShyN9ODbVUBBY6rO1fnnnPjK6QOUMeFyEDZEabtuxFFf9GqkKO0yvaDzwSQb
	KJnQXV1miO3XolsZ5nEqa78jK5Qdm2wPFn5BEd3ErXb8dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1u9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:17:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso105354985a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 14:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947434; x=1769552234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMgrBojsqlFJeJoL236KYZQ0LMM0OzaqMepEeLLT3fo=;
        b=el+N5NvEoFWEsbu/VM+XuEwCb3FaMdI5UWI7kRxwXZM7k1T/DrgD2gDrmomYb2fK2c
         s+gjY0Fn779WZjvyRAs3oHiQ4E0NKlDyh1Ww1m72jjdEHrVWbD1HE7KRrMFwRszdKn4U
         cLpR5aAFTMDj//asd2J5YsFeypph617THQ4vMBGJSwlllclrA+i74SyFtTU4Tv96Esi2
         UojU5gg+LzEItXRXkcJxvlBymWBBda/smMXKN7UCSqbjB3IHbpb0s9dVR1QwnZMSiFNI
         Nrc2WbasM64LSYCnICd0gG/Q5QwWW8zxJ83Qc6KB16wZCwwn1394s8jmVqr5lBQrIKNz
         bq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947434; x=1769552234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMgrBojsqlFJeJoL236KYZQ0LMM0OzaqMepEeLLT3fo=;
        b=CagRDidZtWjxMNZw8wj7oDdKszvsQIdsUZY/ZnlcqTZQsTp8K54P45Dg/7EFCAi+yB
         6s20pB0biQiX5bdOEojUE3n5MnnoTamFQXGaxsOPog5EAfzzzzVNJB3sBORsCYFZ3MUD
         glmJywA4mwjv+hDhoJtKvz6VU+4p5qzN0J8zCpL1gQ7+2L1U+iWCr5aaYAhDCT0yHHlq
         xTAGY0bcP4Zp8OzF3ZrbnciuQqmXeGQH8RukGHNFVaZW7ccEo76tPaL+vZPdrNpzEveo
         xU7Uv2Qb8sbyNKxTnNgRQgg1+/D0KpEujaUjy+RQETkBLEY+xPcnvCg5/VYwoFUbnrdK
         1zUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQNRrOhior07cPuywVfuRsT2jC+fwu+9DSyX+T9EaEWNWe7beNbSY8S8htUGGWDuPKiHy6KQ6R2kA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XRFXGSqGzymAly1n0eHMtbXcgx0dRsc5f2CUxOwVu3gJv6je
	nqMKJXPu0BGyJkbv/G3AuvdrDyGzrJKP8aNecEbknZKCeuadJwWN2fr04sYV4xAMdgaK7Dfo5qf
	1d7L8HupKQdC9XlPfusGlouahCSvXJ9mn7MAYhd+DJJ/w+JU1bmG2HHszL3mrxDQ=
X-Gm-Gg: AY/fxX7mhi4vDQc5M9Qo3jT+UBiYdLQCVgDp1IoNCqQWrUugl3CpxuV1miYaGhfUFKK
	FWfzY8fkya3oli2lWbbWZu0n6leZ/vyExSoAjkY3Eanqai4uJowwtpEJCVrbpOucw3N2Gn8C7xK
	gR4evftX7q1nMn7S+Po3zfIRy0pmACQSOq/Q6flLtH9eZaY2saLCD/1fApxa+KLI9bBBP/U/MFx
	Eeh+S/jbhEFGZ2zoj+aZYgGn9NUr85xJ+q6ucNDIuAc3q3pvoTxHY3dKIp+jqgu5l0Zl3IqrZ53
	5UNEzxw+tDqIUjevK8Qft46JgfpzpibImXPVVpY9gCsjBhPAmtLChF9TYBD+72TQhvTKVt2d24u
	Cr/LpmfnuzCQZzD16dYkWxvIHQA5ix3k9i9+q8VeCfz0piR9gcdkJuNNoMZz+ZRKzFkXqX6DDbC
	ZQ1p+PXhuUeHkkydprzddcMi4=
X-Received: by 2002:a05:620a:7008:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8c5919e1b04mr2642871185a.27.1768947433854;
        Tue, 20 Jan 2026 14:17:13 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:8b2:e9e1:4023 with SMTP id af79cd13be357-8c5919e1b04mr2642865585a.27.1768947433220;
        Tue, 20 Jan 2026 14:17:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8d94fsm41687101fa.13.2026.01.20.14.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:17:11 -0800 (PST)
Date: Wed, 21 Jan 2026 00:17:08 +0200
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
Message-ID: <abjl52dpzm7hwzu5ccifdcjzesocngpaxlefgtuwuvlebgvz2v@eovoklufhfni>
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
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696ffeea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=57BrPIaqvqL-b6ncg-wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NSBTYWx0ZWRfXwJ74npZA0nTE
 LVitQRMZkZjqlFS5jN+yB7TvNQKUKXzplcSMRB9nBn4vodr4h8RoJV9WYGmc84Lf/BfcdAoA9we
 /i+Lr+tHkp3MO6grpGJY6iSQQqW0f0vK4dumhR+BJyDBPioFT5+j5F702Qo6KlbR8JfFAQSIaEw
 cgD4AN0AsnDIGyN4QSm1PUMLUjn2QKW2qO8DwePAfxHnnQfcVXn4blY6SqfGWOZ6cqqE/ZJ/50e
 lhiUJR4Ub8sIzmB27doA8Y1gDnwQIqzHdKt9guzhLBIEhdwM7XmOfg0j4jI7LK4gIyWgVfjUBIr
 dB+/alADZQVqHaWi8JAejDHg/lqTIoJnr3SztqOu0jbJeQSeb46aF1aBZUPpyK2eTMBL3nJit7n
 W3p2UYnfQ50hkYWqdX9XYDFsaQwGyzbZ4bfQ1rYknA3NfQvDRsw/zplOPSY2ox0IJoO15D7m9wq
 qN4o++3jEy5vlEDuabQ==
X-Proofpoint-GUID: FKo5n4fAWWY-J-A5r7eflsfsq9ZkLodc
X-Proofpoint-ORIG-GUID: FKo5n4fAWWY-J-A5r7eflsfsq9ZkLodc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200185
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-32557-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,0.0.0.0:email,0.0.0.2:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC1DC4CFEF
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
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 074a1edd0334..328b30576a0b 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
>  		};
>  	};
>  
> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "source";
> +
> +		vbus-supply = <&vbus_supply_regulator_1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb1_con_ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_1_in_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb1_hs_in: endpoint {
> +					remote-endpoint = <&usb_hub_2_1>;
> +				};
> +
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				usb1_ss_in: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +			};
> +		};
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>  		enable-active-high;
>  	};
>  
> +	vbus_supply_regulator_1: regulator-vbus-supply-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_1";
> +		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +
>  	vmmc_sdc: regulator-vmmc-sdc {
>  		compatible = "regulator-fixed";
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
> +		};
> +	};
> +
>  };
>  
>  &i2c18 {
> @@ -699,6 +774,14 @@ usb0_intr_state: usb0-intr-state {
>  		bias-pull-up;
>  		power-source = <0>;
>  	};
> +
> +	usb1_intr: usb1-intr-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
>  };
>  
>  &qup_i2c19_default {
> @@ -868,6 +951,12 @@ usb_id: usb-id-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	usb1_id: usb1-id-state {
> +		pins = "gpio51";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart10 {
> @@ -922,6 +1011,126 @@ &usb_0_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_1 {
> +	dr_mode = "host";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	usb_hub_2_x: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <1>;
> +
> +		peer-hub = <&usb_hub_3_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_2_1: endpoint {
> +					remote-endpoint = <&usb1_hs_in>;
> +				};
> +			};
> +
> +			/*
> +			 * Port2 is connected to another hub which is present on the interface
> +			 * plus mezz through which 4 type-A ports are connected.
> +			 */

You are describing external mezzanines, are you not? Please tell, what
is presend on the board: e.g. signals routed to the connectors.

> +			port@2 {
> +				reg = <2>;
> +
> +				usb_hub_2_2: endpoint {
> +				};
> +			};
> +
> +			/*
> +			 * Port3 is used for the M.2 B key for a 5G card when the interface
> +			 * plus mezz is connected.
> +			 */
> +			port@3 {
> +				reg = <3>;
> +
> +				usb_hub_2_3: endpoint {
> +				};
> +			};
> +
> +			/*
> +			 * Port-4 is used for the M.2 E key on corekit. Standard core kit uses
> +			 * UART for Bluetooth. This port is to be used only if user optionally
> +			 * replaces the WiFi card with the NFA765 chip which uses USB for
> +			 * Bluetooth.

This is the corekit. Only. So, it's just "routed to M.2 E key connector"

> +			 */
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_2_4: endpoint {
> +				};
> +			};
> +		};
> +	};
> +

-- 
With best wishes
Dmitry

