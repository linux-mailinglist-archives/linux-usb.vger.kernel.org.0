Return-Path: <linux-usb+bounces-28663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB6B9D3EA
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6822B1BC0985
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D1A2E6CBE;
	Thu, 25 Sep 2025 02:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oC6v6fJb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9727732
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768904; cv=none; b=TNJrREdBFQxgHlvWdK72FDQ8C4txsYap/d0URLbosvmoaRusZaxP09PCLMFxCQnLcZW7gfGkI3jEj2vglZsGBtIPCT3fv9pz7fVx1Gr+ABS7JhtxDcmhBFlgJaJOUeliuspt8ICzaTbd4UNF6s71x2QUWUhtR3w0r6B3Ko9agkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768904; c=relaxed/simple;
	bh=GRzW2UTFXjkMbCv8ZuBiMaxnc7z24scaXvk2FiPQdfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak9c/endNTYUET1m/kw399fumHDkSug9PlCJ91J85fmIF347LaaJltrPCA+XSVRGL8f01SvraktOdERol3h5+09bYIF+SO+Vg1wGt55SrxOy9xnTHXEwHdad1GfAEP/Z77wCAhLQPeyTC2QjMTd4SJKRuWaEIyyCymVFh3eCgbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oC6v6fJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0OKuF001948
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5qc2kjNdpU+Ilinxlsz6Brx3
	M0lwHT1wZVUtKam6+GA=; b=oC6v6fJbG/C2Sv8NIRf1HC8NhJtgOv1kmlCBKK7V
	W6gZjv97Nth+siQt+Dp7WQb7vfjPWg4+m6Z8ZtbATMtkYqFjUCDeuTn2e1183bZP
	xfiv6fkvr8VrHLmzdfSl//F//rdC9/BlALYGlBZM78WMD4VYBatfJ3Tx0DBZxzci
	f7WMwWx5/Pfsd/MZILKCGUUQ60kkisntAJ3gmytOWKQxRoMv80PZXJxtBuW9UVvt
	SLYaJEccjYJHZbjM7CE5k6xzhfV+/iZyy7y4TzP40IQljR1Xqu1NQm9Y0uhAO57/
	gWa+ArYwrITDdyyiF4NYyNMvVsJB7L4QETVfbQM4x6gXvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pgqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:55:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d77ae03937so13760221cf.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768899; x=1759373699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qc2kjNdpU+Ilinxlsz6Brx3M0lwHT1wZVUtKam6+GA=;
        b=oDQzaOVRkZcnswID2JnAbe58YyNeWEQDuzc/W2N6ZdX6YB7qHqEGtQqFEAuaQXZej5
         c7BGKmxjfr7iUZGuvG/uC24P0D8QBK82gFc3oYaCrO7+HyFULcglVGbXFeKnNQMR/dtW
         RJga+H00sw6PEXrCbYa/hcXln4FKL2Cc08fn4HBCDkLEUZ/5S6gRpl8LhIlnOPtqSQq5
         VuHH0y7Yh6PyMsK6lNUyL9AkhQGf6wJZF8vw0WwsLBNtgzHWvEKL4JMUoRv8Cnm5jY6s
         ZK2a1fba3JYgk9nLLb3ZuKTXO4NZ7PnfTQNJROSW9hgh6h8YBETCxww421w6kkZrVFGI
         VUWw==
X-Forwarded-Encrypted: i=1; AJvYcCVmu5EklaubbuQ7vgja/frmoZiszVTnLSati2ojFKRl9Y8VZfq33nmT+M+zyoh5U+7ApmHMb7g7vMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYX61lo0gvd47HRVmS28Pw07jQ1dW6ubW8Wvm0kOfx/ckSGEl
	zFx3lQrcOOVJF34aInB64ol3hsn7zSw6o+kSJI0xLIkper3vhbhM0/eRNaMHWCIic8Ia6ObXE6R
	XUvhhriwm7WnYRKGb/acbApXmhNr8eyu9C2d36mYSaGDQafkeU21EG0S2HGF4Yk4=
