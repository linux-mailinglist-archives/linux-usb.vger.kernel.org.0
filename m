Return-Path: <linux-usb+bounces-27764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80BB4A10C
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 07:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6BC1BC3979
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 05:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7532EBBAD;
	Tue,  9 Sep 2025 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEfhh1Hj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C926FA67
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757394068; cv=none; b=kdox9oz2E5u8l2zhcqcp8i1XR2htjIWWFu8J9aMwJyFPWgUe5vC87c13f4G+UmkUfl6xNSP2lsO3mZmOcb0Wx4XPnomq3oF+Eci5in/dFxyciVtVo8sERa4AZxHvPx/CVY2WB5Fq7TZiv2v320FF7y7F+86kAdkXzm4CSVuuf5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757394068; c=relaxed/simple;
	bh=E4mwAjyuGe4AG0Z+PouqoEFvUzMH25x+ZfdcWRSEE5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=burwUj7cHHCa9dBdY9mtaJHRir5sHG4f/wYYXKFCMOh7PWzgASa6yVgTkR+ZDAYU5uz8yUWxlI1t9n5O23ck/M4R25mEukEHO22i/O0QnzVGAdQizD/XE9WFv2u6xRIC3dFzUWhWyoujjCum7zKb6YT4I+4oQOzA9omIH/oNdQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEfhh1Hj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5894cjjB007400
	for <linux-usb@vger.kernel.org>; Tue, 9 Sep 2025 05:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWS6C4mWnJD4C5OWdXp3iNdw/xJNKSa9b6pwbOJSwGI=; b=EEfhh1HjT1WwR9e/
	hMsMIstcI0mVQQ/sRwMwxUH/8mxqna+HyF0JYQ9F1TcfgeA6T8Y5yhDQOmpNsDI3
	EB6HOjHXADu0WqF5JkZdIx8MJHJ3CKFfjVKi+VYZJlXPcKWNASTekAMWW8k+aWlG
	lXyME29Icb9A5fh1w88OE9I3ZjFMXu+pQEC+55fydfYyoD+3YTUNQyhqrq01dCk7
	cQt0a48sq84PrQisYAHjiSDVzbxF5WW/Wxg8JNrCBvtimlAzhziW1Y0V8cw0NGep
	m3q3fCcsgnBmJqJSUtcDSCgO/u3NKdScobEXUH8yiRB3eCJ1aw/hUtJxota+p7SA
	qLie3A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j71td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 05:01:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-772299b3405so10737068b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Sep 2025 22:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757394064; x=1757998864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWS6C4mWnJD4C5OWdXp3iNdw/xJNKSa9b6pwbOJSwGI=;
        b=i43OrMhYsE7I5wrzIQ4wP/WQfha634/xHCh9BMm+jAx5B4P2QKjlkRlmdNY0obdTG6
         B6ofWngJku7C+PR8+yiJd7ggxSA65GanxFBo5bVrgznq8OlSf1FbqkSNSk/6cCBcakdf
         QgF1/ewvlL04+1SdclkICZPeOhYE9nZYAVHhFDdhjPnkMLVUOn9pMDfkk15s0j0tS+24
         oNI72S6lbKLZ9PGFMiRojKHTrP2+fpkmwDw7ueK6qESSLUUp9ecco52q3xn0922sJYpY
         rLCvajZ3d1f9tlFjdPIrrr63kOk0hnLF3thfNPpDThQgMLRi0LcqesW0VnJ+Q+0m6rdu
         TAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1hMYIywFkXR4BphpjUtBwKYro1mh4j9swipzQICh+wSXOfNJmoC9zHQ9RADpHSvXw62DItxqY2tc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2ta1QVVzrhQO6Pw2VFE6NXXiBqnLcdCQMubm6ZQExrZ9+7lN
	3PFnTMZThtMPoWkxPlJJGFvQs6aPdGK1UqFvterlf8qmK+H1dZMbWmHOpqsgByYxKi2Td+zJB7i
	eEvKo0TpLATn9Qy52xnVSIwTJqUFzVuUy12j9ZmSXpdMku+WtADM4RI1A4B41XOESsVCxNJQ=
X-Gm-Gg: ASbGncvDPOyabqKXJR6wsEQ6FITPagmfwLQHPFLUA/UAiB5Pj2yQxY0vaOUgkMb3Yzk
	ldMHyO0skc6zeBeNFn9/pSIJV0ltqVABma1RW+vfNoIHUyzJ4t0DSXtnvt/d4ZJ9imlp4Wc4eWk
	7ATYm76+4suwpTUSuQR+uktLxihHG0/0QWFJXgKPpAvfiW2xqIS7GOLQnqd3NjOe86Fkp1+lL73
	8QgOmJ5rmZhbhCI8r0IJCKPjHMQrp5BfHvOCC4fxKtWAoF9nX2DIWKz1WaiA/cbkktlpDZb5Hsv
	Q699axzzwXLrvR/+16VR2cXRn1O3WkTjYcI5KrWhMW/mQUhXIA/ZcjzIVRgHz+j7ar2D
X-Received: by 2002:a05:6a00:2ea6:b0:772:40ba:61c0 with SMTP id d2e1a72fcca58-7742ddb1ffcmr10916102b3a.5.1757394060961;
        Mon, 08 Sep 2025 22:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPzA/C/CIvT8cevf/od0VnnsA8Irk7qi8raGZGTUwkiAnY8UlfQXN2VAQnBWs174CppcIqxw==
