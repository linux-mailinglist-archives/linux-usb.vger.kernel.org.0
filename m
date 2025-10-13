Return-Path: <linux-usb+bounces-29262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EABD6C35
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 01:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 791683B4527
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 23:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9E62C0F79;
	Mon, 13 Oct 2025 23:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6w1NkH1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21B2D7D41
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 23:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399065; cv=none; b=onFhbMvGMp5xOv4UMBc//rXXIzdU01CibPYA1orz8qGZavHiUSKVNoE8qBpSDVaOieacBdvAxd8PJHG2OPSo5ES1oeSI09Iy1m2r/ARW9m56gF/FYGUu13fHPgKIaLU14iabgWC9fDwJyDljz3TuOBy7cmlxRSwQd8OtiedeT6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399065; c=relaxed/simple;
	bh=Nzt8647+EKTBB+laQsBzzYVQ9BNxTkISTr1GK3EeIQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OndmwWhnIetuyGWkUuxNQJAH+8lDx0PmV7PNmeqh76epUF/g9AFbBqjR3XfLG4B+usOpd/O0+ePwtI+m9PixED/v+5LHWtAxDSuwMz8uLJfVAS7len0yQVAdsjgCwhb3LrbMLY+mNKkKpdGmmd5uvm9DkwAxLR93zADrRJ1PNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6w1NkH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DIMMjB024038
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 23:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+2pANyzcoM3DHg5TppGmIvwYCz/hBBmCZ5ALOha+JY=; b=j6w1NkH1mgOKp4/B
	VdoN/dg0uOwEnc45wHa5bk9aHMp0qBqaKGCfZ/KaWhXswW1nJu+IOo+SjYKucdzY
	hfy8ORdaHqhN4dlobKfPym3HVxRsIqZhHUFZVzLMyt9f/llBJFF5e4eZ+NCw6y99
	VbSyS31hqh7uf4vMrR4CVwqsIh9aOUVVZAHpLb7qrufRK34OrHDw4y2UP518dDKB
	hCKctlc6ArdAU7hg9MYZJX67cGooNdHvD06BIa+RdJAsgncPnDh/rh4L/nYCgMh/
	AnyFeWa4ivZxPWjyUU5aEux/7SX6TqpwgQKnSrER8nEjeKF7USAli2W+qCsv2y1A
	mgiG2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwgsry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 23:44:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-277f0ea6fbaso120617085ad.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 16:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399062; x=1761003862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+2pANyzcoM3DHg5TppGmIvwYCz/hBBmCZ5ALOha+JY=;
        b=io6XrZRrKG0U6dMCwxrdlyx+t2DShsJuNDPOA+RBawb2Zhu2jBYnA8bFtj6LQP5Prm
         qO+SwAFKTOKubXB/EFkGRaQDfdNTJy3SEY7DBD8qO3C0WjIUbIwZ6EsP97BjjazPenID
         bx2GMIF3xiKNqorOFPMGnG5eM44qX1s071Ae7m7tdhloKw9Goleq2GfEK6xnmQFHT9YK
         /vSODom2qLVpvNQrMuHjawr1TeViiVukD45n5J+2capud77YBN6hAx71dVo/A9y8pnzt
         1YffTWF6d+eaPjYUyh8tHifvbgXwANox+7U1wiGcwnQ34Almh8sA2LsZF+wl7+SBVN8s
         NsDw==
X-Forwarded-Encrypted: i=1; AJvYcCXYJ4fMdESJbSqKeMid9Miw/59KbMPUKeuNrBj7SH5FmAqZ80LIjCiocpYFbgxk8SdUVjtmlk+khus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLnGF2ejR648ZypUTAFTwQYJvvX1pfJN5PFapQWvgqRhTzZfz
	DzaJR4ctajwvb2xOLNmG4SlzblyoVvcxzC09SyHX4kf0unXl//cx7rXSeI7heE4hXCEcG6FHEbn
	EX8ad5KkrqRIRRLzQO9r9JNhwVBaKavv5+0IkD6bCU6DpHtAo0qzZDYKHVnaSMSs=
