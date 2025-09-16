Return-Path: <linux-usb+bounces-28135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F39B58BF9
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 04:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E34C3AD03F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 02:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49AD241691;
	Tue, 16 Sep 2025 02:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pax8MzK9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DF22F386
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990415; cv=none; b=QPdQwqfKgNkc0J2bT+RDuw7fHaLtTxuhBqg2d/bUBRGdv19qRpYnK2LoDlG8e3NlONZ+ypBKWdpuPYYbbD6Hl6l/Bx/I4AvZUzmou2NwdKTAwtlwT3YC0AWTQLHk/Dy62VsMAo4dsAsOVLtND5w7iaS9cQMZu/rx2VeDgcgtp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990415; c=relaxed/simple;
	bh=sw3T+Yf7rRxGoEHikzqSJtqsISrkBdzL4ry7W6NjCME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPzICxtfHlCfL4PMh5C8KK/TN6QLsGAbKFB9MqS3amIQwNDkILhJ4lQJ7jDYjHFsxwIlpsL8aW106ZHs6HvjOkQUF8a2DyA0kyvrjCz84vrSCqPao5a+QdYhclO3VnSQP092OqGdgHanwzRx0XLJ/ycSA81WXlyal/uUftaj1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pax8MzK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G2L0Wt008402
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALKBbxJKWhBYDEwvuuS6efzqtoWF3Q6y4KRex8tFebc=; b=Pax8MzK9tDYbi4Wi
	Ua6hvVsXPpOHAhwBypsMIc9+z4o6lY/oYAjB83+3hbB+EwhrKjBydKQAtUqlD/M8
	eVsqnkaGkJzDxO+RjNwvZLqBHAj6rkTSL2N7BF4N3MNpXPvWGKl+z+kmmgOSP2RK
	99dQKfqF/K+g7XKOMTUe+kxakNT6FGXjMoqlsMgu9iLXOvyoqtY7/uMZ88IZKoM/
	uKlha3oiUB6s19t7AWs457xcN5xpTZfKY2MI9xbAFDyEylwNgYhILNcCuNnHQkNd
	opNG3nl8dWny9qc48KNuQeoGhTTfqThLp8b3exkw1BvCmq3mEe2/Ui3/Jv0rc25T
	NnbHdw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpwyb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:40:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458274406so95275685ad.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 19:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757990410; x=1758595210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALKBbxJKWhBYDEwvuuS6efzqtoWF3Q6y4KRex8tFebc=;
        b=VblrMxFzWedg4pfbO0ufBQfpNatm03vwQdwLVRJf4S++Mi/PTieGMlY9+rqmjrAu6k
         32MGkP8yIYgQMo+J9VAVIQ/dKbBu1atMGJ7zMfvNYm10rJNY1bk3W40IB1zSDFTLgxZM
         Hk70mihtKq9jXqrw8954BvodH469X8uUuN07jC92T+biklAC4gdIMY5SSW1PPg2VoK6X
         ucUDVSicMq8zs2y2h7Gm6LITtCIPV34jJGe79uPTtzLp/xrVmFM2NDPYhQcX+9BvL00U
         iSOh9PyRkNfi2SW00vsdV/xJGbX55rQNtEc2lSg0as024nNOyUzEluPC1jcpdgdWu7zm
         dxVg==
X-Forwarded-Encrypted: i=1; AJvYcCVvB4wsRG2nqgUKmXP5xGSLr7+jsg4/fpBSK/XbGwp3KiFVyw8Q2Dbvcz+Cw55083vCuoDpM3+9rW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSWnvaX7b0R8K6m3tiyz3Cp5gvBaPbSCcwA2UjbWj0oua0jY2
	tITFFjLZ/7yVBsejBFOzZy/iJc158CWzPawJXjv78O9bo4g9NEQpWzIpokTyYJ3alsCN+MH+5Os
	kMHWpMOEHz6d9Ybb14Q5VYZIHNela4svtULL4+YpY4cwueSlmVStN1JVjVwgvJDg=
