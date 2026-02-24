Return-Path: <linux-usb+bounces-33647-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJRoAeWRnWlKQgQAu9opvQ
	(envelope-from <linux-usb+bounces-33647-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:56:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0EB186A7C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 12:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C76308861B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278E63803EF;
	Tue, 24 Feb 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaB3VGEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfV37hVE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329F3803F0
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933927; cv=none; b=m5rMtx8S/AqUm4ts5UT4BSHQ6H8R4ZST0G8XUV63kgH/y5Ri96Ce22TBjn8AcExkkWWFDcQ3e9ZOrm55j01ki/rzWcL4Xbc/Eh49BObnGdrcJJC4LRjXUXpLMo0/RFxiSl2HeqoCEryazuezD0TU5lVo9TbCEtUhBtuyQSqrdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933927; c=relaxed/simple;
	bh=t2PDruC7elzjUKHs6mTF0Zfkfl27z6kKCKjiRIRKPBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArWOHbXj3DsTTUB0bJdf6MPot1/wZAv4N8bd1vVZFK4PUu0XhPQ0m0A+3UVtd7FhlUophU9DM3AZwKTAJ9pUsOqqg1OY9+4W1259x3+l6TlBNsLlWjyvcwp6zS7wnLbOsS9O7X0bXItWkpqZtBVD4oQ962hpqgjAMcquE54F+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaB3VGEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfV37hVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFYil2220905
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 11:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yb0i4w564/iHf2Ws4pYqL/Fu
	4x9UFMFGj2EhrHPEPrs=; b=PaB3VGEIylLDOX6R0FCDonrWjutfawvHujCWnurh
	znLe+QoOrl3EXpvQsqN8AEzHBACSWI+csabNFbJfOqexHvQBOgVjHw6xZ9++FycP
	C2qEiO+jQZQ5/SkMIjtiQl8qr0xG0O+jcd2DLIE0D6iktWI3UIsydZ2lw2eGb/z3
	SMYcFE7Vlv/MxyQYT5rg8KP0uGc56LhecYjtzlBfs1dn3Z61WFGYzjQ5WbkvoyDE
	3wW+2wq3G/uunuWxmN8zcxcfqa+UblpovQ33l9A7GQgSemSy0oEDJraQRkofDQu7
	x6quqZsZ6ZMDM48HtQ+pCcYPb1AIcTAanV0Pv7ZNrBQ+CA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e39akb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 11:52:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so4912202585a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771933925; x=1772538725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb0i4w564/iHf2Ws4pYqL/Fu4x9UFMFGj2EhrHPEPrs=;
        b=QfV37hVE4wS6ZLvTzfg+GnOnclpzOADA81vbi5wF3aC9aet7d3R+abuvpiq3zr68wr
         5LSt7ZIuP+KgzZrw56UglT8wPXx6teN7xvdJWIfTAieNC/pUKCSaF9gsL2csl+BzlL1h
         Dy7atlLs+Zp/n6MqlHtuKEaHcs7CdkZsYOHitBB+HuSBQOOS1vArYBlClVNeLJ8z9E9n
         +Bu1Wexkp4hILhum4FKIgIBUIp/lwui/NrSAfPvrvNkYnYlPqYRxL68q5aECWPNXlLrd
         l6cvHb3Gkh4181alHXuzBSwMEauH00G9BONIwrdUAr9gIYbvUmABXyC7NsXvAzrxjOEq
         LVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933925; x=1772538725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yb0i4w564/iHf2Ws4pYqL/Fu4x9UFMFGj2EhrHPEPrs=;
        b=UEwbbYwt6mIRHsAZkGk5PQuSb+OjaxBi2VDHvnLDtAOl9xpvGnZwC7iRgp8GkqHH15
         b2ipc0od+r0ZsWuHE9ZKGJVYMrsrR7Fx75TB8na7O3cxNBAEUrygv5NUl1jgQ7fZn7EK
         DaAkeCahspuZHViFf/DdAcJqfKJqngp/Q1kxKLIKvS27XDGwRWvhEn4pRE59zQIUE+J5
         WLe4eLGHqYlWi2G1+tP55BAqWBjMvplozvmXKH8e+13YV/mmKyE1qDEHlqD++yi6JR3q
         IriKkvrFJY4G5WqLD4mIuDkmSOBqnCBQRwCIm1qnWNCX9ArTPMm+P4WNKpGodF/wAn5A
         Fs2g==
X-Forwarded-Encrypted: i=1; AJvYcCV3362H/oTNERwf1KPM/r9/GsxdSTA92240+rVO/X4vd3hGncPDpD8aCduzzJK/zP43sSJVpe+3g3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwazONNQhrYsvUYe7E9BsnWC81/Gf6jKXhlFCuC1tYsyYfdGbWp
	E3qVKvTN7rtRcKVXlIaAucxS4AT0w3QAU4GSl/7UA0PJh+fYBNqHYP2YJlJd/WkNIENO1GOGXJ/
	8DKKn7n4B9GhjcXxmn64QjebmGytsI7Kn867HvvE7JwYn4PFY/TjtTOHgnQVaav8=
X-Gm-Gg: AZuq6aKor1j0ufdL0Z8NDFVWlBvHG+EP39nE+0trN/km3R7hWZU1GGGEXk+l/ewH8dP
	XvBae9DdX7vaMWRGVzBDN7oC1RMhOf2AcpTi89O+gNRk3pBzLmswzTI/Wx7dMgj/ykaUzNgH5in
	Mb+J0caTxP6hSh6vEfUJzbLJO1eS+uYY5OFiMav5u13OUAcWbCXIcknqbxwduG8yv3twa1p4mS1
	vX+xUN/xD0Z2/ouleC3pEE8/Eci/DbAmSSrjOfj2nwL6tWXD03g9aMKREQIPZ/KAkjkcHdHkNVE
	ccdEpWDuKZ0akolrDD+V1RWC18dZKDAa4GvN/hlahv8dNk75ZtAN1czw+pF5RJN2EtGNVDcIFSg
	ioY3moGVi2EKV05zumJU7n6i9fRcEaT6Mnne0
X-Received: by 2002:a05:620a:f04:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb8ca769c1mr1701824785a.57.1771933924867;
        Tue, 24 Feb 2026 03:52:04 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb8ca769c1mr1701820085a.57.1771933924255;
        Tue, 24 Feb 2026 03:52:04 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm28004908f8f.22.2026.02.24.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:52:03 -0800 (PST)
Date: Tue, 24 Feb 2026 13:52:02 +0200
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
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH RFT v2 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Message-ID: <aa3gn6iubvv6n44irrssxxywhvilvywrxaoigmgw26vdjmujmz@asnn7cwrn62p>
References: <20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com>
 <20260223-dts-qcom-glymur-add-usb-support-v2-1-f4e0f38db21d@oss.qualcomm.com>
 <8a2db0f2-c9f5-474f-afcc-53248da19297@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2db0f2-c9f5-474f-afcc-53248da19297@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d90e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ktuAATloqCpIEK87szYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nYlfI3eNFQ1kArbHV6R_pT1ZDuFAgtlt
X-Proofpoint-ORIG-GUID: nYlfI3eNFQ1kArbHV6R_pT1ZDuFAgtlt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5NSBTYWx0ZWRfX3t1EOTRyZwQe
 ma679O1RVtTWwp36RH8tXaroB68V18/6gPLK/q94kd9jIyi0zybxhIBixyr2kL9FbV6vp/HsrVZ
 BefvfzT5QIIsZu+3jLuubJEqGLCaqgydicsnWjkdmIiL6JMXE3WFZxn8ADIgL7UNiZ2Fc40XkqA
 0BefRnTtkJ+QpgF+jlucVcMoP2ql0R2w5FRAVmWMSfWAx+32MNabDmEQF3kOhV47EQlTRA19ePC
 ftPiCNE54hHIG7DGOSnrZ6O/Ac6jr1d5zUsmTTzqYBT9KOR0rROBmbLjLxS915HuB8RVMexBmXB
 EGvkHJsyAFVce9AnN2KkvOXsQT725fbzqZZI91SUVaDOHFNzjrqVZHs6sCtCTCJnWQnDFXAGPUR
 EwuZK697eU70rFEyQAK0S4i73whPq6MWSwgtf03gKbvEz1iGShL0VOuurHihzHG4fxiF7V8ak+B
 BmGuXTUOp7Rk/FLJDqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240095
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
	TAGGED_FROM(0.00)[bounces-33647-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F0EB186A7C
X-Rspamd-Action: no action

On 26-02-24 12:46:43, Konrad Dybcio wrote:
> On 2/23/26 4:37 PM, Abel Vesa wrote:
> > Some of the controllers found of these platforms can be tied up to a
> > single high-speed PHY, basically rendering them as USB 2.0 controllers.
> > So in this case, the interrupt to the Synopsys DesignWare Core is coming
> > from the high-speed PHY, so allow the interrupt to reflect that.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 7d784a648b7d..f879e2e104c4 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -500,7 +500,7 @@ allOf:
> >              - const: pwr_event
> >              - const: dp_hs_phy_irq
> >              - const: dm_hs_phy_irq
> > -            - const: ss_phy_irq
> > +            - enum: [hs_phy_irq, ss_phy_irq]
> 
> Since you're tracking this change, after it lands, could you please fix up hamoa
> (SPI 243) and milos (AFAICT SPI 349) too?

Sure thing.