X-Gm-Gg: ASbGncvDLy0HAqwwK/hILNoG6wus74PUxX3ChHIADzq1JofEufSOJiN/qanaktMqM7c
	O3LgPu033fXn26jTdgmWyrVx9a4LcpbLjZA3BBtRm2Nsc83zjnaeW6dmVVT+mVcZeblSIR+rS6Z
	xf0K0MMlEBWrDzMGYO01BePAgzcfZ8ECbN1Bg8Ra1RIfD12/TOXb98a2Q1hIWG0cw+9lhKxFJyp
	9vKhcax3P86plcgpgjB5ep9k7LUncjVWfmaY28zwb4bQaupT9DZylaDs5Aj0hi+DFMHth9jDPr9
	VoWgrLW6BdvskhGU9PK+ASP23vg9QYXaI/eXmk4Un3BkbZisPR6VQ/MybY+HNeoVw2ml6DlDOI/
	e8wAwXsXlVCwc3FCBUs2krQFRYnys9gVONGhs81z4wow6nd85m//E
X-Received: by 2002:ac8:5f53:0:b0:4b7:9ddb:abbd with SMTP id d75a77b69052e-4da48c83c0fmr29976521cf.27.1758768898902;
        Wed, 24 Sep 2025 19:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+wX0KgM5CRfCAhfR9yvHW5QMrj5JET9e3yAt5sYvlw+SROD2nT79PnMZGnXjEN0cJtYx4zA==
X-Received: by 2002:ac8:5f53:0:b0:4b7:9ddb:abbd with SMTP id d75a77b69052e-4da48c83c0fmr29976331cf.27.1758768896998;
        Wed, 24 Sep 2025 19:54:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff5f0fsm256240e87.135.2025.09.24.19.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:54:56 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:54:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <oecyjwj7ouufjbiq2fpvlhhuaof5agm22fdsruf3ppayiu4kkm@wvi4no53x64y>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: KGqm4poU-lKbQ0rE_80Qm6HUJD_OAkg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+6iEPC6+AOhH
 50SKj+qlAyvtKTfR0ohAGRrSJzEOzpxDLDeYVNi1GACEl1+/kgcExNoxzxaOV925ST/KSe7MHSa
 e/J631BYqyZumjIEZEK2aq3lZVetOs4QaXJk1VbQbaPcb3Xbc0+ZU5Xjv5NUqlnrO3EM2aUGtv5
 wSi4xeMlPdoU8729Zo7lfujwbqq1FZS/b/EfMcn8T8TME9vQP3zqYPic/R9mFoVq97kCWVBYz3F
 lWbWB4lgPj3lxYnGDdtw79zlmuDOsY6yopa+FWrSNOeeGhoVetesleMljSsvGxfhoS9vemacZU5
 zAhqGVAGx5VuoRxDTjrrp0GxSYhvyoQcmhfxEjigPmqvRMr61thvxVRs8o9yO9hOmyT6vHxh1uX
 zm+jdjcm
X-Proofpoint-ORIG-GUID: KGqm4poU-lKbQ0rE_80Qm6HUJD_OAkg3
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4af04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bgMNcTsuivlx1WpOe6cA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Wed, Sep 24, 2025 at 07:28:47PM -0700, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +
>  2 files changed, 314 insertions(+), 1 deletion(-)
> 
> +
> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),

Why is this V4 all of sudden?

> +};
> +
> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1, 0xc4),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2, 0x89),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_SIGDET_LVL, 0x55),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME, 0xa4),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_CONFIG, 0x0a),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_DLY_TIME, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2, 0x30),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG1, 0x4b),
> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG5, 0x10),
> +};
> +
> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_usb_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +};
> +
> @@ -1667,6 +1899,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
>  	{ .name = "vdda-pll", .enable_load = 36000 },
>  };
>  
> +static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
> +	{ .name = "vdda-phy", .enable_load = 21800 },
> +	{ .name = "vdda-pll", .enable_load = 36000 },
> +	{ .name = "refgen", .enable_load = 936 },

Is this a meaningful value?

> +};
> +
>  static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
>  	{ 0x00, 0x0c, 0x15, 0x1a },
>  	{ 0x02, 0x0e, 0x16, 0xff },

-- 
With best wishes
Dmitry

