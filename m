Return-Path: <linux-usb+bounces-28641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E910B9D044
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C95954A2D08
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F0B2DEA86;
	Thu, 25 Sep 2025 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtUpD4aH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93310A1E
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763763; cv=none; b=Cn81vQPWbAZPHY8WHSRQIrX7gR+VHg3nPYAYezquY3reCy0qHujJyV3hjWY2zQ0JNmb7cYMPc9ya7zve57dRTv1WzKpvoyHFdB9/RVm4658spwMOOG4mLSmCiV4IsbazSuTiRRguG3GB/yvzvDmZGUJXiwGLxdxILwOGQr3XFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763763; c=relaxed/simple;
	bh=sD0sv3TBC0KMw1V9eMLpdNGEKhtdWpJ8BsqL0n7Zz5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzvAF0w1h1O6LksuX/8flHCJni6DNuBWCGCKhTnt/IUt8+jqQCqMF9syNbbhQWc3x4Zby1baKO/VcykwVxIbb10vivGdBLgNd/I06MSJ0FGIEQI69W2uYJTNx7XyUAjv9G8FXDTsuyTg/cvccNq2ePsVQut/lQhxB3qK+ZGsUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtUpD4aH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0dRQq002118
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nuNK7T5DMoCfeLehWypj1GbI
	p838IekSq4r6kPWaJsw=; b=HtUpD4aHVrML9VGB5a4rv4i8ZcW+b6IyZ+IJoRZ7
	IGi/4uDN9wJoQ+BSsjF1iFvLWPVPvVZAgRBOpDNrHRphXviBI9eB9XlfBNpyIAnH
	WA5cDwkBTU9JoS5dFHGOmtpTuUOUII1Q4tWHwwp7b/pJBKUPjrKmigO6+LsE10iA
	V3vZfaQvEnl50ZNpECdrkoOVXuMFCaKS3FCM0zbpShCk1jhLZTIkeZajV1n2i1we
	wrU78ckyvcJiVdlxA3ymKSSex4lnTUEyP7MHPhZVygJj6TfJW4FpAkew25+pgo0X
	soqnrZ0/bQJmwxYWZUkarslyU1hjJjFTNuJ6y7KHH5kmmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pabc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:29:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d7f90350f3so10870081cf.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 18:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758763759; x=1759368559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuNK7T5DMoCfeLehWypj1GbIp838IekSq4r6kPWaJsw=;
        b=b+CEgYTu0yLOWk6M6bt069XdeUFmLoZxgaef3BI3pvMst1B1aMGxnnc3CoLMHK1Ou0
         /sWdtLlR814g+n3UnplfJH9IgtV9A5cEJ5lHILdJcQMkehzRNAHJ4kZ5EFZPdzD7wVaf
         pfDmi0B8zCCAcFrgQXNYTYs3LLNvL8WWGqLNinymSjqVgGg5+hwgO3eRNB6IAZn7FL+u
         PIApwXSHL0T+61vKJXGLFA3CI0hXOSUKIceI4fOs5eXaDVdDrIUSdwF33V3l1Tnd0MPZ
         HH8UJiljyg0bu6beGZq0lCKpNJQkpuuwNjpNRkGQh3To4KbzYziWjEjvcm3mzTu5xUIG
         7Z5A==
X-Forwarded-Encrypted: i=1; AJvYcCXWX9N/CgvXzk0ptW97ND24hBMW4bwGEIvEwanHrpls0UXN63m0HPHukdFtqhPge5GpEN7S9SCAHJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMBJrHXC3fAa3sQGq6WCQR3sedfzI1d6mXC0EBF7Kgyb/3ZAXd
	pOjWmLhOZzA8OC6iLnK0/GIreUbqDCH4Nx7ANR5tyeFxJ8BI664q/GDTjYVsFmeKxCJsLefKrHs
	FcZmNbINKuXvtj6WC/1LrNMYTygMrCae2C79zlexwSobTDjNRixmS/8CyNbAY6/A=
