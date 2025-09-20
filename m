Return-Path: <linux-usb+bounces-28410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B899AB8CBDC
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 17:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C4AA1B2542E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 15:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9112EB5C6;
	Sat, 20 Sep 2025 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aD0Ny0nC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2882288AD
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382946; cv=none; b=L5CwcUL15olIGSS2j2iBJsg/T4toG4LTAxg71Na7GoRyYzJPmvBK1nNAydU+yV5vxor8slRndQfugl7Y0Ko7luAoXgd5h5CzStrT6UGrta2lwFWLvhlZuTqS8TSNTnCWdb9JbHk2RmFFdBA1Szciy5TPfV4edBnMJh7P5kXsXh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382946; c=relaxed/simple;
	bh=7N5jlOZYh9u1THddtOHhgkD+bhf1xoM3gGgwqKJdFqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgFZD4Kxtvd29gNtBVKrFzV2hJaB52G7P4ucP3L1XQ6jSRQ1/kWGd9s3nDE0cOCQCIMQRArLrKsSPAqez8a1oYhY0MuMnQe1N1pwYzKcW78BmV8IMWjenHj6XEL7j2342H37coCVVesfGO3ed7SsuFmJOO+L9G3dk0Khcmd/Vxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aD0Ny0nC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3KMxr006534
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ySgCIkEcT6RN//nbWYzuq5eP
	Gh9GHy2GH+slUyUPPTc=; b=aD0Ny0nCLmWMWLln8dhigVD2p98ZjnM7Hhjiy7Io
	OSzpOmF/9xFlnw6RgBm8V7VJsgtb1lY97wWsSaMOYIxgtInXVyUGiapOf2SpSKlN
	CrSnJqG3MwcNHv1tw25TBP3PJNayf95X2XeAUVgzdTA40POrr/MfI9TQzg28wrXH
	uzx6AryKBEzq7YLb1FLqPkUkxdsJHsVbGredFeKi20WlW+Ojl8mjeGOpqHjIrtk3
	Si79Fs3QH/va57PgWoGLIColF0Qr+RkMrSQIRBWnLD7NQWW3Ph7iazPI7GyFRdHu
	VFn1G3do5z/mE8j64iemUdCMxFE5OfG5JcGUO8safeWVSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k989076-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 15:42:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5e91fb101so89162501cf.0
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 08:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758382942; x=1758987742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySgCIkEcT6RN//nbWYzuq5ePGh9GHy2GH+slUyUPPTc=;
        b=M282CtUL/VLX4lRG24GjCxxNDXoGsnAePwX3i+6WKKCoMKjsJnvSHoDrumiirczet6
         aKy50FS0D7ls817G1gOdB0FEcqlvpBgsEx1ga4QMu8C1roUPcHY2CHFaDgO/eEakcFRG
         JRAn0svwuBuBIn87iATBpUVFmG0flhOyTADgnvFn59Bheungl01sWatppkNEVhH//QNI
         ij47bbdvqssGMZk0ayOOGF6PIoX8tnuu8ZH7Qu/ouh7ADVx8qPjT/jRvglFeF/b5CBFZ
         YCIlqmKDsn4XXeWMx3hJphLgUbiwZaeXE3dC+mQYktxwOWCJaItcTSURG0E7dLjthfkV
         CFHg==
X-Forwarded-Encrypted: i=1; AJvYcCUfadCHPU/y5kaJkOtWQqC+TF3plf6+bOe5dxA3bVdcvbgBQpVd+NS7L7gkldG5da/f7x+n9Z60SIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFecIZRP4ZCuGDf+Ub7fgYK281Bffh2EH5Zx+7KAlnZTJ73xsL
	vWC1Ziibs7xnuJbhEM53Zz2P65sN1OgO5TNE6ejSC/XYzMjM3gMJAxUn3g9ESSDB6VaHOPUnZP2
	va0UE4BQAdP4NLklPu/6vG8iw3HwPBJsgUSPjznNZz4Rkr7i9tuH0GgNcjt993y4=
