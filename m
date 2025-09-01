Return-Path: <linux-usb+bounces-27416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F3B3DF25
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 11:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118DB17D53B
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF3830DEBB;
	Mon,  1 Sep 2025 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anxy8gHZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51130DD1B
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720631; cv=none; b=ZyCWQiW+dUwkkqB/fM3xnfGMUIsBX3tpTVcdi2EZO8PE75AQ3InWumUOdR7bH6ZfpBUfdK64fpNBf8pA2bWxiyhsIDdL9aj6TN2Lw0MulLKwLfrSeAhYvQWeKXPzPvO0B/ZA4SAU7SPdJu7BdJicW7RqCenF48vjMoIY6/35IKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720631; c=relaxed/simple;
	bh=/u0ryJ6xCLlLqWA6VM5G5IQQ2G5Q5uH4siSOeD6tJzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onNfP6QmyhwWCQw3OxghOIMPVTWzUTk22YyJ+cHHRDSpgoL6iFqrZJbbzOzHoDWRcnmzzXUQhgOE9xTYDetzxLi6sBwKsZ2nESfqJl1y1CH41hLfXsgQsOS10QFWaCWQkt4EoqlHgRIXEKho+Vh6LlZiCaxSspGl17niDMv/Zpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anxy8gHZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819ePTL005048
	for <linux-usb@vger.kernel.org>; Mon, 1 Sep 2025 09:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00dLSbYm0RAfMXQaim1Wtp3zXWPbxfLKsoiLkamHIiw=; b=anxy8gHZliLYaPA6
	r7OIpwyVVv5bNxCAWPc23TQk4WyIvFFvDenRkBuNrqMljYrnJijGQ7ICM8U0pkkY
	pjqVUC4aB/tF0l/7BrhCHB6BMPKsLKjUznAzGBGPwnSTHF1RWt/jbQ76MkGKVMMP
	EA38f4jHgtjurdV/MjoEiUsBOY7bMFmOsKXfGNGFVR1gR8nGmJYHlKJvTDhtn5mf
	K9J5b8VsVOjKCvOasdY2xIJvDL+xHxKo4f/QQTzISeDCpPk9PNrXvFcZue8WnW9A
	IOpnlNJJ59ix+jEwhUHFWFwKKPWAreAthgMP/CUmp8bhnlhU+xy3i335tEylhwKn
	LQPWFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ecg00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 01 Sep 2025 09:57:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32769224506so4217555a91.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Sep 2025 02:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720628; x=1757325428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00dLSbYm0RAfMXQaim1Wtp3zXWPbxfLKsoiLkamHIiw=;
        b=gu9f4FKmzIwjB8cuxU9TsOLDmErWxsLzMAyYMgICgM4hAjRIAg1RXp+0wnK10YSSWp
         HmrrE6/MU8W8e3nbEQve3jfpl9vlmrIxKwcMI+N8tbP338VlAWhyPLgnqRM340IevxE6
         UJSTMZWGPULBS4AWCAe+YFviKWglPkxg3BvT/nuS7Tdjq04y8prt9atU5dbGtmc8zkW2
         g71tkEdSHY3BWGPcWbhXN4uPU5+qc1UhybiHsrhn9dyipwaCNphMlYI5Kp0hRjIjQ9yQ
         qszgXV5n0yb3uGkDyMldObC22KwNX0yw8j4ZWDhZiptDZJD+5Xy6qseWWy2tvLqi+vl+
         fUVw==
X-Forwarded-Encrypted: i=1; AJvYcCUVChSRXABDSfneHCFZY4UeTyw5xuvcUrPsSHEKuGqWcUFTIjrOL38rAfkalB2eNnXHfBf7DwPLnk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnP9nw/aNBTdwplBNeI1EJIsndrKK5nnf5TGo8n5V2xMkkYgDh
	1E2ary7xbcFc77YotPkRLaNBNPSgVkIyME0BhuTmOFu+64STYk9cA4svdP5qRIv3ATKIlKEkTn+
	LBQt6LlqHIkZ75sBnRynDW+GotrfBM2x03QzVUs+BGG2/rrOWc/SL5CID3iGC+gk=
X-Gm-Gg: ASbGncsGQRvTru9n9MMTNUZX8loJti7mwulyynxpkroAS2QXVEIvJu9JKP/jlSfvds+
	1JccZToDerjJK4/T4FJFQDNYWzaem9BD23v4zyY1Ow64obg3FitOUmIcQs/CwVC+ab9sXvLcSby
	Ki3i0KmQU8AoOHtJfmX5Ghz/XOP09w8pT8hwNfrcg6NRabIjLH86DwGdHKP1rXtAQqCbjoy50vg
	As7MqUvf6D+9qnwfkT2PN1RsMfYtIGfY9rQvVpIsxncTOlDoB15yrRcLnADE+yN7MhsIjkzfewr
	8L74okn9DTWYd+wUsgz1SKDDKJW1/XKpPf9PAI2KkgGdgbM8H9S5iGeQqcm3pDXlG0tm
X-Received: by 2002:a17:90b:5205:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-329cb761185mr162193a91.3.1756720628149;
        Mon, 01 Sep 2025 02:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo2XIc0MdwcHVOgcMpSGI5G399DdswL5C9qGONnIa5/Q8lIDtvNeTe9LQtas7uLSamRYS2kA==
