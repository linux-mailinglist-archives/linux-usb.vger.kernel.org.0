Return-Path: <linux-usb+bounces-29636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300DC085E1
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 02:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 99438355813
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 00:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D9B13AC1;
	Sat, 25 Oct 2025 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGM/74FO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE62F747F
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761350543; cv=none; b=Ny9Xp9Et2kRJctCou2Q7bmH/6FSH8UEFTEiqcx69cd+/ubnx6Kp5MHMlSF+t1tUsTZFulJeTZj61Klx0wHFNHtNifa6538DLIzQND0X5+Q9zFYSRBqawbQ5kFu4ahMk2zD/zLq8lMZayG+VFwwtqsakWahp+AuZpVefHanEv3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761350543; c=relaxed/simple;
	bh=BqREg4gsxpMPNLe6ibuhRTqn6ygL+R0bbCz/kW1VxKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNdtFxBaSJrp87MzZBkID+hwb7oQwZlXQiQj5auwPPI8zdXFVRLKZ+0ZhvWgwSVcf+P3oLC2bDX9ttgBd8iZUaRzxy3j6RXoWEE00UWbhKCtSIJUguSobd5cuVlOl1OsW1qvNqd1Efn6uV9gHsRYgeBMxkXOTnOYnCI/uy3f5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGM/74FO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9OiC029376
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc56pL8berOUmLto0AR19Euk08KtluvdaeNgGMdpvTE=; b=XGM/74FOGdNx4bPt
	V2fYvREFPHifpId8zU2Ui2yQVcAFg4vl3fBm1nXlYcoeDfHYVXKzMnCXVKFwH9NV
	ziNbdw9OozywFuMK9R+KP8Mmy9KWf+6igzG7Di5mhjv/NgAHH2XnP8ljF+k4x+HQ
	TLX3TVACSX4kY/NvUVAJkHPpGvmT8RXfArjyAXrezz3uCta5/LfvRMuwfiMwYAHI
	YCo3G4yPBh4AJE/eqLXCWLepxGpXYLzhT4JBWnr0xLI0TKfGPsMWgG/KLx8r9/dK
	AalJYizIUkOpmENTDJ/1dYL2T6hOT+ni8NXATzK1GBwWSYJOs3Stqe3Mja39E0q0
	xWn5Zw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8dg8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:02:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a267606fe8so2113146b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 17:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761350539; x=1761955339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fc56pL8berOUmLto0AR19Euk08KtluvdaeNgGMdpvTE=;
        b=UXsdl75mdC3jRuByCNlvM3MPJA+9xMUMDBIGr5dk9/vMeO0c2ptBMr8MqOg+w1O96I
         tgvtl8h9k2/MvaseY7UVR2v04OOAr+GGIa+NDKmodRrfeEqALDt4pWAUklTZncb6llli
         ZmB7TA8GNVDYZoRXNCPtTIBaEWxPufNxJZlSfodYJgtD6Imh4ohaHhgGy5zIkzUKRr9+
         xWvXSaz+419MfFDmSPYoOTppL1mSgMUZeBJLauXzSzIZQ5luot+nxL3FmBYCL+zFRrP2
         ZFRN0xX/sr53S8KSv6cGZA1d518EygbqckwZLHr0qMDGT4AZDrSS8soAtsvJMxrtKzyt
         IuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt1SYdpLM++rBcvxPONz/VJXVVk7fap6OYT7MPSi5iyOjdUDBJoIGHhcOuoVjBSQhzAl9GxEQEtAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMNm3D1VGQ/vflpuzpgulAUfBCGsFZXCCoyVMJDQYmeNm2NNx
	FDPkmbCZIhMrMeFxxtIuReMCnQUuHHswEn8TG1vjs3YpKnf6eOGeIkHFFQnrkg8WJJq0EYBHZ0a
	WsEeutduphnCbv3ovi2b9DS3jFP6Xl3Abcy/nB5jCvIvuJUKpHJG0u4fOs08gsl4=
X-Gm-Gg: ASbGncsGZ4WFUAmywUTQ0MRf9AB4F66xQ0CUCQnj8h6mbyKrmRSKUKVOwFaCTuTesHm
	fxVsLQ0+8IdpUi7EVkUcSJBObsJfY5WqgF3qwlS+8ns3xzrWyPqdRR/sPd0he/NNvFQgGb+lNkw
	IJ7gg4PQtuBU4etgf4pvf3TQlNiwX8HfgCIC3Npy8DPZzceTB2YZI+V2Oo5/owkpy4UPX4xqpkc
	Uk9J5PG/NV/7qBhjkhK02iCItV4ph/EFUOkOHtiQh/o1yrNlqUor+0ap7wSx3Gw5xfsY1UMNiTs
	oBonk+xzuFCcxF1ZjsZdKrb6rDhhcRqmWR9ijCnrgy05ufl2oOPI0qrln0r7qVryAXRSL/9qqh6
	rfbPDS8QSLosimaFcEEytx+bBtmIGpfU6dGaFHM4v
X-Received: by 2002:a05:6a20:e291:b0:341:3b91:69d1 with SMTP id adf61e73a8af0-3413b916bfemr325154637.5.1761350539011;
        Fri, 24 Oct 2025 17:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx6iqMO7Mnjaq8k2ZFocktbexyApACGzLDJtVcDcWlYMjTJ7zTgXxvx6wLi2N8LqDG0LX5kw==
