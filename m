Return-Path: <linux-usb+bounces-28665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4BB9D438
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 814523BE84A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB902E6CCB;
	Thu, 25 Sep 2025 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecY1Uw/t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56DD2E610B
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769147; cv=none; b=bnlloHd2ZH5z2uMo73RM6DKw0hTUyFuaWVfiMiTHpF9UEwDExPXtbQgr5FwrFqsGMK/8a3ee8lLwa6xVDbkpS4s0LMitnjcyHEKJd06T3ocDFWR0IOvfcrFzNtb8XdLtCUJhTJMBKkmTz6AITuQxWdeY+ohPbDNbOnmLDxb4K+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769147; c=relaxed/simple;
	bh=rMdx9u4+CPZdlaDXxIrAkulEp2MNorpZN4qQed5m6F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVe8FabSwVfCDhSDzrvJqe2p/kJTP05Rg4PO36aIzxwbh//N1FMDcbQbuQKFQaeCS2VF4ED+T0O9aITETNblSUGq6b90ht+DJbvq/crRJ1Ldqx+8Oeyy/IWITkjcIUJwxduZ0VRDZ0vwt/iQFsJ2W9FHXwEy4sNNyknMVE0IUMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecY1Uw/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0t1O4019945
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YVhIbwN6AspjG/ncbcs2oWej
	SClutNyLdf6oqsabWes=; b=ecY1Uw/tmpiKZ43veGA4miv+hG7rVv5z2SRAJt/F
	EQqTuFKj/yjj2QfelvNwiNA6Xks+kSz4+BaNM+VoqZ3EkPbiUXhkFIo0gdlIR1J6
	hu1rOiFbl1DjPTxo7FLgTdVOlR1WUuk0e1Osl9XL7qwjXSavTlTCYSWn6Dm+UpKY
	vAoAxheZQ7swzYArZYtpvs/bv2ZahmV25s+sMY5SAgbRQU/JvG8RRXmdOn1MD/aW
	nSj70Vg0RRX5k1zQefbDqTigNuTmbqAXJcKetlf6yHxal43YCDyZJIEITb6nJ1PG
	HW13iuaKoCsstPGToliG9G4BikT+U22WU/tLP9BuYK/Xyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyr34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:59:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d905ce4749so9684911cf.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769142; x=1759373942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVhIbwN6AspjG/ncbcs2oWejSClutNyLdf6oqsabWes=;
        b=DzYxDa7UykJDBQA6Vog9uhqMrN+Jn48vcnSy9a8HmY05ZrhTVWfDMGeMFizrQ3LAAJ
         EZWWpCIxeRi0wAhWU8JmDlLs9fsK0UHQgy7pvZUrhaWUo2fzsXjjVaDeYV4Xa9gd3fo1
         ujVreNGKBx3wJy0p39IkLNHMcymMtfSvjGXrFv/0vJYnhb+0RocF4UEzrvvRno148Va0
         g8CI07P8cuT0KgVDJhTKxtneFbFkBGhOncIsuIMiWeFoFubtmglcE+pne3xpvRaaJrqx
         TOl6HxB+oqfe9lqAwC1I5D2mkDwnmVbodnCq9XB3UbeCuP57QqWsIzWIQpXHrQCHUlu+
         JISQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZNBkOvw1Wp+bkYnJpoR2+XLh3yBeHsNGMkXxV2SPC2OAo3evzcEGmn7dfHviyOhUPeuX7OMJS0aA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+zUBhvE6A9cT3rqCQ+j/DzVuAAhxVoY+2I6L4OqDwSVi0jQ1
	jjdLzSV26zFSCAPuSpnbmCmrl6y2GQ3d3Ae/42JsIJ/lfQPew6fGSBVCmOu7/vjq2ATlfsRztkg
	NI3HFXZnRI3tI75tIfM2K02wpr7cJf2WKIVMoMn3FHXXgaBgTTOdrpnn0B+7h6yY=
