Return-Path: <linux-usb+bounces-32621-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPgBMvn/cWmvZwAAu9opvQ
	(envelope-from <linux-usb+bounces-32621-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:46:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278565757
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 11:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D57E6A2E03
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12C5346A05;
	Thu, 22 Jan 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJNQO+qJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbWKHJGv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E434FF69
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077924; cv=none; b=ljdALNWtGz1m34VnuxNkGHslcMpnYN3/XaHtTNcw171ALKp/YUrBZORWSM+zZ9MXQvOp+MaPzt49kSSqgtXucXgnPUMkOiFa9XUP9VdLnlBeGeV/GggeEn/65TzN8+9A2/mGaSJCIaKOVd+9ETosKuX2LaPI7xfkYJ58zqcipEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077924; c=relaxed/simple;
	bh=0Co5weH8cBdV+MO7Nv/xilh0YC0/KdxZClyI7xy+lM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYnKaCB6TNSWWN9bJRKk8bNwUfGB0RsM75VQU7YlrtxjMKU7P3Rzb+ZW30BJgGE5Z5cJHkG+wq+ZRyGZUji4J147q+OzDpyYrFOPMtpFuQoPKtlkBpI1Y4WpuXjb7ImEJTlrPBRxjAczKhf4JbJ4B/BXu+2WyQz6tS7Vslic6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJNQO+qJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbWKHJGv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M96GDq3463156
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RWPOmYHgvofTgCZKFpE9v6lP
	V5GKRyPu/2tUu/oAOlc=; b=IJNQO+qJsCfOhElNUVuWdwNYRUyIi1ji0ziPTwO7
	hmb4qPuHvOimlwyAmqiXUY2Z+yqV33x0bjJ9K2bZbzU8llXaCC1eYmCbh4ytZMav
	lHqfcA3a0D8uh5Lglgpv+SIigQb4fjjmDk5w1IShni3goh5WtqB6Qo4n2Pnwld1/
	4lZz4rv1WQyI/ZfpbH5z9UMzHLLL6fYmG6mhVMb53Y0UrwjkSHKkYwTekgXpSbGS
	MUQ6Y50FRZNthIng9YNuy6Es87QbEAcpJ5KPQGMSXVixRmnYh1y/pfEYUgDm7Fmw
	f+X0L2sRZ+iUf5mQaYpnuXfhF/50axJVGjxLe3WqyqT8Lg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653gek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 10:32:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9480078b2e2so1065966241.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 02:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769077920; x=1769682720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWPOmYHgvofTgCZKFpE9v6lPV5GKRyPu/2tUu/oAOlc=;
        b=LbWKHJGvH8UbGGvE+gQFxBt3Qtohgh/zLWWf/Ib8xUJfHDhGyli4p8L3LvKohFbp6d
         Tm41tpe5Pe5wnkuAN2xdo+dwwJ4tYYfPrkE6NruFuUatjkxOilAbkN1WxOu2ibtJyR0v
         7WbLp6x3cy/ADqXL+SeApa59stIpoV2jioCYkoSf7v8FChIX/oqzzVtvpE41DzttZ+Mp
         DN8N0As+n1Y00ktUtox3yTyWaFscfdNG00VQJ9KFyLET0i8mNBgy2a2gLpFDRk/VI7zG
         jpe7l/AZ9nloInM8rlSeaYtvvxSP9OP83gk5TNO0fLvPhYm7L+77sgrQPIQvi5SLfEdk
         mqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769077920; x=1769682720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWPOmYHgvofTgCZKFpE9v6lPV5GKRyPu/2tUu/oAOlc=;
        b=DVXuPO6fTdxM2wRD70OOJfm2U8+zUr0miid6Zj6YIGERRuchnGHz6iOdleUBX9Lg71
         gjQEHy5/b+aHJmYIyWdaJhJh+M0lQs9IcSCMR50aiIUTbonO306nV9+wgrP6ENrzXWrq
         mRPRbtp++OZAJP17iTXtqECg9Am/ZFoUnj1F2JwRn7H+wxFZ5wvpykbNSgQrWVigJHnN
         tFtdaPh8ZwMSDwvMLsIQvAMsRgn1KwiPgSF7wpRSW14kevymWt1PPuGE8x6wtOEMgJdD
         cYF9ByJnvKd8hk5JnyXeNRjJ1/QNHvFa/snxV/Rij1Ad0EJ7Z1XtSjwuz3jsZuEtW/91
         hqVg==
X-Forwarded-Encrypted: i=1; AJvYcCUHFdZdv7MRyXlXRH0k01fQ9/HrP2x3AoGQphJltaHM0o3O2AJiTUvSCjZmbYZL6WUMuNvBDrw/vcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNTViVlySZw4eu48o+CF7Y3aMFLxN2DqKjShhIWoCEZyrYTsJ
	6OHuSV4+QKB48LbYbNivTHArSeJdvwZs73A+VO4Dx+BEEiRyTooe9wxCBExow/h5r5fFsrJ2AJ4
	bWFgOb08z/2m4EPuUXf4ziU9tatmktHhuvoUPs5ehats4yWSm2qbmjOLTXopQ6JI=
X-Gm-Gg: AZuq6aIbiEeSxb2KpXJ72JDq+T8S5LdklKWV6KC23wg7GJCV9J/+eKf6w1MPbskYyIz
	4wUchoafac7n9BNxwDb1jbNExllt1igSfvk283TDHQrZJgfW/F6aG+80huAifGDrnIM3/6itaUK
	SWvEkEWwUiIEgAxbEqTG6XgsMqQ3dGWlxZHBi01R8Xnh6i65zlGTeStzTEuuOC+rHuHDwUMyk/r
	jjD9un4UORlPd2vb/jjEu/EhMART8i/glgrCCDta/DOhIeaibCDJ3e7+ix8mWSdirvaI1/fNI+y
	HvRvOSrOr+Ba88VVt+Ta5wA+XTgArfqiY7Q8EycaGK/K4rKVlNixrN7QrMOO2G1ReNLPf7nymc9
	3XZQMUBHgrCe6uMABNxRvlqJbSD+z0/7CPLEGR8xbSTAYJZh7bz+QsxkSzh05KkBa78vsK6qIY1
	JGLVE1jy91iLZzZ2gCbMQLNVU=
X-Received: by 2002:a05:6102:6207:10b0:5f5:27c4:94b8 with SMTP id ada2fe7eead31-5f527c4a249mr1080285137.28.1769077920130;
        Thu, 22 Jan 2026 02:32:00 -0800 (PST)
X-Received: by 2002:a05:6102:6207:10b0:5f5:27c4:94b8 with SMTP id ada2fe7eead31-5f527c4a249mr1080279137.28.1769077919604;
        Thu, 22 Jan 2026 02:31:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ec1dsm5388593e87.6.2026.01.22.02.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:31:58 -0800 (PST)
Date: Thu, 22 Jan 2026 12:31:57 +0200
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
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971fca1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FbqvZ5gebcY0GhSFTNsA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: FBu12zOeoxkOF5onXgZugTzSO0aZdKTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NSBTYWx0ZWRfX9eKcOFegat3n
 aZ5xD8kvvWOzqhC4ns7XYEo3L3u/2Y9L4jefnojyh/8EPNkjyRKdz8lTGTdOzR3+s0ladTmn3MO
 JQ/oCecW1+ekEr7+rVDMyQxq0fxuoouLqBySqBmqOaSFtCxF7G1NF8wJbTmIL19noKEN28FDtxd
 XV6DWX1kvpLeTIpVEyx23nzTcTOKzGrXhw9BiZhbSWOzrxK1DrEOIYo0FW8KZJwUtRFNvGMxW+k
 SR39kB9FiXSd4dOZwuIcLWrQTvx/ADY6dMS5p+MYqpGiuFybFWIxo/nSbRmzRgEmkcjmMN5huCH
 wW17l1J6nyy0SYdaqX7pZHtZvx2Ep/NhIPMU8epcq32Ei9+dnnltpIQQxVvhGOuScbXkjfAEq2e
 s8h5NllsU/uj8YCZYcn+FTCpLT8zzzk3mv/3/85Xy8ItFxs4WFohI5w2gn262vdStH5C+W01BZi
 xDZUSDk2SLLssztDGFw==
X-Proofpoint-GUID: FBu12zOeoxkOF5onXgZugTzSO0aZdKTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220075
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32621-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,0.0.0.3:email,0.0.0.0:email,0.0.0.47:email,0.0.0.1:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.4:email];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3278565757
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports. The ports of hub that are present on lemans EVK standalone
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
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
>  1 file changed, 208 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 074a1edd0334..a549f7fe53a1 100644
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

