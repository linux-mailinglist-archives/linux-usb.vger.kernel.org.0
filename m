Return-Path: <linux-usb+bounces-29270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92710BD71D1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 04:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B537040180B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 02:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AF0305943;
	Tue, 14 Oct 2025 02:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnNcNtJY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3C43054CE
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 02:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760409577; cv=none; b=CDogs+h7ekgY+N7M8MWgTJtHqiVrXN41iQIwTfO9Hg3MnPa37Ncu3sLeP0ONMCmDWbIRIAnt+RibBfh/sKTgVgYDqqYOsJuQ76LBX5XjggnFWuFhMPbrBwkZuqkUg4rLjsiGY9MeHNIUW6s2FTSNxoyRjUe/N73bIHOPi3SGCvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760409577; c=relaxed/simple;
	bh=gJl0FfQuDtF2eNgYEi2LJEGUJxfSedvbty82t8RTVFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rolbltD/3Md/APc3DVvag3SlqsgR8NuFDSg9xvNRZh6gpNhzqi5A8VK11vS+EKf7GDXuT8yYK7WRCQBpByIf63UDrSlo5uUc/hVM2V7LUhw9UKrLiTGLhCvAtNCYsHbXEy/+OY3rK+l9+RL55TDa6jwvOAnzK12HzLxHUVDupb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnNcNtJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDosV021731
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 02:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1liYZOex6u3499p/8XbqN27JoYRD6zSaqlCfAiBYXU=; b=gnNcNtJYdDP4XeIJ
	OyO1R5md2VLhg1Lopy5qqpA4VK7aTRyqXZ0RNDAtYgH1qcUeag59B5gjWmODsqLm
	PoaUN0y9fDPVZ5aucviQfnha1CtPnFRiOYAQshyYOcs3Bbyz8E1KhmOEVhdV7YiJ
	LoqrFKUMGYVFZypIfIDkkK0mDLLOmo+CRIjRk3CB50sXZnlMlwOkcWpv7u0cHBeB
	lh9gOVMkAyQGG1toqIE1bfqh5KnCtzkgGpXTQaQx9A+Fi4DG1O5ibemE7qkAlEhW
	pgyzlptyX2arTnET5bUNX49nBBqBgi7aK7IdDB5EQhXu6WCWGgypaIk9xUgBf5XC
	itkJdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bxucs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 02:39:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269880a7bd9so106962585ad.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 19:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760409571; x=1761014371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1liYZOex6u3499p/8XbqN27JoYRD6zSaqlCfAiBYXU=;
        b=NWWOs5F3Z7JnmClibbB5+IUIiA3Qyaddz6d/woGptyZVGh1Qu7/8cXd1rF0Y1X2O3l
         1A3ouvkqNtaoM36xkU1/EUMn1Rq4nAChHo7uH7TKDUtSQUzqhToYH7TxbglLyipQFnBW
         uC8LzGpq99sQ9ccyZTWj0AoQKjJga8AQMi29L+NbijEaf4VW+E0WOD36IgXOyBa1aAU9
         PXR3NxwGgeV3j44h7JGyQ4FxzNFi5nXN2OPPiPpByQxx3kxq0TGQHT/44AI7rRTu7091
         T11yDqRZ9j/wUgej6hkPUXMC9AZ0RFPPaiCUzxylBZstuvmOq+7QJBVy9vNaZZyPpxCU
         Swgw==
X-Forwarded-Encrypted: i=1; AJvYcCWR4/VeyAQ+QpcIBLIKChJZig9z0O2jGZwM6zVuk9sbTznf8ucs/WCoLBDD0aXCG3S+bmS5+AbKZMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90ho99Jkw7pZhdpP3cp2kJxC26KcrI7euMyjxEl5Igbjq4hjB
	0dsAdNAM2EWl0L2rjH3mudHsr1FXsos8lFZ/mV2eIRoMaJ0k1Mtw87sBlh6OATjmCGiODaXQ2SU
	i8TW73IggIRuNT67BizngC/2o9ZGijfFNm28shrCY3jVgNh26hJtQC8diSOn6YVY=
X-Gm-Gg: ASbGnctXIzKiXeXaZgFFvX5mJvP2OId3E/Xhsl3LXvFRefsIQlKM1BYIN1XxqAuxh7r
	8lO1DrTEB1hEm4xVpbsrqzkYUsXzxpQZQY1rNgkgBxbwXz8rQUTwQII6crvTWcKAUceyVUQAQB3
	zAtT+7n93+8ovilZszfPQUtoO5PxG1mGPbUlRq5kQnDK7nQSCAPkFxxl2c7QAB/Jm/vNoAo/+bc
	WFTeJbau2rAewLFIegkL2udVeucHMfq9aRGM72HyM5gXsD7rXGdQOGQmkjn/HCwaoZrwlGU2iEL
	GXyWOhXUc3/fH+dnZ91DCOaUr0/iKD+G8egiht2VgBUT5UtNhWD9AWS7JPtuT+VTvYoPhb6l0dV
	x
X-Received: by 2002:a17:903:3c66:b0:269:9e4d:4c8b with SMTP id d9443c01a7336-29027379a40mr313265455ad.21.1760409571379;
        Mon, 13 Oct 2025 19:39:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzomiFefnWgNLltTkzNNBTfg0uOb7fx//fR5/hrzk7NEI1Z5j0/t2K0xrD/6XVsL6pRiF72w==
