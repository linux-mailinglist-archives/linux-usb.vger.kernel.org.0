Return-Path: <linux-usb+bounces-24271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A0AC2ECC
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 12:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF92D3A76DD
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 10:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596581A23AD;
	Sat, 24 May 2025 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jopsFuCM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0E18787A
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081505; cv=none; b=c/G0IE2fqz7PxpX/67yuGgYkrwZB+qZF9Tp5EJ9hsG2HIYEoXLhADKq7AuJKd+wUtHyrz1HxDqDPGdpoEZuc5G/IeFlk1O3ptW633IbaV9Hhd0fJUE4l4DnthHRe/r9CMtaWXr2AKsSqhVs6IOiSJeohCbgH10auIG8sli91qX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081505; c=relaxed/simple;
	bh=yi0nJZG9HpJprpjPC17cymVzwqzBeojV3kBquhceHpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXRhnWXB8EXFSh9xBqnOY315tnoNzD8ZQiUSvtR29YP4yQgY2rSrpnQReXs8vVgZH8Hco67MDETGxX2s1hBMTMwy342tZ8BGct6wHaS08858CaLI079NSkRMBbGLyNmFtFaj/9GWfCJmlWSwRhQrXFhYOq8mSjZNlRxSDmIbTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jopsFuCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9CB8g022333
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q5Ywd8CbRuq6nVjt49lYrhT3
	U7K9EU94H7oOTbzR8PI=; b=jopsFuCM3uH7xTo+LmcRutvUrKk8LvTQ4RzCmBBT
	Wz5jsSkBvvtseKSNOO6c0U9M6h4usQhgyFrm/nO1UGodVGOJewNzKra9ndhGIno5
	CAffzgMWOo/aAFroUIbYMUgMbmHcekJ5RpylhFA+6h52rRgTDlK8mCzQwYJeuNOo
	++Jo+R/Tl4eh+ypL45h/NOnWao13fq+N4phxwPUHWCTDqLOyf9gd6Lv76aHiSNkr
	/1TLAuvwwNh102RQmDTPq0zmK0Vg/dSLSipkZYZqdBmEtePHcxIVqrwnsfIE0mBX
	VCikBpu61ee2fhcSgW0Yl2xdirPWfnAUQm/KMw35xwgpXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3thrp9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 10:11:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so13055676d6.2
        for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 03:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081501; x=1748686301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5Ywd8CbRuq6nVjt49lYrhT3U7K9EU94H7oOTbzR8PI=;
        b=Z0CYQDLGHQZps2ejM+iCQ4ZchG/+pkr1bFGlRQc4uvGIqTJIS9RjAzifeWn9UEdEP1
         zg2TR9o/f7fNrZw8q7EZu/MfYRWA9lrLlg2mL6rl/pNuq4c1plcfIVB2kKBxpF+Aozps
         wzeR+7BGA+x3uVTqp2jFygv98RXc0PxZZ3Aitt+cmBpFsZGPQWdzWKRwE1M3vuUwqAM0
         47btx9MZ8X57GSB8rrNFT9oggMTDnufizkrOK6Ti5teFYXwqkF6xafK6cdiIoISccoML
         izMal8sjK9oI/cxzc0ItsHLBm1ttjxNSeWvFicjqhGiz5uudXwH2tlbqahBxzSH9mNel
         pz4w==
X-Forwarded-Encrypted: i=1; AJvYcCWA9w06FY1F4eSXbMODIOG0gMzui0LtX1BE6NRR1fNOhqKaswRVlacHAQ2A4cbU0LAM2kRgIQpMDWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QMbunrHBafOPrypbpp7ZDcJXnPXRSmRuM4eAZ6JtN39ck13e
	mk6Z16kxWjdtCdYa+/tC4VrtBnEQimb5daYs2d3tu0RXfYfz/aZGkScj6+BhpzgxYURtjHFDag9
	PUMTDNMVBjIVv80IO04L6e+i9SLmtwCDNYeDeqrZMqQK7qdREG7sosDL/GIUWR1o=
X-Gm-Gg: ASbGncuGtGIYGh8tdYv0u7cl9Hf4u/6s1/rhm0sUNm7s7zW3kDYUBSvfNm5zA0HpYSW
	rwVTtjVudQsmsfaRt/gUO/gFb56v1EkTILjt+QXBc59lS1LiDM7c0Y4rmN+r4BQ/z+WtLnuYACy
	+nsMlLW7/JwDWpTIwhuJAdfioNyaIZGPY7f9zdrULgivQxvkEYabSOijqxNXzmU+/ZPQ6M8BNsJ
	MPxF5Yj3etuvDmjzGQTdvLLsIYmncP2pxXyUUh7Xy0xS/JTG83y5kUyFkrJyXCKJ+9v2qFNEGa3
	PmRdeWkuB7QFSiDqZkUoNpPwvY2e/qYq3L1ymIYZ5EvEB1yae7K3PAFbkiab0F+8r3sflcHPL5Q
	=
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa9cfea4dcmr46563586d6.4.1748081501046;
        Sat, 24 May 2025 03:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3xlcfUJq8nA48ODJlNUBRaEf9+7/QJQDSqq3iA7gxZrJiVGayzAZZZ+Q6hrv/sh+JeoK21g==
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa9cfea4dcmr46563106d6.4.1748081500681;
        Sat, 24 May 2025 03:11:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c78sm39724731fa.36.2025.05.24.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:11:39 -0700 (PDT)
Date: Sat, 24 May 2025 13:11:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
Message-ID: <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: LDAR4j3SQSJWjiIasX2JaAa52QWRkrX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5MSBTYWx0ZWRfXxzU+f4971GAb
 9rSu6qwL83OJYShthKHp3g4OgS02DT3c+vPxK6bCqX3h7ZjZUyi4YxBvfRYgDGoerYAg/qMPeN3
 l9FoyVEzihCmnhDJ1BVRYu0Odoqz/4frafE0MfXDAeIuPy0vrsAbQ75plmPzqrEDbIwCSCG3Jk9
 sgdDdabDijDzSBM+yZUL7NjCJBZV615fnmLBzg0iT5zXICACif3fnDAJDYZ28rlYwtQwV4HWcPi
 b3SzJmAkxrshmfKYlP9dhttQIj6Q/zN/vD+/Oo57PRBOTqTSHaysr44F/CcsO//4/y/6mQogt2M
 Q4g3VBskvZKV3lOf20h6k093wX5n6lfZ82SENXtBaTlg2HSSzrfPgx+i5jWnq3BglIa/8vS4xr7
 aOlDfaKV1H/D9SodhsW55/ngEvC0l28oTY4eeSD8EDLSsPLByWG9bsETwXrYOE6utXO2yMh7
X-Authority-Analysis: v=2.4 cv=e94GSbp/ c=1 sm=1 tr=0 ts=68319b5e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=cusL2G7gvvxGUya2EAQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: LDAR4j3SQSJWjiIasX2JaAa52QWRkrX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=752 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240091

On Sat, May 24, 2025 at 11:19:12AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Thinkbook 16 appears to be an X1 / X1 Plus only design.
> Add make targets for normal and -el2 variant.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> +

This will break without the next patch. They need to be squashet into a
single patch.

-- 
With best wishes
Dmitry

