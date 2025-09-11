Return-Path: <linux-usb+bounces-27914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB8B527D2
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 06:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBD317B5F2F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 04:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C6623B63B;
	Thu, 11 Sep 2025 04:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoBkoLVu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7F19DF4D
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757566005; cv=none; b=eEZihhMj1xTQukdzFz7cEsn4m19bCFE3R0g1oNWru95AT7/6zjTIJjClHJVagphPNQlQuhhxd45llASIgb5TsliylMvWL0H8XjU8GjDBkz/PgMXr61vJM7OWZuRN6lSJDoWcfx0JImzHP2KAvG3uibLnVJVfJs87rOUc9lFgMhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757566005; c=relaxed/simple;
	bh=FY5K5/YBs57CAchuTzsxr5A8V3N+Hwp+3GcfSoXsJSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPl+FKEwQlR2lJENLLQtFarrlDv1PuMr56cpHpNQ5cfsFynMB9Xkg9lwvb13/NrowIojjOKr7Dvq1kL5fe/GxubbPcMyAYugFe9nGJcmJ37XKQKj53lIGDSAqsxy24dVCCi2J5siajYuiEwHCHWURkq9hIyEHZqcJAyK8WZO5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoBkoLVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J3oY026568
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 04:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kwfsr7UMzt/yvq4a/oVLSOK4spFamKl/o9sZhs0Z63U=; b=ZoBkoLVuQn2/0mpW
	ALTlm/5aFGIOHdFI6DUM8t/Q3k2vGGxeXkDZ+0khtdkOf3mV8r1VhMey6D8vkTqa
	N0lzwaJQJ3sHipWRx7HRHleuEOWxh9/4E9pa55uZBh7EoGZvJZhOit5yrHOL4Z7Z
	rsuGBjeTmi/iRWsE+Cc6Qyt2rmDIL+8kAPWWglFzm7HRrbSfFmcV30UtBaPnh/+m
	YMzGKJ6n/zMA0yohh+u8m5cogojrMQJp1Abmbsw/Oyi5ElzBbReAd9P17n6EVF6n
	insknHfpoisaKdQhwXCU1th92Fi3eQHLyof07bnblh7z32JHAlpxERvCVuX8aTK4
	fqP7PA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0x7dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 04:46:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32bdfd536aeso349565a91.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 21:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757566001; x=1758170801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kwfsr7UMzt/yvq4a/oVLSOK4spFamKl/o9sZhs0Z63U=;
        b=SNaPQjLgCaO1aDnwrGeXoerMT1cY7rx+IfiuhIdXl3UE4BU0FE3ON4HdzDB58h1IhU
         yP29rdILTIW2LbJc1gZLUvM34cfawFKU80TvAiZq1b+6bNZ8S4ahR9v7I7+P6WK9yhhD
         5A9w5I5rffIQd81VdE3MhGk1rDQdWzJ6x1duR6dKbF4x3HE5zb+3t8MxOVZSJ8m/r8Wi
         cSeN7cuIvoFFtO3G3nwcbogLMt6RF1BeSQcUIuItPY9juYovJDtZLVUftzPlubyTpIky
         9n/WJ9L6OcTeTwsQN2quQ8lc8YT693KDgJoMoj7T1JlfWpk1bMjAsIh0VeO2Bt04O5rz
         Y6lw==
X-Forwarded-Encrypted: i=1; AJvYcCWqxx7PEI5/r91HX8VT2q0le2HWSA3dHidEMvFz3490/Z4gqRtb/82+tQYLnhGxFZVZF93VOK7Uldg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Mt/4yryyl3JAtZhh1lpgB/eEV817IUdBPZ/mRmYystvQTlJD
	EH58ETSO+fpT0w55t6y0wueBIMQPgWSEVSfhXiFUDtvLpZYKAhxx8rKYLEVuOgXu/40/Rfd6y7o
	sWNmSbo1hQk3tghr0rJXzaGe+BPH06rS0lGOWO/dIDvd8iD/pqwNg1SG9bNaKmwbM3yu4ixg=
