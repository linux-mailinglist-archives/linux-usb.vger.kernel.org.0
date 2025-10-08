Return-Path: <linux-usb+bounces-28999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF89BC33C7
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 05:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D31884001D1
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 03:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5762BD5B2;
	Wed,  8 Oct 2025 03:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUMcassV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7329B8D3
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 03:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759894274; cv=none; b=gPqUb2hmG7fxR82EpqkYyLIPuKEAidsqGpm9pXF4fqPXxkfxNWpxbfuaNcI2Qn9+GumWTp7xNQLyrtlwbDwD/f4Zq9dRrFXAALEOVj69ulCPRh6nphwooNM38nlE/cu1TJlBaoiPu+lcejHC4qxUfPe38AwOt30vCbWsdD7zN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759894274; c=relaxed/simple;
	bh=2a3OrLH67QU4fsm474jcgPYn16EzoMNKGPvctGw+AQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSc0We8/Dn5JRBVLOtzywuJtti4tWMfpdcrppWUyOlfdA4fL1YUzES6hdO0pEzLFXskwyuud4VuWBWZHKFN3Tk5PFVEK67O3m9FddiUgOWKnV8CHWc2zCV9Adx8ogjtymXYscIhR3I+7ea9+q3p4/kQ+fOcIxepANxriBaU/e8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUMcassV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803vr4018594
	for <linux-usb@vger.kernel.org>; Wed, 8 Oct 2025 03:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WWL+oxTaknWPjEJ9W43cr4xK
	NIzu1kCbsEoFeNIlit0=; b=dUMcassVp3gMljPZyMDp1hQaii9A5T70+AeLfRZp
	oHAi5RF9lsSo+5SRAGRXA38s0UjlaJHa6uVD0bYcRV1rPMOqq31eCi0MW8VUMVJr
	5+L81wNwxLn4+ub7dk4O6tEwCAR+W7V270Y6G46xuT/9Sv56LvwwVqVSS5DsgLJr
	Ay+yCN+ZaSh52FUIpvJzmAqQmIqGUVmDNYWAmBi7Dd/OagOepNA7QytESBy2w6mf
	feLaGvZ5sv63G83b7UMlPqUOuT6uPJm0NtP//duPyap3E3eY43habQBBm9a8m/qR
	hR9pjcMcgEKNvixJwt2gYHUpJRR6X19zRQpJv4pe7p6yyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0my50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 03:31:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e574e01ed8so168015501cf.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 20:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894271; x=1760499071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWL+oxTaknWPjEJ9W43cr4xKNIzu1kCbsEoFeNIlit0=;
        b=NqlvMaORtsDbkz3kknATGwuWpgRwDvBMRZnDi3ZPIghHnJWFiqls0VCFM207KYXspu
         S5h2HDn3NwXUL/BjB/3Q2+5qO4QMOdoHOd39Wz3nZkQb1TN0E5pu8dPCRpgpfV1a7io2
         VfGp+rytDP/ZOXKQ7Cf34Yl1wNGkZtPTMd0o6FPCZDEKpRT3G2pimkLpdyWPIs3WpOWm
         SOdtnY/AOS3PrEmPVyYxsX2db8/OlS1aYgUC0Ds+mJNpOIv/iXqr0rpteq1k65BUlo2G
         4G3OKsh9vI6Ctaqd3o53hjMN4lbeD7jzxUib7qrhOOmWhsrQtB4WDyVUyZd99xIc6Exf
         J4sw==
X-Forwarded-Encrypted: i=1; AJvYcCXhuyDaO0TdDiJHclB8C4wHDz2tuqjERGPQkhkcOPWNSGd6c9o4ZtqQssmudnyLRZayXxoFVrL0ueo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ0fLTtxF7spBNLnE4bHar2B0o7IpjIRr9Am7SB7gdUzCZfRSK
	S39wvIuzpYEpjyAtKaQ58Il7F3JXpNosUl4CxGahrmJTLRJneuVq7TtQt0YeD3mJbx3wTPUCVaM
	p6P3Hu7xk7oJkldGLoTEuk8BnsutW+iRGydtInMrbbdoGceRwif/ddy/r9++Qe9Y=
