Return-Path: <linux-usb+bounces-28662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE20B9D3C3
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B333A9579
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEBD2E6CA4;
	Thu, 25 Sep 2025 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFlkY+kv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC012DEA73
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768619; cv=none; b=OEkYYFd/KBmDFuZnWBoUHYGp4VfQVTYGiq+lN7ZOjqF1VGW4TbsROvfgNDHcoUmd0ik9DMQ6AisJWDBAm7UBBDgqhUirCC+EG8JYWsUoq4rZ6uT17yqgctRk2b3w2s87l49RrOu/ZSMIBX1hnp9MenNmIqzw5Q1Bg9S1I6T+JBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768619; c=relaxed/simple;
	bh=//JuZfSiU5ZOHan2hVqEAb98T+pI2MO07exn9jj/d7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTw1ebxzR6YamSl0Vm6pnS0e4BXLhNYE5pNwBTLvv+wbXqQfEj83z+DZCNzahkmYGCCE/WrhO4TsHcvKPUcPpQAANOfDszcFG3E/wPRV9vjp+/hed2xUsNbZ9pntyhAeMSU5hW+z8H35q8dUQY87eCrJ8USFl7hhNO7WgYjrenQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFlkY+kv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONv5pP028199
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aTjhOlbDGoi+nAgLRYqCc7oF
	FUvkDZHGjtvCYSikgJs=; b=NFlkY+kvk3DkDeJ7Kp3u9alaExlaj2NbPl3K9MBJ
	2DPcQdzpC3hz/nrnlDpVGZR3TKu8Rva1p1XF4vWWgAOg6FoQ0m93KAECNBzqkUny
	kH/ayuWVl+CuvnS6ryJN2hvPciWNTbqXGBGbWDuaYcQDcI2i/65PLDIe7uebt8P1
	Lt1SAmHgrgOun/CEGG9rvjIhchuUZzobq6NQQYvdpvPA/AX0qMeH3ODj/COT08yg
	+4z3VLEFTOmPn2dHvbsIcviJabAiB75kQNa5HBNYKw+25vcGcaIFPKs+AAZmQT3U
	jY0IbAl9FD5WiqHZ7lMdQGxxGVVWDAqyPg0hBjxe2rwGlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxuks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:50:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d905ce4749so9591481cf.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768615; x=1759373415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTjhOlbDGoi+nAgLRYqCc7oFFUvkDZHGjtvCYSikgJs=;
        b=NvKNOmXL2J8y91I6wU/Dg5qmqJuH8whk9b2uf4V2EyQvbfJvQMnR0V9ZUuj+HdN+mj
         FrYvRWA8rDkWULq/tTkc9ghCEtkyE3NwouMJVVx/ssEHSM653+ObdSvQUB5zAv0/qKbc
         L9IMee/lOsW5faHP81L/x3tM4v/w9WL32SU/cTIHEZcRdfnfSXIiNaE4dp3wMr6YbN27
         thxMENerN73xxIDVEb2qs+tu9fSR45i4Th+vXBzCoSXn6GtK/APjvm/iO71y+1FtK/wA
         lNzN615y/0ZT1729LUgdGlK39NOtwfNXk3wGgQP3B3zbtTKu/UPW50BPQWEQNXyglx7B
         o0qA==
X-Forwarded-Encrypted: i=1; AJvYcCVy1c2LvSGZkfELmD4TnrTsVy4Y+UJWVpwg6DlH3XuMc/TmMun8ji7jyQnrx8U0UMy1WlSQgr3xElo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDS5xoLX1p+VnvIjQr63LEsHtSXjm9+2yozIB8C80h1VSp774z
	eLyl+CecQHGyOftrA21WniGan0GOQzX+gweAVN/bSU9Bf8EwlpnpurYozg5J3Oo6lBM47wm+oEX
	qYepPnKAVUt/r1//bbFLqDBEduEe+PoWw7jpXUFoJapk65EhI8QHyvHcGGGqcsdw=
