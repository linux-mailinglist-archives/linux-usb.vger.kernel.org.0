Return-Path: <linux-usb+bounces-32742-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGW4FBCrd2kZkAEAu9opvQ
	(envelope-from <linux-usb+bounces-32742-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 18:57:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6B8BD3E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 18:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D190A305DEDB
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 17:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D289A34D3BB;
	Mon, 26 Jan 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsgdZwIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuNYv8sr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F2330B07
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449965; cv=none; b=r4UMmebs2Uu4qjn/0cdd86bvrPdvGnjtcLM90zGCJiE6YGjzQBwq0WrA6i9K68mC3BvYlLGYrEgy/U11zsWMU5PdqzXFt5Qm0yWRZYz0SHbuTZPF76UDXSYxSqb/oyv9bt6LBoBvSgCkvcJPo+IkbELaYk33kFTx1JSA1Dxwi9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449965; c=relaxed/simple;
	bh=oxytmQ7Q/NVn9hPzBT6wYXD605qGpFPY9t3RwpUQZ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p01jIW0FHbDwncEkvDwmyhcxjqJHxJwgGfp4M8mxveByxUDHm0ytNB6FiT/+rosITa4yF6yaAWz2osSIyg8a0Cr4zH1GkW6D4r6c/4om3LdCUStPCm2y05IU0QnhftULmFmJWjJKnylNV+7pFoIIQtWkkT//eF5iIxBt/SJsC1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsgdZwIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuNYv8sr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QEtOme1019394
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 17:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/nzY/LSg89jdVeFBfEiFDWma
	1Qd3u+6EyWxjhj6At4U=; b=SsgdZwIR/IGf1mwKNZ67D0Wb2zAmcStLEduCjPNW
	IFMoFEew6pskVp0ifRT8VTd/96aWhZMkfvCa2yFzrSJp4xBVs7+0ad5/HoablWw7
	/MD7QE6ffdo5O0b6hdEe/R5YRZG6QWAf+eHjKaO8O+rfLEA9c4vPUrOgixAtPGbC
	VpdnpSoHdBSAlwgvQ5B2AZepUi8+EeIWSBgDPhkOZBPqhMkW61M9ikAnUKYYJcJU
	Vls8HUDQnftIJ7DL4GrF2kIsDVAvJ5rjn9p+Q20KUJoSqkUjTz05tsARps79BNDl
	rAUTd1ilqUHCcUm+Uuh0lqRtHUDAVRJxWILpSkuVrBtA7w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2681wtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 17:52:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ec8781f5caso13550061137.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769449962; x=1770054762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/nzY/LSg89jdVeFBfEiFDWma1Qd3u+6EyWxjhj6At4U=;
        b=EuNYv8srapBS6DqKsyxbZVhNTqT1VJ6ylvTgzWYxBq1rrq/4XizaPyFEalgUSSn6z+
         u3aN2zZnz4uQ1mzYw/ntXRfQRi87x7j3x5UNzkwcGMo/2WGH+68nK0c96CJ/JhmgVYNV
         1Snf9a7DH9ayEngPsqtonCmmRAgDRJcgxf6/YFvjSopWx0bsTuKQVS/TBLzPiAsVF8Cc
         LLA5isIejZS+AqD76ZOxvhMoCzBaV2BesUIY0DFu+m367Do+BuqHM05l4AaL2rsziS1b
         E4hwu/Ee1ccEo+v6ln8J/cT83UwtxY3WcxTbNKfeKPBNy3rM1LDNyCnQhavgOIm9wakr
         1E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449962; x=1770054762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nzY/LSg89jdVeFBfEiFDWma1Qd3u+6EyWxjhj6At4U=;
        b=KEhXIK63RpQUziVE00YoPxdOiqh+x/sA3q1bBfHm7JWBff2L78XvFrFhnotvVy/gyD
         2hNceaREuN3z2x8Blka08+Riul/Qn+ooi7lqIS09G8qOqJjHvrHK8mu3DGekN/2d1gca
         cvopCiQZPk3yXHEaBZPO/pvVs7GNQwxqMpBDShBBhwhh9itpBq+Xclasq5d4v+ymHHWB
         7wULDrhGrpMb2B5Z4LbvkzFdxApnFlesaK+2CSx3G9aSc9ZBtSjCd/j1WUFm6dk9sgiZ
         igRDCCjLHNheeHdCX5XEZblZrBPMv7XUq9pMwtBD+c2fEbWDc2SqmnG39p+2PkLzkVkG
         IgSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9TS6w16LNL3128Y35KtAvY6mthNtbM6MrR1PYKz925zGX3ABQSMHfAjHzQwcKeJP2W/Znmt6/Omg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywsbagJQv56ocCpSc6sWyKn0/iqxAy1jf6/LyzQUoS1G48z/xJ
	Jnc1YKLd09WHRuEn5lSu9dINYK9XROLggP/dnoSMfXQBA91PPE/QeNR9IrT2/2ULxmKciEyucVP
	8XZATz5cT+fERL78RUAtAaRfLEIjORV9X38nEPGOkwo5l7VX7RUIZVQS0Vl8Bvv4=
X-Gm-Gg: AZuq6aKMhmSWrTJEaW2VtN7lU8ecW8GVegPhY7ccN74cRuYzd3iOPJ4X4NCllG0UTxd
	yc1FG4GpUc4A0nUdq9ttRMG5NDLkVw5lw9Gb9R3A5OaPe7fU353ipIqT0giuvom5EqsidGjtrC0
	4snUvWwiz2XFk7GU/6Bm5mSkEsgyLSIeqoLA/inZYAxnsNb5CrauxS9DCKCrInEoVLvDndrylB+
	vIomTB54osGTXrnJTPWxxgfTlL4HI4GYCJev5sVMqAbyb1NLjOV20OLZoUI3/fATF/2VLDtwqLa
	T1QFR2bd524M7k/P2rHIZHrynVkxuerJIXd51VFVg7tzRIsg4NTVFeB080HXz4vXgyNdXhQkCTu
	qprmoJadQ5dCsG5hG+Bpb3nzcGxBWHWb0rOnsAAotXmr2G7YtfNCQpV4BgA037+ds5pgxIyx6l5
	OGqcijexrWxLW6aUjUZ4CgUJM=
X-Received: by 2002:a05:6102:3f45:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5f5762c4b9dmr1743428137.2.1769449962310;
        Mon, 26 Jan 2026 09:52:42 -0800 (PST)
X-Received: by 2002:a05:6102:3f45:b0:5f5:4d37:8118 with SMTP id ada2fe7eead31-5f5762c4b9dmr1743400137.2.1769449961682;
        Mon, 26 Jan 2026 09:52:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4926111sm2824442e87.81.2026.01.26.09.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:52:40 -0800 (PST)
Date: Mon, 26 Jan 2026 19:52:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <rqcvkrrfqil45wctqtjfmvublek3d33wkjvhogp4eymnwskzxj@nzu42jwjbmrw>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
 <4wyliidx7f2otaudyfhevemnigd2zpietbhsovhna2cvftbd2o@x22jpa6ffjyy>
 <kupuqmjjuds2aznpl3oicbl2ererfa6i4br5c45mg2xr7fwyon@f6qoyr34smr4>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kupuqmjjuds2aznpl3oicbl2ererfa6i4br5c45mg2xr7fwyon@f6qoyr34smr4>
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6977a9eb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tGu0c17UIxBQEtl-8TEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE1MiBTYWx0ZWRfX0BOxsIuG0phJ
 pH7r4U+jyUToL+QHeI2x8NTXtQPqJ9Wbd+Grshr7U/YJxyGjditWeIJ/f3WkgGqYvo/kw5v0DI2
 4rR1U6Gr+8QXh+fj2HFt5SwaTfxkmpVWEyfJeJXM2IORqPpMjCXvH2gCtD4OYFcNCgAQuCbJQ0J
 n0+9ITfw9e8wO5cPuAWtd5VGCXbMa1nThnII5adyPPZ44VedVjp9chAFKPTY2DDB6nSXF4XfUZD
 ITNwoBhKjO5ZwMKVlv6ST4ywDcR9F414SnDzbmhIl0I3fwRv0y4uXAoJpgCWIdM0Wj3XGKvksUm
 7YOrRAjj3CktrG/yt763ypnP2nnR/8F4M84zSPVXZ11KRbOGsdK22Mo//yptkkzwHy2jq6vsRqb
 +7s3beeJFkVkB/DA4YmBHOROWF0wA4GNCiEXbo90vIOJcAkka8VjgLTBjsZErl75/u/qQ8QBcfr
 G9lz6UMCccFsCHEwuVw==
X-Proofpoint-ORIG-GUID: naJV0QzlySMUq2QcDT-hN-vtN8F3PyLX
X-Proofpoint-GUID: naJV0QzlySMUq2QcDT-hN-vtN8F3PyLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32742-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEE6B8BD3E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:24:24PM +0200, Abel Vesa wrote:
> On 26-01-13 20:02:25, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 02:33:06PM +0200, Abel Vesa wrote:
> > > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > 
> > > The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> > > one USB Type-A, and a fingerprint reader connected over USB. Each of these
> > > 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> > > M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> > > via one of the M31 eUSB2 PHYs and one combo PHY. The fingerprint reader
> > > is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> > > eUSB2 to USB 2.0 repeaters, which are either part of SMB2360 PMICs or
> > > dedicated NXP PTN3222.
> > > 
> > > So enable all needed controllers, PHYs and repeaters, while describing
> > > their supplies. Also describe the PMIC glink graph for Type-C connectors.
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 283 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 283 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > index 7c168e813f1e..3188bfa27bea 100644
> > > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > @@ -56,6 +56,97 @@ key-volume-up {
> > >  		};
> > >  	};
> > >  
> > > +	pmic-glink {
> > > +		compatible = "qcom,glymur-pmic-glink";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > 
> > No orientation-gpios?
> 
> Nope. Glymur does UCSI 2.x, so orientation comes via UCSI payload.

But is there a GPIO or not?

> 
> > 
> > > +
> > > @@ -858,3 +1015,129 @@ &pcie6_port0 {
> > >  	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> > >  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> > >  };
> > > +
> > > +&usb1_ss0_qmpphy {
> > > +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> > > +	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
> > > +	refgen-supply = <&vreg_l2f_e0_0p82>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb1_ss0_qmpphy_out {
> > > +	remote-endpoint = <&pmic_glink_ss_in>;
> > > +};
> > > +
> > > +&usb1_ss0_dwc3_hs {
> > > +	remote-endpoint = <&pmic_glink_hs_in>;
> > > +};
> > 
> > This is obviously not sorted. Please sort the nodes.
> 
> Will do.

-- 
With best wishes
Dmitry

