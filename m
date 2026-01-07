Return-Path: <linux-usb+bounces-31978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9FCFCC22
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 10:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4D2030281AC
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 09:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11972F5A13;
	Wed,  7 Jan 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCHzC34a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P56LxhDB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B98270EDF
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776734; cv=none; b=jewcDdGG1D3lLw8amQxi7BKaoKPm4wWABhKWlvEuugNb2Ada3/2yw+6a8+DuzivNRHOgacwaWn9GRhUAIOpo/QD7E/oTX78uDeSKixma309smC0WEK5+xfHjqfjFYAwuTNh4vyoPo3MWdb5xMkMq5hbUvA28oFauMuxeW+GnwS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776734; c=relaxed/simple;
	bh=/EzyqPcaUxLxZ5is/W9daFjbwmPeSJJHeB4dnp1Ap/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APfLfsdsDjEd1UZqR7AbEV1frsKUhM7gZVOXX1shBaMSNgD3U9JRt4XA4f7D+QoPieJ9UUuH4CcTrTkeVyZpjK0ThjJhYfVLM59PYx/oNZaNxGAJutwT365riYigcPVEUAhQ1Nl2dB+iB+1z0V+ItUiH3BfseqKxE0gWZpdjnYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCHzC34a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P56LxhDB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076HclF4048847
	for <linux-usb@vger.kernel.org>; Wed, 7 Jan 2026 09:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQtUTXsxRPA/rxxveREFetsO7cCg45SWc2jQH6Nyyfc=; b=hCHzC34avLc0LA8/
	r1rCh+gVSqJX5CQF9sdypg0u2Sd1Vn1rq4RMO/M6lShuL8C7QAFAYKcu/PHwWCnB
	BEddBbjX7H6m3KvWaJP6n7JssnT6XdG776tEWXCvVqqpS6DMDfV29RJ+aXKQ3U2M
	45LXgJiiqT0VuUJTNkKdQeRIoFKM/f9UPCVCvUoUt9f0T8WiyE3d5l2r6uuGo5Or
	Wugtz++Sssgu73CR4Sc7X0Giksf0crZPWuISC0HFncOJg8r6MTziDkIo+tUHWcnf
	uPPOuqr2/y9OqVbcNukM2g49RT08ikGiVlagKp1wU0q9/qc9u2caTrOrPH0hK4/C
	kUOymQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25ruf2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 09:05:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so29771685ad.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 01:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767776731; x=1768381531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQtUTXsxRPA/rxxveREFetsO7cCg45SWc2jQH6Nyyfc=;
        b=P56LxhDB5XHDLu+5sMDgKfi2JO3Em/Obx+XBd5pkT8TLe2f1l5RK+DV0EMLAvMgGaZ
         qmGAckpkmIyZn7gFkUB0JYyIgsTXS38csYAj7sfHVupkvoElhpiwqlt4MSUQCpAXT/OH
         G3tlD3f+OsWI0XfomwNGRhaVscxZ+k72NMNkZprV+PRDZjLlczjGXZa2n30ZvfZWja6Y
         XGwR7zGGeO1BNA9v1pJJy/ImzrN5elWNoXsLFYd+u3/p2sCK+K35Y9hOIRlETbM3EGfZ
         3xuwC+RNoSSMBHtF2UnHBrdIuR56II2H7H7EYIqC0Eecx/cKy+4escv+4cj2LDaI+clI
         R2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776731; x=1768381531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQtUTXsxRPA/rxxveREFetsO7cCg45SWc2jQH6Nyyfc=;
        b=LWWt7Tg3ssdgtBa+uLlt9EFypJPSuytl2vJBOrR7c6h19N9e+pVoHndYxo5Y+oehj7
         Usniit+6BvL2jkTHUUW9d1N96IiwzL1hXDy4TT7joPTE1LBF63TYaMTYQqUEB3EVebgS
         qmUJVnPiickjKYhvJSrvPIp/0OY6N0NI5LvrLM0eNckWkjYJFr4FvRKCjrTLavZ2J3JW
         qDwnT0U0TBqVt3+TMdcpGSpvMvjtMj36au6Izbn2/50Oo0DfZiAs2Ww1IEf0t5Bg0s8/
         A+fNR72ddqJy07uw1iozVqReTnqqn7sKr3f39NHFbaNHvkU7lVXFLcADjvlk3WgTwhYW
         EJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUz8Hniv9WhYSYYs5vReBNR63KgSpuaDNWo+hvJl78uU9Xlcij/eC4zB8M3E65laBiVRdnIkMkjBC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9k54sZyCTyNY0JnFzdrM0Lb9X5WkIm3KgYU9GOWLalfi1vAs1
	onzvGCHQw/bZk7y/ltcDiIq/GLhCfGyyDWFFosgYHRAz3z5BPRbFjz8M6OogWVH6q/+41pH6g+a
	XckIHBQ/2LMy/d8JVa4FGaj7e9DfafMEZaZu3jI5hKlhgBX24TicfwHzK132YkSWwo3z2Kxg=
