Return-Path: <linux-usb+bounces-29267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B9146BD6F71
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 03:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DC53351BE6
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 01:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB022877D4;
	Tue, 14 Oct 2025 01:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqHUwIXZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414242701C3
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 01:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760404568; cv=none; b=rQcf4RNzjKuw4klhQxFFRauKDiQStlWjGxdNeYH2nPEZ2eLxPqxVO3ZkpkOoILXJR18XnVuuk7skrJFBEB0AwxgrRgqWyMZB1ywH7KX2nf7uULA36W7PwJHj/V8SF0AvpQn3SHAKdvOemHHgK6IUZKyL9H1cCBhLXB0yS1uBfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760404568; c=relaxed/simple;
	bh=EP0dab8QWVw8F2Oho9PP3xZsSiVZ6Hs0NI1VFXmo3zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrnvgQ0wUwKhNTHo6RXUI5N8jkTPLTpd+891i+GxeBfHcuO7O3NqYiXPQYHISKqxdoUU2ZU6pa9cCHVbAEvpI9FnH5UWLXNtAifUCdzCSFRO1Vc+MrckVjngLuCB/yxAL1GAcp0yOSzIdMScYOkBwehY7jRWLDa6khzON7bo6l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqHUwIXZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDEL0002453
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 01:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBxsTtnZ+1IYc29HTC1+91xtqulsSxhtxcQZF6gRcXU=; b=HqHUwIXZoBKQoLm1
	pp9KPIkA1VbhXLJqkbHHet1Mv+qQv6VU3XDUH5gCVQHInTgSTfDpS0Dn4HQSeiqA
	Dl7uf3cqUEfMBxGJ7DDx7B/2egqqQ4ZGG64EdWyj9ymBlg2UJX1CuFFRbFiRY/xt
	CDN0EfpocrBqJ942MJ8IEoPp37DvHcBzpZWY8NLbETyQLxwwV5wfdPSAOJr5YudF
	0rKubX8CwqHS61Fdrh5oQNXnEqKyIxUInCQ9Na0sLW7vHct065Q/wAFATzbHGV1G
	cjpAiZBkMdMscImjpnb+UvAfWpqB3e3lXl//XoDswk5c08YQh6InX+oE/+SLqKqW
	oXBa/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk6ntw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 01:16:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5529da7771so6891794a12.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 18:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760404563; x=1761009363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBxsTtnZ+1IYc29HTC1+91xtqulsSxhtxcQZF6gRcXU=;
        b=sJuhZyU4UyFxrRSPbK12nIcUFM58tz4msekxRDT+sOY51qVYygo9CMtv+wvspq+wsl
         +OS1k4lnloOyy85p66xB1lo5DJ/gx3temuS7Wh22f0zJ2KsHQUQnXpaCNeUFFFJC7laz
         jYDhQUkOckbFT6EeTgkr+sHimJBdm8zTBEp3/KkhUpia/kkxdpphsoFioX7fCozTkoIc
         045rrMWIoxWkMwLcy6i9ccIp6SaZMso+p+HrUyAjGrje1Grz6opR26tH7SBeSsMLQKfQ
         thn8cNBosFhceatrxUa7725oF3eexNSmXm7SXBaFO7dy8cqhmtZ5kkiA7vwfo07Jd0pL
         gB/A==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+NfYAmVLpCKoBPZS2OXegzF35Z1/v9hIMS9a0z3xR3K45+JnsHQEdCWdn4w5ACVnCB8bqapJzII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNST5T6Tmhh+1kQojQ0vs5/PZbNJfJkGTjI+7XWDNKZxeTXnS8
	z45HwGBrc+NaVic2+q2ufYsOoKlFUcNyp5X3vxp4DuVJ/rccPuo2e1IvtC/AreGF1nWY3LGJwoE
	fRjikqRQXgUhTra0uRevszwEKpVo7T5bvzoGKDD2xF1b3ZtSuFvL/+O83eKvlFy4=
X-Gm-Gg: ASbGnct6+IKCzOBYBaZ82NFtv9yM0/b6gxUhjElSUQuf2aZOvHU7+Gt/Gs1HYGHW+pV
	ae0wvvoksxFMKYNo3Kk0Huk9L3HZsjc25IP/KaH3y141OrBrWzv2danQZTlXZvMDn1HFhw90blX
	VnxIbVEJKu4IvWThy9Dy3aO5HW2YVAAFuOSM9MrrH/D+LGkC6bnHgRtF+KQwHL3OHA9qU7LWX1Y
	ANkEYlRoO5bJ1Ec8aO1CSQKO/tdeA53Iz1dYCFvM90GmvV9NakjGhPFup0LIH44tz07/IojAhKy
	bGUioIq0g/jFGrm7V79bCq/OJkVwQHZA2pMmLUemdXTSYf4XTtDGvUEOH/4aJ/gi0FYY3furU5i
	FuJO9bQ==
