Return-Path: <linux-usb+bounces-29639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD36C08752
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 02:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3394F351394
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 00:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855691CAA85;
	Sat, 25 Oct 2025 00:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HyYHbihJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758941B0F23
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761352885; cv=none; b=ZzBhGWf8+VMN3M6Y2oybmNGn0Kppdj3YLoD40hhECyQxcf9/a48wyyk17kcg42QEIl45HWRWkFH7guXWswqPWL5SkQOLIREbzhrjOgcAtnSSV4ScaLK5JYyRAby3FZnTbXIKpFyWU5f8ZdYZj6ZR7QPjhU9woLt5AE7rtO2y7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761352885; c=relaxed/simple;
	bh=QbZ9GJPkmkuF9RKGFB5uu4i2+W2OdqDczAhVKCOTVRU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qDDEP/8rOOtf0xqKsG3Ymm5gyNReOmWkFiaM2mdHE0tzO4x+5aJublJTPnt5lF2dljnhM5co5Ck2LVNiDsal7N31LiFg2zEAHc23kitXqFaYCDJ7mo7qjaWLA1kVApvneMeW9UcdIjoMQN7H+Xu+MyhkVmRQAeV6bcO3FKvF870=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyYHbihJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9IJW023506
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya8Q6uFCCxVarjTky3xl1Z6ewP/ZO6Fn6dKVnrcxZ5g=; b=HyYHbihJDASOeksK
	Y7kb56aLOxi4/wvzvHC4WTbI7w6kCerS3XOGnfZQUp7BPRcN17tUB+3EW3BR9Oc2
	RapLfuDSCbxdAnq6lUA3u6A8W9uFDVIng0a1wjirgMSXA1nwKhTay5mrylsAIMLr
	hH7XaaGiXKUCL5V6IHnWfsHu3ZX9LHF/yc2gydEsd6vCncp5xmTUrN0UGflWeHq6
	0WUClzfDizYsrGF/yDdE90POESFOwk4Z0BWz88Agg8Bm82HeAA20fKEjBRecZ+QK
	9H4LkRmCt/Gpnuxm1QnJfL4vgkNAIAWhmT8wdlRj1H7LB7zQsiGAJe51ibhGZC5D
	2GXmpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8qu5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:41:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290c2d13a01so20671655ad.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 17:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761352881; x=1761957681;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ya8Q6uFCCxVarjTky3xl1Z6ewP/ZO6Fn6dKVnrcxZ5g=;
        b=DNJM/dlfNVekf4OLUJWaHIEAZ3PtruQ60fujAqwvXhTFX80/iL76t6kDSov/xnxgB7
         sMqQHvoj/q+fAniAWl7eGhbIiSRJ5SBVSiBE03VEkVV+Gz0GSGg4lNENerr397bmnpiE
         cQLCvk3iwYKtmdIK2IBETEcDBrvjiGqSxAG0GpfFFSgkDNeT4KsyS4PJ23WmC031UYLP
         ZBJkkTZEPJr9EkOMUup1W4FfU5QlklNvAly0D7xCAhEkP2XEO/gStFni1nl1O8PNXJWF
         z8JGTGCWocwYV4NAPE6FP/jqZx5C1OzbgexUoOZuv690Nfe0tlYMk7fzkMV7Y/ycTz0c
         F8mA==
X-Forwarded-Encrypted: i=1; AJvYcCXWW8nWzeYuqSTmClfRGTyLgS2tsfvOSRcnJ7rgTJW/syEAf0qSFaFjOj4QzrK897aDOXfrrVnwfXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKDFYoxD9hfsQWwpdD3g/yUY5Wlttc3imF7+x6y0fCfBdR7HA9
	Mkqr6Feb/RFCIDjJXeDilMjcT3qQQguBSXk/YS/8EeAIN63aHV/j6mLkikWiLkbMrXtG7Iznysd
	zgKF8KVCAXPCMub5gPLq09pV+fI84No25W1zcXL8YA9bRYR+lQ3HugiR1iPa/QeY=