X-Gm-Gg: AY/fxX5YfnzfRd1FLqRB2ePGPsWOngwapL97anFo0Ut45THr/uRqmkPuC4kVfV8EsWy
	spcrMUS0iBGU7+INCQwci3GbYk2+fsbXFWPhV9c4gsjtUiG9SWyXt4FfTM7QlBueQ1tYWXCmO0j
	grwQTdPPVqRKcAdU6Usew8GFHLApjEeAaxbaoYx3Bm2NfMyedNJKMNuqxz7ZLmHdBoJJ1d5iPH1
	xRdd1ysbQbzHjh/Z3t1oAgn7lnT/V9dGcG/+aTtG4F3Gy2GVNBMazT89Aso89CNNhNse1P1ZTZs
	b1nYlG8jQCE6BB/xemcQbmFoSMrno9NftS/xO89cm4Dav2/ZG/zrRoOjEWL5W7zLQbcms2dCdtx
	O9pgKsHcaUTKDlhHs1BODxkdHRgCNigEZ3uGtmQ==
X-Received: by 2002:a17:902:ce0e:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a3ee4e7045mr16522365ad.55.1767776730950;
        Wed, 07 Jan 2026 01:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExaYLk0/4zSS33E2S0Ols1wCFMMkr6XO+Tcw+bWD14Khl1YhmQXnFMEM5jbgaTwEv1yvKnAg==
X-Received: by 2002:a17:902:ce0e:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a3ee4e7045mr16522165ad.55.1767776730434;
        Wed, 07 Jan 2026 01:05:30 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm43923675ad.88.2026.01.07.01.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 01:05:29 -0800 (PST)
Message-ID: <16c3b03f-198a-487a-9e1b-b772b61441ff@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:35:26 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
 <2026010652-dissuade-reproduce-008d@gregkh>
 <dec18683-5b43-464f-a735-4bf26644aa0a@oss.qualcomm.com>
 <2026010747-darkroom-peso-24fb@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2026010747-darkroom-peso-24fb@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cV-lsRozYcH3zrz6ChcOfDPIJbTWCtpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3MyBTYWx0ZWRfX7Rde3UChRPvV
 fhvRb9+VuzueQPZy6XYQYW/LVBIXmZDiG35REeEFX6LbdH0wEEM5meWWKobNfdeR5OzXS9T/4Qk
 BzTLYfW9aQ5uYTqgkCwMfWJP/wF1fcbk/09XycyLZ4jcnt80/s7aa52l0JqKMmomaLHxJwNGLF5
 BT32NwtWo5CDzJjxzFMnyl/y/hwowWT/HlvVnM8anMhh12JOFJm872A2ZDRV0n+4S/7Xj8A19WU
 HWArZqvhi/PvbM0oQmHfvI23PbDKCYyc8fINz65RyEmHAv2kXJhWJepaWMJyZW1k2SSE5HW/7IY
 kJG76TWBsixSTXXvZyFMmPAEH5xaufU8R5asN19qcyL6AArT1Q1JJn4ozBKoa9FC3Er6y42II/o
 U0sVMhDWN78Pd6hmVCiO9kQ0/cuRzA4vyrw918io1onw4uYc6jty+kCD6qrIrQauguPxNl9ohSl
 6cRkjJj/evYvQBeM6tQ==
X-Proofpoint-ORIG-GUID: cV-lsRozYcH3zrz6ChcOfDPIJbTWCtpL
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695e21dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=St60lDPJFlc7h7vggfsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070073



On 1/7/2026 12:10 PM, Greg Kroah-Hartman wrote:
> On Wed, Jan 07, 2026 at 11:33:11AM +0530, Prashanth K wrote:
>> On 1/6/2026 3:28 PM, Greg Kroah-Hartman wrote:
>> +	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
>> +		 (u64)res->start);
>>
>>> And are you _sure_ it is ok to expose that to userspace?
>>>
>> yes, because it's already part of devname in most cases.
> 
As Thinh suggested PCI based devices has different devname style,  which
is difficult to map with correct controller instance from just trace logs.

> Ah, so then why do you really need this?  :)
> 
>>>> +
>>>>  	if (dev->of_node) {
>>>>  		struct device_node *parent = of_get_parent(dev->of_node);
>>>>  
>>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>>> index 23188b910528..c16e47273ea0 100644
>>>> --- a/drivers/usb/dwc3/core.h
>>>> +++ b/drivers/usb/dwc3/core.h
>>>> @@ -1178,6 +1178,7 @@ struct dwc3_glue_ops {
>>>>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>>>>   *			 function wakeup in bitmap format where bit position
>>>>   *			 represents interface_id.
>>>> + * @base_addr: The HW base address of DWC3 controller.
>>>
>>> You already have this pointer to the resource in dwc3 somewhere, so why
>>> are you storing this as a char string and not just always using the
>>> "real" resource instead?
>>>
>> No Greg, dwc3 struct doesn't have the resource pointer, but has res for
>> xhci.
> 
> That resource has to be somewhere in the dwc3 structure, otherwise how
> does the driver know how to talk to the device in the end?  Or is that
> just happening deep in the dwc3-platform-specific-code?  And if so,
> doesn't that imply that you can't just rely on a single resource for
> this "address" as you don't know what the platform really does to talk
> to the device?
> 
It does have the iomapped resource (stored in dwc3 struct), but doesn't
have the actual physical address.

> So this leads me back to the "just use the device name" argument.  Don't
> try to encode a platform-type-thing into the name for everyone to be
> using as that's just not going to work well.  But if you totally insist
> on it, please name this something else, as that's not what this really
> is (i.e. "base_addr" is not correct.)
> 
Sorry, I guess there's a confusion here.
We are trying to print the physical address thats coming from DT/ACPI
(reg property). We are not adding the iomem/virtual address here.
I'll rename/document it for better clarity.

Regards,
Prashanth K

