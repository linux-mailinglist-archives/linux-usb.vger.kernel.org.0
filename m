Return-Path: <linux-usb+bounces-24488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50AACDB2C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 11:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB0B43A4510
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AC828CF6E;
	Wed,  4 Jun 2025 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuZJA+Cm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF222539F
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030023; cv=none; b=l5tOcHUk6iFj6Htr1/fdP8/T7iObKMPHKx285dd8/O+9B0tnEjqM1poT3z2X+T02UPZwT18iRNA0OPGfEgxD3MXMFCrnItacu5jg81Uukr0L2FSVnhoXgqbMOXeFGh1+rEuh8Q18Lgql3QyHpswSK4Y/xpAW21SII2IbCRTzDvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030023; c=relaxed/simple;
	bh=1Oq+QK6DtW3S+GpXlQ6xHnSJKU+GIAlR+6vmh4nl108=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjBD6kIzl8sEkh22aWiHrocX8oJIwJGvzdFfIJgAt/kr0HLtkGM/hDpmQ4bb+lls9ceTaQ3S445AbNCToePEvTVVVZlP+VxujQgOx+9KTS08HFP53hahyGIJ96wMx3Hyi3pCkbTFVtpwb/NTrnmBtWjlSU+XLW2RtAg6+C8cCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuZJA+Cm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549T6Mq013323
	for <linux-usb@vger.kernel.org>; Wed, 4 Jun 2025 09:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehfJf/B06kDJTwICFuLMnBb1b7Hu+mMt7DmuRM99TgU=; b=WuZJA+CmnISg0IGm
	U/O0RkM8c/iieR5oUzJ3HzpVAX4shqOyIIndJXKX7hGtTtyIEc8SGXDyL55N36Lz
	vjc2851eI+jeJfIscrWvr7jn+1gS/o0l2WgjYukUBhdEbysZgiLPhBEphMBT7cF3
	igb+8ITdJgvQjPjaZ9BUeKJgNhGKn/2FpvQwuE3ZCPP21D4j2xsMame6FAwmdzHQ
	mEKNN7mIVD64fkKBx2+H/sq6bJRig05ULB19AtusL4nfWfmkw3f5mrhZ/RhQzMfV
	1uax2kC4wLwz6nD3HXYssQr97uwYk2MdyGSjSZs5xeUvisGREzaFtx/ziJTFe8ZI
	NDtLng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be819ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 09:40:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2358ddcb1e3so52177215ad.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 02:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030020; x=1749634820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehfJf/B06kDJTwICFuLMnBb1b7Hu+mMt7DmuRM99TgU=;
        b=t0M+g9qEBnmA5JdJ73NNqRmcmxZ8gpMTW/XifDYXzafDacvGyfMl/J1FN5z/AWfpVP
         WMimkSVSPzp9oENyx3hoHFD+8hoVPYjKxYHAedAWmo9KBzk79ronhtdTifH/LSCN+R3f
         PVl+FrGdf4cHOqw2la+Xw7w4uflYlQaU6WZdMyMh6G/747d59BxbQ8sbnwZfhL4E23wk
         wPS9JSjgjvJdxAuTkKCFMUpzFpTcG94HbefZr7SGPtns67syti9x2TEivtDVmjie5wV8
         rENAJ/YNCw9ZfCQXyctuR5wELvyFBEhGqtl600uVIX+jvBuZvdjqMWda9P83LpXav/Do
         BmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJka0Sdnh1NrNysE0v9EBzFYCOkZNXxiLFhF5/yVaejWSFb+OsYH4JaJQE4Z+7sVsbcrqAsyuFBsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOhvrB6LtDjNqF9Tm+9H4ynGoJ8GklLLaRCW2Kyb7GuWc36+w
	oxj8ADauWL4QjCjnGk2HxnEav9CpibGP/OhLLmuMtdtHuf8Z4Pq0Eg74UycBKD3Kwc5MASuQUM0
	02UyT3KP/+TCb1kz4eeF57+gsZZ3rhLbDbSoal4TkUQF1RCC9y9Cf/0Nh53K0k2Q=
X-Gm-Gg: ASbGncvE0BGwVIMcxNtXR4QXbSMKSlqWgX/mH89Q8q+UatEWDGhfxeOO3nUR26K3I3Q
	uxiMffF6PTsWOwbe46yPGgRTkSruWWPW4dBOqDPiSTBKi2mS/u7kli4dajCjmAIOS9cHG2+V3rw
	IOcr58DXmz9fSfmxA0zFb/9uwe6iumWpIANhVqeplVJ840CGsVbCO1lBp9I89/AwuGRYFoayAjI
	Ar77yP7LQuPwzrvGh9UvtF726Ff4XnQdk80pZIUH7zMeYnoV8WDAtcImPiZc239bOadybmmn6xg
	h0gdieZSAw2FJpySnY+zH9FLNQV3t2ht9jJ9rQ6v8zVYVyoWSezWOu0pszTpJ/ftCsk734+B3cw
	7
