Return-Path: <linux-usb+bounces-24362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32546AC68F1
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 14:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA8C74A7EDA
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF977283FC5;
	Wed, 28 May 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBe5zTmC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34652205E2F
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434480; cv=none; b=uQakfOpoZz28vsR+ZhkcmcHEJ13PNj4HP+3x+fjEGWYka03GzHVXV2XXbhHaubpN8TQNLLOVPSP2XLcJWqSsyY0xGs/ws5qgkWU9RDQkhhvzCYd6goEyfTZ5N+mdxgBWscoVoUErWKk61eER1NSNB8s0K5B3Qu9oLlpg3Wu4iQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434480; c=relaxed/simple;
	bh=jYOPvF1Iu9M3uetpmwUkrikZ5IUGSU8JmbXp4kxQezU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A416pAzC7IZW5zx7wRozcCUYd7Vxm6ZVNOJz8aZYLB0O3p3Rtv7mrchrTX553EPz63Tp57VlPzk6DkbPW/ozmduLpz+1jOacsvpo0ftLyC9gJEFNE2BfY4/oQU9owu3JVwbBtlyUwyXiNf1oexmzaOScRQ3F+FO8lBo57gytfjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBe5zTmC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAI3xH021578
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cjdekBqq9jQ1YXFhfk1E8WK4
	nJD05A+u1nrX/oJj5mo=; b=OBe5zTmCx9eNzb6Gr9pjOGgX4nz68VzF4PYfCXmb
	kpSlphATodbmzpK4/CcmXm9Ry/OB5hR90fIcgX6j1WoovJYM43uH1nX733aVpOQN
	Cq9cPEMS2NVqazTry1eX2iKI42IF5KOYjgz+IsesBw2FW7JekOVJ8BhuYYIEHT1p
	EiVFoQ4KHnUy6uI7KMqFJe+IjQCz+1plpvlL5/MLzg4wPFOsGIHzZaeDzVmD80EU
	jyHDUXcAXCKtCvZq2Jsy7jzeZc2De6XBjm3sTzq3JvHSBui/ACCfmv73YbCN712T
	SmCSMiVLwjIz+D4FPCgRGtqat5McrFV5FvRmWhpkaTgYJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9253w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:14:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fab1b8d379so22030766d6.0
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434476; x=1749039276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjdekBqq9jQ1YXFhfk1E8WK4nJD05A+u1nrX/oJj5mo=;
        b=uf81S7gJaAZTB+VXEmDRwhfYsFjORjh6z1HUrBSIQSrVboFhZr3GIVdvN6F09ATQIu
         unYd4iY4j0wab++Hpq8gYXdp8y7CqBbRmF+pMAUUFOa/Lu5gmeNXA70cw9UpYXMgbXj6
         xK2/mBMqx2HE9BBb7BUVvUAFqwwHxI+HZVUkRpWs9AYhx8I/QSOX39Frcf5maRdF1tpK
         gYg+AiST/wfk0NVB4rklhpgWH7+8EzybozL+FQkcB5AnI+MwPPKqnulyiNbxaw0QgaI2
         9SixbO4poW8hc0tLrurR8mtjew47jNJljCFyarpXMSa0km6iCnBaXF08ozVBRvW+bbzN
         BDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMddfTMv2wcRaepPh0PZ5KSfe6DcJZujlEcHnMNvLYzyFi+MxasRDOJNigb/B7s+Bs6Y0ijPIJX/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvKxyJGRGJVWto/A65Cfp/Y5SFz/oK+mEdrtCR3w0Hqu9fpt2
	kN4zbVkHkfwYlq2V9caQZ4sqXYDBSPTlr+IXuRAIELgV6HufxP3y5C+m7PIu5ptD7umkKsefDPY
	wTgyUPhqP96/dZ4MKqb0l0ybe7XOHmlEIXL0dYRrJarNAT7ue06aIJ5BB0IhbD2o=
