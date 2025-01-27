Return-Path: <linux-usb+bounces-19784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E57A1D8A5
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 15:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C6697A1B71
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 14:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425CA6F30F;
	Mon, 27 Jan 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCd0tyBe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BD1C68F
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989142; cv=none; b=FfHYytSXFxD0JZgOHEPeOveP9q94vbx7k5vnl2ASoNkIchIC57jr8UiT9e+it29mDP7raFpgxABKX5z6jQCg9PAwoEfPE8Ag2WovCCab2EWbW95cBSIZ6sdwL4UDyVz8GLCaDRnKPe/Y/xQpDUJ28lnf5I+BrR3+kPNQ906Rg1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989142; c=relaxed/simple;
	bh=wqen5QqvQcEQxpPvtTgSOB9IxhjeeWYi88Zb9RiNpNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aM9CcXmh5AX+hTHIpMqltj8ZPabL1MeE1thykQl0+Z5AUir1B3ONgPg1+1CyXkRhSQjKjKPMTA/VSjaR2c7JDHJzNmSC/fdcYwPLLasKxK+mqfLMFJTw2Gs7GoiQOm63cKQMiS9xnZYhHXu5Z8wp44TQ8n2xd0ch8ZMbFzo6AyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCd0tyBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RD3dc6020251
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 14:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrRoBeelfFXbKKIfECxmv8hw8TWenwlLx1vwSbq5ykQ=; b=bCd0tyBe9aNzXwp1
	A6dMeByFDDop4sP69OV4YrToP6Xz83AGtjTU1LpxswNgzC95xywSXSAGqiYDTDmh
	Zm6sLaUNz94rvxAmpQ7+pvBvVToOKyxhxndE41xEf5LdpzIEI2wphbUcqUckxxt1
	0eiwJoeeNV5n+z/xetYLazC3jAno4fFoY+/by0pLXN/q80yZfyBzs/zn/NeGlLYM
	nJZ6mIDeLELk34+mH3KN400vB6K+HzDZZW18FTY++lESqUtyJiYFNNFZHfAelKTI
	tA8/AxDAApT0JsklOYqqB1i5NbR4Bw0J4PVGQ9RLHGCBdNPI0ODuuQKREv3MXzB+
	1zSeCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eapq86rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 14:45:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679af4d6b7so8089971cf.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 06:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737989139; x=1738593939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrRoBeelfFXbKKIfECxmv8hw8TWenwlLx1vwSbq5ykQ=;
        b=H+VXnOlPkEdxw+FopFinss2gIK85oYRW0FEAkJw6GIhNpGfnxuwJg6Wk0UBjjZzkrt
         /BxLWD0FIFEKJ5gX3GCAdK5I4azE267NTklPW8J5TsMqQjFvUWqxCfhz5K08VKKauM7u
         KYqVshpTKBZTnpWf6W8CWSEDKHSiNvJN2Lvem8xT6IB/zuWS2/WH3cJ9XEg2MYK03PC0
         wIBFfRluiDZWcLetQS+ocU0yloGWgxn4tEz340KnWig7deKHdQxebVzMwztK3YBk+pcw
         Sc9h+TvS51GaVfwnX+AL9UljVjMHyz8L58bK8Wc+/Ea250yf5GKJ/hEx6v7O6lT2qu8I
         wKmg==
X-Forwarded-Encrypted: i=1; AJvYcCURumlSvJJAoZpHb6KVyhPpLEeiBmdL1KAeLgA4VvqO/7U1e1ssAAyxwdN5FGfbIVQLmRYyjARRZlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJtWoA4DV2iQ/abP5rl+p37TpM7cROLWqAnz7gdlHyzOWYrWj
	1w96j8jbkThVuuRsNsPzaFuzvqhNmwlk7LEpcQ+nBFzVZQ/BKj5AmIy9W/Nc1by9bFt4uyvIbxL
	OeemcasKolAHofMdtXF55pLMH201P6PBv6VIPFJ2AIqbdSNK1xvoIMVijJaU=
