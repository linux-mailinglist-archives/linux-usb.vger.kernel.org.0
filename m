Return-Path: <linux-usb+bounces-28670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AABB9E5C4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 11:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B92277B7104
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 09:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4190F2EBBA2;
	Thu, 25 Sep 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXKzxbAC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92F2EAB76
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792477; cv=none; b=FPXaT49RDFVFx9+2e600bhSzwA+Sn5AN3dbZGJ+zg36OlKNjEVPV4f3kL8tdp1nEDfmFbVOdea/KyOEVQ+d7moJ4POFlzI0lym/O6BiaYC5UX874Wf7zBQ9I9eLc+cGuPoPnASS2EZ0FfJ0xpv0Wx4ppPOVNZa8sbTV91jrnyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792477; c=relaxed/simple;
	bh=kybbvXhHxELtxPAzzOcOTx6gRpgiCCcD9x5PrtveDbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmObxTURerl9UMNylQSfHS5okCaSwZ48bGlHoXkhN2FEHDHnV0oogslur18nV1AE4ineHUperPF8U7lB7Vw5SjGmP2wnZHAqX0Re9YRFMmosP+sQlYLjZC8NQuOLbPgP6p0nSoMgrTscqb8ap6Szs6AEYOaq754kcg1x1zikr+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXKzxbAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aWHj027688
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUqki5AzViBdF4eWTm2k5POhswMbNALIQr455o+v3LE=; b=RXKzxbACfU6aYseM
	WS/frB2kdxl9qtA/ZbXY6GHtrmGzwQ8xlO4nhwcH+IsJZL1MRxwlXv0Mj1SozAeC
	I0Tz5tKQ5EtLrofZi1ph7Y95gJ2Jm/7Er8Ngny/QDvIGAcxHwfwvMuq27BMP3mZx
	PfkFRWNSjxxQd/jVQLu4a/4M0wNZqt7/6n8n62bC5t2Ds4E7K3q8mrUoqgOxOVS3
	4YI+Psb27Icecc6jEQSytulRebFtycuo4rvkBuTgTtYWvkh3MydV3/WH+1FDGHIC
	+xwUd0LnCRNzA6/F0/shoWQz7T6HQtuoxDH+Xb/q3eVjXHbCLTT8sck5WYMrkyPQ
	qWNYug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0sg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 09:27:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7f5798303b3so1796476d6.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792474; x=1759397274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUqki5AzViBdF4eWTm2k5POhswMbNALIQr455o+v3LE=;
        b=k7yB6m/m7zNPaYW0Q5MRIauuTgwmVEh8WPLPaSG1sLbSHqwuskV0aXJxRdGzFkcyki
         VJISbx7xckqwGDObKHd3bfZdxCWeZFrlFx/bpx+TVYF9ZY2kimPJR6W5Rt8Kq255muRk
         hGLafvKZ9WW31qbKmrgejcrVWctzIRrDWFqlBCzvIjSeE/IPBKmppjzaWGcjogzvD+pJ
         P0fkeUAroER83SmISfDTaOitM1SLwXdUjed9hhmNz1dUXn/GhmMkp5/aPApH6nXpUuT0
         p5d25bzPBOCKoiBCr/03YQMK6+t7Munwp5lDQSNFduiJe3M9TEOmWWC3Jbb/Ec40N/Cb
         1V3g==
X-Forwarded-Encrypted: i=1; AJvYcCWz7plIh9w9oCV7f/1cVk/WFwVRn6IIkGdPE2/2UKDT+AtByNqvcCJXprHPbU7uCuj7ROQCZU2M7pU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkvoHimTQ5XlqwTum0A9HKkEcDphaWVFRrSsDDgpKCvOawcKm
	7AR1qRpEU/3yOk3dptU3Aj2977CABT2joVwpeDc7IhZYLQvAatz7ifJTRtBwTT3IvXhXgT8Pgb7
	VPf/gI61jElECFh2thAbhHtLO3xicJxdok1+F5QpX/o9IUXuCjujGOVwQn29puo0=