X-Gm-Gg: ASbGncsLlx2uU5Pib97JWjeeyvxS4nu4wSDFRl6MxM3aoTNqlZFMpGFDY2WpmuEpCHD
	mNq3R+u7iHhc1COyEAioXw8utPDInx19kN39FadLHb3YifSntvG8ELB93Li4WAg5Ln0amTcwAPG
	wWNmySXuFH17Ptf4JNlWXNGUc1FcUT+sxk00ogoTrtf8tRo1quB4lC+uqjGEXkZxY5VQhfiDM3P
	mX/qh2GDzpCIs+IaZ8T7g713JeK92dFjRkZtOG+GuqZOWn56c1Okr4rdipfC3ePDG6V75VNI5o9
	L7+H+tLPG3JNYNq9XUMSXJjDdCifP8wuIxuyGOOsHNAniSIa7dJkFV40xXlJpPHrpW/sFGJkgE8
	=
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14194976d6.5.1748434476038;
        Wed, 28 May 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2p2VwJWOXtJEGL/fYyqmZpdkmAOdMF5Qq25nUD3joqlGl9qIwB9aKQH/bANxFtWon8zcbtA==
X-Received: by 2002:a05:6214:21ce:b0:6fa:c2d5:b3a4 with SMTP id 6a1803df08f44-6fac2d5b470mr14194596d6.5.1748434475626;
        Wed, 28 May 2025 05:14:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb688esm2323591fa.24.2025.05.28.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:14:34 -0700 (PDT)
Date: Wed, 28 May 2025 15:14:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Message-ID: <ari3245mwglxyelcpbct2dnclmp7xtgj6jwrkopb7t77rzdmio@zkpzkyzydig2>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6836fe2c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zrS0zEH8eRrj_hfGFQMA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: W6yiTED04hv7KzWBl3sWLvddN5CZUyP8
X-Proofpoint-GUID: W6yiTED04hv7KzWBl3sWLvddN5CZUyP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNiBTYWx0ZWRfX09i/YaWL7dEX
 yO0PskDOcxc/MvmpQCQoWy3sr+2IWVH6oJdGGmLeFSnE+5ai9cSycerS/djU0A8t3o2j8zdzCPg
 8sXeuKaTmfTwRMRlzKpS2A5mnVkKfA4Z/pyzJ3SWad/i4L0b0MDh7dtY5KQoCAGmUkn3qQ4qwAP
 sM+YnC/bD8mQpEA/BoJWrldjhbyPC2bAnY/W6/H4Th7cRVR3Nwmcz+PKhIT5pGF9jcHmNaImCex
 SoDlN1hn347NtbbDZ+MehaIYTY3mQD2/6QNzkvUsnKVMIKjg7fDJL4XCKjcJMH+WatnTQRNPx4R
 UOOKb7KUKrj5mXr7uElq+aHpCZgSiVZDLIPYaEY660C9AX4y+EODumgysKUeJfDTTtTVE7hogMk
 yRWlAg1RjM44dyQk7Q6rKWI9UlptCvoAalg8B+4Wi9vYqXyxbN2eLZgmzb578BzzrIwD2kzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=486
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280106

On Tue, May 27, 2025 at 02:04:39PM -0700, Melody Olvera wrote:
> SM8750 does not require an XO clock in the dt as it is the
> parent of the TCSR refclk_src, so move the compatible to a section
> where the XO clock is not required.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -227,6 +227,7 @@ allOf:
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
>                - qcom,sm6350-dwc3
> +              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> @@ -366,7 +367,6 @@ allOf:
>                - qcom,sm8450-dwc3
>                - qcom,sm8550-dwc3
>                - qcom,sm8650-dwc3

I can't stop but notice that SM8650 also uses TCSR clock as XO. Should
the clock also be dropped from DT?

> -              - qcom,sm8750-dwc3
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

