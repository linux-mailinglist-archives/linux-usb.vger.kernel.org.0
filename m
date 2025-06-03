Return-Path: <linux-usb+bounces-24447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E3ACC14D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 09:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17C553A3C7A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 07:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A6E269D06;
	Tue,  3 Jun 2025 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNZuuOQv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550B5269AE7
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936481; cv=none; b=LZgwS5lXiXuDOlTJW9il+Zh6WgAFjP+Ee5lJWwzgyc8XwfrOMb6nJU01ki/vH447OJybqk8NXNTg68m9VJD1jMLIvAnxNmpKu/HHyFcM3/hYayNXqCAbgQqWplz5kdowjKkPc10b+DK2fkQ7ImPePwQbLdP8nB4bW1U53oOtEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936481; c=relaxed/simple;
	bh=In8KGH84rQSlIQGJCX8qPgiH7qfMn5UKCVWmjMX7u5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEWpF5JyLisdRV+kLC+GEcX1Gu/b6gkwuObldx6ZgbSMowSibyFAeMQCijk+1J8r0PG/sfsu3bHLrfiSEqVSkSePUJqYWdGg+QGw6lDN3zG4TpvMh58oxKSexUOcpCZqHqbgB9+uj41VOl8L2MpS088hH3ZUUhQMf6XL7Dztvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNZuuOQv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552N7vnn013294
	for <linux-usb@vger.kernel.org>; Tue, 3 Jun 2025 07:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rn7HNqQKqhT5Xc11pa0QotTmX+wuzsGSTytyFvDOsL0=; b=PNZuuOQvCMw7rZZq
	X7bD4fPSjo0Xpcb857UQWEt7uX6B9QNVbP6gNs7kn7W1UOfUZD5KuVk2j765LH6R
	XR07XE99U6hhEzq9xpg6AHsH2OkKpF/9qWtvgD+zsoDOfx/MWdKGc8HNiovQOHcb
	8brx3a57J5DlcLzoqRaB2ySXFGymNAjukKO7KRvfr5Xiz5/2rXD0oSCqJ7Dacp/u
	F0ScmCPIHK636dlE4o+jDI5P/GdjIQj4ekFdk5xG8LClK0Bj1u+VM3t5U9teC5N8
	GqDHmNKul34qaPJHAmrietVfGJJHl1huMJGq6xJjpBVAnou0L/7RTQikhds629C1
	gnSK4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1rjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 07:41:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74620e98ec8so4530922b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 00:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936478; x=1749541278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7HNqQKqhT5Xc11pa0QotTmX+wuzsGSTytyFvDOsL0=;
        b=K0g1qjKTuUNgK7cH9LIlcjSIfPcDIx+Y77IvsEeprl776mPS6ocPf1orwQ3ly8IZOt
         WDdrwd3iGfw6MHCrToyiQSzV1/4xuiAIs3wAiUJbps5W2rJmaeJMOU47TVq8zcEk510E
         /zk0cMIFEyfLBXo5HvtMsSqOe/vEDLwPSeY52KpZoaSSXpxGu/7gcN2IB3+2g0ukgohN
         TNBGOuTg4E2pj2VjsoMMqRmWtiVUQP+0NhxWA2nnH16iC0MdB5kDM2sWPXBm4Ze/WcFe
         TRMlqW7SeGUVwDlYTplc2O9t7u5u07e93VZdD/KnphAhwAH+N8WsSZ9U62PRseY79zBB
         wXIA==
X-Forwarded-Encrypted: i=1; AJvYcCWUo4+Y0CR0T4Pli787WRzUqdbSYGVctsppbPtMYwJ8SNiNgcrXAaloYvkrf7/MNEfGk9hLoa3oXUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Y7Ej/yuVMFV655ufFTcpqIpPudbGPP5pjzwW6lzhCUFahSi4
	R5/PNMgt5H6QMNfJW6ea/RTsO4rn5O4InQ3TEDvO39y3Cuho2pcmaYPAA8j+ldfoZGQ3Nkkc+kh
	fLZ3nEr/4jc4tNnK9m3xy8HJLSWeae/8zbgQlOVaZUJyuozFTbiNaGrf4E+5ncG8=
