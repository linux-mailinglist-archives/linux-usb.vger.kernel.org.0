Return-Path: <linux-usb+bounces-34275-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOqnJ7qcrmk7GwIAu9opvQ
	(envelope-from <linux-usb+bounces-34275-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:11:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B80236D3A
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACDC2300B8D9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F72638B7DB;
	Mon,  9 Mar 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hE2ibJhK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFi5ZEfr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED038E103
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051011; cv=none; b=bubPyBaxB8zNGxwninWS2qlKAXxlvUgrlPsWEYpA1Pre7vxF357sxDQVco7W9Z+XCBXYgiRKGfhhsGYtdr5bCfvMKhmCmbqpVxyafp4sPVEiH5/2/pMe0LQvWUHdPVxTo7q7RP9EcodaD2dnC/nEYqPQ5tOI7SZDrQVAI9mrA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051011; c=relaxed/simple;
	bh=vr6CAYEA5hTipP2TOuXOnhA/YZKBNgT4Sgf+GuQeDVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFAbaIadJ+LTLf3LJd96W8JNdn1oPF0AmozIJHdEO0ehazcPKQ9dDZxFEVWgOYVTGMSahMisOT1nuk8JCks/tENh5Q43+gQ9WoasMN8Em5f2QsPfuTQ1KiafqEpovb8+TfkPUFxlbCdcEA2/DAPAUi6VHFeDr4PLSIy0HEY8OnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hE2ibJhK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFi5ZEfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WPVq3774286
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 10:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U6+EMlJOOn4VofKWZU4qvsjW
	sKu8bamoKtuqSuyVGd8=; b=hE2ibJhK2lXiMW0tRgyMTqlvlfspsawFs2mP6oiD
	XwMUMRlwlE2sU9qsjeZ3JOJTJVklNyNgshnNCeFWSZ77/OmruvurA8JK0jF2cUpX
	nWGSkGf0wO4rvqos4KS21Q2WpQCH2tcx4AVnCM4Q0r6xMJkRHia6JszjvpAXns/n
	xklUCllqpMzfzq+hwPRIVAH/1Q8zJJfmFnQLc8ETmcMgmHbZqVsSMCzPQKgIrw20
	d5Dzi0+JbMWl1Qnao0c2bJRHuDnw1LLUSq1cnwN684qxlgJmTHsBJHr+l5zJRmkU
	EMsmVOgN32ia+im3pM4M6fhsWbN1jLyb1gez67OPNVn0lA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8c85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 10:10:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso9084542485a.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 03:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773051007; x=1773655807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6+EMlJOOn4VofKWZU4qvsjWsKu8bamoKtuqSuyVGd8=;
        b=dFi5ZEfr5YsDiUlR1FU40h9VVV1q4m6o/eAkH1/X/wjkVUIuMqLODPECUHnd6LbV30
         6H/GV2GGOeiUntz7z+VtUbnlZ4EPLtKGf1QRmfQr8lQyhCmtN/gcManLvFQy0EGA+N/T
         5uqy19D+V8gLqacn7hZ5UT3rqmej/Vo0jTHi2OaESQcVspn86ON8pSNNYgA5r+Bo9A2x
         r4lTYiZmWl8OVawEyJI8qkhaAol7+lJa2lFahs2YIuXhI+GNBHbZ7JUc5WKL8hxSL74e
         Ir9V8h1Vrd++GvdXEE5daCT96b+mVz6j/pFko579B/q7YEAhetZr9J0zsB71+4iDYoWO
         McZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773051007; x=1773655807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6+EMlJOOn4VofKWZU4qvsjWsKu8bamoKtuqSuyVGd8=;
        b=WCmM9odx+6Ot2tIm0G4uItyXuhQxP5u0rnJWk7en30mSdONCNdO4UNbCBHK8ZaZaJw
         3MTRDh5+a+ztlGtchrq9589ppf/VTbxIV7ubfQbSgsb4D1bSl7yfWgqdABkDgYF48fZF
         8VExcUeHX2OmGqjYkxVnJtc6XBCl/fHyQuCYQAj5grVvQ9oAhbp7EThbEI/OkiqemTtU
         BL/zzVgulQRx+wePDO5iecS+Ww7TP0o5SLWZC6Rr3AOAVseRzIEExiO/CGq22NwX0ndT
         ve435vMGBmceLOQbumxrVRtdcBD2giw9SaASiyBVBWL6ntOsqeoRXYgYxK2F9qcWbs5U
         dJDg==
X-Forwarded-Encrypted: i=1; AJvYcCUJSRe9j9HGTa0ZEuo7GykpfDyoQGTHZf6+wLXEcFWzrJ4VVwPiq4IJDofA+w0HcxgWBqSWMZyxu6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwtkJSIxQGeg23QJlolg9pUkCFuiSh2f/2aUaIv/TlGAYABjy
	5kPzof0WcpCjsYCOHNe5KdtEuFwu2aX495jx7ZnnPaKHSbWno9q04AUc+n6xn9yC334RGB+CMki
	ahddPGpD9lMideSp/f8aphVDPsuqDesld9Wg/g5Ts4ubyRQIquyeQatwQGaeV7nI=
X-Gm-Gg: ATEYQzy7sVx9SUgywcD2KLUvAO781varnn7gPvTYe+B83qOSqMPDfHkTkgyNb2p0G6E
	7YWU4eaX5KJJDnwfDlc6vC3dQW85BUNvUTH4K5MwzhT7IeMPwmGP/YPbTX6xeaqRipJT5IMieIT
	L0nUS1DfqUpSju4RlhUbECNe6TD7j9EzGamrpVMBV3hI8iivEkZV+hfaXGrpqBn4jIJspkEpbL2
	9p3vOF4/dQtbMb6rXIxIqoin3KjYbslycT5LP/Lz+xRKfCU0nfTlM8DQlzXb6frpgkTbBiXm1qd
	Hk4yk99Nq+ybPlnXkHhC5MngPMBOrc1rxJf4Zs5YwWggrF3ZBFmIBRuHt1/8vJry1wG9PdvoPh4
	eSF4uViQd3HKBiUGai/kVCwHrYhfNnWTpZ9Hg
X-Received: by 2002:a05:620a:f05:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cd6d4334ccmr1302980585a.34.1773051007236;
        Mon, 09 Mar 2026 03:10:07 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cd6d4334ccmr1302976585a.34.1773051006671;
        Mon, 09 Mar 2026 03:10:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae56300sm25028195f8f.37.2026.03.09.03.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:10:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 12:10:04 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
Subject: Re: [PATCH RFT v3 2/3] arm64: dts: qcom: glymur: Add USB related
 nodes
Message-ID: <thehranqdsasmzgyyr2laauozjoy3oi3k44vuw2tpsbddxv73o@zhxglzekrf2x>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
 <20260302-dts-qcom-glymur-add-usb-support-v3-2-883eb2691a0d@oss.qualcomm.com>
 <0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com>
X-Proofpoint-GUID: 63VKhwbouxKdnZxPqGSk1PLDyWep6lJY
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69ae9c7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vTMJP6u9PrFE7TUiA3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX99GGtc5TeV0l
 e39b/Kl9c1VTsBrXCfbh8UCi1E7AGqpZB+Sp6cq5LQfrdSu5RUcAxlXYTgGG5MQwX83Abg/+u9r
 y3CYcwyh087dsnYasseyoBDkUOH4qeFKB5rXKqC5S48ceVrz8XuotEMlfmlE7FIUsA6yC59WHmQ
 4TGHPokSv7UDXLNbZ4Mx3d/S9WZcTSV9X/ia9kaA0GGS8DpQXTO5rZjGxaTUAI3z0vPutZ1EGuM
 L94tfzVwm2z+6rU/nYRpDwzchlMh2LlT42CaH/9YAs+jtngkbSem99scj7PYdam2M1P/rZ9WQJl
 2ALBoi9PxcnXMTGRPPR6z0hDu2SxGLM+puQCZvjlOVT9Vqum6vo1lIadq0o8AaT/bAXhPxYaqag
 sKPZPsQ1pH2eePqHoGCcexj3LXtgr1be8Lg2YYsUMgBjQMVo7mEEsXhU8mNI/+WBqSabUDOGpe3
 1Zl7ZXXPwIXkstkxeKw==
X-Proofpoint-ORIG-GUID: 63VKhwbouxKdnZxPqGSk1PLDyWep6lJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090093
X-Rspamd-Queue-Id: A5B80236D3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34275-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-03 23:50:39, Akhil P Oommen wrote:
> << Snip >>
> 
> > +
> > +		usb_hs: usb@a2f8800 {
> > +			compatible = "qcom,glymur-dwc3", "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a200000 0x0 0xfc100>;
> > +
> > +			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
> > +				 <&gcc GCC_USB20_MASTER_CLK>,
> > +				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
> > +				 <&gcc GCC_USB20_SLEEP_CLK>,
> > +				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> > +				 <&gcc GCC_CFG_NOC_USB_ANOC_AHB_CLK>,
> > +				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>;
> > +			clock-names = "cfg_noc",
> > +				      "core",
> > +				      "iface",
> > +				      "sleep",
> > +				      "mock_utmi",
> > +				      "noc_aggr_north",
> > +				      "noc_aggr_south";
> > +
> > +			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> > +					  <&gcc GCC_USB20_MASTER_CLK>;
> > +			assigned-clock-rates = <19200000>, <200000000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 92 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&intc GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "hs_phy_irq";
> > +
> > +			resets = <&gcc GCC_USB20_PRIM_BCR>;
> > +
> > +			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
> > +			required-opps = <&rpmhpd_opp_nom>;
> 
> Please ensure that the rail (CX rail?) is scaled. Otherwise, it will
> impact other subsystems using the same rail (eg: GPU).

Sent as a separate fix here:

https://lore.kernel.org/all/20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com/


