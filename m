Return-Path: <linux-usb+bounces-28564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88FB975EF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 21:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 204457AF75E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 19:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EE73019B9;
	Tue, 23 Sep 2025 19:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixd2zA1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E812E7F27
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 19:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656218; cv=none; b=dSw6YS3LT9nJp0aGvOXMpUZl4FJVCToJbZbIHeeEXCTxamYYV+eLRJb/BPkHiemWiBnZi46E6rTaBLfBNvrir9Z9g1Qv6phWtVgH2ATGS3ONjyeaQ+quEsGubqPRmtStL0v86/XU3D9Xh0OH1PgMvFSZQ+1xKvIcG8iauXluis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656218; c=relaxed/simple;
	bh=1iqe1y2ibI+fHdNR9WdsYwRbrTafRFMRYIggoMNDtII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8pak+4T76tWAE2lr/qr2W4nZ4Ha5qZhYqu5/CsyqzE0MksrHAM9WBPC6BF/GUebOxYK/HkkDXXrQi/5QXVs6JNpeK3uzpdu1U34E12kPEF4liCYIBWB1VwJgMelKkQcdGAGqPsouNnTxjj3sZO2yd1ntAays+2BKxarqp/xld8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixd2zA1N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFOWsn021317
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 19:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJneKB6KUlYtnPIPcPrOqQOo+8uP80oakK/pn7zFJCw=; b=ixd2zA1NnKzqnOhq
	d2ZzEpMjcuwg+2EHlZrLhD8oW9qTrB7WEKcN6uiBS9yzBJL81zzoF79Z46pj3Yev
	Wfq6KidPBDuUDUgq+1SPcO9qXZdSfyXugG/yGi+SpJTTsXn1hIFKfi71D33lRw3w
	BBzPWnTxHDuGMG0IABoE1Xl8mZkqutkvketAZXxdsFFKNw797+VM2X2k8sOJbRIO
	JYUFDiinEErxwpPb6jqrXV5pOtNxgeDZ1PjifQSObGwhNO6MnJ3ikpAOXd2G+HMG
	hAmFe3klh7x8gTlUlo37/ivHd4RWAMVV5lwoQhGQ+Dt/RP97nqVE3BVI6BeHTd3B
	V/3/RA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvju5y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 19:36:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5514519038so6331381a12.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 12:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656215; x=1759261015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJneKB6KUlYtnPIPcPrOqQOo+8uP80oakK/pn7zFJCw=;
        b=ZKV0bBtOoNaRKnq9nBeR91OosmfceUPvk6J2GFvthIQQHG9lqNXLEsyVWytEaxHeOx
         CJjzpLbck+JDV7EMJQLssG/r2fiT5d/g67erDebLn8uVf/GtQ0jbV8Gl4AFtJ78dAeYK
         BX7pVGFWBKcpJqeiLfoJUPQIZgdbHsNhg2z66KV12r8WRZsr/ZjgPM4tJJk+kskw6lr9
         +iRCoLocEXpyJgmEGC3yicpD1adE8pII/3SM8HNQZ4ut52f4C3fOSUCr9UzNjyCa6A6c
         LD6Wrb7ZepVWDEs7btXXY2xiLazTX1IOu+E4PuAHQIeFYHVS+9ZnFDBErPDFQDOC2XAY
         B+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV5kP/10+7z3WPwK6SCA7ep05mLLyb/xE8OzakT75YcmlZngZpY45tIG+CJ2mBX1wd5ehq4lwhlNEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTPT5RFk5XztIfds7t1M6lV5oTzFuxBO1ovrOKS0jcQVF94hQ
	mm4eVrmd1V239IXJKB/DnSDvYvzm47J24BhZCo/cnUSGYZBpmTU1HaXG1z0jp6F+TDqtaHpPrYn
	WTWmpoDu94BwZhKW/sjPY9Hi2gD68lLOjF8igNA9ovUZ0EfxYNY7S1+RENB5ppBc=
X-Gm-Gg: ASbGncuD4mzcoB5rzmISwVgGQatFKp2qWVEHAbwvf0ynSCdoy7lJu2ycbHlq6pe1NbG
	9gpZS7aoxxiYRKg0yLeHUi5sxcL02kdtnjJN5+j8cw1PGw9aKJXYyT5gOu6qT5gu02I1Sg6RORO
	dj1eXpzFOLsnZZcIUrX6ImsH7U1qr/Brc4QodFSn2TP4TX46Uge12hRkGoP4tP6kPsoGOP0sdhV
	vNcV430Jzl6BLpPKEtDOWLKxep0Hs63ksyL41Jgs7xUhHt7hOb7XQJE2pcFYsy29Ry0lPCHMNs3
	FbFIKsxDyIEdnz76UjyRyfjgkxZJdHJMVJaHXsVy4OT79GMr2kFSTqAJZBCRrroUNivRt+irgEt
	sdn9qEA==
X-Received: by 2002:a05:6a20:3d1c:b0:2ac:7567:c069 with SMTP id adf61e73a8af0-2cfdac2f25fmr5659660637.17.1758656215455;
        Tue, 23 Sep 2025 12:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS/UpqR/9Of4sY1TBzz+iudIRPwp/SAd9XDBUzr/RWXOhBvNioYOHJ1X+iG1pgZNxz8t6Mhg==
