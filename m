Return-Path: <linux-usb+bounces-22459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F325A78756
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 06:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 497D83AE9B0
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 04:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FAF230BC7;
	Wed,  2 Apr 2025 04:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5h3c8EX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76920AF8B
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 04:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743568975; cv=none; b=bYo3G8pofAEIKG2pPyjDhhrfEuYfxZZrkYNJ8jyHwpXHv/QIdX7QFrsNln4AqyYuLWjh5Y/oQOdsPa14a9nxkhqa4kiIRFWQaR/VvEcmtqXXk++93nK4r5jg+3Mw0p70kUrD4TWS7miWkK81D/9WTqjmOk8ZpYChhLh20x88hEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743568975; c=relaxed/simple;
	bh=qZYwJH7+q22j/uTOz04w3vnQHZFCKfxkJPGcjgjE6d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmjwaGz+kCAFddxA/E1YLD/+Vfsy0PwG+bKuUC+akrEAZG7aUgc7fbabj+LluGfaSbbGTkWKT+FzDdI2gRARKS4GG6pw6xzZQYflBAGRlZ6U3JOx9GuYbNXTXJFHFu2Y+YueZjNYaiEx/W5pRCaZBDt35Y1fkRDqh3hIWkm6c28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5h3c8EX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5322fiwZ024654
	for <linux-usb@vger.kernel.org>; Wed, 2 Apr 2025 04:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fsc/ia+3ekoWiUvTYhDO0IcUlCjl3N229EoDeW2bErU=; b=B5h3c8EXGjZroHdw
	b7U54eLHGo8qm1AioH4ij9Wslkp1ranXN+kDGBJtXf73+cW0PPwOc1beCzxegwWY
	UL+cRMAY3LW9pvHBUh3OVvn9twbkKotCNw2a5yeWKsjjCghRdbD0fm7/MXQd6C6v
	B8xrU4Bfw7XCaxDxAZXRkA86XBWV2zS/Rel5/HJocZAUe6msvJKRJq1IUwlP5cdX
	Ch2uMldyEBOxiP4hDGxiqZ5+DWWhFavmhOZEI3e8YJcE5KLV0gXD7HtsAc1bcIOX
	Th3e5yXXN7mW617xTJb4uXssjcbd9ofbefwFl6Q4tGrxMjDbgE5X07o4G8UQy46W
	RheGQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kt7hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 04:42:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-227ea16b03dso178399215ad.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 21:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743568970; x=1744173770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fsc/ia+3ekoWiUvTYhDO0IcUlCjl3N229EoDeW2bErU=;
        b=KFOoLEBknMhPng3VnjjgFsHnmrXXpEBeAwUGCqmKXjMAl26Hm3Tp6HV7+VdpYjGg52
         My4KfPMxw8KsXa539oQKUd3AGowQ3fbnohIXoNU7bZqjXh7JVwJtg8/7WZZjYFDdC/SU
         raRxBDIrRseQLqxBEvaoroPotf9fT6pQz7SPG3KWE0WcpKend0R4nK0MUF6OI+en0Vbk
         0cN3xT13Wg2sedIQKI+MjBST6uUmn1gLuiQsBJuBJyI6V3QFNEBBObMlMc5uJfGTiWmw
         XjDVsjz7+ADLrQtNC9ohx6ADvQDbUrP5rMr2B50BC8AbQyUlDp2eGaaTp0nA6J1Adyob
         +hWw==
X-Forwarded-Encrypted: i=1; AJvYcCUBREkNmrVVsYblHJNOMxiTkv1470z6tvH1MpT3cHUpU85iekQ0D0REazXRYctBmMRC1RfQeXRuJ3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SiSxsRl5dxMkRcY9+e9sn3pNHoTNZkSK5dnjEgDfzwSDQ61V
	n6GoeNug8aq9e37hMkSO6mhj48bbmWmlYXBec9zAtdWGwgTKncqeXC4BzQOpJRDNMifIZ+VfUqd
	anAJNVlQU8gKuhBNDG7qyZV43UrJkodRe19uB+LgDhV0E/DXyWCH9fCTLgr1zvg2Nv90=
X-Gm-Gg: ASbGncvpk731hvdgFgPlZ1qjxKJIb/DxuzzuEoqYmKgFxF/NGIkRQNoJxA+9uPcmc/m
	AOS0c8hFGEOb13aGJmyYqkvpW+ZzxMsSj/dfIVqPlsCxHn/JVCf4vvjPSOEA5cRFmU0E8dbjZpM
	5Px+nMsCpFTZensFHR0iSwrNiVag9fdIQjBU9R+PJXd4bXCz0cKRwtDp7pVS8VkobMsC4KagfYY
	+UGZ/Qi2HH0FvjakHXQYfwEhdXRzJdybjItPt0wo+A6CjVTWgBDRHcgAGrAOPahLnLfvcYb87UW
	HOmqacn4kTkKWob4uZTYr0QX75doOqLmivC6TAPE76qY
X-Received: by 2002:a05:6a00:852:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7398036737cmr20072274b3a.7.1743568970530;
        Tue, 01 Apr 2025 21:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5ELsL2QdK6nHfiqIA5vZv80dty9X8RSjij14cKDuVlA2qtjsFx42IogqS87E3RtSAUR5DFw==
X-Received: by 2002:a05:6a00:852:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7398036737cmr20072249b3a.7.1743568970031;
        Tue, 01 Apr 2025 21:42:50 -0700 (PDT)