X-Gm-Gg: ASbGncsinKdx6tYgrsUgEbMGKzwOG3llg2DTzTa1fI9tSoQYTCi1wXKM3F0RB7c9lRt
	eO9pmbNwKi5eSuA/PHlzvDvl7EndYmtnNut//W3Tun9VHfSLpAwi/Xp1LsFKIFROostuWOddn51
	Ft8gE6qpN2byz9YaPRBUJklyLZ+UgrMOunJCZ6+K5UHAEmO1QfVIB1zagk96bN3BhZuixrYNMMm
	PoSeUygmhDYgk5w1TRtjIR+Qm0fZJIpMqWEfvBmYytth8Wq9lXqFAP0VF3XNHgt+nuCI6KX2dTB
	xyOATwaRz6XATjlEvxCNhZtVgWqk8bbV3z7NxRJkzX+uAZA3kDcjLAdjb8znyfKEQHemjlfnhR4
	/nR1VSgPeAYxnXdbY5lU41waZJJSlduIKqrN89F3K2Xx4X5izDQSV
X-Received: by 2002:ac8:590b:0:b0:4b7:b2c5:c61a with SMTP id d75a77b69052e-4da4d21edc4mr25364031cf.83.1758769142404;
        Wed, 24 Sep 2025 19:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1XnTbfMNHcgRcbCrb+1DBR8eHmzim3EHHlWAZftE/lw4akJE2YkN9j6quohmLlN7TXR0gww==
X-Received: by 2002:ac8:590b:0:b0:4b7:b2c5:c61a with SMTP id d75a77b69052e-4da4d21edc4mr25363851cf.83.1758769141924;
        Wed, 24 Sep 2025 19:59:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656989sm267325e87.90.2025.09.24.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:59:01 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:58:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Message-ID: <p2deqsamovmrcijqhmcss2766owsxfyz7v2uk3mxd5du6e6tse@uo5q2iqwjxj2>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
 <5mwqf4djs2jee4x6edplwmd5ugucoi4wazrzjoiw2p5ndiv6h2@6xqnnavp2a4i>
 <efa5ed28-674c-6a30-eff3-eadc650ed6ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa5ed28-674c-6a30-eff3-eadc650ed6ea@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: j7EFBwlTTUZsKvptwsVbnpdWJFawm1V1
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4aff7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6Hf86mc1Aoj0dGmY1zEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: j7EFBwlTTUZsKvptwsVbnpdWJFawm1V1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX05yVDMCAHXmO
 GASfZ1o8/3zIzt6m2Vq9MNFhP9D4rLwoTKqLqB5zruWX/VkRGB869O/8nMa2pogJRycJmQdU+85
 Eao7qAGDDwelpf4h5HYrBHBqfy5nKAH0r92vhsU3QPnIV1ydsVg+LYidZGaXMZnUoA1unb59wXb
 c7MR7ZFFjwH+K0g1jTg+/a4AA8fi4DOT9h0LjzVP4kDsolG/6gXuTwPvoky+CxlPlmduYTqPrOo
 rI1SMHWiYSsIywysetyCCSlLGeccpWfmTozm7JUhEsswz5VTPn+LgqY1lAkpGmtgExAJ6LB6dhK
 4BxlWj6XMD01/CFBSd5RigU5XbFXcRVe978cqSwBmY9QUawtQ8MuyRnOCqsfaDipQjB40Md71kN
 8Uyj05Lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On Wed, Sep 24, 2025 at 07:12:36PM -0700, Wesley Cheng wrote:
> 
> 
> On 9/24/2025 6:12 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 05:52:20PM -0700, Wesley Cheng wrote:
> > > The Glymur USB subsystem contains a multiport controller, which utilizes
> > > two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > ---
> > >   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
> > >   1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > > index a1b55168e050..b0ce803d2b49 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> > > @@ -16,6 +16,7 @@ description:
> > >   properties:
> > >     compatible:
> > >       enum:
> > > +      - qcom,glymur-qmp-usb3-uni-phy
> > >         - qcom,ipq5424-qmp-usb3-phy
> > >         - qcom,ipq6018-qmp-usb3-phy
> > >         - qcom,ipq8074-qmp-usb3-phy
> > > @@ -62,6 +63,8 @@ properties:
> > >     vdda-pll-supply: true
> > > +  refgen-supply: true
> > 
> > Which device is going to provide this supply?
> > 
> 
> This is just a pmic regulator.

Ack, thanks.

> 
> Thanks
> Wesley Cheng
> 
> > > +
> > >     "#clock-cells":
> > >       const: 0
> > 

-- 
With best wishes
Dmitry

