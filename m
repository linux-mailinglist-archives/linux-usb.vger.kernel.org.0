Return-Path: <linux-usb+bounces-31975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490CCFC245
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 07:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BA293046756
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 06:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DA823D7FF;
	Wed,  7 Jan 2026 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIdUlUpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0nsplc2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D020468E
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765798; cv=none; b=qhUAMgy7bghanhEfIitR97MhLmcGeQeVMLMqVR7NFflhAohG/ba5JDVP9hcWisbaHc/txXAKIu4z+3+MEQSXVBlr9vRKscrcB4aODzo8md3aX/2LYDScZi6RNTFcz984Ze20L3MGSBLJUAXRnRUbvl+dowFDK3LqxaRvWcOr1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765798; c=relaxed/simple;
	bh=Gfm54GMHTsoaMjmjTrphaXnoGzK3DtlV8+KEj1qyslM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jU1FXQpitW8aXhHKEaxxw6a0d0P/4O4luyUAE4yU371joBfQHyobMIrDVNxaMWgIP36HbWVWkVgZn1gkVmWTH3pyEs7tCYiGE2eOzECLHazJsuqOPxJZ2eCxftLYrOxusuXdpYpBnJXZmyVgr0jzSxvpleKr9jx+41C90CMrd1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIdUlUpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0nsplc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074gTx91462988
	for <linux-usb@vger.kernel.org>; Wed, 7 Jan 2026 06:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wiq3SXQ/7luWcry7LKvThb2qVI8evQKnxXTpWHbnKl0=; b=dIdUlUpg6svcqOuD
	N9aj7uZXxMKJ4VDvHobK2m3m8rek7zydCfybPk9yDhd2bpigoP71n59MCYPqJbZ1
	4ubP/bZyQfNpoIIPQhf3Qy7wDvs4tnRYbUb0h3WmGOCuNVaHzuRTdAbjJR1Eqral
	DNEeQLBq6cDnsOT4Re7G+8PdeckTI2VS6zACQooqVabnoNOEOIjtFwrafmvbdC5L
	3th9UJbHB+wgaXSgz7wqmJLweas6oOHmf0XMd9hTgqnNXSZInF9zonRVd0GxIrLN
	tZD+l1FQBjXzqvLSgHG20P2Ej1TUm+aovYZe26HBGrkaell1TVIjXI5+tkt4qs8/
	yZvtgg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm332x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 06:03:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso2728580a12.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 22:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767765795; x=1768370595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wiq3SXQ/7luWcry7LKvThb2qVI8evQKnxXTpWHbnKl0=;
        b=X0nsplc2gfYSuzfs+iK0cxidmH5VG0NLKaSGUFmUZ8c3ch8bsg6bEerUT+tKUEKTpz
         h3eUe2UvH0zNO6DZgHbkdmi/cJ8jK1fZACzaJiBRdLhps4g8mlpZM4xRNpFQLSC5xXQn
         bzWmrlcKi3IISDaI57OnC9nmCx89N4zK8b3WftEjPhazWN3WGub6lrskKMM6n4zK7+Db
         YQBnLPEYAf6NXxzsRKNBTG1R8fPV+kcp0OgnV8P1CFp5cTtMZuw4SIF5azys1ERhQ6Dl
         ewLyD5tZXK34yooHn0vT5max9bHcm5Zns1onJFRyqGsyE4VjtgMAMDjrMjZzA3M43mxq
         FcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765795; x=1768370595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wiq3SXQ/7luWcry7LKvThb2qVI8evQKnxXTpWHbnKl0=;
        b=KCfutH8ZQoF7vfWpYpOZRecsk4Q3uaQjIe9r83scw7D4IF10FQvmOdeFO3LcDDcNW6
         6MdjvgAxFNyiZW+u3+tfoZhUulFjYMv4clr3jYS7Z1AVifJ5mc/SE3z2nHL41tKs9sqo
         h5v8HM6J4JuXeaAKBJn7h9gDnrR7YrgzSEjAlY+3+Q/eD53Olx8V6NWrC9LKtJZdned3
         40ofPH5HFSLderivXUgeHUfPAf45LR7jXbPFY4l5qtZTCZhH0TPoIIHnN66mFJfwymAK
         XVzbWzbs38moMZpOWEJ3+8UIcGV+EU8Ymv1wBt0SSHOcXwdmbv2J2QZJs9cWcspKvPjU
         ATdg==
X-Forwarded-Encrypted: i=1; AJvYcCUF+ujXu4cAgeRCRlY0e8w02d2w/kGDqVCBV8LbSEamKOQArE2h9hlwg+zeTEMjavVkCmwwHGbou08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2BoWz2q4yEhmsF7l6dNhjmY5vYUhWHO96AeJFP/kvd2Ka5lcC
	e0rjdFcAAkDjVt5Q9sDKdXWjPk9145C241HfqDZQurf4nsQNwKlHqkEMWAK4MKQ0qatEiaaOAdm
	5659ygM5RUoqri2LJLtNzBPQYJso8g1JPgypqlWqa+XVWZ50yXXxMyAv3cEGi5Qg=
X-Gm-Gg: AY/fxX4Hg3zVoWCg6IKFvvyT2J2085Cfyz76OVBfu2DOMc+0sM1sMS3cOw+nqOiXRoz
	uufzIOvsfAtVjxcxekS7eGSmfKgPCzcHSgRUqJQDSjuLjchlEJLNMNQRVwQFrzLSddAuo8Natc2
	Tp82vtBVQVIBOl2jo9SfxYiY3HwiH0evz3QLdV2cr8pUDQBAxGzh6D7jCqvif4HTzB0Pps0otVV
	XbaSxl8YT+r5Tet+8AbKKrhXIkQbMW1ERTIwnXbBmLcadCnHTVWEI7YwHgAnjiXPUlooShYG/K2
	zkqova9OLd6NCEEkhX+bixHzUpHZuxX0YMwV23TJZXYLz0hHIbYuqoYCYg+tjJwLIZM+zX+mMQt
	teLxS03LfZtgNX7sBjJJMvrt800zadUWNsHsJjw==
