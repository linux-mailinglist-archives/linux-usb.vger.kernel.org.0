Return-Path: <linux-usb+bounces-28405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D523B8CB5E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 17:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 439A562721C
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 15:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3624F2FF165;
	Sat, 20 Sep 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHdi39/s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FC61F0E34
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758381764; cv=none; b=bvMVwE53aLGT1ad1i2ch68ScV4jrxvL1NKFT4fpoZQ5YCYjsU+AtqmHHBsHqr5oDK+dLUedK2Iiszl/Zjea0EgqMdIh3qHQ5ngW7Bb14f6Qht5jmxSuRcEmf04wqHeU6k53j2GcTtcz3EkPznkC8lInyoTX3KqIf6CuEGS46D0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758381764; c=relaxed/simple;
	bh=ADtsq7AKzm5Iw0ISFNLkeS8bqwkOPzAKJJ4xuvJ/GhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URIFDKh+2F6pZM0ru9BIGocJ6VdMRWtcDJThQiS0JYDR06addgi+r/QUOitv96WCdkoVSerYIeMtaG5psruU4W0bh94vfvYkrlbBlu7sf8iomIUL5/d1lvSgUQRqwr0xq0gqsWlgsJMYFo5lPrwnk3F9FoRIBiJU6YEcfAESYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHdi39/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K4C2tI023292
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMvP8F7p/iDOTofUgdqZ4hYV
	jRyQ8rzwo1S3mGKqewI=; b=EHdi39/sRKMF5YFMprLKbxk2PLKoxfCXgK62NOBa
	lh3Dsw0MKcrUKng/QZ5fVT7lNhoFNhMC0mQUN5TSCmf3VM8+MfO3aAUVR6dGDJAp
	+jnND8JM0Yru8ZOCmeI8PyeXU2t8tdjskYPeQUWDsigwwIEVqvml1xzaRZX2RcTB
	oK9WskshuZpjyOQoD1FZUO9H9T6u5Bmd3W149CO7J99/IJyoQYhg9VBk+OHhIRKz
	EdF0r6z3DHdnfQ9pIMPiMyGENsHIb2Gu0mxABEEi88zkOkrgJcpbuHSBipC+C0qp
	qXJbcpCYR4CCG0V/a1bYECWjegISWElZUf6V6tev6zKuMg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f8t6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:22:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7248ed9f932so45850896d6.3
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 08:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758381761; x=1758986561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMvP8F7p/iDOTofUgdqZ4hYVjRyQ8rzwo1S3mGKqewI=;
        b=PxtL8qexE/RFAvFa1goG2Xxase5FOhdM9GNtg3VSriHwvrjNAAPq44hCUSc/vlagtN
         HT7msbUoZZCiPg7EG5yg5pBQzPqFD1mdanqj/P3x/6pjVPguMbmAAAKP0Iv9vRfQinL1
         OGbInN6GWtQZ1T+KgCQ3X6/Ctuaogzxw/8TTeGZ2/renw3E6SoroaE8wyi3nVGm0oEzA
         H5q/lf7ejvYWstny3w7eHnLpALRUHLQFdAvH04zkTX+xq+yPJGhhBdH94UL2O3/IviiK
         JebcmGE+52+sMRpc506Rvw0dKdo8gwbryOuJxx3RiNIEDyLEwbVtn5I3mN+OC4Oi0rhK
         vZgg==
X-Forwarded-Encrypted: i=1; AJvYcCU3uQ3ujkvtWhpNSCemPOmCOzItQmCSHbvV4xbhqkax70lYlpupYKWUj+oF8TJnEqRJtoJZ+ktuRVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2uj+NCieuEz57s0IyCoILF95kR+y5Kfa4MQA77VibxW+iv8h
	AzSHU1BD6t6k1TBWifk4kCPT3Ycr0sGnWFIuwBo0ie21vRfTdzRaWHMTCm2KsIBV5butH2ambsL
	vJWlri8zARTMe8jdYTefXPbVgAHneQFxMV+xOuSVnhPtMRulTa8Tj1yVT7wVIuwOi2zY4ouc=
