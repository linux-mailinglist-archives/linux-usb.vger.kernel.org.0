Return-Path: <linux-usb+bounces-25677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A0B001FA
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 14:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FCE53B89E8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 12:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7482E9720;
	Thu, 10 Jul 2025 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJvsZi1q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CE2E92C4
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150592; cv=none; b=LIW7CckdU1NI3Kde8l8KRxp1K7oRAPQeB+9go/pLz6sygFlmW1GWsXq3Orf0giXv+YOOhwp4T4rYOEYACYvjLm16TWPOejl302KrNswLCu3yrkEjUKExs1a/eo8pt8y/Ep3JJborJJ/nGwzJewzhAIQuj94yM05ieNbFlMM0oHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150592; c=relaxed/simple;
	bh=aL3HjbrXqAD6L7Xc0fFY03lrdZxa+2iBQMhBs5Ndh+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gawKvpvhBYaUZz9MMzwsjJcQ6Wzi2YVfyXmUpD1QJKisEXhnmX4qB611c5dkcuG0JdyYxpyI9/MM3gUflLzfF+Mg0sQ3SA850X/EoVnLCD+gw4x5eUUyM5fTzw/3q2VAGc4fL/VrcG97POg74zB/zEwzxHbUaf7phZtKvcK7qxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJvsZi1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9MPXV002622
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 12:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YMeQ302waQ/lVXch317TVOxg9bPEhO9O7NnF203imC0=; b=CJvsZi1q2495tCk9
	46Vx/lRJaGBGBSBROIyzMx+d79OA5D5UDuImKmIxj8N1mnV0JnLcCew72NyQkMrr
	SW8S+1Re4Xx45SpgGh3ysN9pN4WUZSARzaVfmlAY8rfifFl2U1+sj0oxEs7AgOJe
	+s1u2tRcBtvtfclseXQMyUF7RsgNg//DW3Ae+qXRKIEc6dHG4NLlKLo2IG+qQ34r
	OCBQFB14A7Cu2Rt0WVmrWPLsXat8FilyQKDZh9FgW/ySmthJrITPnyMAWVIGSFXM
	psxM0OH+e7CPLz3WKumov50EYpClIWZ+T2SprOBbJOQ9LcCE9iwvFG5vBV746lnT
	KIA5RA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bg6up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 12:29:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso12344485a.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 05:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150589; x=1752755389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMeQ302waQ/lVXch317TVOxg9bPEhO9O7NnF203imC0=;
        b=OsUZgfIKExwG8mgUmg9/VrKJ61qFpLI391R4RHa94IgVADQBcw0rPdS3yr1yXTXLP+
         Y5GVyEqn26RzPunc79YX6VwOVo8bcj6ND7t5W9TaTeKrjfVKE6OLNuSyVM81xDvLeLD7
         ghkelZaL5BE/L5hp77q4yDo4hSQprKKvT/s6MG57HYEwpdxfBeuKNJQHfdJ+MlhyN+FL
         H8tgu4mfuTBxi68b3LvHw30Q/Jt7tu+LGn0UOsNY5d5oER17iIqFC08v3I72AREPSf2R
         ZUOYFXyiAWjz8BCI6iBsvUDxWC6pclI8tX0B71aLDDODyZy7lPkSYNuoQD19j5gSuqTA
         4SWA==
X-Forwarded-Encrypted: i=1; AJvYcCUbYTDOwXR99IgQVoK9/IlqYuEvUoRDH5ApR+1iCwlcHIP18n2hpXYcwEg1iS1o9VL7Hs9ZplYqAHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTc/qEj66BiHFgXfVJfBfq1eNJCH0axLByv6xF7ImaOkQagigb
	a1DbA8my7JB4jxNaxEzBdXeViGmQLQ/I5KfWbGiopS8qTbiYdmX6yDT3sSZS6LFzSgf6NfsSuC5
	fJPTeFX25SVQi3fAWtBOCJX0BrE/tXXoArN1uHT0s1y+5r9HlpPCklfJIizGO21U=
