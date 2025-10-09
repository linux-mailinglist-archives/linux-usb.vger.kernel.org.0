Return-Path: <linux-usb+bounces-29094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A6BC98C9
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 16:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD0D3A5DBC
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 14:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B8F2EAB98;
	Thu,  9 Oct 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h55SnEXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599C4153BE9
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020720; cv=none; b=jEXZvQrB2iwvZbUqBC0FMIm1r2McGp0fwRyTl5An5dMlPsvAUjI8Pwr49tsGBda3uaFxJTlToWxFVI1teavGr+/yusm8zv0XR+ie/HJeJFPwHBAxmDkJLsp+lCq8W8mWMOrxZuFzaDrPuUGfOicpI7uH60Kixx5v0LJWmEu8W98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020720; c=relaxed/simple;
	bh=vp7VjUXj+As7oOKkaiuaBC5XXitotERlBrJ3mgdUli8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qygHQpfYgT6mwOShzfFfYuqO/bGWV8wvGZzE2f09KEwCZ0qBeMVUL/QwaMHxYtcgwKVDil7FzQ/fubQ5brj3ILDgraxI0FMPnFCfhMmKoPHEMWDFe9JxR5WElFepa5JPSfpF2T24t17Oq9HjTM7rgBpjhhcq7v9JQnnOytch0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h55SnEXO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EmUJ020142
	for <linux-usb@vger.kernel.org>; Thu, 9 Oct 2025 14:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4vBhPHQU3f3k1y9DS67UjAgU
	bNDRpJ4AofTiTYruk3A=; b=h55SnEXOobNRQlQCOCWUy9CbVe6LDj6avqwfogwk
	qIkxNU4IRyy6eFxbcmOe/xohO9vcljTJ8FDB2qB4MS+HLhrFo95dKIAIO5rbiU2R
	B3BXtXj/Tbxdd8ACGmjcyoUAjx+YjOvqc4pI/O4rFJbVMwl8jVEsKNuq8jhCEHKZ
	RJNbuImxdcZbegeiXSstzfYNBfcmhYdf31VPRtwWL1V0tA8Ks2CejTNeOgTb2+bT
	tH7WfWKsU+t64ggVEhG6anr2TIAMnvo4TUm6XZiAjPW5tc0n1VwhkvejB01nokUB
	TdndrodXgO1CPpOg/6GkLJwt55aBE0vYUmGbU5QFNKJ7KQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nu67k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 14:38:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e5739a388bso36137931cf.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 07:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020716; x=1760625516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vBhPHQU3f3k1y9DS67UjAgUbNDRpJ4AofTiTYruk3A=;
        b=w7VVvZ18qSbFJMUXCx7517T7yVfcYyUh50evbvpxR1uXAH77oVTOj9JQ4grmoiQHtq
         s59NvHP1gB4cuffTX0lYMwi7PdaKOt3cWYVRbbF+zai+KLOUjFZmdccED6/A/1j+sN/e
         HTlPY8Um5JSajIt/KBWdXOt6BFStu4QoswkUwaJoG7mjSHSPr8BisV3+vP6B3PhroVvc
         kTWWE609DHEyK/TWlA6u3eIXk5z3jb69W5jZr0K1D7Pfr3CecAYVfNTvrfjnDsVpIs5a
         V6h/qbjk7FBQ7EbpLAFxEAECRbX1cn6ppqIk4GSS8EI4j2GHOGswVMeXSXec3rn81U4o
         Pl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbl21VRbkHu4Q2pJTinGbewFMG/eAS0XzhqjG10MEmKpwpBTv0jI6nlCHV5bntIIS5xpY3+XJFlgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjnE/rMll9jXBrQy55R0eEgYiB4VESUAb+LRt+ph2lLH3AboI
	VvHCqNVjPc4azyxfid2pVLizkt5udUs2uCeUZkUUP6IZe0neolMp2Ysb4/hkee7U1hxoX/8ct8H
	pelRAAU0EsDpsNtFi5tjuJcmiRGH8OyG1ddXkr2dNm+2Ysm6pR/lplE4PQHBd03w=
X-Gm-Gg: ASbGncv1CG+K3lZ9YNT2DMN5bV1PoDXCnLwWa0MwGVdEV/kFtmQJLumxoYSEYJnUxte
	6KcupJMzNkMD+V1zoWr57mGvvYq9yrYn5fNa4MHnJ8OttvxdntrI4DwosesNNcZsdKe3kKCyo1z
	S5ePrSJSNa19r6mE1gto6fgCGl8/boP/2x4Xkl3xdFwDi6Dt+GOEo7x4WGRI9Jnt4Js0vSUk5N3
	l7GEMVqeRlrrX+a7Xb6keP75E4WsS0LOCYv9vrR2NJvH69miW1RQ01RTR1+6XtWmIhpIlifaaZj
	pJTjYBn+VnHwdurJpyeK5A/cpVG6NRQBOvG1nNmRAB7xSHbqCLfR3vF8aYGYBGNYNfFBisNJwrS
	n2kP51ge8KbAlker+JCbnux69Yoxv4M8ofbRAbw06pGLPx5S5JnaDQ5JuIw==