X-Received: by 2002:a17:902:e80e:b0:234:a139:11fa with SMTP id d9443c01a7336-235e112921emr28649615ad.3.1749030020020;
        Wed, 04 Jun 2025 02:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1vhO7ZAlz+m9O2qFjGc4Yn7BJiMc/2wBHTuo17Wh8+4LWBA/1mZhmuYZdb7VBXfY2r5zHiA==
X-Received: by 2002:a17:902:e80e:b0:234:a139:11fa with SMTP id d9443c01a7336-235e112921emr28649175ad.3.1749030019581;
        Wed, 04 Jun 2025 02:40:19 -0700 (PDT)
Received: from [10.133.33.130] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd8d6dsm99932015ad.119.2025.06.04.02.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:40:18 -0700 (PDT)
Message-ID: <9f332148-57ef-4716-8866-36c702a9aeb6@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 17:40:13 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
 <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
 <14cba9ae-e3bb-46e8-a800-be5d979b2e06@oss.qualcomm.com>
 <b07200a2-4e7b-480e-a683-d116e7da8de8@kernel.org>
 <c4be4b97-6104-45e3-b555-6691e369c3a4@oss.qualcomm.com>
 <bcf487c9-e522-44a3-b094-daf98823a195@kernel.org>
 <a840aa80-75ef-4527-bc17-226ba5157a85@oss.qualcomm.com>
 <898e998f-11b2-4b08-9580-263046c0615a@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <898e998f-11b2-4b08-9580-263046c0615a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68401485 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OiBcQO-rpwxFLkUKu48A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: APmn3ivwzfYaOCg8K1rvPdUICDG1j6FL
X-Proofpoint-ORIG-GUID: APmn3ivwzfYaOCg8K1rvPdUICDG1j6FL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3MiBTYWx0ZWRfX28OWErDXWCXU
 YU5mbPg1K5VkepkFWeeICncGqcLUSqBBowKWU9koKxv+oRWeU+Vd9SNbAyyFiuBLx2kKV1NUtYI
 r1Kmfa+xpi5UQ7XGejSj6OdbtKG9dCY+irx+USXuqGFKw0SVZOouvAQ0mfCJix59ULNQ/1ueJob
 EPjq2Ew7H318jXGtpeVoKvVuREIunwq6J4WvQVdRqpojLYMeBhN646F+bjwIEc6BIgR9luyiiFD
 Ko9BoquET5RecmFzmnpNKXJ5k5tsy2CkRJVl8pGYT5jUgYtc76qahUfPqYK5CNo1LBuh1Akxngo
 Na6RNsg3hj4OtNYgkKuQmGQTRi7bGOlTQsa+Sk65ok/XmQhveVrHEhEFvrRJh0aoJc1hdrANtA5
 F0bSOMw85KMrzewqCf/4NSLc7LAqXz4uuHvfXmYjMBEbNi15oWwlpLzcXZ+//sdNCkiOarmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040072