X-Gm-Gg: ASbGncuxSqgrkMq2FgWKsx/EuZY26zZDiy/Ko6iVQ8I3uVstGscbf0D8U357tpZm2J1
	CilKydSzaWUrvA2RyTesJM2ZncfdtaiIo0006RftsbgFFTUaZaU1vR8NWooIpQtjsurRAMKNZgC
	5xpdafXaY96SykWr/MdoUU+UCVmSgUlhLaRA6h8aErB3eYdnZm1UpNjD5g8510m9xN9HGaoYnhd
	dhzUYLs7ZUr6/tfQQwfIGK997FYdWM0jHxaRrzgP93NhUmKZhwxGKUy06b8DZQm225uFFBO5gkp
	CCpb6NyhcGuSi+HbiWYbCm8Aorc9DPhHJbg/d55N9PoYgyT00o2j3v6USLviahOd4R9Ok0jEghQ
	8
X-Received: by 2002:a05:6a00:198a:b0:744:a240:fb1b with SMTP id d2e1a72fcca58-747fe26f390mr2416084b3a.5.1748936478488;
        Tue, 03 Jun 2025 00:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxDdY+DvTThVS555Bkd87SdzVaej4kipGmlkAAc0IcgdaXB8CqEZUdpp/TxJdPYRMWzhVo2w==
X-Received: by 2002:a05:6a00:198a:b0:744:a240:fb1b with SMTP id d2e1a72fcca58-747fe26f390mr2416038b3a.5.1748936478058;
        Tue, 03 Jun 2025 00:41:18 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf4b9sm9071161b3a.133.2025.06.03.00.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:41:17 -0700 (PDT)
Message-ID: <a840aa80-75ef-4527-bc17-226ba5157a85@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 15:41:12 +0800
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
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <bcf487c9-e522-44a3-b094-daf98823a195@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=683ea71f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zsytL_p2Dl488aa6HTsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: k0HoMalHrnd7-vTnHs26Ynm99dWvc202
X-Proofpoint-GUID: k0HoMalHrnd7-vTnHs26Ynm99dWvc202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2NSBTYWx0ZWRfXyHCaA/JM2NJS
 9lM2tvjetk/yl7q577mKrS2aMiLwdvRt2WyFg9YkLTWNUlTqz46lKqk0QJ8vABmEJ3+0LMR8BaD
 iHoY8SVBN9Hx/D2N//Bb9WloRjiA5ZHGDVZwj/TFxqXQeUNDZC/sqHdeyNtHtO0W53aNdsvFP9O
 8g17HGe9pBfbyVOXW1fmipgRu0Ak9o1S5oZ0eFq0n4LaOcISq7FZ4B0vXTt4P38oUF53VEcxfw2
 QTUR5Kr0Lghq2SMuE2X/akXlOJhqAZKWnpqsh7P4sTqlMliPi21C6UJk/7nEiM4K3Mi06MS1rHU
 i15Sa0ph3MSXcVn5PGrYKnRMNrMkfKutFvN16f3auSx1qIO/uJAexu23laQh40ea2rJe0DTs201
 gG/T6u4GZAahKzG4NjKLMFf4BXepbtAIeWzPXi62eDtPXr7A3fMjVvOC3xqgGANdTZuxRMtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030065