Received: from [10.218.44.4] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e27129sm10235002b3a.57.2025.04.01.21.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 21:42:49 -0700 (PDT)
Message-ID: <4d9226a9-d89d-4441-9dbf-f76ebce49a9e@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 10:12:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: gadget: check that event count does not
 exceed event buffer length
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Frode Isaksen <fisaksen@baylibre.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Frode Isaksen <frode@meta.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250328104930.2179123-1-fisaksen@baylibre.com>
 <0767d38d-179a-4c5e-9dfe-fef847d1354d@oss.qualcomm.com>
 <d21c87f4-0e26-41e1-a114-7fb982d0fd34@baylibre.com>
 <a1ccb48d-8c32-42bf-885f-22f3b1ca147b@oss.qualcomm.com>
 <20250401233625.6jtsauyqkzqej3uj@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250401233625.6jtsauyqkzqej3uj@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67ecc04c cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=VabnemYjAAAA:8 a=m5ogOnp4AejF7vqX9dAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: a7ur2W1hMoIDeY7-6MzCoKuHM_j9kJth
X-Proofpoint-ORIG-GUID: a7ur2W1hMoIDeY7-6MzCoKuHM_j9kJth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504020028



On 4/2/2025 5:06 AM, Thinh Nguyen wrote:
> Hi Frode,
> 
> On Tue, Apr 01, 2025, Krishna Kurapati wrote:
>>
>>
>> On 4/1/2025 5:38 PM, Frode Isaksen wrote:
>>> On 4/1/25 7:43 AM, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 3/28/2025 4:14 PM, Frode Isaksen wrote:
>>>>> From: Frode Isaksen <frode@meta.com>
>>>>>
>>>>> The event count is read from register DWC3_GEVNTCOUNT.
>>>>> There is a check for the count being zero, but not for exceeding the
>>>>> event buffer length.
>>>>> Check that event count does not exceed event buffer length,
>>>>> avoiding an out-of-bounds access when memcpy'ing the event.
>>>>> Crash log:
>>>>> Unable to handle kernel paging request at virtual address
>>>>> ffffffc0129be000
>>>>> pc : __memcpy+0x114/0x180
>>>>> lr : dwc3_check_event_buf+0xec/0x348
>>>>> x3 : 0000000000000030 x2 : 000000000000dfc4
>>>>> x1 : ffffffc0129be000 x0 : ffffff87aad60080
>>>>> Call trace:
>>>>> __memcpy+0x114/0x180
>>>>> dwc3_interrupt+0x24/0x34
>>>>>
>>>>> Signed-off-by: Frode Isaksen <frode@meta.com>
>>>>> Fixes: ebbb2d59398f ("usb: dwc3: gadget: use evt->cache for
>>>>> processing events")
>>>>> Cc: stable@vger.kernel.org
>>>>> ---
>>>>> v1 -> v2: Added Fixes and Cc tag.
>>>>>
>>>>> This bug was discovered, tested and fixed (no more crashes seen)
>>>>> on Meta Quest 3 device.
>>>>> Also tested on T.I. AM62x board.
>>>>>
>>>>>    drivers/usb/dwc3/gadget.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>> index 63fef4a1a498..548e112167f3 100644
>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>> @@ -4564,7 +4564,7 @@ static irqreturn_t
>>>>> dwc3_check_event_buf(struct dwc3_event_buffer *evt)
>>>>>          count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
>>>>>        count &= DWC3_GEVNTCOUNT_MASK;
>>>>> -    if (!count)
>>>>> +    if (!count || count > evt->length)
>>>>>            return IRQ_NONE;
>>>>>          evt->count = count;
>>>>
>>>>
>>>> I did see this issue previously ([1] on 5.10) on SAR2130 (upstreamed
>>>> recently). Can you help check if the issue is same on your end if
>>>> you can reproduce it easily. Thinh also provided some debug pointers
>>>> to check suspecting it to be a HW issue.
>>>
>>> Seems to be exactly the same issue, and your fix looks OK as well. I'm
>>> happy to abandon my patch and let yo provide the fix.
>>>
>>
>> NAK. I tried to skip copying data beyond 4K which is not the right approach.
>> Thinh was tending more towards your line of code changes. So your code looks
>> fine, but an error log indicating the presence of this issue might be
>> helpful.
>>
>>> Note that I am not able to reproduce this locally and it happens very
>>> seldom.
>>>
>>
>> It was very hard to reproduce this issue. Only two instances reported on
>> SAR2130 on my end.
>>
> 
> I still wonder what's current behavior of the HW to properly respond
> here. If the device is dead, register read often returns all Fs, which
> may be the case you're seeing here. If so, we should properly prevent
> the driver from accessing the device and properly teardown the driver.
> 
> If this is a momentary bleep/lost of power in the device, perhaps your
> change here is sufficient and the driver can continue to access the
> device.
> 
> With the difficulty of reproducing this issue, can you confirm that the
> device still operates properly after this change?

Unfortunately, I did not test this particular change of returning when 
ev count is invalid. I stress tested the change of copying only 4K [1], 
but didn't see any issue. I suspect we didn't hit the issue later again 
in the course of 14 day testing.

[1]: 
https://lore.kernel.org/all/20230521100330.22478-1-quic_kriskura@quicinc.com/

Regards,
Krishna,



