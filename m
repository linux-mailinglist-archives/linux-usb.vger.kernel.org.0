Return-Path: <linux-usb+bounces-25106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D99AE8869
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 17:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C35E3A6B0E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 15:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14DA2877F5;
	Wed, 25 Jun 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7kjGolx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A02877DC
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866087; cv=none; b=F/X7D5SU7U/UlIQUuQri72MBU12DQHUnG3dHU1fjynU0RCD4F+I4wxFVpN7GZBUZTAQm3SIK00OSjUPwsUtRtk9QdMoS7jcq3VHYPfhBXIWZBUKZWVFWl1/jjo8qQlc/AGrPQkFkagLTKrqrsknIvaBic3CTN+moqSiePSkVmbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866087; c=relaxed/simple;
	bh=6McqjBxGI04s6MAVtEJ0z4GFsv1LxIRPtK/v9BEjGvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnOewgA38jOBBTj9Okbi5HG4+FRUWjpRZb/WG4I/mZzeVCqXTcFEidf3GAfF6janvhtHrZgCUiz7fB02iTfqM/5WZAEy3GoXIQxfbVqKpMEZLMfegvaET7bl2QmGPXiNMPFXi3YZkcWT2hH98ET5h05bAfRZCYjTHCX0sZuSnQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7kjGolx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAfCMp001125
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 15:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1m7rJB50SZfSiBdwdM6cOmKzQ8rEb7FS+FQ3vsiuRg=; b=a7kjGolxeqY2aQcz
	8RMA49SUGRDB/FpbWKF+e76g09ImeRB4XHj95R+xrs9V25tSQV0gBcGahzTCjtI0
	Rm6T7If27oEr+O/IM6KYBWPIi1dinbUUQnE1gEYjK9o3xH0mFnsjlgc8mlsLnvp0
	lXDffmHGMG6jhkCF6oThaBxyOEEjht/KnXXazOF8Z6w1fY5ChbyVEe/35pI7kwRr
	EXtOUxPLrUg5h37jfqM0Xo9erKiYsVbD51hx7HaFYOC1KANYI1rmvu+PiP4MoE+1
	KVaSvK+/Iqkeh5Obl/YQ2RPU0Dvt8V0PU2S1QDaXNEKxRAdVg9kCdhSUuXFjNOkQ
	iDUeEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tda9ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 15:41:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5ae436badso81631cf.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 08:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866082; x=1751470882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1m7rJB50SZfSiBdwdM6cOmKzQ8rEb7FS+FQ3vsiuRg=;
        b=jcXZZ0TWStKTMJxB3N/NrvY+0lskyXmbpjl2IjlxI0vr0WwWh9dOs/hyAjVJDz496G
         8+Jv/Moq/qhLwXMU0nlNNoJvtAXkGJFsQPFItOg8LCJlzCyf2bBTqvl3mlAtwgds8nkQ
         xsrtHpPFExWZY3Y6bH9s/sJkS2MEXQgq/qOS3MWb18ndgqvFhRjHJXpn9cQ7UbvpW6qc
         Kkp2nJPwH4Q8yTnMoJXJIuLN7bgUATc7pEL6b5A1Cvx6H1NbTSs+AJdn+pxTM2PLRGQB
         AmCPH/nWk7amT+mrzgJD+/MwMOPvrdmVBNLDmFqSTNTBNcQ2EzSDxmOTVWLCAK3zY3Ms
         iwlA==
X-Gm-Message-State: AOJu0YwAHGLPp+RDLy3E4wSOjIWuaFzpAJzO2CpWYA4VT+QTJp1arXDY
	/Dsdh2hjujJ63HXcN+WSG1eOOnQwR8UTVw92nK4UQaxY1EhPLBys2X1iJqMFAfXAdtvNnHsSvJd
	lNDPT5B9lh5dq0scWyOzBQcM6dkHjkZvnnVCZaRpEkUraBpQURPJ84vXmrsQjyow=
X-Gm-Gg: ASbGncsZg9PMh4Cl0ftoJye0pl353tYAbHz+RWBwEMZt9Yd/80o9oDZjl22ZE8VOWaw
	+5Tg6nxp44multB3JpubxSzTx6WtZhZgms4/3pl/hS9BXh73caVl5qZhIwBnZdet3i7DSJhFGRP
	AD1vfnxuvcS4CTBi/5Ij2/Au9VJJo6r0QLcSSjTt8DxrmaS+fmUCQoc9krb12/zhRd1IVZ/83yW
	9GMREEg8dc9qJ3+py7rdgBIrsR261jWvgJk7cyN+oMQTmsUByV2gmutydT0oiZM5p8hV13s8gUb
	XxBSf6ePdmtyFPHVoNgJRFNzV+XEn24i9ypLqKvamBteCAYW361yZ0EBPiGu9DrJfD8C74vXGCM
	eu4A=