X-Gm-Gg: ASbGncsb7pEuPBYcLI46WDol8igJOR7VlhbRb170QXdh5OCclGYKm6hlR5FOoen1RYk
	MDBbAeUQFhvRypFChcmEdI/wdCBQ2+68J+9FD4keUHR6WrB60GdLWWff0bgdWFwWq5EHN02KyqH
	JBtwLd2pddb3PDS3AHjb0fr3HBm4K97QKghx5mmubayN7gxk0tMiyLaZ95wg8WJi/lCHanlyPtB
	CBc7CqTwcSEqyOBH4ZhmCibYXEQWg50AqWtA4Eyyp7ALyqpca8o257wYyld7JtCy7xnkP5MAuSK
	KBJRdhYl5LQ7MLyP8f1MXIIYBeZD5LbY2OG24cKoUF6sctoyaMIShTqBus7QJmBNuxfi94hJxej
	z22Y+kgsf3/NW6xKZxm9rAVsJqxVHpZ2g5bWGPDqBBUoSmVYA2wHK
X-Received: by 2002:ac8:5e4f:0:b0:4b6:3d70:8810 with SMTP id d75a77b69052e-4dacd244d25mr11227251cf.22.1758763758895;
        Wed, 24 Sep 2025 18:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbXt6dQDxjOzbNg9IrWf3qsSEdLVIcZtX7vGPsgYxRkHkV+RizhrTs9YlBAGqCYeg/uaivtA==
X-Received: by 2002:ac8:5e4f:0:b0:4b6:3d70:8810 with SMTP id d75a77b69052e-4dacd244d25mr11226981cf.22.1758763758390;
        Wed, 24 Sep 2025 18:29:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe8750sm1814621fa.66.2025.09.24.18.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:29:16 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: Re: [PATCH v2 06/10] phy: qualcomm: Update the QMP clamp register
 for V6
Message-ID: <v42k6kmpzcq6aa2c3bgaga3xf47ucg6q4qduwg7w6v6672s2eb@hfpwd73pv6gq>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-7-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-7-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: 6CvN5o5lYbr2hCyTX4KuroSEzHEHF5oD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX/a0BQ0eyf82t
 MYhe6DrPE339Uh209D2lWbyTAQXC0OB9GFXPzhLCQO5T0N765jEClATvYuApAHNkeQ1E/wZ0X/l
 2pkU1qAVRs92woN4QW9UhQ3C+DTT9j143NekUbMrkpxtVXG9jtpCTo1oAq/T1uQ0bEHDUd7KNcl
 ogHe7eH+66QmhoUW/2ZeZSNGQQL2IPB/LmkxI2Wo5OgzhHtai6vo1OFsXHqVHMvosN8EuaPuKry
 l7d2Lll7bXvATYYC0U/Rw4WxQP9f91f2+/X3LKZiBsvMWt6STokfFjvynmfzqlq9k1apcxY0TcS
 VP0Jb7v572aC4Twhc5sCaMgzPuFiPGNmMXCOMDRkxJRqpqFwPmzZLOv3OVin+j0zAZyhfx5hwkG
 aTcU5JKH