X-Received: by 2002:a17:90b:5205:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-329cb761185mr162169a91.3.1756720627597;
        Mon, 01 Sep 2025 02:57:07 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ed87sm10763105a91.23.2025.09.01.02.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:57:07 -0700 (PDT)
Message-ID: <5b30f63a-5999-48f1-972f-93f02fcc0ec2@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 15:26:58 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250828224852.ukelgargocektp3z@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vrXLJiV-g4xd8AymYYvtPDFMYFHxJSOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX0d6mQNH76ruI
 Ru/hENXi9oI6c+J0hqMQHI212Mm43kp9l+H4tWPknMCiZgroOCgSs3ik5PrsYorKkr0lQq99hIJ
 +Liy1yPx7eXWZ9RvkFuUj3F2WMtzrF+oI1gN2DuEMcqfLgRBafEqk0T9Ovg3IejxNsrquqBNbei
 ixZpJdVornDd7KhPkz0oIzj4ndnucGGh1bGZ69X7sQSANq8NCY6ntanSIDIjOvRZ4l2PJlHYRBD
 q1MG6guG1PveldqdnrVFJ1DOXoVMR5aE50g963UXFBjpUwg9ey+JAE4zR7qHtWpE2RFfVFOYJw/
 DaMCjEKhLzkQb11TcMxKNaraF+HvOiHmqLub2rgoa6xY5hIC5yd4V3ndJG1UVBLfPuzLzNZur+d
 LuVvZL/v
X-Proofpoint-ORIG-GUID: vrXLJiV-g4xd8AymYYvtPDFMYFHxJSOQ
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b56df5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tjQcG7l_prDQjLVM-sEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004



On 8/29/2025 4:18 AM, Thinh Nguyen wrote:
> Hi,
> 
> On Mon, Aug 25, 2025, Prashanth K wrote:
>> When multiple DWC3 controllers are being used, trace events from
>> different instances get mixed up making debugging difficult as
>> there's no way to distinguish which instance generated the trace.
>>
>> Append the device name to trace events to clearly identify the
>> source instance.
> 
> Can we print the base address instead of the device name? This will be
> consistent across different device names, and it will be easier to
> create filter.
> 
Did you mean to print the iomem (base address) directly?
I think using device name is more readable, in most cases device name
would contain the base address also. Let me know if you are pointing to
something else.>>
>> Example trace output,
>> before ->  dwc3_event: event (00000101): Reset [U0]
>> after  ->  dwc3_event: a600000.usb: event (00000101): Reset [U0]
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/ep0.c    |  2 +-
>>  drivers/usb/dwc3/gadget.c |  2 +-
>>  drivers/usb/dwc3/gadget.h |  1 +
>>  drivers/usb/dwc3/io.h     | 12 ++++---
>>  drivers/usb/dwc3/trace.h  | 76 ++++++++++++++++++++++++---------------
>>  5 files changed, 59 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 666ac432f52d..b814bbba18ac 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -830,7 +830,7 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
>>  	if (!dwc->gadget_driver || !dwc->softconnect || !dwc->connected)
>>  		goto out;
>>  
>> -	trace_dwc3_ctrl_req(ctrl);
>> +	trace_dwc3_ctrl_req(dwc, ctrl);
>>  
>>  	len = le16_to_cpu(ctrl->wLength);
>>  	if (!len) {
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 25db36c63951..e3621cc318ea 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -271,7 +271,7 @@ int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>  		status = -ETIMEDOUT;
>>  	}
>>  
>> -	trace_dwc3_gadget_generic_cmd(cmd, param, status);
>> +	trace_dwc3_gadget_generic_cmd(dwc, cmd, param, status);
>>  
>>  	return ret;
>>  }
>> diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
>> index d73e735e4081..dc9985523ed8 100644
>> --- a/drivers/usb/dwc3/gadget.h
>> +++ b/drivers/usb/dwc3/gadget.h
>> @@ -131,6 +131,7 @@ int dwc3_gadget_start_config(struct dwc3 *dwc, unsigned int resource_index);
>>  static inline void dwc3_gadget_ep_get_transfer_index(struct dwc3_ep *dep)
>>  {
>>  	u32			res_id;
>> +	struct dwc3		*dwc = dep->dwc;
> 
> This looks unused when it's not.
> 
>>  
>>  	res_id = dwc3_readl(dep->regs, DWC3_DEPCMD);
>>  	dep->resource_index = DWC3_DEPCMD_GET_RSC_IDX(res_id);
>> diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
>> index 1e96ea339d48..8e8eb3265676 100644
>> --- a/drivers/usb/dwc3/io.h
>> +++ b/drivers/usb/dwc3/io.h
>> @@ -16,7 +16,11 @@
>>  #include "debug.h"
>>  #include "core.h"
>>  
>> -static inline u32 dwc3_readl(void __iomem *base, u32 offset)
>> +/* Note: Caller must have a reference to dwc3 structure */
>> +#define dwc3_readl(b, o) __dwc3_readl(dwc, b, o)
>> +#define dwc3_writel(b, o, v) __dwc3_writel(dwc, b, o, v)
> 
> Can we not do this. This will be hard to read. If we just print the base
> address, this will be simpler.
> 
> Thanks,
> Thinh
> 

This is just a wrapper macro for readl/writel APIs. I tried using
container_of in dwc3_readl/writel() to get the dwc pointer,
container_of(base, struct dwc3, regs))
but this causes trouble since we use dep->regs in some cases,
thats why i used a wrapper macro instead.

Regards,
Prashanth K

