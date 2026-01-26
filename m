Return-Path: <linux-usb+bounces-32738-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBtPA0+Dd2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32738-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 16:07:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1189EC8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 16:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B03D23042985
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAA23375A7;
	Mon, 26 Jan 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfS+Fciu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ho6D8mh6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF9F3358CE
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439813; cv=none; b=rgsshdgzmQ3jQNsO99IDaoDKHe1VwUJinjyATfmUKm9p5Zin/l542suW6ROm3t7FFhL5j8W1CKGI8J6S6Z05dfWx4OdT42VNm8+fN9DeqmhcV0ttbQ4wARviI81WkRdflITKn5v02FPe/7ROGBSfa8Qpd7jbnGn+KKKETcpLGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439813; c=relaxed/simple;
	bh=FbRWRE99w1hP97Fxyw4gsfPUF1oyccUPfN1+ykWolw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BllBAZ0Bg3oGOURGdGvUbiQ4qsZuPQC5lg4gLrXNnXabpJ3OPka3CBxb758Wk7oNrkbskFWZn4QbHnIZnMFU2PcBtPTJR5NWIcGfkJnZ6aFdcXnc38ZLdzYbxCXqF48Axumw6zM9J288/jC/irM5E7cQTpVYJ0qY2/OyifzOHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfS+Fciu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ho6D8mh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q81sUH3347754
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 15:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ejhhd5mKIO+krlcy04QgJSBx
	/8PrM5U8ePcBuVqH5kY=; b=UfS+Fciup/w9pbRtz8TmtdJfrakX0K9PaOZ2qKFg
	ZY+zKHudSOfTkulQ/ONUcLO/DT9ZK/kOnz9zPh97PaECEeS3tcjT1nk5oxaSauav
	k2tH2GyD2o87ejjen2Sm3KqbW9tpNirczDW6Eoi3K2mxOpNv7ajOS5jOw+pqAqib
	T+8AbWDVhYFGyt8xuW4etEbdT2H9tbtl3VFLgQ1gNKtGQ8IGawP3ArEy/kR57Zag
	4t+OyRXm3LVU6VMkdJzUbb9T0vPLWwlOSv0wZFzREHXTnffB4uSamtypojTA83WT
	r2TTMKWptNKhhaLAsnd/XmKOhRgiXn656T/u/GDHbKpIpQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24mucp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 15:03:31 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5662e5d9a84so5034157e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769439811; x=1770044611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejhhd5mKIO+krlcy04QgJSBx/8PrM5U8ePcBuVqH5kY=;
        b=Ho6D8mh6atqOqEzaRWDTi0CRGanf37vPpmy3Xutsns+lwpFuU8YTvGjgW4F+0+k7PO
         ZuGaQojEU2ItnZqUwVfhnkEowuZqMCZIqUMQCc9VZTlB6oBB7X8ROmU9j/7avW6aIXOp
         5w55NRv6aWmB15C/DnWrW88YvLrGm1GF+DvHK2fiPD1b4SsSr5+K/T5xcCkN8W9+6gW3
         ZdvDitA0jmCMv4zBa205TTZrHigyXH3NDTARUW3CxtJtlD0yWENJVtpIeEY2wO8F7syZ
         z5epZInrbbNQ1f2Axba+iga+RdAW7ayKqnvlP56aK+8KDDEU7U1gKArSNDLviB3sjEM1
         WQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439811; x=1770044611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ejhhd5mKIO+krlcy04QgJSBx/8PrM5U8ePcBuVqH5kY=;
        b=s0j6WLKxFm92ZVtt3QfjYFLfa03e/VdAmhiflvcM8uJn9E4EMIDCDLKztQMJNTfh1L
         i5X0Ve/PdvgbWGObGNZRADRs9eTWZf2aY7tsGnFt1naD2MZeMy77FCzsSZpBoBYlxYcn
         7XknVrgbKF865xON+c+AtwMUK3CjVg+6c7QeMgVgBE3WZL5q56/q95w/HYgLUNUUJUZW
         AIlxbfWniCW1O8xjfo/42UZx5SFpxTxDGDyqmPcH16EZrcSbNVgegG8BS6uemGXQO02B
         mV6iBltqcavi3gQcmNKScerEUOgVzSubeo3O8G6bMS4euoSU1J5tkWQIFBorRRuFekW9
         wR1w==
X-Forwarded-Encrypted: i=1; AJvYcCWzKAT8TUaqZp83H6BYYAnGOZTx/vzN2sUjfC8CBek+TV2meMc1CbR0Q7oM2By5zkaz9qS1wOU3NQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH6lxPyM3F9vuc2PGnYY5u2xr/CB5Ia1mQDFw32awY+PvpKTNc
	Ej46YVAYRjmxhR91411aB6u1GtNYdW/BJCmJ0SNh/xLkcV6GisXY629kuraggImXIWAXPp6w6MS
	Kjy1HD2px/L3kFepJiQ3IFNcO5AvEbT5Ljy1Hvr5XsOcHTUD/DZAHPUdWt0mkdNg=