X-Received: by 2002:a17:903:3c66:b0:269:9e4d:4c8b with SMTP id d9443c01a7336-29027379a40mr313265215ad.21.1760409570900;
        Mon, 13 Oct 2025 19:39:30 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.228.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f837dcsm146768865ad.111.2025.10.13.19.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 19:39:30 -0700 (PDT)
Message-ID: <654b804d-fbeb-45ea-a6fd-9d551224c934@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:09:23 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for
 VBUS based on ID state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
 <20251008175750.1770454-2-krishna.kurapati@oss.qualcomm.com>
 <odikli6rfdyid5oqavurtqytgnwgh5hpmka2jt5tprpdw7cd72@icpnjnkfowt7>
 <20251009131543.GA379737-robh@kernel.org>
 <cbpne2d7yr2vpxmrrveqajlp3irzsglxroxyyjmviuci2ewted@6ewwp6yyybk5>
 <2a088c8f-5555-490e-a70d-308a876924ca@oss.qualcomm.com>
 <CAO9ioeX51SzaMS4TK7=xfCXBNYi7SGsMBZAv4FrZ1LzONWFw3A@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <CAO9ioeX51SzaMS4TK7=xfCXBNYi7SGsMBZAv4FrZ1LzONWFw3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 78EBOp6VIU_kdNTqUIVvfoNDdhAqxq4C
X-Proofpoint-ORIG-GUID: 78EBOp6VIU_kdNTqUIVvfoNDdhAqxq4C
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68edb7e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8YinarrYfdS0Dhyguhy4yQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DEfk8Nzn-u4LZ7i_Gp8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX6c3U6EoQ+5iy
 w123Zj7vcJR2MW3vabtZa3ccLx9ffegNGTRcgRvE6tLbfNWEp/kowwwiICUIbA4yHONMCwdFBpy
 ywJCxb935nFjTbIjyA73iQw9Q9x7Ocan18sLAbnpZTq8OBTXM0pGmmbWMv5Ga8+e8syX8trMiym
 hVIRMbHCoWIBou6gSk1knL6Np1g3aFrEYP8Ltr97UnQeSsxOrqx7d7yRJs1Y96k0bli2jSJ2pG6
 lmSLJpUXb+b6Ler+ER29BGudM80r4tVg7tbdrpamSVookJRViyZvCYKi8ObXTKIM+voaHcMi7cB
 67LvWhOgBQLJBk9vo8r5j6pSnpzD+jsLYC3YAve6KyER+Rt5M+OT0S9Xo7dIr6zFusZbZxUgJma
 /IK/MMmICGNWuAxVsnITWrla6Y+Qng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/13/2025 2:38 PM, Dmitry Baryshkov wrote:
> On Mon, 13 Oct 2025 at 04:17, Krishna Kurapati PSSNV
> <krishna.kurapati@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/9/2025 8:08 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 09, 2025 at 08:15:43AM -0500, Rob Herring wrote:
>>>> On Wed, Oct 08, 2025 at 09:31:59PM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 08, 2025 at 11:27:49PM +0530, Krishna Kurapati wrote:
>>>>>> Update the bindings to support reading ID state and VBUS, as per the
>>>>>> HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
>>>>>> asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
>>>>>> VBUS must be at VSafe0V before re-enabling VBUS.
>>>>>>
>>>>>> Add id-gpios property to describe the input gpio for USB ID pin and vbus-
>>>>>> supply property to describe the regulator for USB VBUS.
>>>>>>
>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>> ---
>>>>>>    .../devicetree/bindings/usb/ti,hd3ss3220.yaml       | 13 +++++++++++++
>>>>>>    1 file changed, 13 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>>>> index bec1c8047bc0..c869eece39a7 100644
>>>>>> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
>>>>>> @@ -25,6 +25,19 @@ properties:
>>>>>>      interrupts:
>>>>>>        maxItems: 1
>>>>>>
>>>>>> +  id-gpios:
>>>>>> +    description:
>>>>>> +      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
>>>>>> +      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
>>>>>> +      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
>>>>>> +      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
>>>>>> +
>>>>>
>>>>> Stray empty line?
>>>>>
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  vbus-supply:
>>>>>> +    description: A phandle to the regulator for USB VBUS if needed when host
>>>>>> +      mode or dual role mode is supported.
>>>>>
>>>>> Why are we adding the property here while we can use the vbus-supply of
>>>>> the usb-c-connector?
>>>>
>>>> Normally, that's my question on both of these, too. However, it does
>>>> look like both are connected to the chip. There's VBUS_DET which is
>>>> connected to Vbus (thru a 900k resistor). So having these here does look
>>>> like accurate representation of the h/w. The commit message should make
>>>> this more clear. Honestly, that's really the only part I care about.
>>>> How it works is not so important.
>>>
>>> The VBUS_DET pin is used by the controller to detect the VBUS provided
>>> by the USB-C partner and to identify when it's safe to turn on the
>>> device's VBUS supply. I think this still fits into the description of
>>> the connector's vbus-supply.
>>>
> 
>>    In case we put the vbus supply in usb-c-connector node, is there any
>> way we can get its phandle reference in hd3 driver given that the
>> connector node is not a child or parent of port controller node.
> 
> Sure. Use devm_of_regulator_get() passing connector node to the function.
> 

I am not sure if I am asking the right question, but in case there are 
multiple connector nodes, each one corresponding to one port controller 
node, how do we get the reference of proper connector node in hd3 driver 
since the port controller node and connector node are not parent/child 
or each of them don't have reference to one another.

Regards,
Krishna,