X-Received: by 2002:a05:6a20:e291:b0:341:3b91:69d1 with SMTP id adf61e73a8af0-3413b916bfemr325102637.5.1761350538483;
        Fri, 24 Oct 2025 17:02:18 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d024aaasm382952a12.26.2025.10.24.17.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 17:02:17 -0700 (PDT)
Message-ID: <9d3dd1cf-4969-3dcb-18dc-59cfb68033f7@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:02:15 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
To: Abel Vesa <abel.vesa@linaro.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-8-wesley.cheng@oss.qualcomm.com>
 <zaotrz6upmpwv2w65633rlflubmykzn5dqiydl66y7rdalld4l@bo4oto5iynor>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <zaotrz6upmpwv2w65633rlflubmykzn5dqiydl66y7rdalld4l@bo4oto5iynor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXxddqPq3NsVle
 qww4sMHu5VBBNgZDqbcyecyWEmDGUrtuDN9iYUI1Ej/03YFwA4t96laZ+zCAYEKHUE/8LwpnSbf
 FtcLKCjxpF81+kTBQAq8NGyBtLuT9xR2gdZCNz+Qy1dipFGSQM2IAUdDH7iEW8A/rieN2scyK00
 mp2MSbWzk31xa9jyhI36G5+yTovKV6KQuMuTq10velC9z5Jvea0tTPyPnVMgyaYaKfraPhGlqoT
 teWw2Jj7/YWcEx4QSnxJ2UK61OJf1pLfFOf9lFCSpIhAXMWvWw+DqcZy6+1Rs1O3HL5SXAbkn5Z
 +BgD7O/tLmY7X76SYLLE2WuPp8TAngmaq34q24E6g9CcgHU5Gv2jRUlgaE1Pl+cqrZpC8MzdRnV
 XJZ9SFMJu5PWzFrTwf/rjoJYjdCfwQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fc138c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iT4AbuSYlod7UvTVlOgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: JiBmyhXyh-gc52OYHiGo33bXWD_38Weq
X-Proofpoint-ORIG-GUID: JiBmyhXyh-gc52OYHiGo33bXWD_38Weq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/24/2025 3:04 AM, Abel Vesa wrote:
> On 25-10-06 15:19:59, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>
>> There are also some PHY init updates to modify the PCS MISC register space.
>> Without these, the QMP PHY PLL locking fails.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 314 ++++++++-
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
>>   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>>   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
>>   7 files changed, 1240 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 1caa1fb6a8c7..8216820e388f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> 
> [...]
> 
>> +static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>> +	.offsets		= &qmp_combo_usb43dp_offsets_v8,
>> +
>> +	.serdes_tbl		= glymur_usb43dp_serdes_tbl,
>> +	.serdes_tbl_num		= ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
>> +	.tx_tbl			= glymur_usb43dp_lalb_tbl,
>> +	.tx_tbl_num		= ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
>> +	.pcs_tbl		= glymur_usb43dp_pcs_tbl,
>> +	.pcs_tbl_num		= ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
>> +	.pcs_usb_tbl		= glymur_usb43dp_pcs_usb_tbl,
>> +	.pcs_usb_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
>> +	.pcs_misc_tbl		= glymur_usb43dp_pcs_misc_tbl,
>> +	.pcs_misc_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
>> +
>> +	.dp_serdes_tbl		= qmp_v6_n4_dp_serdes_tbl,
>> +	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl),
>> +	.dp_tx_tbl		= qmp_v6_n4_dp_tx_tbl,
>> +	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_n4_dp_tx_tbl),
>> +
>> +	.serdes_tbl_rbr		= qmp_v6_n4_dp_serdes_tbl_rbr,
>> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_rbr),
>> +	.serdes_tbl_hbr		= qmp_v6_n4_dp_serdes_tbl_hbr,
>> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr),
>> +	.serdes_tbl_hbr2	= qmp_v6_n4_dp_serdes_tbl_hbr2,
>> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr2),
>> +	.serdes_tbl_hbr3	= qmp_v6_n4_dp_serdes_tbl_hbr3,
>> +	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr3),
>> +
>> +	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
>> +	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
>> +	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
>> +	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
>> +
>> +	.dp_aux_init		= qmp_v4_dp_aux_init,
>> +	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>> +	.configure_dp_phy	= qmp_v4_configure_dp_phy,
>> +	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
> 
> So I see you are adding the DP related config here as well, but it is
> definitely not compatible with v6 N4. I'm assyuming you picked v6 N4 as a default
> just to allow the USB part work for now, right ?
> 
> I don't suppose we can drop the DP related config from this patch and
> still have the USB part working, right?
> 
> Otherwise, we need to mention the fact that even though the DP part
> is also being added, it is broken.

Hi Abel,

That is correct.  Without these defined, the USB path won't work, and 
we'll need to supplement this if we wanted to add DP support.  Hence, 
why I didn't add any mention of DP altmode in the commit text.  I can 
clarify that we added DP placeholders if that makes it more clear in the 
commit text.

Thanks
Wesley CHeng