X-Received: by 2002:a05:6a21:3394:b0:2ea:41f1:d54a with SMTP id adf61e73a8af0-32da8540764mr31709139637.55.1760404563430;
        Mon, 13 Oct 2025 18:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELt/YGsVm2PjjEZ477lrGaSp2HNzDVReiR0NJSLQK9e2H2AIf2ucuUQKdNf5z06//FvgGKdQ==
X-Received: by 2002:a05:6a21:3394:b0:2ea:41f1:d54a with SMTP id adf61e73a8af0-32da8540764mr31709094637.55.1760404562901;
        Mon, 13 Oct 2025 18:16:02 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b065c40sm13045573b3a.10.2025.10.13.18.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 18:16:02 -0700 (PDT)
Message-ID: <2a70f878-269c-1b40-2e8c-77b5851de9a1@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 18:16:00 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-3-wesley.cheng@oss.qualcomm.com>
 <f5e4ae02-b8fa-4406-b2e0-3602b07b7e23@kernel.org>
 <00408896-2e25-2dd1-6e6e-2195317ee7fb@oss.qualcomm.com>
 <14bc2a85-0f1d-3834-9b9c-32654348603a@oss.qualcomm.com>
 <387c707e-613d-433b-a76d-16ef10dabc59@kernel.org>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <387c707e-613d-433b-a76d-16ef10dabc59@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lteDEiQ1FObbmUs0b0zNZlHqa9qHJeMc
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68eda454 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sZIQVmb-xcyDnIycNOAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: lteDEiQ1FObbmUs0b0zNZlHqa9qHJeMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxCP6nSythj0C
 mGbebkr8IkctJZqpn4GlQwSW0yu6i3Ie+ZCa7u209p4zrWsrEJ2k2RqT6Xa93n2uBKxkr1UGQ7x
 RoRcudNb1DbMkZcy6kf4yYQCeO8lj6yDFFKfWyv3sSuVcEFAbUtvXc8sUsgPbFBQsUBoTG5hEVM
 3ECgHIN0dw4v/9dhthHS11YR8wvn5XLmzfPH9sJsgDJekndpO2/OGQtKEXPu5zmeJzNNVgW/dnZ
 bO8SjjlAKbHTJ8AgczdE6bXL9QYNNLnYAqeapjQ0a1bGtJiF6Xyjwdqrk0LeJy+wD27vebBvAuM
 bX9AwQ0QP6EMLsc3gai+6uTR3fzQ6mOrTwMH/eWmRXolioHLm8uDkPnvQnmOuNgyvNx3KwTF/+C
 Ca5Cdd0mdDrr4MfVoV+Vq/BWNa3eJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/13/2025 4:50 PM, Krzysztof Kozlowski wrote:
> On 14/10/2025 01:46, Wesley Cheng wrote:
>>>>>      "#clock-cells":
>>>>>        const: 0
>>>>> @@ -157,6 +160,25 @@ allOf:
>>>>>            compatible:
>>>>>              contains:
>>>>>                enum:
>>>>> +              - qcom,glymur-qmp-usb3-uni-phy
>>>>> +    then:
>>>>> +      properties:
>>>>> +        clocks:
>>>>
>>>> Missing minItems.
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>> Won't the minItems be inherited by the base definition?
>>>
>>
>> Ah...are you saying to define minItems to 5 as well, since we need to
>> have all 5 clocks handles defined to work?
> 
> 
> You need the minItems constraint as well, to define the dimension
> accurately.
> 
>>
>> Thanks
>> Wesley Cheng
>>
>>>>> +          maxItems: 5
>>>>> +        clock-names:
>>>>> +          items:
>>>>> +            - const: aux
>>>>> +            - const: clkref
>>>>> +            - const: ref
>>>>
>>>> What is the difference between these two? Which block INPUTs
>>>> (important!) they represent?
>>>>
>>>
>>> clkref is the TCSR reference clock switch, and the ref is the actual CXO
>>> handle.
> 
> 
> Then this should be named somehow differently. CXO is clock. Reference
> clock is clock... To me it feels like you are describing the same clock,
> just missing some gate in TCSR. But in case these are not the same
> clocks, you need to name it accurately.
> 

Technically its all handling the same clock branch (CXO), we have the 
TCSR clkref register that allows us to gate the CXO to the USB PHY, as 
CXO is shared across several HW blocks, so it allows us to properly 
powerdown the PHY even though other clients are voting for CXO on.  Then 
we obviously have to remove our vote to the overall CXO, so that it can 
potentially be shutdown.

Maybe we can rename it to "clkref" for the CXO handle and 
"clkref_switch" for the TCSRCC handle?

Thanks
Wesley Cheng


