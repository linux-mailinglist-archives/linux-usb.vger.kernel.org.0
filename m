Return-Path: <linux-usb+bounces-33777-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAjzMVFloWkCsgQAu9opvQ
	(envelope-from <linux-usb+bounces-33777-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 10:35:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713B1B568F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 10:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0EF2305C8D1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 09:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5313ACF13;
	Fri, 27 Feb 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB99tzmi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkKV0Rse"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD573939D1
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184895; cv=none; b=UyC2BVvq0elnvcEetDYPRi054/fCBumtvatMC+TG9SBVPp4QXClkhTJmqgN0XQM74MKEdwXJgGlxWTzPcyfgHjyxIbj+ElZIYA7wtIjbRWHzJDQcd8T2J7HkVN5EnaT0ud0cGu39XbCDv0rgOETGEu2M21UIwQHHpuZEEHMwtp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184895; c=relaxed/simple;
	bh=h7yhnVHgPNwIjcIUIO6Hvv4cSEJBOU2d+dRlhSV6N3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3vae9Di71/NBAeWvSGhbpfPnGkJ2M3dtE/uVt7Csqr20mmpA7ImwpnX+b9WFwofW4dmm0bEIo6URTbAd3GsVvWLoSVzUovtEElVoy4Pta6XCdd55LnyGra61I/P2AW/DLunl+Ft8uGAWxCGDGjEJL4scToK93Z3JNNMCgVX/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB99tzmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkKV0Rse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fVUr2309061
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 09:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UIcDBr2wve7pKgjAxBAKzoDu
	LV8DKggSrjaVxuAmsK0=; b=nB99tzmi7eYpzGQ2WRHM8MBNGBUCmOcgSKnhch5A
	Cf1Oz7b7oOR0EG8fqdOoq25UoaWGkpXior2+xVHfjLlJqEE564HgbgrU3aMDMwYU
	GFF3CrFZ7gym9zwizcCSq+5KHOvU8zxYBbPC9gme/L9TYz/jO4S+L+1vqUzVMSsJ
	K0c3NWoryVMeAzYKNJCk8d6d76IU8wL8jh3jwGJgC1xn0DWIe14vrW+0OwtuoPdq
	xCnQPxDkTD8WweLrjoAxJYiUeoP1Yw9mS7DpZARW9x4aHLz2fjo6nbRexUTj7saE
	nEyBBHL5+BMcA4/+lLconCVODaBOtdiYiff7k0JHy7lCDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q0bh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 09:34:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4e37a796so1304563785a.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 01:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772184891; x=1772789691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIcDBr2wve7pKgjAxBAKzoDuLV8DKggSrjaVxuAmsK0=;
        b=OkKV0RsezzTT4kf+Np/9EbO971TcrXl7SUg9Fu8LiprMWJTZJU+pIQ1Et63w2aQBkX
         DpiIV/0pfLO9+oZsnjbdDAznq5x9AFBrFEaRs1OeAkg7ahPpk32yzfG9bp4qMYtkBPxM
         0vXbDxC47AJh+tzxhp5HMxX7vGB3ds5i1E0BisDCyhLVA5rlnY4lqQb95EG/k1mc4QRR
         bqkUtUSlPtTFl1rTjVed6sC0ZUigjU/emhRSPX30ssZVPWw+XSF4FUPJK0ZL6AGv6p/4
         mKZmCqjfIq5s/KyecZItq4YRa8R6+qGuZGSYHZLXMVJIUQHYM80X7s0oXtde0OA0+djV
         5jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184891; x=1772789691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIcDBr2wve7pKgjAxBAKzoDuLV8DKggSrjaVxuAmsK0=;
        b=SilR1Nhr2MGPgIqRo73shG3ImvNcdjjqI9Bs/aZhKDypv7EYV7hrdPscU4i/PwIQVW
         XnFmF17aLrJyHnRdXxJcpIilVAvafHtkOkx1ZMl0wiGXtdHPvyq3jAAAs+TmGak7boTS
         podfTtZgQGcsrccE8vp31C6eW9Y8fVWRhBPuyO5vO4hCAYzGmRNyC1NXY3utOjW2mkph
         88FQnx1XMNERlJP0Y7pC7SIbj3PtPkKtm852A7PBJ5QuNj/VF11SPiWlXYj2clvclsII
         X3DkIdHyTdp95LWWfOYqJmx5Vukn9xxRqxC3MYS2nxUpSBc9Vw/I3gKrdBsB9GJSWbKx
         yuJg==
X-Forwarded-Encrypted: i=1; AJvYcCVBfpLLCCpaMiyz7Plr0WDTTOBg7mAO2s4P6uzJZqu1HHYdqQ6amoPi/9XrEcrhLbZf5IkcD9tP9bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCvRN3Q1vjtjuTqcFyeIKZtFjOG7eqfF6JYRwcbOSH5AL48bN
	uXZdofY9sFc/yT+kRUK4gbjXpagPzu7TYxWsfe1LPzkwYN19fQzRpAfNN+PEK/4yXle0XJw2v+Z
	vqbmxQnmA8T5CR8XL6sTt+hjSJQc+vsjupp5mdjfAP3bQf3OcpsJHGDxQz1DHyxs=
X-Gm-Gg: ATEYQzzhFVPUZJB47ZTl1R/hu6XBooFxs7m6TMYFsP+IOBxKY00gFC6SZtpNrb7+9lx
	0xTjp1aK9LwCkPF8c+qPbfdxA9CaLpIAcGamFRPklWZ0zAoMDSOJkg4zI0kfTyW924RenvAH4Ee
	aXtA7GPOD9DTPmaeX3fmjG8sl9yUUkcwZaNkawheptNpKUcrzdIIN0X1DzcIz39bVFe+Nczfcco
	KITZsvCFJlToHIxOxhq4ENCdSeLPoUJBTGOCY0IdpX95D9b7am10GeczDJcaloYSRoM8/NdM2oJ
	aeHB+eJErTsTx0F5ZLj0xQJ+w4z9BNwSXVks3GW0dHu0Z6YeWXUqE2z3dgETTOkWkMKC8t2pjpo
	b2YuckAzqzXcVwhC4RzxvQdexd3Xi+U2naWvP
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr248699485a.77.1772184891356;
        Fri, 27 Feb 2026 01:34:51 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:8cb:bae9:9f46 with SMTP id af79cd13be357-8cbc8e2a446mr248696385a.77.1772184890733;
        Fri, 27 Feb 2026 01:34:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70f8casm9909167f8f.14.2026.02.27.01.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:34:50 -0800 (PST)
Date: Fri, 27 Feb 2026 11:34:48 +0200
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
Subject: Re: [PATCH RFT v2 3/3] arm64: dts: qcom: glymur-crd: Enable USB
 support
Message-ID: <tbzc4v7o22ns5gblcr2nlck5gjzqfsb2a2jna5jimslhselsin@7i2fu5wt6g2g>
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
 <20260223-dts-qcom-glymur-add-usb-support-v2-3-f4e0f38db21d@oss.qualcomm.com>
 <42716b92-9814-4697-83f8-4983de0ce57e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42716b92-9814-4697-83f8-4983de0ce57e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4MiBTYWx0ZWRfX1vl/2P9DSzBe
 13NgOyVYR6v30Ob0UxjTb2SzBBjSCfGgSYiayUdZAk98vjShpr+4rUaSwT7RaIOyXSB3p4uLaqI
 zStIfUD9ws+iyi9opl6qkvbgPsr3DUHyZzJm1hd1JCePnXj0hztbGzmLL222kZcik8EEJYaIGOO
 i5hJixl/xbFCgd2oe4Z6CcEKgXpotWeDnI1HF81YtJS04tYz7BNfSpHv3Gzxtg2UojBHB0t7F3u
 BBv8cy+KwGgOykqZpBnw4fjyFm7CWQ1HHSxnFUVOVKumm5dcnVZeGBIdSUzYhacO71LagMvsm08
 fhIUaqSJSaxYuPhu2M3TXr0m9y823gcZaQ9ikqLejTZgAONTC8YXRCANery3vRv7WdCTs+tIYUY
 qkq14SkcbdflJhmUOsbzC/kNMuB3K7bnJl2qfAUJaNb1hpvbu7crVZ6R/FNwZ3akzGMxLpcF4UM
 Wp1HH6IY8rVByEuZNGw==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1653c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tGu0c17UIxBQEtl-8TEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XSRQpdQMQEBKFjTmnlLbEsyKzMFwS8sc
X-Proofpoint-GUID: XSRQpdQMQEBKFjTmnlLbEsyKzMFwS8sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33777-lists,linux-usb=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,0.0.0.0:server fail,4f:server fail,sea.lore.kernel.org:server fail,oss.qualcomm.com:server fail,0.0.0.43:server fail];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,4f:email,0.0.0.43:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2713B1B568F
X-Rspamd-Action: no action