X-Received: by 2002:a05:622a:4812:b0:4d7:bf73:7641 with SMTP id d75a77b69052e-4e6eacb362emr101466811cf.17.1760020716261;
        Thu, 09 Oct 2025 07:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJWR/L5QvAdufneVpdCNLbrPazn1qmhQTRqnRIiTH9ugDxuMkMX/Hp2rQmkitaj4be/K7DKQ==
X-Received: by 2002:a05:622a:4812:b0:4d7:bf73:7641 with SMTP id d75a77b69052e-4e6eacb362emr101465171cf.17.1760020714634;
        Thu, 09 Oct 2025 07:38:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39d509bsm29456381fa.12.2025.10.09.07.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:38:33 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:38:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 VBUS based on ID state
Message-ID: <cbpne2d7yr2vpxmrrveqajlp3irzsglxroxyyjmviuci2ewted@6ewwp6yyybk5>
References: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
 <20251008175750.1770454-2-krishna.kurapati@oss.qualcomm.com>
 <odikli6rfdyid5oqavurtqytgnwgh5hpmka2jt5tprpdw7cd72@icpnjnkfowt7>
 <20251009131543.GA379737-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009131543.GA379737-robh@kernel.org>
X-Proofpoint-ORIG-GUID: BLKBhtMbcyrerONxE7i9u6gQFQH1R45t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzbCkLZ2sJ8PJ
 Hm3WUPOvMeAtWE30P3ksDXOT67yFna+VfuOgjXvQgr1wnPig9KF2q9aDEhxeRL9QntXMZmY/Pys
 +13nJ/bn+VMCagWm5tJ5rQ0xaP2kuJFjQRGF7Nqyfn5F95WB2tWiZJ2ZSDLVhfdVQUeTTPEb0DX
 GYzI56QIaZg/fVA8sPFf7Kk/GjUU+oGSMlPfpddebtwyY6sG8R6YhS0aXeXmqrWPJe66DF+YTu5
 8kxKXqaFb+kK/62KnE158vx2oRX3+3+GRzpcvhS2rDIxzwwHE+E5uw09QzoYPAQHg5UnZR3V8R0
 8hJO9FfyjtM0ZXTThovW5eR6UDHni3AP2GvJjKLNmo69OAD5j2nT05DiEQsEHvjMEXwmc4iUFiG
 CwrqMGCDYgtONDCHxvucoEpfNpmd0w==
X-Proofpoint-GUID: BLKBhtMbcyrerONxE7i9u6gQFQH1R45t
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7c8ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=wJJNMdjIKgIFmJVF0V4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 08:15:43AM -0500, Rob Herring wrote:
> On Wed, Oct 08, 2025 at 09:31:59PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 11:27:49PM +0530, Krishna Kurapati wrote:
> > > Update the bindings to support reading ID state and VBUS, as per the
> > > HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
> > > asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
> > > VBUS must be at VSafe0V before re-enabling VBUS.
> > > 
> > > Add id-gpios property to describe the input gpio for USB ID pin and vbus-
> > > supply property to describe the regulator for USB VBUS.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >  .../devicetree/bindings/usb/ti,hd3ss3220.yaml       | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > > index bec1c8047bc0..c869eece39a7 100644
> > > --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > > @@ -25,6 +25,19 @@ properties:
> > >    interrupts:
> > >      maxItems: 1
> > >  
> > > +  id-gpios:
> > > +    description:
> > > +      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
> > > +      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
> > > +      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
> > > +      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
> > > +
> > 
> > Stray empty line?
> > 
> > > +    maxItems: 1
> > > +
> > > +  vbus-supply:
> > > +    description: A phandle to the regulator for USB VBUS if needed when host
> > > +      mode or dual role mode is supported.
> > 
> > Why are we adding the property here while we can use the vbus-supply of
> > the usb-c-connector?
> 
> Normally, that's my question on both of these, too. However, it does 
> look like both are connected to the chip. There's VBUS_DET which is 
> connected to Vbus (thru a 900k resistor). So having these here does look 
> like accurate representation of the h/w. The commit message should make 
> this more clear. Honestly, that's really the only part I care about. 
> How it works is not so important. 

The VBUS_DET pin is used by the controller to detect the VBUS provided
by the USB-C partner and to identify when it's safe to turn on the
device's VBUS supply. I think this still fits into the description of
the connector's vbus-supply.

-- 
With best wishes
Dmitry

