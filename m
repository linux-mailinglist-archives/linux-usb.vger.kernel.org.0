Return-Path: <linux-usb+bounces-28644-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E9B9D05F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D90A37B51BD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5102D839D;
	Thu, 25 Sep 2025 01:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eslxo5rj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B101C8631
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763922; cv=none; b=lsIKV0vQN/hQVe3Mu+rZUuWHxjqLQZn639EEgeHyxCg17rSKTbs1auJ5lkQcWJIUQmkSsirt08OrXJ7AVY2vUnA+ACVGbbhUATNqImGuSqPjmA12tdjCD+NfohVmAfOhpnNtMseU6X7dtGqTNtaNDS/XJnrE9O2CxlcWTH6PRLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763922; c=relaxed/simple;
	bh=B2W8QlDRPUbYId4RKLCk+SpL4pdjrDWi1n1TRnKMnVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWXkRQCjyVTgaKB2wUfxWdhfvdf3z17JrU47FodRdA/bI0QHgr0u2D8BpsXuonZx7hhgcwusbO03X3OVfasERgH/xRX8x8vxOKWBXWWo+23ENFSP3guPAfh205pQcFYIDrzcJloiTmPVbNApCChMxLMr+WH4jTFbhOcNAL2rqFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eslxo5rj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONr9ZB027915
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HMxLUM5IWdCMDI4XHlO17eGF
	SLCDgAm/nD6cVTEGZY0=; b=eslxo5rjDla+eOEEdGfqGRTwnttf8tUIBzdpR+nn
	A4DgL5fH2+zyho6V8Zhxi/B6F39cN617tkrQ3766A6SBI0epMBeSQ1+vRbVfr2BJ
	qzIzQmIU9LyLkBwptGhUBKBxkqXIBhtc3GJAJegPIcV4/CpXI8GgRh5M115n+Ivj
	VX8YG6ukLb4r2VuY2q4If0/7/60HHLfnlYKhWfT9pBxU+C7SISEKsAsriI7Bxfje
	y1gkt67cdyVRD2TQ/0AJNVRCZWlGMY6wLkJjnU6McRw9mGTyj+U5Gt5SNS+K//bs
	l+05RwE0xGPbDZSVZBEc3LZwPHS3ZvDHs0nYuBKc6QWUXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxnd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:31:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ca4eeb9b06so10316461cf.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 18:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758763919; x=1759368719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMxLUM5IWdCMDI4XHlO17eGFSLCDgAm/nD6cVTEGZY0=;
        b=KxTFhCcd8eRcxhnoWwPc8WOAEd98r5BS1R/DUnmGfnDr0vORdNId5RLKg14PPs5m5H
         TcWFfZPHX+Tm1i4qR2wRY1G3WUk6Z58UfSmSoDq6EYCZuhhmrzLdrOc9iLUKrYP34aRm
         r+cVbhmVvyDeYS2HHlQD/FQEp88O72wxOF8KhrCtDqGTV9ZaXT77I86jwzBedmiCzM+R
         hOmuBbdk7jYlhchLmOSm4Prxt7H5i4xiMILjkM6EX4cYXB5CYns4/xD4MyhNvw2xBZOR
         cDTtB7ZhM+H2Fs4qCIsihUCZpurfWUnM+slM/qhKlQiR+LlFlK1YwD/Bs5EHkUj4VXLL
         PaNA==
X-Forwarded-Encrypted: i=1; AJvYcCVaae3opk+zwo19T2XEnhXUiMjUB+xMuuO3dnSIPwyBCsioN2NkNRROYChDO+uzVEvVlVwFlx2b0Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+/T7RPsDzTB7AdOItgq5X8XkzkMpuUECRORB3TW2ynyHLNCn
	OZLDVMdJUGxGtnuiqLcj2G+GznjxJYZtDYVsmA2rfvqGYZouV1lm1gTNbnDCB+Mu0acWQrP/baC
	NKVfxLvAkJPX4CQiLpv/1Sf+M/jdPlHNxvYqtXZHQJzHIw1FPj+jgD0nJQ+YvBJE=
