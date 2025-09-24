Return-Path: <linux-usb+bounces-28581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05AB97F59
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 03:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16CE92A4746
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 01:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0141EB5D6;
	Wed, 24 Sep 2025 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdADJHtk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB2B665
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758675616; cv=none; b=GfHKoZJsJpbg0kBOW8U38/CsmlS+xl4Cly+hmrekm5xew3U3EdU+Y14gR5SFWn/PdU9D0XIX7pATgzwa+CHdrGeXH193PiHIWU5ZVQg+TLiKvRrT8DziszmUKT+hR13RJ9ixhkagSU5eMokmsDs/o/VsS6+3I1Kqut6t14uMKHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758675616; c=relaxed/simple;
	bh=aPg0UmtWDWWN4/58XT6GxNp1y+uyLy8yBlL0KKGR5cQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ihs8O439br4HtVmjoVLQCkFTiIa/cryske/5OuLW9P8TsjE9k/PijyM2rzrzh3xLcnAOxDerCXboaVjfNWtN5MEgzi8TXBoq4SlY5Ay5yUk7omDDXrr6R8WRqtTjwagubWQ3HULcw/sNwk0OraFWCgxHsQNHARhO92VVMyaZ1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdADJHtk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFPJqs020668
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 01:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2zvsIx0xpsseLnuqD3wgD1uVrKng7sqp3Iah6620cQ=; b=fdADJHtkDZluEdxf
	dWy2qaD1z6tiE0NDephEw64aP6tE4TUKhFxUpOnASzJfCsajURWkEQgWLmCSSA4o
	+SmlVg7B+MVPs/l/omMhm8Mf9EYVjUAqNNnzkVpXhexxfcJp+yYoRK4L2EXQyXkJ
	ragWJMOYEpGZ4R7sC0r1R5mUTuEw7uqvT4sBodFaG0IITK4ourkDoVXPAT9U+P/w
	7p5IUliSUv0Vo3SZh7pU15QAVON0Oe13AfYqYUV2crBIzWJWLTzzu/IUCmI2sOCw
	vaDZFybNnROri0cEDaIdbrsqbRA4atH/kIh4lSTSXSzPCLcSSMTaXTQv3gXmfoX6
	0nWlJA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjuvhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 01:00:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5509ed1854so4055946a12.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 18:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758675607; x=1759280407;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2zvsIx0xpsseLnuqD3wgD1uVrKng7sqp3Iah6620cQ=;
        b=Iowsw8njUG7M6+bmHlmGzzGbgKU2lEWHPVEt/avLd8ipIEXCPnS3b9krjRpw7DEBUL
         1Lo4HeumfZP7BTZtpGVlOEr6vK9iBOuJjPRzhnEzbRHeXmUGfBPSkv9vkSvTVIMfg1Jo
         cfyw8+VfyPMtQV98lEXRb1lbqHDwXmZct5nOz9e8ILGfTVWZjRoXCccKV2ZFS6aE1Beu
         nOkG5fyS0vnonMs8AL1Jc+LQO6FLj0cBgHl5MGEm164tkx08/oqcdpk5x1YjIBY5oyox
         vRlfaJTpbZYdLT3tEIuYmyyrQw2M74N38kY5beXSNg86CnSZo+Ht5mLJ13IxsNa0rHQ9
         m+kA==
X-Forwarded-Encrypted: i=1; AJvYcCUYmw/8J/+dDpbGID8S7kGNIUe3CyEVE7Bj30haLozakGqJEjv1bFyefGTxkADhSPK6uIO1I+WVWUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5YjPm6+oUsPbryTR1AHkRNU+CJZV7HuHoEKGpnjmMQgUMaaF
	LTnVscExtekop6R0F3W6N/JTG6hp2UNjvVjqcZeVXfdNUOj9Se3EHlxpCFlb8lRMk2uGDrkYNoT
	5YPX+NrICewh2x7/FV0z/oxfvM3ETwLcRulJ2bFyryw9WUoj5nXAEJQW6b+fkk94=
X-Gm-Gg: ASbGnctAeOg0TGxtAUwwdNDTGs5r9TVzlSnSaMA2D2IKz7kKhfLcTgsXGieTdDMjRjx
	CLjhCCRBaUdrBpUuJdUK/rZ+dWTGlM7+fsAf+ll/jtcoP3usmI0qeoHVk8fCRXI39l1/jdQgsAg
	lBeNCf3l7ftf2MRT1/Xq68wWZoLE4wzA4OOIuFDCLLZqB/DNloGBRmJAIz8lQr9TJ/X79u7inKm
	QzT9cy5rYwfE12Xi4vM/Nh48bn3aUWkgfhnrXUe7a0+4jhgyQIjei2d62fu2qjuvMJsQ/jg26sI
	LjLK9hvpGRQSxOc4QlTTQB4K9kycRaONNB/pUkPFzvBiGNRnCsszzgQGzWYtYGYQCBUKhDF2OWs
	7x10DkA==