X-Gm-Gg: ASbGnctEAOMHKz9OYwHSNPV9aV28n5Yh4H1LnjgCozMKBl2zvryDys6Kd5kACbJGKgl
	gpBg2iYDjfHseZeA7uFIjrU15jAZPyed+XgMiKZo1BJIqqgZm3vraEPqu9XcDQrgj5LQzhzjOwS
	y+/yfDAee8jHZAh90r/goHx6I6QI7qS9H1MQF6hNu01Ufzfvul+84qpKoxq1Q0kv7ROJMn0XF4d
	WFf+wlPpRjeiIqF8AYxF2BrccF6OyQa0+oHSWP47vndp944E84e1hEkKAl/SrzFM6Dwi4vgabCu
	Nu/v/eNzMaYCKeOUuGd8+3LTqLDaqcy67WCpBIu7msJrSGZsgBZSLVP/HXp17OyfOO1dzTdfN3g
	t5eo=
X-Received: by 2002:a05:620a:192a:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7db7d3ad273mr306326485a.10.1752150588602;
        Thu, 10 Jul 2025 05:29:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoLijVe8n8HkS++sYfgSY4jCehRjGuNzgRewdZVKw6l0oW8rg4uJs1mwTv59gejgnKmNBoVQ==
X-Received: by 2002:a05:620a:192a:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7db7d3ad273mr306323585a.10.1752150587891;
        Thu, 10 Jul 2025 05:29:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976f333sm803699a12.64.2025.07.10.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:29:47 -0700 (PDT)
Message-ID: <a2567891-1dd4-44ff-9853-6f9a451f0a74@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
 <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
 <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfXz+9Lu2qQpVEq
 yiWx2Xm+/f4pOTtVqfTULNO/mtABUCz6/ou1C5cdJkmhlTNpEwDw65POgtKiZ0jQ7YEF4l3rKL/
 21g3UyoDBfbQWVcRBHwvpHCinf7EcUP0egYRs4n+llAj9lpyFENCYCaKf7eeHAtJgcehJtFMDij
 oJErii/xLwmwQoHvREBijn8yJWR1tj3GB+P0MdSi6Rq/belBqqf3Xt3o6MJrZSaF1gG7uI5y+qD
 McRPp9qDV+mRiX/wdJdgHF8FmnsJINBsaYHlVmzMkr7vSUKkM36CgLhn4GnYTAZ+oY2bWm7T6Bj
 LXAuvKAx9FbBeuC1eRNk8gH5lH5EEr19apOPLofiP0ZbAjasEdAd+ZtP6g5VhWjMpcr2HlP+XKP
 a+98jvTorcJBJVpK9oUi3yxaq/wPJNds+vB3RDTjOQ8HxL4P+dfGnojsvjSSsMJb6GjnOcQR
X-Proofpoint-ORIG-GUID: SWVpSULeVSXtx5h9GfLdq5Vi9NIKR-IP
X-Proofpoint-GUID: SWVpSULeVSXtx5h9GfLdq5Vi9NIKR-IP
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fb23d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=RC4AtmPg6BGSdlR6CyEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100106

On 7/10/25 2:25 PM, Luca Weiss wrote:
> On Thu Jul 10, 2025 at 2:10 PM CEST, Konrad Dybcio wrote:
>> On 7/9/25 11:18 AM, Luca Weiss wrote:
>>> As per the downstream devicetree for Milos, add a register write for
>>> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> The downstream driver supports an arbitrary extra init sequence via
>>> qcom,param-override-seq.
>>>
>>> volcano-usb.dtsi has the following which is implemented in this patch:
>>>
>>>     /* eUSB2 HPG version 1.0.2 update */
>>>     qcom,param-override-seq =
>>>             <0x00 0x58>;
>>> ---
>>>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>>> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870aa7f7971a51d4a567 100644
>>> --- a/drivers/phy/phy-snps-eusb2.c
>>> +++ b/drivers/phy/phy-snps-eusb2.c
>>> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>>>  	/* set default parameters */
>>>  	qcom_eusb2_default_parameters(phy);
>>>  
>>> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy")) {
>>> +		/* eUSB2 HPG version 1.0.2 update */
>>> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>>> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>>
>> Said HPG asks to clear bits [7:1] on all targets
> 
> Okay, so make this unconditional and only update those bits instead of
> writing the full register?

Yes

> 
> Keep the write at this location, or move the code somewhere else in the
> function?
Let's simply do this instead:

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 87f323e758d6..6c44d0366f34 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -392,7 +392,7 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 
        snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
                                    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
-                                   FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
+                                   FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x0));
 
        snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
                                    PHY_CFG_PLL_INT_CNTRL_MASK


Konrad

