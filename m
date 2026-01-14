Return-Path: <linux-usb+bounces-32354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F130AD21712
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AEFB30146FD
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4543A63F7;
	Wed, 14 Jan 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOpmXL/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xga3NiGD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FC73A7824
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427412; cv=none; b=GOOctPmn1j93KPlVi5YhqAflli9rf1UbSB38Ohs/+wNIMzjd9SwCIiqEDqxkKEgJlIwt1UEoxD+TscsK8wSw72ES687+zBAzfpsL5Ywj84cBBifzKzBZ+szOBgX3/aFwW+mShpHhfamaXWQfYCfn8+uUu5ckcX3rP0j2INnsL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427412; c=relaxed/simple;
	bh=pM6rH1wDt+deEBUHqE+D5yOSxEdfw/j+X7ePmUlHSz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJXPjxyunbBErczdWSanwH/5YAcj5hF9x655LVnGQ5XpKa+qi0V8BVY4gaAjlRr+dGCSe+7+Ll2+pI6oR72Arr9lLoGATsLVNavY8fVFSweLAIEBqF8LgMBEfVVp0+UIx1Wxkj8aaNttMLp3qH5dp/uuUzbrcTQ/EhFx79yMCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOpmXL/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xga3NiGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ELPLEC3925427
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hKeUV2Uhbrfkcr6j7DSR+Sck
	JGwnu8Y7+L8EWtr68+s=; b=FOpmXL/61/kLOPbdbN1pFDf+8qWhvTyi5PGGtKYW
	ijqHDxJbPB/mxNCR8NBIxMiPBArGQjzsvrkz8EK0GfrKZMJ4inkKnAXWuksmDvVY
	9leBlqbPE4cyCr4o79eIdu8mAM7LzzE8ec0ZZgqaHoWBIZWyuhwX+5/bE0PIdtoP
	RuFVSweVZ5oTE27JM3vsVSkq0jaBfEeDTZ/yXqj3Q7zb4aDIpAXm3dLjq2v+4oFZ
	wymTNwD9bHvF8pPNf5emsUhBg+HbchqutQBp88M+Ji7/obtLf9pbXebPlwibiK5F
	9sPPqQeUBiHzpXtmfZi8BqHwPiYNbKOirBd3YLqApBpKRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbsrqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 21:50:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2bcf21a58so88471985a.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427403; x=1769032203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hKeUV2Uhbrfkcr6j7DSR+SckJGwnu8Y7+L8EWtr68+s=;
        b=Xga3NiGDQpMwjEYy+u1fFdI3IOiaEKLefffstzbD4tG+JmB5DxYDGwuJUqXv0IHq/2
         duBXfVOFMM9xgHGiEdPyqghPSsK9HE1DUixaOsp3+LImjNLidReEQHy6V7z7fJBh5rgx
         JUNLczMl8FISoDZnmeeAlhnCI2ETT41NLYhHiYmONUhxoWNq6+lVcCgTm5pb8LUoJbo9
         JUoVreIe6NUWmLS5jyizLgtL7lePbJPBS377YZq1wemFk5/DK/VwUDOHhZrBOjVYqu4n
         qCDn0cdIUadGn3QBJl0JQICycddsLi3spTHTWtAIPbTMPKZ2yYInpYdWN/+qsUzVcBkY
         Kcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427403; x=1769032203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKeUV2Uhbrfkcr6j7DSR+SckJGwnu8Y7+L8EWtr68+s=;
        b=BMf1RSC8wd3n6UOxb4oXnYa3yB1kWk7bhyKXTpQhtJbnGnNsBZaZqEy5Y1i408Nk42
         Ga9bqrWREeRKL+OYqnQVSskmiv0+6joABE1fGUlwaCR3NuZlnz6Wp4W8u75Vjri+U3UF
         NIc9Uko44vxNxU4PaLSxkdjidtC1S3pFixpFzmO5SrzLAjZ5ixSxFiKahdMvafVU2Tpe
         WpBksAHbe/Mp4YTTSux81RqH3zJkHxGCMWHgjw4ivKG9BCust+d31rDWs4G987Ybqsc6
         lEWLh7MNeCNWtrCc7XVbKZ4NuqGEe6yf9hqLkQRN/xazZ31CfwQD0HaRMWcbPlQlIloo
         6jmg==
X-Forwarded-Encrypted: i=1; AJvYcCX77d4pA5ZzTwbg+AU5+uWxhlasiSYK4yVNsoCoAOvpNr8jp20I+G/ypykvH/wV2Xft5p3W6KtOqDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn50Gn8kqZmQ1IaQUZysPHbT4YJc1dFmE1xs9NUE7PetgkyvG
	MlpKFDoR0ldVg2GfqfIuja6dZYMvaZ47Gc+gWDEa6k0nJ61V9pc4G0utTv4TL7CeYncGkGdmVoe
	23Tp7imb5Yu8YLNqZZi1XkPFSZHlx55otsWeOEXvcAriOmUT6s+MXdnTKG2zdx1I=
