Return-Path: <linux-usb+bounces-22751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FBA80699
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 14:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE3C4A345D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 12:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104F26B2A4;
	Tue,  8 Apr 2025 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLwBGt9R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96C26B092
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114702; cv=none; b=QQ18PfeVjo3SG0J64g4A39qv6cj2X3/OOHk50tF2PupLcws8hKe53+AFcxZVsgW9bFBePPrFelZbpl4TuM/wUeb0UuQ6n9WR5nVXx2o3HF4EvMkbEymSFuWjgpGDuaSf1z35N4NpsAs03jNb0qUZ69G/PjkY4afpFAFYE0owgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114702; c=relaxed/simple;
	bh=ojpl3R7qQEv816bYbLyXuNTJWAZHR4sSDd3c8WkLDOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbArWrsjib8mx0atmPiB9Fs5yB9jzrKZsaZFWq1VjQgumt8sTrkrdY3SdkccqCmWaekQTXJFqxeCPqqd7CEDZU9fs0GjKgFwbEK6HZn2XCasMA59VpZinnwlqr0d8ClJTfMiPCRYZwcGtnzDiz4mf377UnPS8E7qTAcWbRQ6zbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLwBGt9R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B8ALf019572
	for <linux-usb@vger.kernel.org>; Tue, 8 Apr 2025 12:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hTasaWk4O1x7oCPw4TPr50jW
	GCj6aihBh3sw6SWrF74=; b=FLwBGt9RpdSk3oPdhWTCafzOct+Ppd1yHQgQJbVB
	muNOXwKXW3ZuhGBJ2sGDrwWQrQxwd08KnewvA5KgP17cn2nbOrN+KAlEoPLQ+M6T
	aTKGYpI0mDpKzIuD+ikkT6tJoSZ8Cp9jYdA+YeHGj6iA2oeeWJjzdlScmV+zKxpz
	c9Y4cYzA980S3JvVcSmbbNMIcJCpA7shvv63uHifg+KMi0zOCItCmUkKjomeiRUA
	jELfp7ua+PSwqhgXho+GM1+95kaMOOOPHhWGSwMusnNjSxsrp81NbUDIcZT6KMUh
	Si93NtH8dPoVYF1/toLJn4OyOpVav0xjQgD0RCiOSh8kUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fp49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 12:18:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c57f80d258so1813449885a.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 05:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114698; x=1744719498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTasaWk4O1x7oCPw4TPr50jWGCj6aihBh3sw6SWrF74=;
        b=SlNPse8tW3SiwZQUSccbdK2iEx3FZxN08k+1afXbLSgdkqxhQj2LBlK2YtlPBckrSn
         HqzxAZUQiLY7bolHz+tR3e1vtl9IM3YnQ8MpE9ambiQH9VQsXnh0hKhJQ0NK11TPpmu2
         OecmwD/N4EvKR/ALeKyDOqYOfUmBm9EN0V2rlKD3Ffhr54b7YIV6CgDypm+2px3YrUVj
         Sold7tYJtLXNVarmHpP5vcTsT/wqIoKsX7YIjIGYABA0ilXb5T0sebCXkiUBo4mGw51P
         RswuXDb0ZAXar+8YeaITuChtdy3hu1ySd7vMo68qhKwqcJaVIVRAL6wQmCBmWISWtWhg
         v5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7x2auY59quuHvas5Zo3MMAJ/Pwy2CfLOqw67WpkyI2gzkBsdtR9tjL/X09QXA2wS73CQdWJKIAe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+kyi+atKMr6sVP5J1w1leetn/bVFdskHawKhyRf9FTg20Gj9
	fdz9HjCiKrZ69h6IeRqVXFqP3/lSHdW4sokVm+Jr8RiJmqklc39qSLgvxuo0FnzhJXYgDHkt3Ng
	lPV64oXDygkrg1kGQk4PlspzG7rczr89cNkSZH1Ay5S5gcVKWp8MF4/ZpeF2fMxGJykU=
X-Gm-Gg: ASbGncsnSsyjXsvrtEZ/MRh0HDDnyngWesMNKgcqxn5Kj0hKmkhDqR9RSgVnngep031
	Rvfnm2zkIeCEsrSzRWnTNcyiz0D3GNDW3zELPY1ci1z/Rgm/LjIBVymN7tw00YJvimJkPOGeyTn
	owxX6p3trAOg18qnQsFZrLd6u4hbwrrhPnY8GOVoXeHGRMwWboH1HsD4CjuUE8YVsMvtuADR3Hv
	6sYyB8gmG9JxnPPE4u9gCYRIWPUBrSb1Ny/uYJzp1JUfmx9pzN50Qdd4NLHeWY5T9c4eRFcbmxr
	3z1L9fpmb8D/YM9bmPcpRIOyumaNif14ux2WNyRvivAbxoRWNHPtWrrTPCCgmCI2ixwa3K8D9Lw
	0JLA=
X-Received: by 2002:a05:620a:1a06:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c774d60c84mr2574816685a.30.1744114697758;
        Tue, 08 Apr 2025 05:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVylSPbz1EzTWNpvd0YBoOebl9ZLithNRq+pXikvQ6TodEPt4B0zQUUbZc1nQkbbwDP1bt4w==
X-Received: by 2002:a05:620a:1a06:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c774d60c84mr2574813885a.30.1744114697454;
        Tue, 08 Apr 2025 05:18:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6370a5sm1510596e87.131.2025.04.08.05.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:18:16 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:18:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: mux: fsa4480: add regulator support
Message-ID: <aiechdq62mjgta5p5g3s33okgnp56fe5ing2va7vaaf74nerug@nvrwrgnoyp7g>
References: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
X-Proofpoint-GUID: T4LWHdFD5TxwBzsX8YWwbAsYT8PwRedz
X-Proofpoint-ORIG-GUID: T4LWHdFD5TxwBzsX8YWwbAsYT8PwRedz
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f5140b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=V9AqYnqgT5IT5PsU-dwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=739 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086

On Fri, Apr 04, 2025 at 01:02:20AM +0200, Michael Grzeschik wrote:
> The fsa4480 vcc lane could be driven by some external regulator.
> This patch is adding support to enable the regulator before probing.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/typec/mux/fsa4480.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index f71dba8bf07c9..c54e42c7e6a16 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -12,6 +12,7 @@
>  #include <linux/regmap.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define FSA4480_DEVICE_ID	0x00
>   #define FSA4480_DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
> @@ -273,6 +274,10 @@ static int fsa4480_probe(struct i2c_client *client)
>  	if (IS_ERR(fsa->regmap))
>  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "vcc");

Missing DT bindings update that describes this supply.

> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "Failed to get regulator\n");
> +
>  	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
>  	if (ret)
>  		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
> 
> ---
> base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
> change-id: 20250404-ml-topic-typec-mux-fs4480-392407f94f84
> 
> Best regards,
> -- 
> Michael Grzeschik <m.grzeschik@pengutronix.de>
> 

-- 
With best wishes
Dmitry