X-Received: by 2002:a05:620a:2787:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d42975039cmr135894785a.11.1750866082239;
        Wed, 25 Jun 2025 08:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCnP8SQUzlqdNjYZ4QmBSaiPoq0qSztYeP4vFnZ1xsmOZrCI9JTcS/JWKsTew9AG3lg8/LQ==
X-Received: by 2002:a05:620a:2787:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d42975039cmr135893385a.11.1750866081807;
        Wed, 25 Jun 2025 08:41:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0f5sm1076549166b.59.2025.06.25.08.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:41:20 -0700 (PDT)
Message-ID: <842ed535-ed0f-43d6-9b69-b5f9aeb853d2@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 17:41:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: hub: fix detection of high tier USB3 devices
 behind suspended hubs
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
        stable@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250611112441.2267883-1-mathias.nyman@linux.intel.com>
 <acaaa928-832c-48ca-b0ea-d202d5cd3d6c@oss.qualcomm.com>
 <c8ea2d32-4e8e-49da-9d75-000d34f8e819@linux.intel.com>
 <67d4d34a-a15f-47b1-9238-d4d6792b89e5@oss.qualcomm.com>
 <c9584bc8-bb9f-41f9-af3c-b606b4e4ee06@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c9584bc8-bb9f-41f9-af3c-b606b4e4ee06@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c18a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=eEY_hVyVELhf5x2GTEsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExNiBTYWx0ZWRfXx1nbOGhMwgdF
 9cRXL5cnONGHS2M+wLZARIenl2uYto2ek0rVqnZic+gFljiNrQxUfyDJF4eD+QCTx/s5OCJ9h6K
 BsWbpIFS0+r+Yk0sthGemKa+1ib52HANgj6oPvlvtM8fY7kDLhoagFvzLxK5u4qkVcnybUnuMyb
 UXzolwARe9JeeL7Mjq5NKaahKQ9ulgffwZxqlOui7awO67w9DkCm4mXF6dvAlXfd3ipuR3L1IQY
 6hXqsccrUSgYUnLRYvGIICqxZLD8auXMqL2m2Zzx5cfQN4RPgZpKoxSddnWoP1A0J7mDT5c32c0
 qMVrBfbNtrCZeIld4awMIpso0eaMgmTt5yihiGQdcMywYjghAPNrpG8i9JHr1jXLn15QKa/Kkkp
 /mywDFiVV2K9GBGh2Olhc+qNIcAS+MZKD4AfaDl2VRWDCIRAQkf1E/LKNNG4z+TLRYGaKzPQ
X-Proofpoint-GUID: e0Q7mWHjaoHwxFRO9H73q3VtOXxnEivL
X-Proofpoint-ORIG-GUID: e0Q7mWHjaoHwxFRO9H73q3VtOXxnEivL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=979 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250116

On 6/25/25 5:11 PM, Mathias Nyman wrote:
> On 24.6.2025 19.40, Konrad Dybcio wrote:
>> On 6/24/25 11:47 AM, Mathias Nyman wrote:
>>> On 23.6.2025 23.31, Konrad Dybcio wrote:
>>>> On 6/11/25 1:24 PM, Mathias Nyman wrote:

[...]

> I added some memory debugging but wasn't able to trigger this.
> 
> Does this oneliner help? It's a shot in the dark.
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index d41a6c239953..1cc853c428fc 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1418,6 +1418,7 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
>  
>     /* Stop hub_wq and related activity */
>     timer_delete_sync(&hub->irq_urb_retry);
> +    flush_delayed_work(&hub->init_work);
>     usb_kill_urb(hub->urb);
>     if (hub->has_indicators)
>         cancel_delayed_work_sync(&hub->leds);

I can't seem to trigger the bug anymore with this (and Alan's change)!

> If not, then could you add 'initcall_debug' to kernel cmd line, and usb core
> dynamic debug before suspend test
> 
> mount -t debugfs none /sys/kernel/debug
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> 
> Also curious about lsusb -t output

Just hubs:

[root@sc8280xp-crd ~]# lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 10000M
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 10000M

Konrad