X-Gm-Gg: AY/fxX5MGjR72mq0lwBl8WD4e+qXCev3GGUB5tvdGNJdjuVAAOFCiqkSyRy8xSkoGpr
	6kROVIzGJ2u2/cnddJ5lmwxbF9w09IAvjJF/vmszWYwoqsVLYpVCISIS7c2kKOqop5zP/Byo5oj
	R4PmbXcMif5QakcCQugNiCu++bt/Fvo7S5jiv4ivEP+8XVSdQIJdWsKpH/sNzuziZH+7cJ5quKT
	irqKzpijLq7aHiOR90B6qcLFzI0+F6tUcSx+BLqU9hGyPObwIQOh1U9CNVh0138/Dp70oodOsFM
	juN5BhGs655lle4JADcxzK7NQctEvnhAKOtwz3ph4hYv/m1lQf29SbCgGVVw8mQdhYg/oCrLRi+
	V0DrhtHCDuF7gd7zbaiZw57efc9rFLaYXpplmxAd45P0lO9gYoTTm/lE4DPziU/pDi/QCtYuS+N
	emrALlFTFExxl1nnwoSi4ym60=
X-Received: by 2002:a05:620a:19a3:b0:8b2:dada:29b4 with SMTP id af79cd13be357-8c5318079eamr480715785a.63.1768427403439;
        Wed, 14 Jan 2026 13:50:03 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8b2:dada:29b4 with SMTP id af79cd13be357-8c5318079eamr480711885a.63.1768427402885;
        Wed, 14 Jan 2026 13:50:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ffe2b913sm44608921fa.33.2026.01.14.13.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:50:02 -0800 (PST)
Date: Wed, 14 Jan 2026 23:50:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: Update
 X1E80100 compatible string
Message-ID: <z6hbqbsbafddo33hv6b37o3rklv7krcxvqi4rmk4f6bnghlwrk@gkeccm5jkqpy>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69680f8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5xImJ3k2O6QUSjG9o0gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CJdtTMuoD4ebMq4sJt3YaiVBtTTXAiJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3OSBTYWx0ZWRfX/aDupdUZv3No
 O3FgOkMXEKRm+K4f6kqnOr+TJgqvdAt9AEGOPmZbPPo60jIS6EEIVWlePx4Mvh0YTbtxdxQpZA4
 /wbocs5/s+glkIyweDuj7zYAfa58lFmanPQbeUdQ3k9nmdrdx/KF6QLfX7B05nDA2M6MyzBKzdb
 d8gLdX27yPXuFUzo+az7T3OgmM12noQiPOD7uoYpz5EOFdsrLklPowZnzg1uHyaXRsdAwkjhuW0
 n0oSsh72uxk/E9/YbjNVVx22FaPDZhY7UJY7aOtxDXtNNgYVnVj2nZ6hvLk0rQU67XreId05rbR
 LAOiZoTIpet0rY04JJAsyHsrd3W1G0Cg6EnPG63mvIKhY78DFd4Y1/GNKOs+HiAq7IYX5x8QnGY
 GQkHUeMgtQasWECRFs76H8d6sMZ+mHt7VIaGz/JaAxETSf03MNezxDn72XXvl1U0iThiDj8IN1O
 R2c433DTS1WaFEWD6QQ==
X-Proofpoint-GUID: CJdtTMuoD4ebMq4sJt3YaiVBtTTXAiJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140179

On Wed, Jan 14, 2026 at 01:17:56PM -0800, Anjelique Melendez wrote:
> Currently, the X1E80100 compatible string is defined to fallback onto
> SM8550 which is incorrect as X1E80100 and SM8550 are not compatible
> devices.

Nit: it would be nice to mention, what is not compatible (BMS).

> Update "qcom,x1e80100-pmic-glink" to be a standalone compatible
> string.
> 
> For now leave the original X1E80100 definition with fallback to SM8550
> as is inorder to not break current definitions. This will be removed after
> a grace period.
> 
> Fixes: 0ebeba917f03 ("dt-bindings: soc: qcom: qcom,pmic-glink: document X1E80100 compatible")
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 7085bf88afab..012c5661115d 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sm8350-pmic-glink
>                - qcom,sm8450-pmic-glink
>                - qcom,sm8550-pmic-glink
> +              - qcom,x1e80100-pmic-glink
>            - const: qcom,pmic-glink
>        - items:
>            - enum:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

