Return-Path: <linux-usb+bounces-32733-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPveNoB8d2m9hgEAu9opvQ
	(envelope-from <linux-usb+bounces-32733-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:38:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7A899DE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 15:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C213056163
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF43C23B63F;
	Mon, 26 Jan 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUOG8T+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crw2djK7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F0254841
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437947; cv=none; b=dDQmQMccyuG2+0sVqvr9Us/tR+AknZWmKcqIHyy4wUwrS3bnE7g12tZM6GDP0jRFpaVLUlO8T6iIpLQGePP+3jvWQlL6O7Ez87JV0erYlR47yv9NMnc0xCPLXnU2736sgcVZgW5TMWcMI5FJlMX7x0YmFx3Aed6nKEcdekQNLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437947; c=relaxed/simple;
	bh=daHZqMONP/7qypDkU0uDwU4DBQuz8Gkx45cmlIumGR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCHGRDN9k7PABFrAbhTvLEqxagwkZgKncJpl3Zm54T0Qj5+A5WN/yHvUtZCgJmoE0U5kldM9dQdywkkjvCca9qGICtkAhzp4kD6gEiPU6BSWOa42U4s7NXc/N/uigCwj1dH3z0brJAJpBjjrxTSVADmITojH8+AN5IJ3cSksmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUOG8T+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crw2djK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7lxVv1879494
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Q/TyKNcc6J5J/TnZoapO+PZ
	pmxpO5YpB2o1GEQ+6j0=; b=HUOG8T+mL1YwwNCl0a6pVvd26T43bK7b011nYTm/
	/uw2/0LFpla9i4IFx5sBqSku5W0aa6jCZnXBuOe1awdHVB2aXNpsdHK8xrB2TiTN
	M4Q2M4ovWeocMUzLaReZofzAM+/kpqxvbFDjoqmo6N+7R64D21XiUnoAOzN+O65E
	r+gp/Ix+gp3+VbR5U1pzPB5+WG1+gMAIaSOd1kBubX+JvveoGIoroIYYoR91DktM
	pxEhzn9FFlx8ML3Ke7b9Le562xzBdXxO3SyLsIrTtrwsLrKCWPyPhKyYeNdBONXy
	6ArXDoAukWaxEAZbeSQ0Q7ndhk0q1XDFHdAW8MEw0WiVlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dmtvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 14:32:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52bb3ac7bso1000689585a.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 06:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769437944; x=1770042744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q/TyKNcc6J5J/TnZoapO+PZpmxpO5YpB2o1GEQ+6j0=;
        b=crw2djK7O5bYhZRpDgAN5RwiF1lShRdImGzYItzd/O3ZrNScOoGM5yPhxInNv70NLt
         OZoWLZcaWaS2+DaRKC2mKgWq5q4QaGiHHN/W/3Gkj4S8hL09X1jandraQP6OQVes12rg
         kSm5aq0VJ4yKrtRLfJYtIrYtSzXC9dR5hZ0aQt/yo3auW1P7Lxjv2GLug7B8Ya/wimmT
         eGDOUWMpcnGYT0QcxRXaRmFqIDBqi9P+otKKcxhhpj2xZx2/Mt8WQdYHEowS/jXpBZLx
         rwuejZ/BKfubgfKMkj2YWxWUmsBGlHDE45dVb1UOt7Zxk72hFzeyv2wV88847UrgPZ3+
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437944; x=1770042744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Q/TyKNcc6J5J/TnZoapO+PZpmxpO5YpB2o1GEQ+6j0=;
        b=RldLc9H7uizlx2Yn7YLn6skcDwSAknRr9Af4Sgj1TIwKRm/P7534LICAsCD84OQyG8
         RuYi2N8L0DfcU7R7ssfpecLJ0UIA8iRCTr+Z5zP3GKnJcj9AjdlL15UluMLsUb6SX3LK
         BizoNgkx9ktkBZgEpnoVtXkwza+Y4WYEsavM9qHyK1BqYy9bpCCXnEB7elUYVL8RoWq4
         kS1uaBWyxCVc571y8HdHLXdo0GJIZbXEIYVOBzsj27z/DFQrD0HozLhby2cgYJ+w2ns0
         gpYPzKg2eRg/gsDWPJdYbHkqIwe4YGRxw/IAAN/yE9Gjc4wknQDWQI2iDtohZCVYHvWa
         Zn6w==
X-Forwarded-Encrypted: i=1; AJvYcCVNMb95D/yvw3DM6PJ6tdZBMmkIRzjTJTRvykpWlBLO2qG9VAHoPKJPT5u7QlSvzp87Rd9THcyLheM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwX/mErXGyaxpetFEALHMv6XpDkZBNxgh51MYIU3XkVKFTUNC
	M686R+Fk7l+4zdgYvENmh/EVACB+fidS00YOy2eAe5pKCoodVsd/9FGAL2YiETHViage1ux6RpS
	jwWQFshYuy+4c/Rml+7sk0ZJrfV2uuoyYPBOQrOmQWzGIXEJrL0MG7r/nCJum+3s=
X-Gm-Gg: AZuq6aKgt7l7MRWIhw/Mo8xJB3u9U01I3hnu1DZoZtGLZKl+qHUtdXkeB6gUhqZpljk
	W5rQ9cJjRjwlm/OfaUvIlMbKOAI+4qcK1DYJjrERg3CkZ8UmwzlE4QEcRNcNTIqxE4sfh23DPUJ
	EXL2uFmev1dCCJq0rrzYUKbaB8L4pNyWq/BDiEV3f0piKweQced5Tz7uqgVrlpIuQBeZIr/krMu
	sjA0nrR5bM4NeBCwy+8RKPSVNOtOXkq8c7HmSL8YNO/sadlDjuJCaUdRj+XrspoUrnnqZj9Ltb5
	uMpnr0fdYlulOMInrQWv709xbEWDjduzTpSvPvVl0WsHP6xACTCdChtrlKWUvqt4z5goxKplWmt
	6vFdutFa3ts1HicSDVjA1Af1e
X-Received: by 2002:a05:620a:1a19:b0:8c6:de6f:8996 with SMTP id af79cd13be357-8c6f95e72d8mr489077185a.16.1769437943925;
        Mon, 26 Jan 2026 06:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a19:b0:8c6:de6f:8996 with SMTP id af79cd13be357-8c6f95e72d8mr489071485a.16.1769437943294;
        Mon, 26 Jan 2026 06:32:23 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3b4625sm109913795e9.0.2026.01.26.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:31:45 -0800 (PST)
Date: Mon, 26 Jan 2026 16:31:44 +0200
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
Message-ID: <wh4qsgwl6drye2d227mv22pxz57cikp6ogabklo6fvlzljqafp@sgps7d52yp2d>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyMyBTYWx0ZWRfX4y86qPrLFlJH
 AT/WMWHQjmmJZ4PN/P0uafJvIT5tjjPpW0Gletrk77pC4i1mRg0fu0Nw9NBMh7qJ7CIyZ3veT+C
 IhY1Du0qDp7OyBlBpdSr3H5Wg1B0Dvep4ZjsINtIXgCVEiE1b9A8r9/ApsHWvwaCaNsAtJnCF5T
 E8Vw81xmyn4/czpA6RLtpv28fd++LSBJeoGkVslkQdEJgVTKmGTT8uBECMn+EvvsrQqIRlbOyY8
 fIuih51n5ciGZVBuC0RyneAaPwUds1CjtMXQo7sD8Q+yw3VMvDu7o2izxsMkTKe0Bh04VpMVSso
 fZJv2UFsym8dHdIsYQ4xnplpeKOrEJ98bNQiDyNc3gH1+K1GchdraecVeuBDDJ3e8fuFw9t+4E2
 6V4mfQN7m6jZpZvQXLR2QCcAZXq9goUrrlrDjlcr4aXpMtLIO+ddN6lWK1yy1SuhNaZyVvJPF3A
 VZrtwuej7l0htye6qlQ==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=69777af8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MOwG-Syh1sNcuLoOUM4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Yd_ciITRLiN1IhlFYaiJ5lGPyzq70NGK
X-Proofpoint-GUID: Yd_ciITRLiN1IhlFYaiJ5lGPyzq70NGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32733-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,fa2000:email,fd3000:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fa1000:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41F7A899DE
X-Rspamd-Action: no action

On 26-01-13 14:13:32, Konrad Dybcio wrote:
> On 1/13/26 1:33 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> > controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> > PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> > DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  
> > +		usb_mp_hsphy0: phy@fa1000 {
> > +			compatible = "qcom,glymur-m31-eusb2-phy",
> > +				     "qcom,sm8750-m31-eusb2-phy";
> > +
> > +			reg = <0 0x00fa1000 0 0x29c>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> > +			clock-names = "ref";
> > +
> > +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_mp_hsphy1: phy@fa2000  {
> > +			compatible = "qcom,glymur-m31-eusb2-phy",
> > +				     "qcom,sm8750-m31-eusb2-phy";
> > +
> > +			reg = <0 0x00fa2000 0 0x29c>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> > +			clock-names = "ref";
> > +
> > +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> > +
> > +			status = "disabled";
> > +		};
> 
> 
> [...]
> 
> > +		usb1_ss0_hsphy: phy@fd3000 {
> 
> Let's not repeat the mess introduced in hamoa..
> 
> Perhaps let's fall back to usb_0 etc.?

Sure. So then:

USB SS[0-2]              -> usb_[0-2]
USB MP                   -> usb_mp
USB 2.0 (USB20S in docs) -> ?

> 
> [...]
> 
> 
> > +			snps,dis_u2_susphy_quirk;
> > +			snps,dis_enblslpm_quirk;
> > +			snps,dis_u3_susphy_quirk;
> > +			snps,usb2-lpm-disable;
> 
> Other SoCs have a list that's much longer, please consult Wesley if
> this list is enough

Will do.

