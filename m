Return-Path: <linux-usb+bounces-22777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25230A81BD9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 06:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A0727B3B06
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 04:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E860E1D54C0;
	Wed,  9 Apr 2025 04:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8UdFSPP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E441BC073
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 04:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744172533; cv=none; b=rnx0f5YwUbgZX2ZVOmqRAyBC+pOO3RxBvLnZUvpbybeAj/YhlXwNOeDhYSS89uxGrsSjBLQjZZRctwd2HuH6J5ZCIgUMmKhSyyo69HYKlUcn1Xfgoo9z8Er0UZ27SthxDGEreMNKSv7N6R73DUcUEl0AURxoj6y3UMuooKJiRrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744172533; c=relaxed/simple;
	bh=DmL00Qj5YipLbFEM/80TDEcMdV2EUDBaeAQ3+vMZCy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7yXYMg2F4IYrjnLcp91IL50NDoRmD+fvSKzmmp87fbyMjGb0h8ZpgRE85g2vMcEJqvRKb0ma1462hHFYZCTs/yLMFYVdMQNVi25K2NgF5XWnuaXZA98yDC3jtmJLbujQTR4FpmXS2EuXKZP5IEqSvbE28EvYufV2nqHDt3hRao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8UdFSPP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZkDP023847
	for <linux-usb@vger.kernel.org>; Wed, 9 Apr 2025 04:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UaOMLZefNjdomADpY83DHsVO9iRZ4CFtlWdaS0QxPYw=; b=J8UdFSPPOzcVQRV4
	FoQQhBFMIWJCcIIhSBVTFyPEP8NbqGf2JW3XxPkgayfL7dVNVu2dHpLrFy1BIEAh
	YJJE1bzTmBacElgZOcghqyeRCORIdR/LLZ7oRMxMh3XyOs0Wjb/6nEBMXCEhwM9x
	858hXK8R2qmo53vVDQYdwOvNAPIpSzw2Or40PXHzI/NWQCeDz0H038YtRNRwMYXt
	DsLXWqSpMiIs05+muKqyN7DUHKQw0itff+hOT0HvVdMEwmUk8rI00k9OWafPsRmB
	7CiUQstyQr9JI3d68i9BPT7dPw67dCYNZXszHQSD5uVfq88SfJ1wX20qQMv7JLEW
	TqCpBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd022wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 04:22:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3011bee1751so5935872a91.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 21:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744172529; x=1744777329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaOMLZefNjdomADpY83DHsVO9iRZ4CFtlWdaS0QxPYw=;
        b=Fk+JfQUWZSDqrGGbExqYyAReP7H26T5OGPzCoAytN0fRnBzTx9EOMim63cEFnUg7sX
         lcNsEUDUU9vXFHTwbtLiwWw9CtBTf/xOuW9Nd5rgnYxNF2YVJNhkskQmKFHcJXh8vPTR
         hShZJRByOAd9FxqK28iF/qwtNpaJVP9OB6cMlSZ6DezIipzLj/wBRvznOXfnyyrscvGA
         TDOuCnYjX/yfGEAP6OKJFYa0Vb+Sln220i2XqXUQajddfhNWBEDylDLiZS9PbvzCzP6h
         RJ1tIPvhxWl+p2bjGQ4jtyh2k86Q9CdbKPUjxmW5D2sEaVsrHTjKLOUPsjFLWPEPtbke
         H4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmyI8QKIFmtHl6fbFDAQ2OBrfAcDvcmrjGd2Lgt4xDylGnDYKjrBHN/w5g7BjgvBicX/tkEua8kSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk3cO5JnD6K9BNc7yzkzdi8c1tytrFqapmWI+gvcAT//DNg2MF
	e2dIw5C5PsgRwUy33Brka1CMfPzKmOyUA+UHzf5tOFb5d+P2arBJ2QLLqhXe8WpUwIGjKqNcu9C
	7tvy1xxJW+UmhUOGiXDewWOjYdsfDpzAn7H4Eg7wHJBSXnoTRnqU++D3WZas=
X-Gm-Gg: ASbGncsfeJQ2+u8ptTvilGubjl7USICzTEAbDOQ70DsPq5t1dBFSx1mFqy5fIImsn90
	fbE6ECtIKCG2LfRSUJSkGh38gg77GOt4op+j0Pt23BYN61hRI3udVO8Gkj7idLzgT/JXuSfkjmQ
	kD98Hr04Cht9vpFDof/c9RO3xRpJwBHSp64wTiwJPn+UEB2WbDglrPvXvF3ypyUKtySVBH722EV
	T08AyNgz1ShK4zrhoKh4fj9poPfZvITlbYnbjC9W0s3yzjFzc8m2I3ftTUpdj3/wMYXHOMFeX54
	mPwSfD+jAsZUTwA8eN3sK2UvwsklY00U53I2TNsZ
X-Received: by 2002:a17:90b:5243:b0:2ff:64a0:4a57 with SMTP id 98e67ed59e1d1-306dd5565damr1228616a91.26.1744172528946;
        Tue, 08 Apr 2025 21:22:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMcV1I4AwmZh4T0/PCML8iEEfoSIz3B/1k5fy7KrLaBfr4U/E7hn0J5MhQ0x80QCufdSDycA==