X-Gm-Gg: ASbGncteEDbTtLVjue+BJP7TmdclDVNnd17dA9KFYkHbZUCvzTXrDjAUTKVneU0hxbZ
	93eF24BMI70SOdyG59JydFOgE8fjzF4h9wZNuhQ6bxNIBRaKvbEg6QBHKreCBrhwzXQH6XAGP1g
	n0xHKBwmd+JgFaIBZxlkYwm/Kf31/62R8iZIbOdPcu+LOyF4p2MI3sWlh8uuOBH6mKuZJo9RkgO
	kWTu4wC6E1m8iZi89XR+WPxTTjcjypBBVLUh6OxnH2irWO3Hvhg2SXVINPbWyXCdOxd3IchEVEH
	Luw+AYbg5uxetgd9cDV7rpb//m93RJE5QHQbunHCT5X6lBo3R1OtXQxtf9fEldlkL8Bq
X-Received: by 2002:a17:90b:4d:b0:32b:5c14:3bb6 with SMTP id 98e67ed59e1d1-32dd1d36ee7mr2070281a91.1.1757566000741;
        Wed, 10 Sep 2025 21:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiiFqCnbIxKhA8tXaJyMf9CqUxxnVMDRmioahxH8ltQfBZCqBo7Tje6V23B+7Nob7q6DPdJg==
X-Received: by 2002:a17:90b:4d:b0:32b:5c14:3bb6 with SMTP id 98e67ed59e1d1-32dd1d36ee7mr2070264a91.1.1757566000192;
        Wed, 10 Sep 2025 21:46:40 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a398cfbasm497823a12.39.2025.09.10.21.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 21:46:39 -0700 (PDT)
Message-ID: <f9e9b906-f3da-421a-b8b1-928534ad5703@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 10:16:36 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Log dwc3 instance name in traces
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250825114433.3170867-1-prashanth.k@oss.qualcomm.com>
 <20250828224852.ukelgargocektp3z@synopsys.com>
 <5b30f63a-5999-48f1-972f-93f02fcc0ec2@oss.qualcomm.com>
 <20250902234450.vdair2jjrtpmpdal@synopsys.com>
 <67329e66-2221-426b-88a4-eece06d694ec@oss.qualcomm.com>
 <20250904000003.b4j7fnucronjf6ej@synopsys.com>
 <745a2b9c-078d-45eb-97a7-3a27a4bc5191@oss.qualcomm.com>
 <20250904234409.etyz6ep3y4rfr3he@synopsys.com>
 <d805d060-be0f-4d23-ade6-683bf5ffebc6@oss.qualcomm.com>
 <20250911013631.hv4ibt3j452tbsex@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250911013631.hv4ibt3j452tbsex@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yXjT43ukm1BidodKI5Itom5Emptyk0lE
X-Proofpoint-GUID: yXjT43ukm1BidodKI5Itom5Emptyk0lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX9V+v4Mdxq9Av
 ann+H2JiZl5v2qoYRxICxbSDW/9iVKVuKOhjmvHKPu6LjYOvk6MHPoC0bU0WnvznEtLWGMw8qCO
 Hm6X3LbICguvsw2RPNJPbafXUxjisc0WwLdvp/N3aYMRfNGJoU526w3FV/aKAG1v5xMVTljeIj6
 XNh3Ge6mSvpCSCrwERqBgCf9v0ywEjHrLEuPxwy8znuMK3CRm1xPtW+yC9UX/wF4KT1A7iewAyo
 0ujgunLYZeWmD7hBvmgbe/P6Hyijl+uX8V+854+HdxHJKaeMCh4pObnNKn3qMElDKJm3xjaEMIR
 ULSnjjJG3+wuSOyzwfWAGYSKcHgGg8JsZthZZatTmf+KYZGEAgGcFISaXFodvyRL52m+g/FygOc
 JC+XN84I
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c25432 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QGgrgOSQPP_-IAqaxi4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024