X-Gm-Gg: ASbGncunqnWvkxBpAo25uHhg8BF8mE9g3YiM3MuPL0JYZj0fmVXhErVCRJLgwayrPcy
	x9FvUMhNbz2UIHBFBdHtGmSxGLV+Fa2VhXpPJv898RzGMlXQIabwNWUoGXSk21baw5bpjIvBoep
	zyBtPzYKZ4t0508tST+wzVJ/SHjbu3lp9QMB/M1GGJ9uUJ4i1HWnv4mKfJNi9Ckeadc/Rr9LMvP
	zISoc7YQK2SsNl3awNX8fNqcmZU93VjjKRFfLeOcqRQlyt0OZXD1lD2Ec/VBT3VEH0NFrmya3TA
	PjmsLEtL7xiPcsWrGeTRkQI4KuEyWRWqyeh8bYhfPSw43C3op8/pAmjj1lW2oK3FjVdAfjNMcIo
	xWUcT+ckGmpOBuMWA+Pg22E2eUqdMTpQpJEHh1Kut
X-Received: by 2002:a17:902:e847:b0:25b:e5a2:fb29 with SMTP id d9443c01a7336-29489df3872mr54903895ad.12.1761352880867;
        Fri, 24 Oct 2025 17:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnu5Z8NPBgBgFB2GFR1aP8qmtpDHK45P3Rv0Oz7knL23wjldQEPCmVxD+1gC0RKhDO+yVGeQ==
X-Received: by 2002:a17:902:e847:b0:25b:e5a2:fb29 with SMTP id d9443c01a7336-29489df3872mr54903645ad.12.1761352880384;
        Fri, 24 Oct 2025 17:41:20 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm5035005ad.70.2025.10.24.17.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 17:41:19 -0700 (PDT)
Message-ID: <39732bf6-dd6f-b808-7c10-b3faa4d46489@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:41:18 -0700
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
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
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
 <9d3dd1cf-4969-3dcb-18dc-59cfb68033f7@oss.qualcomm.com>
In-Reply-To: <9d3dd1cf-4969-3dcb-18dc-59cfb68033f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qutRQQREl_J0oSlshBC3D6hkkE1WyWNZ
X-Proofpoint-GUID: qutRQQREl_J0oSlshBC3D6hkkE1WyWNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX9Y/nchwApKrW
 C/RipqhSiyVw+496iR4WVTf1uVyDmgOpPlFpJAwE5kujf4BfxHW+p3pegVFet7AqS6PYYlF7QmV
 yUIg89fQ03LYEkD3MZ2sHKvsKosLwJXL6p9vMl8rm779AViqZ7tMxRyWst8p7uVyb9cARKzy3qD
 MqVPjWK0ivCD/E20AvWevtemq7kv3DOAyoECnGpIFeNRELRCN3WeujLmD8WrGLFCh+mOaQmPt37
 7e6P/EW2b628/IQ6lCQQmjEz/4PsyyOpV3QXyGMLjRqCAKTummHTvkIlgsBAMWAQN+YMpBjpPU5
 gpBS+RyRGXgVTFif3fLrTGMdoist6tur13Y2R368QnATKQn548Cl39/lT4TkqEc8fVhZOrEzXRm
 5tRjpAOuYlx+U3dcdzW/2XNIx/jkRg==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fc1cb2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RNL1vAbd1nz3C39zmhQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164