X-Received: by 2002:a05:6a20:914b:b0:371:5a31:e487 with SMTP id adf61e73a8af0-3898f9e9596mr1188358637.70.1767765795153;
        Tue, 06 Jan 2026 22:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDzWTjFCaFLK1TKtTV5LvglGVmQbgnstbDthbJ6NCpTyOkmgQE0toj+Pm2pOyuoVr+U9rLbw==
X-Received: by 2002:a05:6a20:914b:b0:371:5a31:e487 with SMTP id adf61e73a8af0-3898f9e9596mr1188339637.70.1767765794675;
        Tue, 06 Jan 2026 22:03:14 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c4118sm3829389a91.7.2026.01.06.22.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 22:03:14 -0800 (PST)
Message-ID: <dec18683-5b43-464f-a735-4bf26644aa0a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:33:11 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2026010652-dissuade-reproduce-008d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695df723 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MQqcKvBo1mwqSKGJkacA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Ln3eVTHusjX8fqQUzE5l0OzM-_AVhvbI
X-Proofpoint-ORIG-GUID: Ln3eVTHusjX8fqQUzE5l0OzM-_AVhvbI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0NyBTYWx0ZWRfXztozFr+fPBhW
 ExDsBo0hcwZa/rPRP71MRcRRT1s1/K80ftxs/D+O2J7NeLqo0Wdgz70a9FQnpcnNwwPA6JSFHzN
 1bHpHjKUVJXO1xqu84qDRSDAtaADmmLEBw3iqQD7/BpcZATHqM6qR+9tMYLme2SV2bNQbRSN6Hk
 3xN+MmXazotXZAMsitpyQYoRKOgECyyAucB2ogl4rVbTmwm4aPvECF2ARxDTdpAchgUT/oQRJzQ
 P3yn1xBq3d0MNPAyTLQJZqZcra4ppzLzSZoSkTEz4ivQXo81q/GY216LmjUMUKGfQ8ljBGqpboo
 uPiBNtMX9vQI5CyXhiWudYVNgsSYWEMmjoO4UuP3iSaYAONl8KXrK7hVeBsSIWXJasfgwrK7cJa
 X/Xj/JLl+xMYgLpToavN6Tix7dV2ZuPPv0EU7e8EOG0u8yywUF07np4d3yKMBf/l3dDfHwXe+F9
 JsXHPrwNp8sUuC2EfuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070047



On 1/6/2026 3:28 PM, Greg Kroah-Hartman wrote:
> On Mon, Jan 05, 2026 at 05:23:25PM +0530, Prashanth K wrote:
>> When multiple DWC3 controllers are being used, trace events from
>> different instances get mixed up making debugging difficult as
>> there's no way to distinguish which instance generated the trace.
>>
>> Append the base address of dwc3 controller to trace events, so that
>> the source instance is clearly identifiable.
>>
>> Example trace output,
>> before ->  dwc3_event: event (00000101): Reset [U0]
>> after  ->  dwc3_event: 0a600000: event (00000101): Reset [U0]
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/dwc3/core.c   |  6 ++-
>>  drivers/usb/dwc3/core.h   |  2 +
>>  drivers/usb/dwc3/ep0.c    |  2 +-
>>  drivers/usb/dwc3/gadget.c |  2 +-
>>  drivers/usb/dwc3/io.h     |  4 +-
>>  drivers/usb/dwc3/trace.h  | 88 ++++++++++++++++++++++++---------------
>>  6 files changed, 66 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 670a9d4bfff2..3aa85f5f1c47 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -158,7 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>  	dwc3_writel(dwc, DWC3_GCTL, reg);
>>  
>>  	dwc->current_dr_role = mode;
>> -	trace_dwc3_set_prtcap(mode);
>> +	trace_dwc3_set_prtcap(dwc, mode);
>>  }
>>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>  
>> @@ -2193,6 +2193,10 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  	dwc_res = *res;
>>  	dwc_res.start += DWC3_GLOBALS_REGS_START;
>>  
>> +	/* Store the physical base address for logging in trace */
>> +	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
>> +		 (unsigned long long)res->start);
> 
> I think start is defined as resource_size_t, which is really
> phys_addr_t, which is then either a u64 or u32, so why not just use u64
> here?
> 
Yes, we can substitute u64 instead of `unsigned long long`

+	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
+		 (u64)res->start);

> And are you _sure_ it is ok to expose that to userspace?
> 
yes, because it's already part of devname in most cases.
> 
>> +
>>  	if (dev->of_node) {
>>  		struct device_node *parent = of_get_parent(dev->of_node);
>>  
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 23188b910528..c16e47273ea0 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1178,6 +1178,7 @@ struct dwc3_glue_ops {
>>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>>   *			 function wakeup in bitmap format where bit position
>>   *			 represents interface_id.
>> + * @base_addr: The HW base address of DWC3 controller.
> 
> You already have this pointer to the resource in dwc3 somewhere, so why
> are you storing this as a char string and not just always using the
> "real" resource instead?
> 
No Greg, dwc3 struct doesn't have the resource pointer, but has res for
xhci.

> And also, document this as ONLY needed for debugging things, that's not
> obvious here at all.
> 
Sure

Regards,
Prashanth K