X-Gm-Gg: ASbGncv3HybGADshjR7+JsaXCipP2gOwzC67tuVGK6FCXN6KCX57e06xqHYJG2cuaXT
	6nNEdqjvW0VRbZWQ0vEW4kRfhhxsY8Kjt0CU1UvUCSkIN4VXz3U97kyAQM1Zno9jdrgGIzh1MXz
	R1IadG4Wn7HIymoBHtifLbiXrlUzxCE1PP3ILd83aXMaXEh8+W97KDJMeBmj8boek/gURXirELo
	DxKkOJ8WUSziaoMmySMQRqNsJaFEI+ge2lqlScKbDO4JiGxe32fheuho+yvXZ0dMUs8K+jF9Nnm
	WDHGJADfmLsxFIUE7RIfClSQjiaCtNsw7oSxbHaH+DDg8lY7ZyZ6ILQHg2CwZoSMtRlUQ2zzHls
	pXLscPc7UmrLypgj3C7boH2NwIX8tcvIdhg==
X-Received: by 2002:a17:903:1aa3:b0:246:2b29:71c7 with SMTP id d9443c01a7336-25d2607a10amr176506485ad.25.1757990409784;
        Mon, 15 Sep 2025 19:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHutrm0VahgASYcAGOWnnFZbZG2dQel55GBh/Zu5/ngeQI/Oxmg11OWKXNdJCX6YG0DD91+/A==
X-Received: by 2002:a17:903:1aa3:b0:246:2b29:71c7 with SMTP id d9443c01a7336-25d2607a10amr176506265ad.25.1757990409367;
        Mon, 15 Sep 2025 19:40:09 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25e2fb546f9sm109794985ad.127.2025.09.15.19.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 19:40:08 -0700 (PDT)
Message-ID: <c5e3ac07-e91e-4c9f-9256-497991b75200@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 10:40:03 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
 <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u-3eYN1aZOHVGhtD0v4XJIIlqMDMf7hB
X-Proofpoint-ORIG-GUID: u-3eYN1aZOHVGhtD0v4XJIIlqMDMf7hB
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c8ce0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=lkjHs5G_WC6zgKVeVEUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX3c99JPIwVnEu
 aANn9gAn9BvlJMYlgeNYtre+E0PoYTzb36+RcYw9+AHibIVJ1m1e6cRygM/YzZdnXA6DM66SNlk
 aSMcavWv/oVRK3PzRHRQVKYSet7gkYQ7TzkpBOQ/R0FtpuZGr+ZeQz2xCcEzPaymaSRnFoQzb89
 N6OR7OjnBLF3zx1+WWuf3bfeiXpGm6RrZqp9P2XSef2TAjXDtjk/Lndr/KIIXOP8wo7hJUSBWzH
 n3BmCTpk2LB+1SOUh0EkWQxEDFtN06hwNjRbX5mepT0Q7Xs7Rw7A87YAPjTB+JI3CZ4Q1qgaVti
 uNWvTQtiREzVZgH8S/9xmozPua98gSSQQjUZ6x+dsNYUzb0viVtFqQdGhIhKkb8mCRtIN0zi7bS
 3p7nmWqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186


On 9/15/2025 6:19 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
>> for SM8550 and update match data for X1E80100 specifically so that they
>> could be handled differently in supporting charge control functionality.
> Why?
Is the question about why this was submitted as a separate patch, or 
about the need for the change itself? The reason for the change is 
explained in the commit text. As for submitting it separately, that was 
done to address Bryan's comments to split out the compats changes. 
Anyway, I will address the further comments from Stephen to make the 
change bisectable.
>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/power/supply/qcom_battmgr.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index 008e241e3eac3574a78459a2256e006e48c9f508..174d3f83ac2b070bb90c21a498686e91cc629ebe 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -19,8 +19,10 @@
>>   #define BATTMGR_STRING_LEN	128
>>   
>>   enum qcom_battmgr_variant {
>> -	QCOM_BATTMGR_SM8350,
>>   	QCOM_BATTMGR_SC8280XP,
>> +	QCOM_BATTMGR_SM8350,
>> +	QCOM_BATTMGR_SM8550,
>> +	QCOM_BATTMGR_X1E80100,
>>   };
>>   
>>   #define BATTMGR_BAT_STATUS		0x1
>> @@ -1333,7 +1335,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
>>   static const struct of_device_id qcom_battmgr_of_variants[] = {
>>   	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>   	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>> -	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
>> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>>   	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>
>>