On 10/24/2025 5:02 PM, Wesley Cheng wrote:
> 
> 
> On 10/24/2025 3:04 AM, Abel Vesa wrote:
>> On 25-10-06 15:19:59, Wesley Cheng wrote:
>>> For SuperSpeed USB to work properly, there is a set of HW settings that
>>> need to be programmed into the USB blocks within the QMP PHY.  Ensure 
>>> that
>>> these settings follow the latest settings mentioned in the HW 
>>> programming
>>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have 
>>> some
>>> new ways to define certain registers, such as the replacement of TXA/RXA
>>> and TXB/RXB register sets.  This was replaced with the LALB register 
>>> set.
>>>
>>> There are also some PHY init updates to modify the PCS MISC register 
>>> space.
>>> Without these, the QMP PHY PLL locking fails.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 314 ++++++++-
>>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>>>   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
>>>   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>>>   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>>>   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>>>   drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
>>>   7 files changed, 1240 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
>>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>>>   create mode 100644 
>>> drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c 
>>> b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> index 1caa1fb6a8c7..8216820e388f 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>
>> [...]
>>
>>> +static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>>> +    .offsets        = &qmp_combo_usb43dp_offsets_v8,
>>> +
>>> +    .serdes_tbl        = glymur_usb43dp_serdes_tbl,
>>> +    .serdes_tbl_num        = ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
>>> +    .tx_tbl            = glymur_usb43dp_lalb_tbl,
>>> +    .tx_tbl_num        = ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
>>> +    .pcs_tbl        = glymur_usb43dp_pcs_tbl,
>>> +    .pcs_tbl_num        = ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
>>> +    .pcs_usb_tbl        = glymur_usb43dp_pcs_usb_tbl,
>>> +    .pcs_usb_tbl_num    = ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
>>> +    .pcs_misc_tbl        = glymur_usb43dp_pcs_misc_tbl,
>>> +    .pcs_misc_tbl_num    = ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
>>> +
>>> +    .dp_serdes_tbl        = qmp_v6_n4_dp_serdes_tbl,
>>> +    .dp_serdes_tbl_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl),
>>> +    .dp_tx_tbl        = qmp_v6_n4_dp_tx_tbl,
>>> +    .dp_tx_tbl_num        = ARRAY_SIZE(qmp_v6_n4_dp_tx_tbl),
>>> +
>>> +    .serdes_tbl_rbr        = qmp_v6_n4_dp_serdes_tbl_rbr,
>>> +    .serdes_tbl_rbr_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_rbr),
>>> +    .serdes_tbl_hbr        = qmp_v6_n4_dp_serdes_tbl_hbr,
>>> +    .serdes_tbl_hbr_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr),
>>> +    .serdes_tbl_hbr2    = qmp_v6_n4_dp_serdes_tbl_hbr2,
>>> +    .serdes_tbl_hbr2_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr2),
>>> +    .serdes_tbl_hbr3    = qmp_v6_n4_dp_serdes_tbl_hbr3,
>>> +    .serdes_tbl_hbr3_num    = ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr3),
>>> +
>>> +    .swing_hbr_rbr        = &qmp_dp_v6_voltage_swing_hbr_rbr,
>>> +    .pre_emphasis_hbr_rbr    = &qmp_dp_v6_pre_emphasis_hbr_rbr,
>>> +    .swing_hbr3_hbr2    = &qmp_dp_v5_voltage_swing_hbr3_hbr2,
>>> +    .pre_emphasis_hbr3_hbr2    = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
>>> +
>>> +    .dp_aux_init        = qmp_v4_dp_aux_init,
>>> +    .configure_dp_tx    = qmp_v4_configure_dp_tx,
>>> +    .configure_dp_phy    = qmp_v4_configure_dp_phy,
>>> +    .calibrate_dp_phy    = qmp_v4_calibrate_dp_phy,
>>
>> So I see you are adding the DP related config here as well, but it is
>> definitely not compatible with v6 N4. I'm assyuming you picked v6 N4 
>> as a default
>> just to allow the USB part work for now, right ?
>>
>> I don't suppose we can drop the DP related config from this patch and
>> still have the USB part working, right?
>>
>> Otherwise, we need to mention the fact that even though the DP part
>> is also being added, it is broken.
> 
> Hi Abel,
> 
> That is correct.  Without these defined, the USB path won't work, and 
> we'll need to supplement this if we wanted to add DP support.  Hence, 
> why I didn't add any mention of DP altmode in the commit text.  I can 
> clarify that we added DP placeholders if that makes it more clear in the 
> commit text.
> 

Hi Abel,

I take that back...I went back and reviewed the QMP combo driver again, 
and gave it a try w/o any of the DP init tables.  SS USB is working 
fine.  I will update the patch to remove the DP entries.  Thanks for 
catching this.

Thanks
Wesley Cheng