X-Received: by 2002:a17:90b:5243:b0:2ff:64a0:4a57 with SMTP id 98e67ed59e1d1-306dd5565damr1228587a91.26.1744172528529;
        Tue, 08 Apr 2025 21:22:08 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6508esm1857615ad.52.2025.04.08.21.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:22:08 -0700 (PDT)
Message-ID: <a4cc6d1b-4925-4b57-ae23-fc1e23c5efde@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 09:52:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] usb: gadget: Use get_status callback to set remote
 wakeup capability
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-3-prashanth.k@oss.qualcomm.com>
 <20250408011758.qfdflgrrmahwmfqi@synopsys.com>
 <4d68cb04-377f-4ebf-99c7-c63b68aebf60@oss.qualcomm.com>
 <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250409005524.fbehw2gonv3p7j2v@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pYguaU3pNmE-5GW4RdJSIM-Q39I0rvE6
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f5f5f2 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Blp5UIsylfuUZZPXD0IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: pYguaU3pNmE-5GW4RdJSIM-Q39I0rvE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090017



On 09-04-25 06:25 am, Thinh Nguyen wrote:
> On Tue, Apr 08, 2025, Prashanth K wrote:
>>
>>
>> On 08-04-25 06:48 am, Thinh Nguyen wrote:
>>> On Thu, Apr 03, 2025, Prashanth K wrote:
>>>> Currently when the host sends GET_STATUS request for an interface,
>>>> we use get_status callbacks to set/clear remote wakeup capability
>>>> of that interface. And if get_status callback isn't present for
>>>> that interface, then we assume its remote wakeup capability based
>>>> on bmAttributes.
>>>>
>>>> Now consider a scenario, where we have a USB configuration with
>>>> multiple interfaces (say ECM + ADB), here ECM is remote wakeup
>>>> capable and as of now ADB isn't. And bmAttributes will indicate
>>>> the device as wakeup capable. With the current implementation,
>>>> when host sends GET_STATUS request for both interfaces, we will
>>>> set FUNC_RW_CAP for both. This results in USB3 CV Chapter 9.15
>>>> (Function Remote Wakeup Test) failures as host expects remote
>>>> wakeup from both interfaces.
>>>>
>>>> The above scenario is just an example, and the failure can be
>>>> observed if we use configuration with any interface except ECM.
>>>> Hence avoid configuring remote wakeup capability from composite
>>>> driver based on bmAttributes, instead use get_status callbacks
>>>> and let the function drivers decide this.
>>>>
>>>> Cc: stable@kernel.org
>>>> Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>> ---
>>>>  drivers/usb/gadget/composite.c | 12 ++++--------
>>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>>>> index 869ad99afb48..5c6da360e95b 100644
>>>> --- a/drivers/usb/gadget/composite.c
>>>> +++ b/drivers/usb/gadget/composite.c
>>>> @@ -2010,16 +2010,12 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>>>>  			break;
>>>>  
>>>>  		if (f->get_status) {
>>>> -			status = f->get_status(f);
>>>> +			/* if D5 is not set, then device is not wakeup capable */
>>>> +			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
>>>
>>> We should allow function to execute get_status regardless of
>>> USB_CONFIG_ATT_WAKEUP. There are other status beside wakeup.
>>>
>> Agree with the first part, I also wanted to remove the explicit check
>> for USB_CONFIG_ATT_WAKEUP. But anyways kept it since only 2 bits (RW_CAP
>> and RW) are defined in the spec as the status of GetStatus for an Interface.
>>
>> Lets do one thing, I'll rearrange it as follows
>>
>> if (f->get_status) {
>> 	status = f->get_status(f);
>> 	
>> /* if D5 is not set, then device is not wakeup capable */
>> if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP)
>> 	status &= ~(USB_INTRF_STAT_FUNC_RW_CAP | USB_INTRF_STAT_FUNC_RW);
> 
> Yes, something like this works, but I think you mean this:
> 
> 	if (!(f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP))
> 		...
> 
Yes right, will update it in next version.
>>
>>>> +				status = f->get_status(f);
>>>> +
>>>>  			if (status < 0)
>>>>  				break;
>>>> -		} else {
>>>> -			/* Set D0 and D1 bits based on func wakeup capability */
>>>> -			if (f->config->bmAttributes & USB_CONFIG_ATT_WAKEUP) {
>>>> -				status |= USB_INTRF_STAT_FUNC_RW_CAP;
>>>
>>>
>>> So right now we're not able to configure the function to enable RW
>>> capable? Perhaps we need to update the composite configfs for this?
>>>
>>
>> The removed code used to set USB_INTRF_STAT_FUNC_RW_CAP even for
>> interfaces which doesn't have RW capability. Its better to handle this
>> from function level than from composite.
>>
> 
> Not at the gadget level, I mean to create a configfs attribute common
> across different functions to allow the user to enable/disable the
> function wakeup capability via the configfs when you setup the function.
> 
> What do you think?
> 
> Thanks,
> Thinh

Thats a good idea, in fact I had the same thought. But thought of doing
it later since its beyond the scope of this patch/series.

We can add a configfs attribute to enable/disable FUNC_RW_CAP, and
functions can return get_status() based on the attribute.

Regards,
Prashanth K