X-Gm-Gg: ASbGncuOxKfaFv3KPk2cuEeNyxmv1vtJhz1m8EiYu+Fs8kd1MqWtt/rxCr0isqDBfnp
	Qkktzxcc5ARJ1RKEgkVExdcaNw1of4pRQzo0r+iCF5ZLH5waFt3i+sIGcdlR1rpkyEo1k9Uwc+c
	pJQmnxaVbXakmBrGnv1MCNSjip5axKeRVaqwYNZU09oOjvgB1eMeSizXxFP3zI04rd/qHn8ZF2t
	mnsmGGi0CfwqAAXrRs9BQgq8TZr9ZSmtA+SHYexiQOHnaLnf4bOI+Xqh6/FkIjeIZ7+nDKodSNV
	yd3gmvFYGa9KwWhPPW+suNJvPrclQml4kuxKLMwP4FgFp8CSbJONUoIidNq+ZABAMHM3T7V2q0a
	mTK4Dm9q0k74rxvsteIGVaQmCFOJrDCLgD+fbeDJp4392+rsk5FEwmW2sQQ==
X-Received: by 2002:ac8:5d05:0:b0:4de:9f9a:b8e1 with SMTP id d75a77b69052e-4e6eacd1632mr28143111cf.18.1759894270935;
        Tue, 07 Oct 2025 20:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpJi9YDeXIx8aKnVS2WDaUwvZAKAbXdQcjcWyTLCETRGIS0rZ8bznBq56g1sVuq6qO6sT9iw==
X-Received: by 2002:ac8:5d05:0:b0:4de:9f9a:b8e1 with SMTP id d75a77b69052e-4e6eacd1632mr28142891cf.18.1759894270521;
        Tue, 07 Oct 2025 20:31:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5906775d5desm979249e87.72.2025.10.07.20.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:31:09 -0700 (PDT)
Date: Wed, 8 Oct 2025 06:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] Introduce Glymur USB support
Message-ID: <llyanh7h7xbojo5n5npglokotkuqagbkqdgcquj6aagu6u7zal@wazru6ihqamp>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
X-Proofpoint-GUID: yeTEowDjR2cfk4RHoQUU0NCrWbQ4JXSP
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5daff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=ukQvhT9bAo9IVCr4j54A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yeTEowDjR2cfk4RHoQUU0NCrWbQ4JXSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX3A1KAN90PTEd
 fLygYr53gv4Rw0+19Z9750ymVZZIh3fD48V+3XAO61kF694t3oQe8ViQyCjoF5klv4OOAcGk88J
 BeduMeXvN9udOufsysQeKNJcVMJL8FB+0YtCKniz3TKYM/q3M1+Yj2kJXxSSMhmPsdJQs9N73a9
 zdzCWpwTh3SxhCSdSm9Q6KpEmSM6ySHaT+D8QkOFVbQt66vcW0S4O8VdOAB9hC+Fh+IHlSwwrAk
 xP6WtOw0u7KlhR1KS8xE1c8WGDlMUrpnm93dcZO/cr8rEYX2xvnNpVfToI6KKj1KrUv9kPrzuVX
 x5pHxS8/UZ7OPznF6v/w00FHN3czr5+f1aggpcUuNsO89yMHMoU6401b+d4KBTFuZcCVDsRYhGU
 cHWmIlUI78TIqwikEEvoM3XifAuX1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On Tue, Oct 07, 2025 at 10:02:11AM +0900, Krzysztof Kozlowski wrote:
> On 07/10/2025 07:19, Wesley Cheng wrote:
> > This series enables the PHY level changes that are required to support
> > the type C based controllers and the multiport controller.  The typeC
> > ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
> > the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
> > it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
> > PHYs for the HSUSB path.
> > 
> > -----
> > Changes in v5:
> > - Moved phy-qcom-qmp-usb43-pcs-v8.h into USB specific QMP driver
> > - Fixed DT bindings for clock properties for QMP combo PHY
> > 
> 
> Where are lore links? Why aren't you using b4?

Using b4 is the best current practice and it is strongly recommended,
but I don't think that it is a requirement for contributing to Linux
kernel.

-- 
With best wishes
Dmitry

