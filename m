Return-Path: <linux-usb+bounces-18451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF99F0D05
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 14:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29228166807
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 13:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955581E00AC;
	Fri, 13 Dec 2024 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxfcN9+z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1E1DFD87
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095337; cv=none; b=q8r9/lmyFcWEXDYSZQRd6J2hlvFdFgvY/w2Z+URHfrvEeGzHpZUDd1vxEsnswNw8ELhescV0brjn/8jmhw8fD2uJ2X3sFyz8ymycKxfGeTpsDbirbEDolLpSNazzMZa24XXQNm7VOmPpWbxnqGNUmHAVFqxSkVEcssqrGrS/4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095337; c=relaxed/simple;
	bh=ah1Z9PtZPjnWAKM1uwclbbVKEEJ5c5oMCqfRl+M+Roc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrVm0mByKm4rh1GedztJVuI+kzwPRSY225lQLgBg/uJ59LYJ9qMAAxsUSF9mkTECZdvgaKcWQkdd+ir0PV4Ye3G1fF8NkYTZLCsO9SvK+yGjlilicQqRYO5x4/Epr8KR/fihH9SyLGMvw6281abXGw4RXiUYYBBKm8EdY2iU+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxfcN9+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA48EG013295
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 13:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+NlxZSUAzQpw/DPspRPS0yu5G8WCJu2cZhtajXHw5A=; b=PxfcN9+zbMYNg/5Y
	BYM0jLlVc/lfMy7ObXEe0jcFYlzYmHD51IPGj0UP3TYdyCBJf6J2iZVTsItua+cG
	WNlMDmfi+PaZfHvo/FOKvsiDqBkQtCYUju6kWIW2H79SCcKXlNPyMi0syqfahQeY
	4eMYiA9otzB6bTZwmDZb5AYQps3ET56SBvBpttCcFaGg04fwCi4brRaISy8HIiD8
	P+gECVXp1q/xB+EH9tIpmycOdBMXhfQ3rhSRmkS2zw1IeyRuNlnqk0XprPG/IC5B
	z8GtJFUUmzypD8SLN4F0Ew5Z0Ia5IYkSeXVfrMe6Ur9jp++ZpgpZ/1cG+/BzQPXK
	JJsIVQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudgh6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 13:08:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f77bf546so4438796d6.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 05:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095333; x=1734700133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+NlxZSUAzQpw/DPspRPS0yu5G8WCJu2cZhtajXHw5A=;
        b=AsopqH1lRoxj8iKmQOxIQf2A6Fe51W2dju9C0FoH8CFZBdeG2m7ShQp+WNCO0dGiBN
         7/hYs4QVUVPXvX+pRaq+STRNdgiMj4KhsOTt4cxul7DQf+aNhMl7YR65wnploQMPq+Lc
         Y0RywdOJ+H9Hvi8uk9fLsclI6z+Wky5U7i6A2pAo+mEUO39VhWfNbxH5d3ikR14aX9KA
         i7S9ZC9QBYgGPZun7CZAcHDmUhqnkIF0Y+qRiS2Xaaf2DSmAw89cjZnCX+rOtebLNH1m
         42SLWKDyyWngeK9t6QclpkHtukB14wwLncjilB63uo1+7niQUoEjiv/5KKKduXIAaJwO
         IYqg==
X-Forwarded-Encrypted: i=1; AJvYcCXQjtT280kBvN3cMAn5yxmeb9xKHrG7hxi/dCXzCICFZWLd4GJ5/rvhEmTX4QyKJJX3wNEKvph2OgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpN2pUBK6wUYVWrU5zMWuTPkbu3lwWPDVRdHmCRHMWO6ydYuG
	8FZmOq5Hzsqyh8fQcgesXXDUULjHEzcSgDPaGRDVz+xd4Tk0ZsPowLpjto79++fnBYO4SRr8DuS
	eLNCqjhV9YWSFPWdzfWntLIUrnGSEN/GiJNpvduBNk02kfHmb+EKpeKjOSjk=
X-Gm-Gg: ASbGncusOl1H8Mgvf4qt8sVFbVQbQNadr/uQ5ad46GY8iuf1vL3cqqhwcQLHntpyLuS
	c6XeYnuQKb5d6P0F2SX+eqawm321hF8/cTIqf5NAV6PobA/F7QX6xaldZzPLg1G98Qk0lThrdPf
	tO1mlFf7UwHbGhDb7HPEHUvS6CE5L1+tHFex+C/iwnE55Fp1WZbVYRs8GMebAUf6uTgRb3swhDi
	TDJnsBOS7xuFeX/68Tn/OG0SGJvzH/1ZhaBqr5Ywf+q1lePZdUFNTfIhHIBMK0pYo480UaQ+Ojv
	zhvq5wBUPCjK246IQ/A2AVHGj/bp8ZkV9XuK
