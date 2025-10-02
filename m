Return-Path: <linux-usb+bounces-28860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB78BB22EC
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 02:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A373C02E1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 00:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA6AEEDE;
	Thu,  2 Oct 2025 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2tOQqxH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF9F513
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 00:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366563; cv=none; b=bxHn91gfCP+0G1Q5imq+E8KmrFkgTNgJO8wUFgTdlJYuqHVCJYt9JRWnHNopYReOdvhbuL/l7WwfyVEgRNcpDfkGfBzy2iCb4HQ1kSVPQ/pK/cU2DEcqI29ZK5eJwEwPDBsPqYcqnjoXy9pnGFV74HCP7usp7ecd/CiBEWi9aN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366563; c=relaxed/simple;
	bh=Mnra6sxDGNMUqaO+Vm3H9zPCZysENcOo0QQWNFnugoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErtLWbME4OuT91vsBtDyrovbkUFqnt1uebVAcSoyXzux97fKSFSauJpMf+lTBfn1spi/cTQCzvynxj2HvKV67GFg1ZSQ4RLckZLhCaUNXTXuH8kuw14d8g/fcgB/4hfIpP6IP1QiqN/ifmJX5ZqZXHHlpkN3h8qC+CLMRUQ9JEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2tOQqxH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcA7b022697
	for <linux-usb@vger.kernel.org>; Thu, 2 Oct 2025 00:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8PzQc+BmJiwVOLFHqrykB34m
	n5pDbaOYFIBrZaxzwsU=; b=I2tOQqxHbLH3mAXAEts/d7DiOVYDuGA82QegSdLf
	vAZ4A+rYVfab/A9wCZ8Dv/yYgp7fkMtxOBmJMzEhTw+qrNjG35UVaL9oEWe6wLHT
	G2VXD8qx8L6vRfY9iz1q7/XtJvNN34W5yJUBsgpjcFX6uNVUc01lWv5SU6EhZM4H
	4NpqV4smMyCJdmLWwo0lwzTajvaonYJ4psS7gc1DXzFE+SlN9ZXGP9Y6ngM/eGME
	2fSZGnXo6BgR2I2QgBZsXkqR2I5x7Q70cxb8Wi5LgcxbUNaxwM8GdL2MdQdBd5EL
	LDGaWXTHQEO0JS8sB2jbzDP63Xin008qIii2EfXZ/v1R4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n6ns8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 00:56:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df10fb4a4cso18019901cf.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 17:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366560; x=1759971360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PzQc+BmJiwVOLFHqrykB34mn5pDbaOYFIBrZaxzwsU=;
        b=EGsQVQ2t2jLV44IfVnDWQaImmT/rKnfk0bKYWte7dsfhVKODrQNUNMi0O/avyyfsUA
         K58Ltsz4LdOYID+vgjrPwSXVo49P9HyBd9u2Dbil8hCfxUW1G/Bqi24XtNMdS+W211eY
         luruSxrmvbGwbZY8KMWt9KSlu9Z6BiPI43gd4hLxy0wFMMcj/L3vzqRm1X42mlFO5vH+
         yTYrlWmRAMYDLAb6XP9TSjp1CokNCJDR9BvEEdIVQtV5mdmXnWD/s8WelM8JrCfeHn6k
         fRTdkkaDcDsjA15oS0opI8J8DlEjZ8FpNy9vk8k5EAOm2sOJTz0EhZj/dyJ5qNr67c8u
         QGkA==
X-Forwarded-Encrypted: i=1; AJvYcCXeRYfn/Fhl0GmnIKznrmbMdNkVXYXKpKyXsywmvGxTDRk1QyKE+rjhyVknw8i5xpwjjatR8+B8qic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50EX19nXfjHQX2M6S/xeH4X+DS4A9ZjXPbExNs0jXLHHSwKp1
	WV4gEvRNfZBxCTQxkPB768qPrH2x+7HjXyr0AWft0w/6gPuqMN8pbMhT9YX4P7t7H2qOFHR+eQR
	aPvOPSXRQtmtfDrisYqWPBlHZbRfsB319l9UXhsSOt6C/dqN7xWtlIrmXHEPGHAA=
X-Gm-Gg: ASbGnctIi4iPsVL7+9eo62yedR9lNPnbPPHr4Nykw7jwYdaeTusM1SaqlHYaPHK92kx
	5VcXCYHzY8PsRyYDznvXekXKN6DArpnWYEYQIu2Dj/N7MqjTrsSa7YIWupe0FPDRtsh692GYzKV
	UJ2HzTTMcEcvrWbK9Q7n1iIqapOEzWrWmcXMPc1ggggFmK3VlFyxnXWmlcpMvbWs7UK44fjIAtZ
	ipdKu14J+LehhJ5KWKLiTIitEpASSSt+BMuiW2bwLh8XFGCRHGefp9CGpF16yHJVzCNcJjL9+ad
	SLaWElwP3y/+c7GUTLWjMdBA1Dc+flGJP9GbFop21nn+TVgR85nQrjLOlVqre/3Hqt1etlTGFy6
	9txGiemX5BOM9MkrPf2XQYK3XdhHVQfPzlpP3GPPQzxuMGsyIYDiaZZ76Qw==