X-Received: by 2002:a05:6a00:2ea6:b0:772:40ba:61c0 with SMTP id d2e1a72fcca58-7742ddb1ffcmr10916066b3a.5.1757394060394;
        Mon, 08 Sep 2025 22:01:00 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77466119d92sm684537b3a.30.2025.09.08.22.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 22:00:59 -0700 (PDT)
Message-ID: <d805d060-be0f-4d23-ade6-683bf5ffebc6@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:30:56 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250904234409.etyz6ep3y4rfr3he@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX3HGhalwK+hlx
 S4/wrrL8rvF597U6UwD5nV6nu7p8b2upxHhCBRCHVBb9J4TDoOeyYxLI8fEbp9i8Gn/tNr8WuQp
 jzHS+Nmx2CzXxcHYhSQTfY03GOpPu1r+V6YHU1vyGTkR0x+JPrnowTsQauxROrv1NJCi+Hfsr8w
 zupuI4upKcBVdhda7dOHQFF37LZIFmpHs70/8ybDdATLn6uBZCiBP/bpT7uq0Ls6TrCQZgV4Y1l
 S9cM0HGCF6n0PZHkCY5BYX6EcDpgeOzafCnOEfqYW1I4L05yDACqKNhIQiHZW0ADYHBaTnEzoYp
 a+QnBIfq+qz/Me17JaBzxG95BJk+RPecpYGJ2+ei7/7pTGf0xWb6NFcDaZjHALouTbOkJ52LZnK
 6GRZ4cTm
X-Proofpoint-ORIG-GUID: YNCI9EGcyX9tYCg6NdtxoQY_Z0queSi3
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bfb491 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ya92I7RcYBdE5E1vmwcA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: YNCI9EGcyX9tYCg6NdtxoQY_Z0queSi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022



On 9/5/2025 5:14 AM, Thinh Nguyen wrote:
> On Thu, Sep 04, 2025, Prashanth K wrote:
>>
>>
>> On 9/4/2025 5:30 AM, Thinh Nguyen wrote:
>>> On Wed, Sep 03, 2025, Prashanth K wrote:
>>>>
>>>>
>>>> On 9/3/2025 5:14 AM, Thinh Nguyen wrote:
>>>>> On Mon, Sep 01, 2025, Prashanth K wrote:
>>>>>>
>>>>>>
>>>>>> On 8/29/2025 4:18 AM, Thinh Nguyen wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Mon, Aug 25, 2025, Prashanth K wrote:
>>>>>>>> When multiple DWC3 controllers are being used, trace events from
>>>>>>>> different instances get mixed up making debugging difficult as
>>>>>>>> there's no way to distinguish which instance generated the trace.
>>>>>>>>
>>>>>>>> Append the device name to trace events to clearly identify the
>>>>>>>> source instance.
>>>>>>>
>>>>>>> Can we print the base address instead of the device name? This will be
>>>>>>> consistent across different device names, and it will be easier to
>>>>>>> create filter.
>>>>>>>
>>>>>> Did you mean to print the iomem (base address) directly?
>>>>>> I think using device name is more readable, in most cases device name
>>>>>> would contain the base address also. Let me know if you are pointing to
>>>>>> something else.>>
>>>>>
>>>>> Yes, I mean the device base address. PCI devices won't have the base
>>>>> address as part of the device name.
>>>>>
>>>> But the base address (void __iomem *base) wouldn't be helpful.
>>>> Using the base address, i guess we would be able to differentiate the
>>>> traces when there are multiple instances, but it wouldn't help us
>>>> identify which controller instance generated which trace.
>>>>
>>>> And for PCI devices, i agree that it doesn't have  address in device
>>>> name, but i think we should be able to identify the correct instance
>>>> based on the bus/device numbers, right ?
>>>>
>>>
>>> We may not have the PCI domain numbers if it's a child device as in the
>>> case of dwc3-pci or dwc3-haps.
>>>
>>> The base address _does_ tell you exactly which device the tracepoints
>>> correspond to. The device name is inconsistent between different device
>>> types and only relevant if we have access to the system to know which
>>> name belongs to which instance.
>>
>> Yes, I agree that device name would be inconsistent for different for
>> PCI (and HAPS) devices. But IMO using base address (virtual) would just
>> make it more harder to read and identify the instance.
>>
>> Perhaps we can cache the register addr and use it, what do you think?
>> Here we can at least differentiate the instances based on HW addr.
>>
>> snprintf(dwc->inst, sizeof(dwc->inst), "0x%08llx", (unsigned long
>> long)res->start);
>> dev_info(dwc->dev, "addr:%s\n", dwc->inst);
>>
>> Output --> [    4.521746] dwc3 a600000.usb: addr:0x0a600000
> 
> I think there's some misunderstanding here. I refer the base address as
> the hardware address.
> 
> I prefer something like this:
> 
>     dwc3_event: 0a600000: event (00000101): Reset [U0]
> 
> instead of the device name like this:
> 
>    dwc3_event: a600000.usb: event (00000101): Reset [U0]
> 
> BR,
> Thinh

Initially I was also talking about HW address, but since we were
discussing this under dwc3_readl/writel functions context, i also got
confused whether you are pointing out the HW address or virtual address.

Anyways, i guess the above method using snprintf on res->start is one
way to get base address, is there any way to do this?

Regards,
Prashanth K