X-Received: by 2002:a05:6a20:3d1c:b0:2ac:7567:c069 with SMTP id adf61e73a8af0-2cfdac2f25fmr5659637637.17.1758656215026;
        Tue, 23 Sep 2025 12:36:55 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f315254edsm7397688b3a.84.2025.09.23.12.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 12:36:54 -0700 (PDT)
Message-ID: <f1b53a1b-ff29-38a9-db54-8acfd1abac7b@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 12:36:52 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
 <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
 <pvma73qs7msh2qkoaqhfv5v57f3asduuutwf73ceyrxbpsv4sl@fd6fs6yrfjp7>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <pvma73qs7msh2qkoaqhfv5v57f3asduuutwf73ceyrxbpsv4sl@fd6fs6yrfjp7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v6nxvFwFnsVziuEk5mLEDHTLVi4EPSGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX0zwM28WhDYij
 eQY5lS/A8JANdtx3GiSLUS2uEvl9teeK+KP6267SVcf2oM1Jcc/urOxbgA5W7yZYDuAK5FrGfnB
 Cal+HLxFRoBx1Tj8Mmoujgk5uoQum751xFtLI3ys+Bzjlaqhyk5mkaNilwp2Sd9/m96K/ZPi5n9
 KDoYffSQK7S5e+w4xWcfpnauLUrQu2z/c44f4JhafWCgF4RLZ1JVOzpGiYAxbdmlzE3CD1T9bwe
 z1GmnM3d6sVOa4v2V6yAEkBJYsDmOMIcOMJmiP+8gs6KSTT+gUp9l7JZLVuxcX9KRSLDdIlnjiX
 2e6Z8BwtbYlt9p9+p2vs/5PO0HAolCygZnNUV9qO3zqYUowycKXXFNv145uzsKrkEdExhr+ubDK
 1iVWTtXz
X-Proofpoint-GUID: v6nxvFwFnsVziuEk5mLEDHTLVi4EPSGF
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d2f6d8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=ySdWX0gGKps6jh8XKZoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011



On 9/22/2025 8:40 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 06:00:04PM -0700, Wesley Cheng wrote:
>>
>>
>> On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
>>>> The Glymur USB subsystem contains a multiport controller, which utilizes
>>>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> index a1b55168e050..772a727a5462 100644
>>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> @@ -16,6 +16,7 @@ description:
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>> +      - qcom,glymur-qmp-usb3-uni-phy
>>>>          - qcom,ipq5424-qmp-usb3-phy
>>>>          - qcom,ipq6018-qmp-usb3-phy
>>>>          - qcom,ipq8074-qmp-usb3-phy
>>>> @@ -62,6 +63,8 @@ properties:
>>>>      vdda-pll-supply: true
>>>> +  refgen-supply: true
>>>
>>> You've added it, but it's not referenced as required. Why is it so?
>>>
>>
>> Hi Dmitry,
>>
>> The refgen clock isn't always required on each and every platform unlike the
>> .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only really
>> depends on how the refclk/CXO network is built for that particular chipset.
>> The refgen ensures that we're properly voting for the supply that is
>> powering our CXO buffer.
> 
> So, it should be marked as required for those SoCs that use it and set
> to false for the SoCs that don't.
> 

Got it. Will fix.

>>
>>>> +
>>>>      "#clock-cells":
>>>>        const: 0
>>>> @@ -139,6 +142,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - qcom,glymur-qmp-usb3-uni-phy
>>>>                  - qcom,sdm845-qmp-usb3-uni-phy
>>>>        then:
>>>>          properties:
>>>> @@ -147,7 +151,7 @@ allOf:
>>>>            clock-names:
>>>>              items:
>>>>                - const: aux
>>>> -            - const: cfg_ahb
>>>> +            - enum: [cfg_ahb, clkref]
>>>
>>> Why is it being placed here? Please comment in the commit message.
>>>
>>
>> Main reason if to avoid having to define another IF/THEN block, but I can do
>> that as well if using enum here is not preferred.
> 
> Is it some new clock that hasn't been used on the previous platforms? Is
> it actually supplying the PHY rather than the controller (note the
> CLKREF clocks on SM8550 / SM8650.
> 

On the recent mobile chipsets, we don't utilize the QMP UNI PHY, so 
those would be n/a for this.  I checked x1e80100 and sc8280xp, and there 
might be an error with the x1e80100 MP UNI PHY definition, because I do 
see that there are TCSR clkref control for both MP QMP PHYs, and we 
should be programming those...

In short, yes, this clkref is technically "new" in that it adds the 
references to the TCSR handle that controls the output for the PHY 
reference clock.  With that in mind, I think its better if we add a 
separate IF/THEN block.

I will submit a patch in a separate series to fix the x1e80100's UNI PHY 
definition, once I get a chance to verify it.

Thanks
Wesley Cheng

>>
>> Thanks
>> Wesley Cheng
>>
>>>>                - const: ref
>>>>                - const: com_aux
>>>>                - const: pipe
>>>> @@ -157,6 +161,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - qcom,glymur-qmp-usb3-uni-phy
>>>>                  - qcom,sa8775p-qmp-usb3-uni-phy
>>>>                  - qcom,sc8180x-qmp-usb3-uni-phy
>>>>                  - qcom,sc8280xp-qmp-usb3-uni-phy
>>>>
>>>> -- 
>>>> linux-phy mailing list
>>>> linux-phy@lists.infradead.org
>>>> https://lists.infradead.org/mailman/listinfo/linux-phy
>>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