X-Gm-Gg: ASbGncvN//qJHfRbpsNZtpATo8BAZwuZHwfIyxxLtQ7RNJkdA0TUyzvb2zpJWB+jgbv
	5CxEdpBXCrRptegKlQ5mcO+IsRyiISUShV5pa3r82lPWUbgCyPow86cI9xp2sm2W4W6RJklMQaA
	2zMV0V211vVfKoGDeKeHn4hczJuc4M1l+UCEDVXNJAVvouwXHPSg7JHDd8cRzbYKolEwCj1OHsg
	KsIr+YnotDpvfI37yiJ/Mwmc0DQz2Z3/PJ65MAsbur8BROu4xjdE1zwwr2VtoKaQsY2FLP9Cw3f
	gcmoZ9zeEch7s/6Q9wYWayG9hAs1aDHN5URVj23ftVXHdVUS9/+QVZn6wCfVryVQE20X75ZzIvr
	OfIC5rzFe9KWH4t0fIkto1//4GWjmIeqqcKO+wdYKPVVOsPCixLY2
X-Received: by 2002:a05:6214:f01:b0:793:1b9b:4a9d with SMTP id 6a1803df08f44-7991c5f520fmr84609206d6.49.1758381760614;
        Sat, 20 Sep 2025 08:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWlAgM3pnMSdAw/Rq7z1YnN1kZKJ5qD9fwFMBKD5LFNPD+tDGwMgQD4d59xA4K90UQvVcnrQ==
X-Received: by 2002:a05:6214:f01:b0:793:1b9b:4a9d with SMTP id 6a1803df08f44-7991c5f520fmr84608976d6.49.1758381760044;
        Sat, 20 Sep 2025 08:22:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a27c0242sm18259521fa.21.2025.09.20.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:22:37 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:22:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Message-ID: <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xM_UYkZM9oYncSjuVPBlqvM28S_jqxaj
X-Proofpoint-GUID: xM_UYkZM9oYncSjuVPBlqvM28S_jqxaj
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cec6c2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=IEiawqspG9gC1EAg6qAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX4mEVH9FCuaj3
 0e+mYf1VcucH34U4j7Hdf4ZPg08t2zz2MbCT+vlDxB4Hi0lJpOTajWa6zOT1Dpuy6878wE4fE4r
 ktrP0h6UCcU4q1zGGZRF69uvYw12dww6kn0QezBkcJ4Y1ys1eQ98sTC8XkticRNzaQju/tAz/zl
 vqqxpypLcbzGg+wek3zRryND7Vr1A3fCNzT1qR0uGOmzUr+Hwrm4GnN6hRZlIcm5uk7jhOFsBUq
 bVBXwxsh9DH78Ap/jJKodjW69w+Q02HAoSDnW7uf44vrHsJz5xLGAx0kSJB/hDZzTtMCTTaPE8C
 yc8ZZwdxC9A5hOBLtL/FvZoDZEaouqlGTkV8ueA+nvc57j5MBZcCVBo0ikCfOzD441h9G6Oa0j9
 idvGPIqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
> The Glymur USB subsystem contains a multiport controller, which utilizes
> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index a1b55168e050..772a727a5462 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-qmp-usb3-uni-phy
>        - qcom,ipq5424-qmp-usb3-phy
>        - qcom,ipq6018-qmp-usb3-phy
>        - qcom,ipq8074-qmp-usb3-phy
> @@ -62,6 +63,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true

You've added it, but it's not referenced as required. Why is it so?

> +
>    "#clock-cells":
>      const: 0
>  
> @@ -139,6 +142,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-qmp-usb3-uni-phy
>                - qcom,sdm845-qmp-usb3-uni-phy
>      then:
>        properties:
> @@ -147,7 +151,7 @@ allOf:
>          clock-names:
>            items:
>              - const: aux
> -            - const: cfg_ahb
> +            - enum: [cfg_ahb, clkref]

Why is it being placed here? Please comment in the commit message.

>              - const: ref
>              - const: com_aux
>              - const: pipe
> @@ -157,6 +161,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,glymur-qmp-usb3-uni-phy
>                - qcom,sa8775p-qmp-usb3-uni-phy
>                - qcom,sc8180x-qmp-usb3-uni-phy
>                - qcom,sc8280xp-qmp-usb3-uni-phy
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