X-Gm-Gg: ASbGnctVgZ78I6mGlrMCMb/XtlVENUxnyV9r7UpX/i/1GIYbeLNNKulnFSMKiYAzkZ6
	nppkVTs5iuYD5mg6QZAexZ4G+FLnPatTFAUS6PiZjQfTY2bziD7ziN+/fHrHZc+GGFwmjt3Cyug
	ZJf7pPFZsc4ouhcMdJ29XfYaDMu5v5NvUoAhAcv8E2qgmeqHqueYM0ITuMLyY0oKwyi+xYsKvYG
	Fn3dwgIvLUghyTBD/1yMuxkyL8G6G27E07waEgIsAlL0QffdpHuzZ3319kNje13AMUN1XwJcKEw
	ummHIDYwFCnS9OM40q3vu1Uzhiianb7W8FDKbF22kZopM1nn1/1RU6mp1ROPK/xM0i7rUGxznrG
	LP1gnnA==
X-Received: by 2002:a17:902:cf08:b0:275:c2f:1b41 with SMTP id d9443c01a7336-290274193camr291358445ad.53.1760399062100;
        Mon, 13 Oct 2025 16:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtJmEqw1slbxjdy+zH5RnzE9u3uG80gq0Z6ZZBCc/1hYMquagduloVtbdhakKZwb9AVAeUjw==
X-Received: by 2002:a17:902:cf08:b0:275:c2f:1b41 with SMTP id d9443c01a7336-290274193camr291358065ad.53.1760399061633;
        Mon, 13 Oct 2025 16:44:21 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc53sm144884885ad.46.2025.10.13.16.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:44:20 -0700 (PDT)
Message-ID: <00408896-2e25-2dd1-6e6e-2195317ee7fb@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:44:19 -0700
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
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <f5e4ae02-b8fa-4406-b2e0-3602b07b7e23@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX5paNYOqTxS7s
 Vx5Y4wqjjrPq3SZA2fm0XM+3u2ZMm3mjIjAzwzFhtry8WQHHIEL8nFgsscUHQBuKM1jgvKh7ZHq
 /TYXmajpdvRf+GZv8mr3czd3uHR0R7fBg/AD76jve2tLO2wfcOL9UVTrrPynkUIiOEefxfyWcyK
 T+UxFgDtmCLxxKbt5QdpSCoEwaq5/JqFMSaEebX/GwbG7fNYhJE9W9Wl/Cj3OcMXPpKeLVlNzWt
 XJlh2GD0AoKgMexZagXv8StYYazZwI05pi0Eld+3XSI40VHgWXk6GptiOpGkPLtGQaKk/DyUY1U
 YtWgmlhCgoKE8AKttNew7ADjQVFPHeKK70nVdonV8Fbng1W5YXpA02o7cGmWm9KMHCj1LQAOpeB
 1O1Qluvced3mRqfr8agdQTgy9Dl9Yw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ed8ed7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mLeorRv-Xii_F4RM4uAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: q8oozjTmY2ZQlRnNnO6bbE1mRoxesjDY
X-Proofpoint-ORIG-GUID: q8oozjTmY2ZQlRnNnO6bbE1mRoxesjDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 10/10/2025 5:04 PM, Krzysztof Kozlowski wrote:
> On 07/10/2025 00:19, Wesley Cheng wrote:
>> The Glymur USB subsystem contains a multiport controller, which utilizes
>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
>> the required clkref clock name.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> index a1b55168e050..b0ce803d2b49 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> @@ -16,6 +16,7 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,glymur-qmp-usb3-uni-phy
>>         - qcom,ipq5424-qmp-usb3-phy
>>         - qcom,ipq6018-qmp-usb3-phy
>>         - qcom,ipq8074-qmp-usb3-phy
>> @@ -62,6 +63,8 @@ properties:
>>   
>>     vdda-pll-supply: true
>>   
>> +  refgen-supply: true
>> +
>>     "#clock-cells":
>>       const: 0
>>   
>> @@ -157,6 +160,25 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-qmp-usb3-uni-phy
>> +    then:
>> +      properties:
>> +        clocks:
> 
> Missing minItems.
> 

Hi Krzysztof,

Won't the minItems be inherited by the base definition?

>> +          maxItems: 5
>> +        clock-names:
>> +          items:
>> +            - const: aux
>> +            - const: clkref
>> +            - const: ref
> 
> What is the difference between these two? Which block INPUTs
> (important!) they represent?
> 

clkref is the TCSR reference clock switch, and the ref is the actual CXO 
handle.

Thanks
Wesley Cheng