X-Received: by 2002:a05:6a20:3d87:b0:252:2bfe:b65d with SMTP id adf61e73a8af0-2cfddc6a137mr6516272637.2.1758675606633;
        Tue, 23 Sep 2025 18:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0NAzGMlXuVw5j4OF/iTpNasadjCiM+4Mz3TJZj0Y3pZnZIJg5KRsof0hAuREl2zzoKFq8fw==
X-Received: by 2002:a05:6a20:3d87:b0:252:2bfe:b65d with SMTP id adf61e73a8af0-2cfddc6a137mr6516229637.2.1758675606142;
        Tue, 23 Sep 2025 18:00:06 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77eee36c2b2sm12958795b3a.78.2025.09.23.18.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 18:00:05 -0700 (PDT)
Message-ID: <31f61f93-2e9d-565a-cd5e-4f668ed7d6c0@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 18:00:04 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur
 compatible
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-4-wesley.cheng@oss.qualcomm.com>
 <20250922201449.GA1235521-robh@kernel.org>
 <554cd2ce-a617-9387-7379-a3c2b9de843c@oss.qualcomm.com>
In-Reply-To: <554cd2ce-a617-9387-7379-a3c2b9de843c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SGrrk4eAeeRuFRI7MP80BpbYLrmzTE5_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX61oSEvT903Ph
 fwcdX3z7jg4Ym0fHCgptjKVIBkbV7vsy/VQR6Nn15RFS2kIBbNjxDPzoj0Nyihhtv16kj8KbS+m
 bVH/ze4nlbHNBYQ1q0XlBbit7Bx7f2m/nVmPYKtTwgJlLA13KedE6EKyj3ILAaIrUNq0u6EPdox
 4DXgSz1xVacDKpZq2SoAKQ7Y0hehkMy1KeB7Q9N6PIAHJiQA/QASa6+CELtLaEKByYBOc41Sroh
 3BYQnKPB7uicPQncxQPi4EU21i5E4FYymamBgEN5aHE160eatazDCam89eA3UA61CzFZ5hAPVRN
 X5WsfXZEXOI3OAhqXIwBHL2qFqeOi2uxZVVKf7u1IejLiCUpsv4lYJOLuPZDOxsf+begO0hKexV
 B2oA3IgJ
X-Proofpoint-GUID: SGrrk4eAeeRuFRI7MP80BpbYLrmzTE5_
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d3429e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1x5KiYs_k_UboVqHg6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011



On 9/22/2025 6:02 PM, Wesley Cheng wrote:
> 
> 
> On 9/22/2025 1:14 PM, Rob Herring wrote:
>> On Fri, Sep 19, 2025 at 08:21:02PM -0700, Wesley Cheng wrote:
>>> Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
>>> the fallback.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml   | 11 ++++++-----
>>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml 
>>> b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>>> index c84c62d0e8cb..b96b1ee80257 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>>> @@ -15,9 +15,12 @@ description:
>>>   properties:
>>>     compatible:
>>> -    items:
>>> -      - enum:
>>> -          - qcom,sm8750-m31-eusb2-phy
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,glymur-m31-eusb2-phy
>>> +          - const: qcom,sm8750-m31-eusb2-phy
>>> +      - const: qcom,sm8750-m31-eusb2-phy
>>>     reg:
>>>       maxItems: 1
>>> @@ -53,8 +56,6 @@ required:
>>>     - compatible
>>>     - reg
>>>     - "#phy-cells"
>>> -  - clocks
>>> -  - clock-names
>>
>> How is it compatible if clocks aren't required now? And clocks are
>> suddenly no longer required on sm8750?
>>
> 
> Hi Rob,
> 
> It depends on the clock subsystem.  On SM8750, we still need the clock 
> entry, because we need to control the output of our CXO/reference clock 
> to our HS PHY.  However, on chipsets like Glymur, some HS PHYs in our 
> USB subsystem doesn't have this refclk output control.
> 

I've updated the bindings to keep it required for SM8750 and optional on 
Glymur.

Thanks
Wesley Cheng

> Thanks
> Wesley Cheng
> 
>>>     - resets
>>>     - vdd-supply
>>>     - vdda12-supply