X-Received: by 2002:a05:620a:2482:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7b6fbf08162mr129332085a.8.1734095331966;
        Fri, 13 Dec 2024 05:08:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFLzgc0KWUHtMB4AX6NRhGSzdp+8nXQHv2f9Rwn0/0hSQQwbzZVKV9uAlixhsyWs44W2qiZw==
X-Received: by 2002:a05:620a:2482:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7b6fbf08162mr129329885a.8.1734095331458;
        Fri, 13 Dec 2024 05:08:51 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6ab44e881sm419566066b.26.2024.12.13.05.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 05:08:51 -0800 (PST)
Message-ID: <04e489be-231a-43b8-a701-1173ea744bae@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 14:08:48 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com> <Z07r3Upr50vLluyn@linaro.org>
 <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>
 <Z08sMkbLF0b1DZTp@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z08sMkbLF0b1DZTp@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gdXyiBQ-_s2aLKflfB6Wgc7lTVBygjgY
X-Proofpoint-ORIG-GUID: gdXyiBQ-_s2aLKflfB6Wgc7lTVBygjgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130092

On 3.12.2024 5:05 PM, Stephan Gerhold wrote:
> On Tue, Dec 03, 2024 at 09:07:22PM +0530, Krishna Kurapati wrote:
>> On 12/3/2024 5:00 PM, Stephan Gerhold wrote:
>>> On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
>>>> [ +CC: Krishna, Thinh and the USB list ]
>>>>
>>>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>>>>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>>>>> multiport controller on eUSB6. All other ports (including USB super-speed
>>>>> pins) are unused.
>>>>>
>>>>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>>>>
>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
>>>>>   1 file changed, 48 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>>>> index 39f9d9cdc10d..44942931c18f 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>>>> @@ -735,6 +735,26 @@ keyboard@3a {
>>>>> [...]
>>>>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>>>>   &usb_1_ss2_qmpphy_out {
>>>>>   	remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>>>>   };
>>>>> +
>>>>> +&usb_mp {
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_mp_dwc3 {
>>>>> +	/* Limit to USB 2.0 and single port */
>>>>> +	maximum-speed = "high-speed";
>>>>> +	phys = <&usb_mp_hsphy1>;
>>>>> +	phy-names = "usb2-1";
>>>>> +};
>>>>
>>>> The dwc3 driver determines (and acts on) the number of ports based on
>>>> the port interrupts in DT and controller capabilities.
>>>>
>>>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>>>> that would still be there in the SoC (possibly initialised by the boot
>>>> firmware).
>>>>
>>>> I had a local patch to enable the multiport controller (for the suspend
>>>> work) and I realise that you'd currently need to specify a repeater also
>>>> for the HS PHY which does not have one, but that should be possible to
>>>> fix somehow.
>>>>
>>>
>>> I think there are two separate questions here:
>>>
>>>   1. Should we (or do we even need to) enable unused PHYs?
>>>   2. Do we need to power off unused PHYs left enabled by the firmware?
>>>
>>> For (1), I'm not not sure if there is a technical reason that requires
>>> us to. And given that PHYs typically consume quite a bit of power, I'm
>>> not sure if we should. Perhaps it's not worth spending effort on this
>>> minor optimization now, but then the device tree would ideally still
>>> tell us which PHYs are actually used (for future optimizations).
>>>
>>> For (2), yes, we probably need to. But my impression so far is that this
>>> might be a larger problem that we need to handle on the SoC level. I
>>> have seen some firmware versions that blindly power up all USB
>>> controllers, even completely unused ones. Ideally we would power down
>>> unused components during startup and then leave them off.
>>>
>>
>> This question might be a dumb one, if so please ignore it.
>>
>> But if we skip adding unused phys in DTS node, the core driver wouldn't have
>> access to all phys and we wouldn't be able to get references to unused ones
>> (un-mentioned ones in DTS). So how can we power them off from core driver if
>> we don't have reference to them ?
>>
> 
> The question is not dumb at all, it's a very valid one. :-)
> 
> Perhaps it's easier if we keep them all listed on the USB controllers
> and have something else to mark them as unused. The downside of that
> option is that we might not be able to have a complete description of
> the PHY with all resources. For example on the CRD there is no eUSB
> repeater we could model for the first USB port (usb2-0), but it's needed
> to enable the qcom,x1e80100-snps-eusb2-phy.

So we have the choice between a silent failure or a loud non-failure wrt
acquiring the repeater.. not sure which one is better

Konrad 