X-Gm-Gg: ASbGncv7/eIre5fDA5HZ2Esb1YZHPwHY/CR7GkbTsuOFAoUh8xO+3gUH6kkL2KxKhGV
	9RnWSnq8z3m3kI7zpElES/lEjff/G8zd7WWHDBYyX3nV7qH3vzxlAkcpfaDxz7CKa+eC9nHf4KP
	LlnrY3W+lUK9P7YcHrRX7nDUY2gAa4E5c+oDsYA0Yg1+wiGIsa6plGrZ4GAszBk61VYcwF0QaB7
	7u/aRRwuq5TwC2BXT6Jebw4uRBMDSDg4hOUs5CnxiRvZwNRxdrWKnYCze11KYVt633/JNRqy/cO
	hbaVg3nLY7CRYwp+OVveNG5MzesEztwOWZxYBJ4dZI+fgrc37wHisz4o/JuRNHeZ4KwQZGb7igE
	K2711zNobVlLLvx1yIr705iMrQg4O/0ORkmdEXHVwombMqtdjeH1U
X-Received: by 2002:a05:622a:347:b0:4d7:9039:2e8b with SMTP id d75a77b69052e-4da4c77c44amr22446061cf.72.1758763918652;
        Wed, 24 Sep 2025 18:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLXkB79ZdwIIrxHpR8mHmz6lONhQNuhy+mvf3W6YwEGNNidGZE2ggTMtevzJ98w35Q6vuNCg==
X-Received: by 2002:a05:622a:347:b0:4d7:9039:2e8b with SMTP id d75a77b69052e-4da4c77c44amr22445871cf.72.1758763918237;
        Wed, 24 Sep 2025 18:31:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583171e50d3sm196333e87.139.2025.09.24.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:31:56 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:31:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] phy: qualcomm: qmp-usb: Add support for Glymur
 USB UNI PHY
Message-ID: <fo4jg2eewahc7iahfk3kdzztpcami2wic2kocgp6m2c5nzb3ma@idfpo4frh3eb>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-9-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-9-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d49b8f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NGXOFnXZFdVYdcUjdRcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: jhcWg5dewJIv4mLcfSMfEbis-xPlA5jP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX5nkJr/RZKgmt
 BigUtcPxjbegLnIb3g00q+CDnlQJavxpEj8EdWJeVK6I29VzVETO9J0BsdZEl8vKTR7EORGm9KH
 EIhLQpjcYiU3XwGpkTsQV5+wefJUrziYeNXaWTGsG6p+Er092ASCbBzBF4k/OjVG7tyzKKUkNbd
 t5W9GBoogrQD46zJ9y7Buc32OtFbzXK668GBQSSGWwGShQKR5EyXf8I0zDM0v4jE2E+UunBedd+
 8SbL6fz1C4kuSHmvHx1BrjXW+MmZ3PdWPEOZpHscptpjCyEQElrW3A76rZnQLFZft5BZ3Je+n9r
 XVSenU+ojKg0+D3G6lB+wdtN8i//WEKv6UDhs2faJtp+FFCwPFlAD18obZY+UVzUHb8L6JWIv15
 2ZxYssUQ
X-Proofpoint-GUID: jhcWg5dewJIv4mLcfSMfEbis-xPlA5jP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Wed, Sep 24, 2025 at 05:52:26PM -0700, Wesley Cheng wrote:
> Glymur contains a USB multiport controller which supports a QMP UNI PHY.
> These ports do not have typeC capability, so it needs to be differentiated
> in this manner.  Update the QMP PHY sequence required to bring up the UNI
> PHY for Glymur.  The UNI PHY follows mostly the same register field
> definitions as previous SoCs.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 163 ++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index ed646a7e705b..50e31610ce20 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -28,6 +28,7 @@
>  #include "phy-qcom-qmp-pcs-usb-v5.h"
>  #include "phy-qcom-qmp-pcs-usb-v6.h"
>  #include "phy-qcom-qmp-pcs-usb-v7.h"
> +#include "phy-qcom-qmp-pcs-usb-v8.h"
>  
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>  
> @@ -1240,6 +1241,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb3_uniphy_pcs_usb_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V7_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
>  };
>  
> +static const struct qmp_phy_init_tbl glymur_usb3_uniphy_serdes_tbl[] = {

Please, keep the file sorted.

> +	QMP_PHY_INIT_CFG(QSERDES_V8_COM_SSC_STEP_SIZE1_MODE1, 0xc0),

-- 
With best wishes
Dmitry