On 6/3/2025 3:06 PM, Krzysztof Kozlowski wrote:
> On 03/06/2025 08:59, Fenglin Wu wrote:
>> On 6/3/2025 2:47 PM, Krzysztof Kozlowski wrote:
>>> On 03/06/2025 08:42, Fenglin Wu wrote:
>>>> On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
>>>>> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>>>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>>>
>>>>>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
>>>>> Why?
>>>>>
>>>>> Do not describe what you do here, it's obvious. We see it from the diff.
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>> Previously, in qcom_battmgr driver, x1e80100 was specified with a match
>>>> data the same as sc8280xp, also sm8550 was treated a fallback of sm8350
>>>> without the need of a match data.
>>>>
>>>> In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated
>>>> as a fallback of sm8550. There was no issues to make x1e80100 as a
>>>> fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.
>>>>
>>>> In patch [5/8] in this series, in qcom_battmgr driver, it added charge
>>>> control functionality for sm8550 and x1e80100 differently hence
>>>> different match data was specified for them, and it makes x1e80100 ad
>>>> sm8550 incompatible and they need to be treated differently.
>>> So you break ABI and that's your problem to fix. You cannot make devices
>>> incompatible without good justification.
>> I would say x1e80100 and sm8550 are different and incompatible from a
>> battery management firmware support perspective. The x1e80100 follows
>> the sc8280xp as a compute platform, whereas the sm8550 follows the
>> sm8350 as a mobile platform.
> Not correct arguments for compatibility.
>
>> The difference between them was initially ignored because the sm8550
>> could use everything that the sm8350 has, and no match data needed to be
>> specified for it. However, now the sm8550 has new features that the
>> sm8350 doesn't have, requiring us to treat it differently, thus the
>> incompatibility was acknowledged.
> So they are perfectly compatible.
>
> I really do not understand what we are discussing here. Explain in
> simple terms of DT spec: what is incompatible that SW cannot use one
> interface to handle the other?

1. x1e80100 was a fallback of sc8280xp, it used "sc8280xp_bat_psy_desc" 
when registering the power supply device.

2. sm8550 was a fallback of sm8350, and they all used 
"sm8350_bat_psy_desc" when registering the power supply device.

3. x1e80100 and sm8550 they are incompatible as they are using different 
data structure of "xxx_bat_psy_desc"  and other “psy_desc" too, such as, 
ac/usb/wls.

4. For charge control functionality, it's only supported in the battery 
management firmware in x1e80100 and sm8550 platforms. And the change in 
battmgr driver (patch [5/8]) adds the support by using 2 additional 
power supply properties, which eventually need to be added in the 
"properties" data member of "xxx_bat_psy_desc" when registering power 
supply devices. Hence, "x1e80100_bat_psy_desc" and "sm8550_bat_psy_desc" 
are created and used separately when registering power supply device 
according to the "variant" value defined in the match data.

The main code change is in [5/8], I am pasting a snippet which might 
help to explain this a little bit:

-       if (battmgr->variant == QCOM_BATTMGR_SC8280XP) {
-               battmgr->bat_psy = devm_power_supply_register(dev, 
&sc8280xp_bat_psy_desc, &psy_cfg);
+       if (battmgr->variant == QCOM_BATTMGR_SC8280XP || 
battmgr->variant == QCOM_BATTMGR_X1E80100) {
+               if (battmgr->variant == QCOM_BATTMGR_X1E80100)
+                       psy_desc = &x1e80100_bat_psy_desc;
+               else
+                       psy_desc = &sc8280xp_bat_psy_desc;
+
+               battmgr->bat_psy = devm_power_supply_register(dev, 
psy_desc, &psy_cfg);
                 if (IS_ERR(battmgr->bat_psy))
                         return dev_err_probe(dev, 
PTR_ERR(battmgr->bat_psy),
                                              "failed to register 
battery power supply\n");
@@ -1394,7 +1628,12 @@ static int qcom_battmgr_probe(struct 
auxiliary_device *adev,
                         return dev_err_probe(dev, 
PTR_ERR(battmgr->wls_psy),
                                              "failed to register 
wireless charing power supply\n");
         } else {
-               battmgr->bat_psy = devm_power_supply_register(dev, 
&sm8350_bat_psy_desc, &psy_cfg);
+               if (battmgr->variant == QCOM_BATTMGR_SM8550)
+                       psy_desc = &sm8550_bat_psy_desc;
+               else
+                       psy_desc = &sm8350_bat_psy_desc;
+
+               battmgr->bat_psy = devm_power_supply_register(dev, 
psy_desc, &psy_cfg);
                 if (IS_ERR(battmgr->bat_psy))
                         return dev_err_probe(dev, 
PTR_ERR(battmgr->bat_psy),
                                              "failed to register 
battery power supply\n");

>
> Best regards,
> Krzysztof