On 6/3/2025 5:34 PM, Krzysztof Kozlowski wrote:
> On 03/06/2025 09:41, Fenglin Wu wrote:
>> On 6/3/2025 3:06 PM, Krzysztof Kozlowski wrote:
>>> On 03/06/2025 08:59, Fenglin Wu wrote:
>>>> On 6/3/2025 2:47 PM, Krzysztof Kozlowski wrote:
>>>>> On 03/06/2025 08:42, Fenglin Wu wrote:
>>>>>> On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>>>>>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
>>>>>>> Why?
>>>>>>>
>>>>>>> Do not describe what you do here, it's obvious. We see it from the diff.
>>>>>>>
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Krzysztof
>>>>>> Previously, in qcom_battmgr driver, x1e80100 was specified with a match
>>>>>> data the same as sc8280xp, also sm8550 was treated a fallback of sm8350
>>>>>> without the need of a match data.
>>>>>>
>>>>>> In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated
>>>>>> as a fallback of sm8550. There was no issues to make x1e80100 as a
>>>>>> fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.
>>>>>>
>>>>>> In patch [5/8] in this series, in qcom_battmgr driver, it added charge
>>>>>> control functionality for sm8550 and x1e80100 differently hence
>>>>>> different match data was specified for them, and it makes x1e80100 ad
>>>>>> sm8550 incompatible and they need to be treated differently.
>>>>> So you break ABI and that's your problem to fix. You cannot make devices
>>>>> incompatible without good justification.
>>>> I would say x1e80100 and sm8550 are different and incompatible from a
>>>> battery management firmware support perspective. The x1e80100 follows
>>>> the sc8280xp as a compute platform, whereas the sm8550 follows the
>>>> sm8350 as a mobile platform.
>>> Not correct arguments for compatibility.
>>>
>>>> The difference between them was initially ignored because the sm8550
>>>> could use everything that the sm8350 has, and no match data needed to be
>>>> specified for it. However, now the sm8550 has new features that the
>>>> sm8350 doesn't have, requiring us to treat it differently, thus the
>>>> incompatibility was acknowledged.
>>> So they are perfectly compatible.
>>>
>>> I really do not understand what we are discussing here. Explain in
>>> simple terms of DT spec: what is incompatible that SW cannot use one
>>> interface to handle the other?
>> 1. x1e80100 was a fallback of sc8280xp, it used "sc8280xp_bat_psy_desc"
>
> No, that's not true. Read the binding again:
>
>                - qcom,x1e80100-pmic-glink
>             - const: qcom,sm8550-pmic-glink
>
> No fallback to sc8280xp.
>
>
>> when registering the power supply device.
>>
>> 2. sm8550 was a fallback of sm8350, and they all used
>
> Also not true. The remaining fallback is not sm8350.
>
>
>> "sm8350_bat_psy_desc" when registering the power supply device.
>>
>> 3. x1e80100 and sm8550 they are incompatible as they are using different
>> data structure of "xxx_bat_psy_desc"  and other “psy_desc" too, such as,
>> ac/usb/wls.
> Look at the driver and bindings now - they are compatible. It looks like
> you made it incompatible and now you claim the "they are incompatible".
> No, you did it. Look at the driver.
>
>
>
>> 4. For charge control functionality, it's only supported in the battery
>> management firmware in x1e80100 and sm8550 platforms. And the change in
>> battmgr driver (patch [5/8]) adds the support by using 2 additional
>> power supply properties, which eventually need to be added in the
>> "properties" data member of "xxx_bat_psy_desc" when registering power
>> supply devices. Hence, "x1e80100_bat_psy_desc" and "sm8550_bat_psy_desc"
>> are created and used separately when registering power supply device
>> according to the "variant" value defined in the match data.
>>
>> The main code change is in [5/8], I am pasting a snippet which might
>> help to explain this a little bit:
>>
>> -       if (battmgr->variant == QCOM_BATTMGR_SC8280XP) {
>> -               battmgr->bat_psy = devm_power_supply_register(dev,
>> &sc8280xp_bat_psy_desc, &psy_cfg);
>> +       if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> battmgr->variant == QCOM_BATTMGR_X1E80100) {
>> +               if (battmgr->variant == QCOM_BATTMGR_X1E80100)
>> +                       psy_desc = &x1e80100_bat_psy_desc;
>> +               else
>> +                       psy_desc = &sc8280xp_bat_psy_desc;
>> +
>> +               battmgr->bat_psy = devm_power_supply_register(dev,
>> psy_desc, &psy_cfg);
>>                   if (IS_ERR(battmgr->bat_psy))
>>                           return dev_err_probe(dev,
>> PTR_ERR(battmgr->bat_psy),
>
> This explains nothing to me. I think you did not get my questions at all
> and just want to push whatever you have in drivers.
>
> Such ping pongs are just tiring, so go back to my previous email, read
> it carefully and try harder to understand what compatibility means.
>
>
> NAK, you are affecting the users and ABI with justification "I make it
> now incompatible, so it is incompatible".
>
> Best regards,
> Krzysztof

Thanks for the explanation with patience. I misunderstood the fallback 
behavior.

I was worried about if the compatible string matching would work 
correctly if both the device node and the driver declared multiple 
identical compatible strings.

I understand now and even if the device node and the driver have defined 
multiple identical compatible strings, the best match which is the most 
specific compatible string will be found.

So in the example below, for X1E80100-CRD, the battmgr driver will 
always match to "qcom,x1e80100-pmic-glink" which is the most specific 
compatible string defined at the beginning of the device node compatible 
string, and the compatibility has not been broken.

In qcom_battmgr driver:

static const struct of_device_id qcom_battmgr_of_variants[] = {
         ...
         { .compatible = "qcom,x1e80100-pmic-glink", .data = (void 
*)QCOM_BATTMGR_X1E80100 },
         { .compatible = "qcom,sm8550-pmic-glink", .data = (void 
*)QCOM_BATTMGR_SM8550 },
         ...
};

In x1-crd.dtsi:

pmic-glink {
           compatible = "qcom,x1e80100-pmic-glink",
                      "qcom,sm8550-pmic-glink",
                      "qcom,pmic-glink";
         ...

}

Let me know if my understanding is correct. I will drop patch 
[6/8],[7/8],[8/8] in next version.

Thanks