X-Gm-Gg: ASbGncusMArHOv2AMORMx5JL5DY0Gv0QYKZlfFbLRYw3RIu296n12SE64+97wpWafby
	c5eE9U0Gki0P34k4q4WOeYXHzYf5CUz4Um5wZHljCOkNhe2SgdNg4/GyO47Fu/CVP793ISK+avM
	xEOwUnWn67QMRFsCRTij4TgkVhGfdEsddWwhRVT5NQfyZvpBA2haXP/CWR4QScVqRzKgK6lyJ+9
	XyB5A06YKqCqP+aeFBj8mZjfj3uHQKiseqRiMAQAroBm05pX/ogWijcwfnMql9yRRrl7GGoXWvq
	A2iOpQvf8vvgTep+yXQsrTY1Q/d36W80PozIOraTZqXHDFOogRYEXKFk4oHVIBHLpagg6zaogo6
	w0s1KZyNRovf+HpJtBuLEUg==
X-Received: by 2002:a05:6214:ac2:b0:798:f061:66bb with SMTP id 6a1803df08f44-7fc27ca1971mr29184336d6.1.1758792474042;
        Thu, 25 Sep 2025 02:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNXr6Gkp6aLTf5IZJgLqxFdi09mSj1x0yLj1wpVf5n029+3a2r9XtLvmqiNW/o5lBQYVn2jA==
X-Received: by 2002:a05:6214:ac2:b0:798:f061:66bb with SMTP id 6a1803df08f44-7fc27ca1971mr29184116d6.1.1758792473575;
        Thu, 25 Sep 2025 02:27:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a366116esm914520a12.21.2025.09.25.02.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:27:53 -0700 (PDT)
Message-ID: <6626df48-bfaa-48a5-ab50-91422d252e86@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:27:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] phy: qualcomm: m31-eusb2: Make clkref an
 optional resource
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-10-wesley.cheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925022850.4133013-10-wesley.cheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d50b1b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rA21lKwlbNzYapJBHGwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX6cAmpcETCjNf
 5oRG61Ea3fdcpqyKVDpcZsz+O8SzGb/wjv7dRWlBtrnuum3LtF259TOlZEQMcBkMf8+0ugQmEKy
 7qK74u9iGeHGVfmErwN51HW/Y7Tg0Fpp4E1zu6tHV7XJ8cEoDmwHgQDtOk8ySEFoCEY81XzCqI/
 X2EePiusScf3EpJFSm5CqmRMZS3ZWddvLLw3SaRTxLXJP3BmxPQOmie+8s0ogcgQbFkKJ4XfEEc
 wzgcn7rlFVqGMzBpOyM1pq7Neo53bSsW1jgSKdo05EiOMoCBBL4sUsSOUD1ZMkBzv3V0MXkipI7
 7yEk9AsquYG+ls5KhuQC9uLoifuc6fEKnnJ8IpIRZlRInVBdms3q2jZ3ouy9Kp8J6KsnRD2Vgh9
 EiSpY1xs
X-Proofpoint-GUID: tuP9rZZns33mZaT1JWSIaE1v44gf-tg_
X-Proofpoint-ORIG-GUID: tuP9rZZns33mZaT1JWSIaE1v44gf-tg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

On 9/25/25 4:28 AM, Wesley Cheng wrote:
> Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.

This is more likely "doesn't include a software-controllable" ref clock

but that's "fine"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> One example is the Glymur platform, which contains 4 USB controllers that
> all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
> and secondary controllers do not require a clkref resource.  Due to this,
> mark this as an optional clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 95cd3175926d..f8a00962f937 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(phy->reset))
>  		return PTR_ERR(phy->reset);
>  
> -	phy->clk = devm_clk_get(dev, NULL);
> +	phy->clk = devm_clk_get_optional(dev, NULL);
>  	if (IS_ERR(phy->clk))
>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>  				     "failed to get clk\n");
> 