X-Gm-Gg: AZuq6aIqnW3w9L055EcDoASoh95H6RRvYIIqfxlbtiwJYzgNbXkXqafFSU/0q/SXav1
	Hz/pqEa/JF8fqhNdgxhS0zdYtW291NJWTJOAwJHUdCTlr3xtQIXHSJGHHxr3+fDN7PIV4ukSpE2
	Z4I7vCw6vOVIHQZz0YkDErFNQFLinhiJBdyDx6B8Xzrpp3pR65ckOIyUXc+wfPy2CMOVEnvofkP
	Hxd11fRcEE5etjWt4ODC/XfMiVb5jJws0lBABVbDYEihwlJUuPtXvjJuNZVITx185xcMTaNrUFV
	hHSKECxNEn1QFJQSB7vaJgXrR4RBES8NUHSMMtzPgYXNLg29GEblvnu5WLlXGODb76KKoL8daAB
	LjU3J0xi14cSkdnkeJFB9zVkC
X-Received: by 2002:a05:6122:511:b0:566:20ed:44cf with SMTP id 71dfb90a1353d-5665c938cecmr1526549e0c.3.1769439809219;
        Mon, 26 Jan 2026 07:03:29 -0800 (PST)
X-Received: by 2002:a05:6122:511:b0:566:20ed:44cf with SMTP id 71dfb90a1353d-5665c938cecmr1526517e0c.3.1769439808641;
        Mon, 26 Jan 2026 07:03:28 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm29701894f8f.17.2026.01.26.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:03:27 -0800 (PST)
Date: Mon, 26 Jan 2026 17:03:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <5upi7gbk7kqsy55zdcmsnorvjtvpkbir72ohkpxy5glolnle5z@4h4tiqjdmui2>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <wh4qsgwl6drye2d227mv22pxz57cikp6ogabklo6fvlzljqafp@sgps7d52yp2d>
 <cb08a156-d905-419f-88f1-77bd136c823f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb08a156-d905-419f-88f1-77bd136c823f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyOSBTYWx0ZWRfX2No5ZfF7wExq
 C9L68ZUfa+DOZ4XH7NViXc1bAUsHYzVyuwbx73L38Ll7ZkzY0rV+UfaP1ri4gSL1T835JI9OAta
 Z/IsDmYAVxd5xPMb6EYpl+y6oRu/DhCw/IkLWFygrbPPt/eUHBHFRlH5wAmXUS67Uj5f+zLe7qJ
 R/ojsS/ztQADwjb+j5SHnjgUukftaTrG4IZ87OtHz6je5vn0z82ue17/zo7qPr2S6EXXypC0H+6
 A7sZy/Xk2NNLZUiiGtQq6OHYI5X7mysqFffnwjWnp6gy/ZVpXsaf5LE2NraTqgMrO7vynk4SPf4
 5EcRkW4YOBcQ/LDeMmAU8Chses7mLwa165CwsyShjPRwv2Hzo5SvwkN6n8uIdK7j4RmNnjvhw+0
 zhb4RKM/4OxxkEZu9zd4iu4oZLMyqbNhRjd1w4sZoA808tPco929hvoeOt1O3sceXYnP2RF1uUT
 j0MeFiFH1cC0Mt9nlCw==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69778243 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=woEmaW9y2rYpOZNNKUgA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: qICbTipE_s5L1Rw56aMGicrOA0mPoA6B
X-Proofpoint-ORIG-GUID: qICbTipE_s5L1Rw56aMGicrOA0mPoA6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32738-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fa2000:email,fd3000:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,fa1000:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77D1189EC8
X-Rspamd-Action: no action

On 26-01-26 15:44:45, Konrad Dybcio wrote:
> On 1/26/26 3:31 PM, Abel Vesa wrote:
> > On 26-01-13 14:13:32, Konrad Dybcio wrote:
> >> On 1/13/26 1:33 PM, Abel Vesa wrote:
> >>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> >>>
> >>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> >>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> >>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> >>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> >>>
> >>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> >>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>>  
> >>> +		usb_mp_hsphy0: phy@fa1000 {
> >>> +			compatible = "qcom,glymur-m31-eusb2-phy",
> >>> +				     "qcom,sm8750-m31-eusb2-phy";
> >>> +
> >>> +			reg = <0 0x00fa1000 0 0x29c>;
> >>> +			#phy-cells = <0>;
> >>> +
> >>> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> >>> +			clock-names = "ref";
> >>> +
> >>> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> >>> +
> >>> +			status = "disabled";
> >>> +		};
> >>> +
> >>> +		usb_mp_hsphy1: phy@fa2000  {
> >>> +			compatible = "qcom,glymur-m31-eusb2-phy",
> >>> +				     "qcom,sm8750-m31-eusb2-phy";
> >>> +
> >>> +			reg = <0 0x00fa2000 0 0x29c>;
> >>> +			#phy-cells = <0>;
> >>> +
> >>> +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> >>> +			clock-names = "ref";
> >>> +
> >>> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> >>> +
> >>> +			status = "disabled";
> >>> +		};
> >>
> >>
> >> [...]
> >>
> >>> +		usb1_ss0_hsphy: phy@fd3000 {
> >>
> >> Let's not repeat the mess introduced in hamoa..
> >>
> >> Perhaps let's fall back to usb_0 etc.?
> > 
> > Sure. So then:
> > 
> > USB SS[0-2]              -> usb_[0-2]
> > USB MP                   -> usb_mp
> > USB 2.0 (USB20S in docs) -> ?
> 
> usb_hs

Fair enough.