X-Received: by 2002:a05:622a:5518:b0:4dc:4828:b7a6 with SMTP id d75a77b69052e-4e41e5416famr78963151cf.59.1759366559898;
        Wed, 01 Oct 2025 17:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtplyOrthJ4uP+eWCWIt60T2cvFyskp9IejhadjkX5IEu1X/U3y4cM2LWQ0k7UzPqTkzQ8qg==
X-Received: by 2002:a05:622a:5518:b0:4dc:4828:b7a6 with SMTP id d75a77b69052e-4e41e5416famr78962981cf.59.1759366559465;
        Wed, 01 Oct 2025 17:55:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4a6015sm2742211fa.45.2025.10.01.17.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:55:57 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:55:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: phy:
 qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Message-ID: <tblxljq2wmbbb3cpzv3xd7koc6j224ts3kd5mhx7hgpatenond@dqu3gunfocu2>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
 <20251001220534.3166401-2-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001220534.3166401-2-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: nUyPON43M8r-JoerazwS5jnqKOyx2bLw
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68ddcda0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=poLWbaA-Eiv7kSeqQ60A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: nUyPON43M8r-JoerazwS5jnqKOyx2bLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX0TrwIkdsJBFF
 mbzQdX70guqYx7vHRBFOPI36hniaS62MaExBb+bOiOkkKsG7qnEsiirD1V2+HN95Wln9Ytl4J80
 bRt8qYH9u0NXXjeR22NcYTWkt4bw2oSJtv1/ZahnYOLjIZgNQAg65SQtwEeMOiSaWPAaWgcB568
 deErtqp7G6uSCuz3xGSf5QhsartcWc/E51a3bsZh/OeemaSFcbtNJYdc79kfih2dor6+lGJqok+
 Cy25leIUZOyIS6v73GIYto98AqW0bEKjRdEAakuPES/qz1UURnCTC+4/sAdkL+wCNUngUS6bgkV
 7eV1qZPl8FMw0GFt0g00xKJUNSIDEwxkdV2stMPCETJ08qzSc8wlASUdZrAUdOxb18fq41xsUm+
 7uCEQJ84619KGh4/U3YP/QCSIpTdqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Wed, Oct 01, 2025 at 03:05:25PM -0700, Wesley Cheng wrote:
> Define a Glymur compatible string for the QMP PHY combo driver, along with
> resource requirements.  This adds a new requirement for a clkref clock-name
> for each QMP PHY.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 76 +++++++++++++++----
>  1 file changed, 63 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b..377d830f0855 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,glymur-qmp-usb3-dp-phy
>        - qcom,sar2130p-qmp-usb3-dp-phy
>        - qcom,sc7180-qmp-usb3-dp-phy
>        - qcom,sc7280-qmp-usb3-dp-phy
> @@ -41,12 +42,7 @@ properties:
>  
>    clock-names:
>      minItems: 4
> -    items:
> -      - const: aux
> -      - const: ref
> -      - const: com_aux
> -      - const: usb3_pipe
> -      - const: cfg_ahb
> +    maxItems: 5
>  
>    power-domains:
>      maxItems: 1
> @@ -63,6 +59,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true
> +
>    "#clock-cells":
>      const: 1
>      description:
> @@ -105,6 +103,22 @@ required:
>  
>  allOf:
>    - $ref: /schemas/usb/usb-switch.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
> +    then:
> +      properties:

Missing constraint for clocks.

> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: clkref
> +
>    - if:
>        properties:
>          compatible:
> @@ -113,21 +127,45 @@ allOf:
>              - qcom,sdm845-qmp-usb3-dp-phy
>      then:
>        properties:
> -        clocks:
> -          maxItems: 5

No, you can't remove this. clock-names doens't provide constraints (or
description) of the clocks property.

>          clock-names:
> -          maxItems: 5
> -    else:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
> +            - const: cfg_ahb
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sar2130p-qmp-usb3-dp-phy
> +            - qcom,sc7280-qmp-usb3-dp-phy
> +            - qcom,sc8180x-qmp-usb3-dp-phy
> +            - qcom,sc8280xp-qmp-usb43dp-phy
> +            - qcom,sm6350-qmp-usb3-dp-phy
> +            - qcom,sm8150-qmp-usb3-dp-phy
> +            - qcom,sm8250-qmp-usb3-dp-phy
> +            - qcom,sm8350-qmp-usb3-dp-phy
> +            - qcom,sm8450-qmp-usb3-dp-phy
> +            - qcom,sm8550-qmp-usb3-dp-phy
> +            - qcom,sm8650-qmp-usb3-dp-phy
> +            - qcom,sm8750-qmp-usb3-dp-phy
> +            - qcom,x1e80100-qmp-usb3-dp-phy
> +    then:
>        properties:
> -        clocks:
> -          maxItems: 4

Same here.

>          clock-names:
> -          maxItems: 4
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux
> +            - const: usb3_pipe
>  
>    - if:
>        properties:
>          compatible:
>            enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
>              - qcom,sar2130p-qmp-usb3-dp-phy
>              - qcom,sc8280xp-qmp-usb43dp-phy
>              - qcom,sm6350-qmp-usb3-dp-phy
> @@ -142,6 +180,18 @@ allOf:
>        properties:
>          power-domains: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
> +    then:
> +      required:
> +        - refgen-supply
> +    else:
> +      properties:
> +        refgen-supply: false
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

