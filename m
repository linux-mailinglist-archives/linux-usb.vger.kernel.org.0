Return-Path: <linux-usb+bounces-32532-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JOSEmOEcGktYAAAu9opvQ
	(envelope-from <linux-usb+bounces-32532-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:46:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D553010
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C881766AF16
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 12:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9113F23B0;
	Tue, 20 Jan 2026 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIR4hLwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEvYd4my"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9038B7AA
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912555; cv=none; b=NMPQninj/Ck6FO03sBhDMmujt5KZIz9Mir+bjCzMIXv2FlSTbi3vOavF5QqZ7IjDiR7eP6hAc2urWTr/Ivw+jWY/1yBrUGiz/qY2vPZSeKGlzND9/7p12eQHXtYGBgOMzmKG1+vWMHr8P0jcCCup8HCDfPcb5D/I7ENLKp46m6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912555; c=relaxed/simple;
	bh=t73NbYyAq1PBG8U3RsIiMkQznS9BO3iUCCyxXhi5dJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ejz2t254S0PuvdJQmNQ70iKimV/EVdAAY14Xa0ewMY/2DX0KXzQyX5n7KfcJQ2BzCHUiU2BCA+OmvHZAmUbyDoTo6njeb2CnIczQlntUQkcKoRgP1wKXZ/9wDVeY6LnPjrTNCDrfv5GK1TvDpqmtMPWOwtnS7Q/p2X7by+l+SEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIR4hLwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEvYd4my; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6j1M73155027
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFH+9mnCwRV+iOiubdBa5gTL
	l6RuPaR1Ug87h0+btIk=; b=cIR4hLwXyF3Aqmel6aXF3rjuc3RmMt5WM6ClHTFZ
	UHM0O9RKulVwzoE0Sa5v5x1+t5FZL/d2mif4ONyuRAKedKaKnnGfMnh4vRj/M97x
	Q1v/5Jkw4am+Pp0EJvDkubSFer9vkuZ7gB6PSp6W8T5BOrYAcb2PLiPqL6tiRi0i
	oaS0Iu+LZkck7msHO7DZfpo7n+dkCEWXUBXT3pkKRpK6SS5jxhrcgfa7mF8PCcu5
	fUF4R4LONrlybpPtrmJaxRH9HQb9bVSMBvSU6x7UGs59h6ugirJM04JZ8Vdws/js
	7NIhEWUfN56kOScHa7hR+J/lDOwyTQbxy2G0If40xDWjyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q511xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:35:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so72423585a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768912552; x=1769517352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFH+9mnCwRV+iOiubdBa5gTLl6RuPaR1Ug87h0+btIk=;
        b=dEvYd4myq0QIK4zSJVXoW7ECJbcvqv/Hu7LWDoLzydiq5lBIr56zlq09b84LixJDUT
         Ym/J38r/mnom7514MeD1VcjLruJtVvWtbH3SEsok4qNY04D2bFaGUymQ6BfvdsnELLXW
         jkE4NwW24AvbHHBL4xMGBr9RqizBCTM0i/unflNZ3Z36pUk+BRdpe5WVOKNDo9KA7s/t
         Uar8QP7NGePPIyDzb7mah0H3E40OU4+NpLZQI6naCZ5tqnJbHiUalCGXycPATfL6cMOZ
         9mKmGp/TGtFktu9SukYbxcwA4kZn8wisw7DwiuSNbj1SSweRd3iUgq/oD9cblcBbhOPb
         UQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912552; x=1769517352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFH+9mnCwRV+iOiubdBa5gTLl6RuPaR1Ug87h0+btIk=;
        b=E8lgMR5fHzFnDhzXexb2cEPhZu1gjhUsILh/eNL6RA5UF9qqxhqr/C040o+LVxbY5g
         3uzJUWECr9BzXmtUCAy3vOx14LFxx8Yai62lhdoj9Vp+JSGGVUFLmQfAQZXDxJGXWcno
         yPNR8yhYDdXMMlhxBTAcWc7bvZ4A6GgAPYN0YEB7HKLWU8Uk04oGAxWK09sZh5aWdKn0
         dUMr6x0Q9q13fK3aLkwDux9U2bqZQjNUkplq2T9ZKei1XKH4QeFT6vG0mb+xbwOA3Fix
         wuW66C5iKMc5+APBt7DRFexJQvagXI5UAau2XeBo82whte0GbjlS5v8F8l4vUqvhnGwu
         hBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4cZOyaIyjkJlBnVIUzgYYdXBQ6Os49thwXidKiVtlySrWxgGtMPOcqDhnKfNDJJOuoo0DVyzyDtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4ruwDHlo26m6E32CrmGjNAx49whH2ziuVBLBMWVJAD9x6beP
	1d7ghhlH500VlUi8zSIhsuHS5ESwim6P9/udmdcFhlBDU7dAG6YhUO1pnLqkK6orGiA7G1wxsd+
	Rf+6xb1Fid7NjIwUJY1r8UBj9KmRAXHHmG/ovgJKrVU8qBrg+k2ean8bFBERTXLk=
X-Gm-Gg: AY/fxX6pmoAnEyHoLTWtj0iYx0Br88zMIXYYom1cL6j4Hl35qGJFkas1So7Gk0Mdn5z
	9UAge7aOSa9QTnSpDiYOChOW6IZYzBghUnGOrugkXC5WRAe4Fjsy0cWHX/hCJvooseqfVOFv+ES
	3hlUMSQwhMz+2gMk3QAEYF20633cq4+3hrSi2wInpc9nxBI4o4HyKjE+S6ESgvPdQecCYOiCMDm
	ArY6nC7Iom9L9VyGm6IIkr6Be/jpfTMpC0zCbXzXjgXgWaHyJlHmH+rr03pN0lGCkdiml/XCZZN
	CArGFJTD3tvqNSYZ06HOk5/oSytrozY8jm42pqUZH8bmpXQeb3PFOipJ7ejmR3OvdTtgmnNhf09
	nTrj0ydahvpE0r/8ZJMVOHCpU
X-Received: by 2002:a05:620a:17a7:b0:8c6:a82e:16ba with SMTP id af79cd13be357-8c6cce505b8mr166698185a.84.1768912551514;
        Tue, 20 Jan 2026 04:35:51 -0800 (PST)
X-Received: by 2002:a05:620a:17a7:b0:8c6:a82e:16ba with SMTP id af79cd13be357-8c6cce505b8mr166695785a.84.1768912550891;
        Tue, 20 Jan 2026 04:35:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879516900csm1484553966b.23.2026.01.20.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:35:50 -0800 (PST)
Date: Tue, 20 Jan 2026 14:35:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <iwdb6x4rh25bs3o6yvqhr2yoylsng6mlno2giklltb25oenpjt@dpxdkktlnytp>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
 <1299cddb-8205-47bc-89c4-98b4ddcd688c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1299cddb-8205-47bc-89c4-98b4ddcd688c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwNCBTYWx0ZWRfXwqvWSItdZxd9
 0i8Cy8gWJjv0f0c9NMXQCix1T9jysaUWYPHWm1rD7hp0Hc0f0XtXxxi9AR9p3iwNrvzbQy1GLq8
 nHOYYRo9LzjviSZ8mAr0wCVYf/nJvdXu0yeNyEMaTQ8iCcBDJa9m4fmhP20PZ8efu9eeIW4Ni1+
 ANhopPttAaOKw0MxPg2vZnW6Y0l1tU3mbd+CcIMjYytTxk7a63g/tE8CtLbyvhNcGMgPoZUwoJl
 dCDih6n/MOGepTyMfj8UVnZy/+sJp8Swe7+4fTgxer1i4JIdH3H03aGfS1guM/xfaIVJ639O8oz
 OH/W92vT/50WXoNtSo/frOgLjOKo6o10/QmfDDPwXrqRwM5orqv1M2K64d+b6/8Vz2dXaawN0ar
 xwda2EhoihHWsqgth6LwFuKeIisL6QUAxnCqqkmfrAQk4FE8PO4+sHXzqUxPukaU6iBxLCDlEb2
 lsZk1CnB2kragYFtqoA==
X-Proofpoint-GUID: xxWXC1b6OjIQAa49I5ovvSz57XEsb9p6
X-Proofpoint-ORIG-GUID: xxWXC1b6OjIQAa49I5ovvSz57XEsb9p6
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696f76a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tGu0c17UIxBQEtl-8TEA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200104
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32532-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF3D553010
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-01-20 17:37:48, Pankaj Patil wrote:
> On 1/13/2026 6:03 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> > one USB Type-A, and a fingerprint reader connected over USB. Each of these
> > 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> > M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> > via one of the M31 eUSB2 PHYs and one combo PHY. The fingerprint reader
> > is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> > eUSB2 to USB 2.0 repeaters, which are either part of SMB2360 PMICs or
> > dedicated NXP PTN3222.
> > 
> > So enable all needed controllers, PHYs and repeaters, while describing
> > their supplies. Also describe the PMIC glink graph for Type-C connectors.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 283 ++++++++++++++++++++++++++++++++
> >  1 file changed, 283 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index 7c168e813f1e..3188bfa27bea 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -858,3 +1015,129 @@ &pcie6_port0 {
> >  	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> >  };
> > +
> > +&usb1_ss0_qmpphy {
> > +	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
> > +	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
> > +	refgen-supply = <&vreg_l2f_e0_0p82>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&usb1_ss0_qmpphy_out {
> > +	remote-endpoint = <&pmic_glink_ss_in>;
> > +};
> > +
> > +&usb1_ss0_dwc3_hs {
> > +	remote-endpoint = <&pmic_glink_hs_in>;
> > +};
> > +
> > +&usb1_ss0 {
> > +	status = "okay";
> > +};
> > +
> > +&usb1_ss1_qmpphy_out {
> > +	remote-endpoint = <&pmic_glink_ss_in1>;
> > +};
> > +
> > +&usb1_ss1_dwc3_hs {
> > +	remote-endpoint = <&pmic_glink_hs_in1>;
> > +};
> > +
> > +&usb1_ss1_hsphy {
> > +	vdd-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> > +
> 
> Board clocks are missing from this and &usb1_ss0_hsphy node

Board clocks? This PHYs are on SoC. Usually they do not have
dedicated clocks comming from off-chip. Am I missing something
w.r.t. this specific SoC ?