X-Gm-Gg: ASbGncuCvF0ivgQMT5FsG4c5lEkQA887Mv0IiJFDc8e27tmwKcBP1rHj8dyayExi46n
	kBBo1L1QPQAAVU001iHROImNShFJtBbOmOA4KbmP7hPEAdGhOeyVE1TekO9JgQ+P5UabahLbMlf
	UI0wf2n9yh51Ht63dU3ZfFmlWqokJB3FDzKD9D/+KZm0js+/o5eN1kKYC6/PPxKm00ZE48PIHJ+
	br3fLhGhJkVwP5GMJg6Mwd9pLSf/7Er3p9/dPhJfOrpMB+dCanNTxQWbajs5+Do1Qm87wjtY7Rv
	tQkdLAI7HzPlxu+HpGE9p0xwEj4sQie6hahrM8fPexJ/3kRp8iasfnYXl4ze+YAq6lsYfneXlue
	VD2Ttg9Wi4yKfoyRjsVsAcmfg+wwiuulTOzjF6zuM5zujzp5icXHc
X-Received: by 2002:a05:622a:11c8:b0:4b6:373c:f81c with SMTP id d75a77b69052e-4da485b86bemr25522261cf.30.1758768615431;
        Wed, 24 Sep 2025 19:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPCPAHGHm02oKWm0hULewn+TOHb7/Ic6Ao7ghcD4in2rWcF+r1bHJkHP7fu0DzmGPlkvE71Q==
X-Received: by 2002:a05:622a:11c8:b0:4b6:373c:f81c with SMTP id d75a77b69052e-4da485b86bemr25522081cf.30.1758768614887;
        Wed, 24 Sep 2025 19:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139047d1sm260416e87.34.2025.09.24.19.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:50:14 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:50:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: phy:
 qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Message-ID: <fuq4wzdsvfxromlezvt645wrjynv6onolv6kfvehwl2n3neezr@gdfbmfzkljwv>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-2-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-2-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4ade8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FDav0VyUyA2TYFF6ppcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _F3LpQprJEw7ZFRPr9J_3vVlGWQFF0gv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX+zweTh4hqEL6
 Y/tgG+0ftxDT9OP2I9XNv/89N9+kFvuGXe/bvD0MZTMyAMsy7PMpcUwsMiwOmp/YsZZozXKTqbb
 1kOVV1iPzgRx7WgNsH4yNn2r61/T2dJuKfa1LCur9fKRBLACW2fTvXO6EQNuEapHETRi/9Naf7X
 4vpDNWVaVhPmfs+FV2CsZPjAt85UTgK834inzB8kwIdxckNDg4Z6YqBwSoKgv2RYUMbQJ8opMU0
 gH2UU3o4V7C1DxBmUTJDCzKcTFYRJy9HJoDhft3HxWkKPyGFGv90mZl9F27lW8iAoMw4YPrv2CK
 7XRtuFHLCEQMP/+YHSnRXRAHhRp7SxuQ1BKjSh00qrySvXhxiawi9dNeX2P/roecxuWW9PEwpVQ
 vTPUmocD
X-Proofpoint-GUID: _F3LpQprJEw7ZFRPr9J_3vVlGWQFF0gv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Wed, Sep 24, 2025 at 07:28:41PM -0700, Wesley Cheng wrote:
> Define a Glymur compatible string for the QMP PHY combo driver, along with
> resource requirements.  Add a different identifier for the primary QMP PHY
> instance as it does not require a clkref entry.

This is no longer true

> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b..2f1f41b64bbd 100644
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
> @@ -46,7 +47,7 @@ properties:
>        - const: ref
>        - const: com_aux
>        - const: usb3_pipe
> -      - const: cfg_ahb
> +      - enum: [cfg_ahb, clkref]

Either define it using the if/else or split glymur to a new schema file.
Such enum allows specifying clkref clock for all the platforms defined
by these bindings.

>  
>    power-domains:
>      maxItems: 1
> @@ -63,6 +64,8 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  refgen-supply: true
> +
>    "#clock-cells":
>      const: 1
>      description:
> @@ -109,6 +112,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
>              - qcom,sc7180-qmp-usb3-dp-phy
>              - qcom,sdm845-qmp-usb3-dp-phy
>      then:
> @@ -128,6 +132,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,glymur-qmp-usb3-dp-phy
>              - qcom,sar2130p-qmp-usb3-dp-phy
>              - qcom,sc8280xp-qmp-usb43dp-phy
>              - qcom,sm6350-qmp-usb3-dp-phy
> @@ -142,6 +147,18 @@ allOf:
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

-- 
With best wishes
Dmitry