X-Gm-Gg: ASbGnctItw0ybG2WQCrGIknKurxhga6KtL9dI0wV+PH3o2R5dEHQxwpQOlTwCz8w4OH
	akKsGBXI2pkFtFQVp3IDmJo2pvEm2p4PTRS7wzko5InSLiPb1Cmq+vFzN6CrmKPcslZSuWKFgtL
	QENo73SLwlyOXbW0xlcLTTfQrPrdHNWu9x7tsnuh8AsGvuiIa3FInw6tTMD7JEm/2EQ5mrFPhdD
	qvdA6AndOaF43m8lJkU0kvxez1oxl6jZfoq7jqZYkTuANVUJohGP597GFdUQt1KgaKyzaTqi/xD
	qpeKU30sgEXLNdupKem4n+dZgZSve6+2yE5DDDk+VF6WrlnzJGuQus7wi9U=
X-Received: by 2002:a05:622a:1210:b0:467:5d34:aa84 with SMTP id d75a77b69052e-46e12a9a0c3mr242352691cf.9.1737989139093;
        Mon, 27 Jan 2025 06:45:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeFGQxsM9cQx8f5654W5vrsEmUeyQuSaOOkZRea+KKqOquJIhIZAHz5V/T+4Tymt7e2W94tA==
X-Received: by 2002:a05:622a:1210:b0:467:5d34:aa84 with SMTP id d75a77b69052e-46e12a9a0c3mr242352481cf.9.1737989138633;
        Mon, 27 Jan 2025 06:45:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e5ca68sm598066766b.38.2025.01.27.06.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:45:38 -0800 (PST)
Message-ID: <c88c99ee-17d6-4d6d-9922-3e979e39e0ca@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 15:45:36 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: soc: qcom: eud: Add usb role switch
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <quic_eserrao@quicinc.com>, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-3-quic_eserrao@quicinc.com>
 <7aec2a72-3276-4837-87fb-ac974588fd53@kernel.org>
 <cc02dc38-3986-4b28-a167-30150ea4cc6c@quicinc.com>
 <41a8e42b-69d7-49ef-97bf-84f260e2e709@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <41a8e42b-69d7-49ef-97bf-84f260e2e709@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m_5wCQtKfXrsKM0aLO3KArMl4xIHwjd8
X-Proofpoint-GUID: m_5wCQtKfXrsKM0aLO3KArMl4xIHwjd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501270117

On 1.08.2024 9:46 AM, Krzysztof Kozlowski wrote:
> On 01/08/2024 02:16, Elson Serrao wrote:
>>
>>
>> On 7/30/2024 10:36 PM, Krzysztof Kozlowski wrote:
>>> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>>>> EUD hub is physically present in between the USB connector and the
>>>> USB controller. So the role switch notifications originating from
>>>> the connector should route through EUD. Hence to interpret the usb
>>>> role assigned by the connector, role switch property is needed.
>>>>
>>>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> index fca5b608ec63..0fa4608568d0 100644
>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> @@ -37,6 +37,10 @@ properties:
>>>>      items:
>>>>        - const: usb2-phy
>>>>  
>>>> +  usb-role-switch:
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +    description: Support role switch.
>>>
>>> So both EUD and DWC3 controller (as this binding states) are role switching?
>>>
>>
>> Yes. EUD would receive roles from the connector and relay it to the DWC3 controller. In addition to these roles, the DWC3 controller
>> would also receive roles from EUD itself (related to USB attach/detach events).
> 
> Does not look right. Seems like you add something because it is easier
> to code in drivers.

Perhaps that's semantics.. EUD can be thought of as something approximating
USB-C (very loosely). If you program it right, it exposes a USB hub full of
"""altmodes""" (debug components visible as separate USB peripherals, really)

We need it to know when the device is connected in USB device mode (vs host),
so that we don't accidentally undermine the rest of the USB hardware by
de-muxing the usb controller from a direct connection to the PHY.

Konrad