On 26-02-25 13:16:23, Konrad Dybcio wrote:
> On 2/23/26 4:37 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> > one USB Type-A, and a fingerprint reader connected over USB. Each of these
> > 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> > M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> > via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
> > is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> > eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
> > dedicated NXP PTN3222.
> > 
> > So enable all needed controllers, PHYs and repeaters, while describing
> > their supplies. Also describe the PMIC glink graph for Type-C connectors.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	pmic-glink {
> > +		compatible = "qcom,glymur-pmic-glink";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +
> > +			power-role = "dual";
> 
> there's a newline above here, but not in the corresponding places on
> the nodes of other ports, I think we generally skip the newline here

Will fix.

> 
> [...]
> 
> > +&i2c5 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	ptn3222_0: redriver@43 {
> > +		compatible = "nxp,ptn3222";
> > +		reg = <0x43>;
> > +
> > +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> > +
> > +		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
> > +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
> > +
> > +		#phy-cells = <0>;
> > +	};
> > +
> > +	ptn3222_1: redriver@4f {
> 
> At least on the schematics I have, this one is not present.. but there
> were a lot of variants early on, could you check whether you can 
> communicate with the chip at this address?

Good catch. Only 0x43 and 0x47 exist on the device I have remote access to.

Will drop this one in the next version.

> 
> The rest looks OK

Thanks for reviewing!