This contradicts USB-C connector bindings. Why?

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

port@2 is for the SBU signals. It can't be connected to the hub.

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
> @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
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
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hd3ss3220_1_out_ep: endpoint {
> +				};

Why is this port disconnected? It it really N/C?

> +			};
> +		};
> +	};
> +
>  };
>  
>  &i2c18 {
> @@ -699,6 +781,14 @@ usb0_intr_state: usb0-intr-state {
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
> @@ -868,6 +958,12 @@ usb_id: usb-id-state {
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
> @@ -922,6 +1018,118 @@ &usb_0_qmpphy {
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
> +			 * Port-2 and port-3 are not connected to anything on corekit.

I thought that they are routed to the HS connectors. Are they not?

> +			 */
> +			port@2 {
> +				reg = <2>;
> +
> +				usb_hub_2_2: endpoint {
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				usb_hub_2_3: endpoint {
> +				};
> +			};
> +
> +			/*
> +			 * Port-4 is connected to M.2 E key connector on corekit.
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
> +	usb_hub_3_x: hub@2 {
> +		compatible = "usb5e3,625";
> +		reg = <2>;
> +
> +		peer-hub = <&usb_hub_2_x>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				usb_hub_3_1: endpoint {
> +					remote-endpoint = <&usb1_ss_in>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				usb_hub_3_2: endpoint {
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				usb_hub_3_3: endpoint {
> +				};
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +
> +				usb_hub_3_4: endpoint {
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l7a>;
> +	vdda18-supply = <&vreg_l6c>;
> +	vdda33-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l1c>;
> +	vdda-pll-supply = <&vreg_l7a>;
> +
> +	status = "okay";
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