X-Gm-Gg: ASbGncsslfPvCNYml35pqp6TG+1UHj3f/i1GaNZu4b5NurWF1Jm9s2jX9xDLp3/Raia
	JrjG9vVaVGT5OTx2MRQrnu+RZCC+KrTE//huB8uXC9Mtk6H0QLXpAaW02NdAuZQbGG8yib7mZGy
	zbyW7l5NmNGdeiTQu+/uNjZHDlhuEoE7sZnQg5LuEKU92uZ0dyo7IEQ3PtEnz4WujCo65cFPNff
	mKIgaxYXSfqoxKVKBAoUuoopQCNGOeBdtaW6d875Awq/aGn0UPkAdqZ1xhecd+32wytW6XDL4BT
	lNXUAIErWMfyTPPK2v06DBUPHU+bvLsaMBJPWR9URu2j0SOdN31aWK1XNQwH4SVWZYlXyD5olBR
	MgbATiJe6TtEe1SvtUzN7CZQOlL6s1BMEfXIflAZCSiWmAXYFJ8pd
X-Received: by 2002:a05:622a:34b:b0:4b7:9b8f:77f5 with SMTP id d75a77b69052e-4c0735e1ba6mr76977381cf.74.1758382941850;
        Sat, 20 Sep 2025 08:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa7N3uIqh65GWelgeqk16thcj0MeA27XSvrxJ5FJEhQq0QoxcPVOcMSSN3aUJTlhCRSHqxDA==
X-Received: by 2002:a05:622a:34b:b0:4b7:9b8f:77f5 with SMTP id d75a77b69052e-4c0735e1ba6mr76977211cf.74.1758382941370;
        Sat, 20 Sep 2025 08:42:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4479fsm2017952e87.12.2025.09.20.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:42:20 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:42:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 9/9] phy: qualcomm: m31-eusb2: Make USB repeater optional
Message-ID: <umoo45pmamr3qraaiommpqh37tgmqidylmtjh3iamlxs34s7wf@ouug53aqvdfd>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: lBoBmnwdQ0hnOK8d4OBvc1jrEZ7odteW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+7dHXAY+TGbS
 2seVYkbkyN52qQiE7LmbwkU+LOQyMj8omj5iYBF1BRB4rdxckYi5y5qzpvc/7sVxcsp0TTE3kOV
 ZsCDCkzCHDVo0+7ELPKXVCDpPut2crn0sZCVJHHwepVleNTUlNHh06h3aCpeJ4eu/OLQLSY6SHQ
 WUmS8pUM1tzM4PZx/sVraZGJvIGNYEsSNKeno6bqFp0IRj6d5g9ErNpICpPinN9LgFWTaSj21EY
 D2Yb6MkeUgewkUsZ4Ip8UvLEnWL17hm6uMvH0RUwv8QvxSECTn+TFh6j8MX8utVp/HBrr/tqYaY
 zFuo5HkopF61GOqK1wryyi7v3F3DCSmlinWPEQeP4nCYlXTOJo1Bn5FL45fq1m2ddaprTpl8qYo
 DpyXE9jf
X-Proofpoint-ORIG-GUID: lBoBmnwdQ0hnOK8d4OBvc1jrEZ7odteW
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68cecb5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GYK7A1noeA1yCKcWlPMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Fri, Sep 19, 2025 at 08:21:08PM -0700, Wesley Cheng wrote:
> Change the notation of making the USB repeater a required DT parameter.
> Issues were seen when supporting USB2 across different form
> factor/platforms, which led to enumeration issues due to improper eUSB2
> repeater tuning.  By making the repeater optional, for SMB/QC PMIC based
> repeaters, it can utilize repeater settings done in the bootloader,
> which cover a wider range of platforms.

No, please don't depend on the bootloader settings. Instead we need to
implement proper prgramming / tuning for eUSB2 repeaters

> 
> For other repeater vendors outside of the SMB/QC PMICs the repeater
> should be defined and managed within the kernel.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index f4355d38aad9..b8ddadf78c53 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(phy->phy, phy);
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	phy->repeater = devm_phy_optional_get(dev, NULL);
>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");

-- 
With best wishes
Dmitry