On 9/11/2025 7:06 AM, Thinh Nguyen wrote:
> On Tue, Sep 09, 2025, Prashanth K wrote:
>>
>>
>> On 9/5/2025 5:14 AM, Thinh Nguyen wrote:
>>> On Thu, Sep 04, 2025, Prashanth K wrote:
>>>>
>>>>
>>>> On 9/4/2025 5:30 AM, Thinh Nguyen wrote:
>>>>> On Wed, Sep 03, 2025, Prashanth K wrote:
>>>>>>
>>>>>>
>>>>>> On 9/3/2025 5:14 AM, Thinh Nguyen wrote:
>>>>>>> On Mon, Sep 01, 2025, Prashanth K wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 8/29/2025 4:18 AM, Thinh Nguyen wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On Mon, Aug 25, 2025, Prashanth K wrote:
>>>>>>>>>> When multiple DWC3 controllers are being used, trace events from
>>>>>>>>>> different instances get mixed up making debugging difficult as
>>>>>>>>>> there's no way to distinguish which instance generated the trace.
>>>>>>>>>>
>>>>>>>>>> Append the device name to trace events to clearly identify the
>>>>>>>>>> source instance.
>>>>>>>>>
>>>>>>>>> Can we print the base address instead of the device name? This will be
>>>>>>>>> consistent across different device names, and it will be easier to
>>>>>>>>> create filter.
>>>>>>>>>
>>>>>>>> Did you mean to print the iomem (base address) directly?
>>>>>>>> I think using device name is more readable, in most cases device name
>>>>>>>> would contain the base address also. Let me know if you are pointing to
>>>>>>>> something else.>>
>>>>>>>
>>>>>>> Yes, I mean the device base address. PCI devices won't have the base
>>>>>>> address as part of the device name.
>>>>>>>
>>>>>> But the base address (void __iomem *base) wouldn't be helpful.
>>>>>> Using the base address, i guess we would be able to differentiate the
>>>>>> traces when there are multiple instances, but it wouldn't help us
>>>>>> identify which controller instance generated which trace.
>>>>>>
>>>>>> And for PCI devices, i agree that it doesn't have  address in device
>>>>>> name, but i think we should be able to identify the correct instance
>>>>>> based on the bus/device numbers, right ?
>>>>>>
>>>>>
>>>>> We may not have the PCI domain numbers if it's a child device as in the
>>>>> case of dwc3-pci or dwc3-haps.
>>>>>
>>>>> The base address _does_ tell you exactly which device the tracepoints
>>>>> correspond to. The device name is inconsistent between different device
>>>>> types and only relevant if we have access to the system to know which
>>>>> name belongs to which instance.
>>>>
>>>> Yes, I agree that device name would be inconsistent for different for
>>>> PCI (and HAPS) devices. But IMO using base address (virtual) would just
>>>> make it more harder to read and identify the instance.
>>>>
>>>> Perhaps we can cache the register addr and use it, what do you think?
>>>> Here we can at least differentiate the instances based on HW addr.
>>>>
>>>> snprintf(dwc->inst, sizeof(dwc->inst), "0x%08llx", (unsigned long
>>>> long)res->start);
>>>> dev_info(dwc->dev, "addr:%s\n", dwc->inst);
>>>>
>>>> Output --> [    4.521746] dwc3 a600000.usb: addr:0x0a600000
>>>
>>> I think there's some misunderstanding here. I refer the base address as
>>> the hardware address.
>>>
>>> I prefer something like this:
>>>
>>>     dwc3_event: 0a600000: event (00000101): Reset [U0]
>>>
>>> instead of the device name like this:
>>>
>>>    dwc3_event: a600000.usb: event (00000101): Reset [U0]
>>>
>>> BR,
>>> Thinh
>>
>> Initially I was also talking about HW address, but since we were
>> discussing this under dwc3_readl/writel functions context, i also got
>> confused whether you are pointing out the HW address or virtual address.
>>
>> Anyways, i guess the above method using snprintf on res->start is one
>> way to get base address, is there any way to do this?
>>
> 
> You're right. I forgot that we can't do virt_to_phys() for ioremapped
> resource...
> 
> In that case, can we pass the dwc3 structure in the dwc3_readl/writel? I
> know there are many places that this change may touch, but I feel that
> it's easier to read than creating the new macro dwc3_readl/writel.
> 
> Thanks,
> Thinh

1) Passing dwc3 structure to dwc3_readl/writel will need changes in
around 250 places, we can do that using 'find and replace'.

2) OR we can use container_of(base, struct dwc3, regs)) to get dwc pointer,
this will not work in few places where we use dep->regs (~6 places). we
can just create a separate function dwc3_dep_readl/writel for dep->regs,
and get dwc3 from dep. This will have lesser number of changes, and less
impact on git history.

I'm more inclined towards approach2, but fine with both approaches, let
me know which one suits here.

We can use snprintf on res->start to get the HW addr and store that
string into dwc3. Is that fine?

Regards,
Prashanth K