X-Proofpoint-ORIG-GUID: 6CvN5o5lYbr2hCyTX4KuroSEzHEHF5oD
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d49aef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=IuB_klkJ-YW1I7EZuIgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Wed, Sep 24, 2025 at 05:52:24PM -0700, Wesley Cheng wrote:
> QMP combo phy V6 and above use the clamp register from the PCS always on
> (AON) address space.  Update the driver accordingly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 38 ++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 7b5af30f1d02..1caa1fb6a8c7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -29,7 +29,10 @@
>  #include "phy-qcom-qmp-common.h"
>  
>  #include "phy-qcom-qmp.h"
> +#include "phy-qcom-qmp-pcs-aon-v6.h"
>  #include "phy-qcom-qmp-pcs-misc-v3.h"
> +#include "phy-qcom-qmp-pcs-misc-v4.h"
> +#include "phy-qcom-qmp-pcs-misc-v5.h"
>  #include "phy-qcom-qmp-pcs-usb-v4.h"
>  #include "phy-qcom-qmp-pcs-usb-v5.h"
>  #include "phy-qcom-qmp-pcs-usb-v6.h"
> @@ -78,6 +81,7 @@ enum qphy_reg_layout {
>  	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
>  	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  	QPHY_PCS_POWER_DOWN_CONTROL,
> +	QPHY_PCS_CLAMP_ENABLE,
>  
>  	QPHY_COM_RESETSM_CNTRL,
>  	QPHY_COM_C_READY_STATUS,
> @@ -105,6 +109,8 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V3_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V3_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V3_COM_CMN_STATUS,
> @@ -130,6 +136,8 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V4_PCS_MISC_CLAMP_ENABLE,
> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V4_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V4_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V4_COM_CMN_STATUS,
> @@ -155,6 +163,8 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V5_PCS_MISC_CLAMP_ENABLE,

Not defined

> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V5_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V5_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V5_COM_CMN_STATUS,
> @@ -180,6 +190,8 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,

Not defined

> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
> @@ -205,6 +217,8 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>  
> +	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,
> +
>  	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
>  	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
>  	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
> @@ -1755,6 +1769,7 @@ struct qmp_combo_offsets {
>  	u16 usb3_serdes;
>  	u16 usb3_pcs_misc;
>  	u16 usb3_pcs;
> +	u16 usb3_pcs_aon;
>  	u16 usb3_pcs_usb;
>  	u16 dp_serdes;
>  	u16 dp_txa;
> @@ -1836,6 +1851,7 @@ struct qmp_combo {
>  	void __iomem *tx2;
>  	void __iomem *rx2;
>  	void __iomem *pcs_misc;
> +	void __iomem *pcs_aon;
>  	void __iomem *pcs_usb;
>  
>  	void __iomem *dp_serdes;
> @@ -1960,6 +1976,7 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
>  	.usb3_serdes	= 0x1000,
>  	.usb3_pcs_misc	= 0x1c00,
>  	.usb3_pcs	= 0x1e00,
> +	.usb3_pcs_aon	= 0x2000,
>  	.usb3_pcs_usb	= 0x2100,
>  	.dp_serdes	= 0x3000,
>  	.dp_txa		= 0x3400,
> @@ -3345,6 +3362,7 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
>  	void __iomem *pcs_misc = qmp->pcs_misc;
> +	void __iomem *pcs_aon = qmp->pcs_aon;
>  	u32 intr_mask;
>  
>  	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
> @@ -3364,9 +3382,14 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
>  	/* Enable required PHY autonomous mode interrupts */
>  	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
>  
> -	/* Enable i/o clamp_n for autonomous mode */
> -	if (pcs_misc)
> -		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
> +	/*
> +	 * Enable i/o clamp_n for autonomous mode
> +	 * V6 and later versions use pcs aon clamp register
> +	 */
> +	if (pcs_aon)
> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
> +	else if (pcs_misc)
> +		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
>  }
>  
>  static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
> @@ -3374,10 +3397,13 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
>  	void __iomem *pcs_misc = qmp->pcs_misc;
> +	void __iomem *pcs_aon = qmp->pcs_aon;
>  
>  	/* Disable i/o clamp_n on resume for normal mode */
> -	if (pcs_misc)
> -		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
> +	if (pcs_aon)
> +		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
> +	else if (pcs_misc)
> +		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
>  
>  	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
>  		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
> @@ -4075,6 +4101,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
>  	qmp->serdes = base + offs->usb3_serdes;
>  	qmp->pcs_misc = base + offs->usb3_pcs_misc;
>  	qmp->pcs = base + offs->usb3_pcs;
> +	if (offs->usb3_pcs_aon)
> +		qmp->pcs_aon = base + offs->usb3_pcs_aon;
>  	qmp->pcs_usb = base + offs->usb3_pcs_usb;
>  
>  	qmp->dp_serdes = base + offs->dp_serdes;
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

