Return-Path: <linux-usb+bounces-23551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D0AA0DE2
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 15:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9D057A7535
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 13:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F072D190C;
	Tue, 29 Apr 2025 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUitJmAP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC02C2AB2
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934627; cv=none; b=Z7Wf0U4zflLe1MGX8LDuf4loVbnjk1YQNIcAnDkBftVSEKcJVqWeKUqLQzFw3YXugyK0VHHDMyfq6Mb/GNqGeHXJXAUf84G3i2a0WI907LAW3iFXcdgKIKb838md6s9QlUmiE3hH+fuNgMEbzqrTj4Y/hM4GYyPtCfb73mOLw6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934627; c=relaxed/simple;
	bh=pNVA3yUdtuzFRIJCTZxPJgmMwtsW1RNQDJVbVdA+ihU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhoObexIfr0ldnwPnkJicqVyMkv0jtTlSpY4P9LKWwhLP0thEIvN/K2fAzLUXqa7tOhPmaFRJzdXYdMJTX4aYm8h/jQYKKCI1ly9A+KzqV7V2qExD983PhlhYTjWGHFqvpio5hiHcCHHqSJbn9Oyf3bq30k9h28sBa2uJa6KF0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUitJmAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9ahlk025060
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 13:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNp59J5iomOJH7AwesSP8ImSI53CstzMhFLTRQKtPBM=; b=IUitJmAPhXVFeZ2Z
	gfJqhjUV++I+juysfy4aPZxdBAwta+pf8w+km8xki1OK/FV/UxC18UJlnvFgPDkT
	iUZplEWkFdF5hKq24EcVKmZIsiPsDspmLXT9+8Bcm2SHphhUHKSA/5cBLVdQ5A6a
	VmLGA4UoyaDqe5NnLC/3ul1RJZ6VMpx5Ec4YbCtuIrXh1AdFCLy13JHAuotKITYg
	rAlYTVEC05t35DtH5ZpsMsV5BF2J+UByz2m2PMUkGy50mGe5RiLUZQjESeyTedHu
	GpQDIqtfnmHn+jiatiXc6Mpkq06bjEEnudDMbvbcw6JScsBbaov/hSFaINdBzcsQ
	yLRR8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmxhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 13:50:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1415cba951so3599366a12.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 06:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934623; x=1746539423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNp59J5iomOJH7AwesSP8ImSI53CstzMhFLTRQKtPBM=;
        b=OAtUnHU9/gzbxEZeLDNOP2t73VZ6YPNEZql6+8BPK+aRQZGaqnqfZeuvoddd2cjZs5
         UG8FwIz32McabEIPBqMQV07AjPuAClTrI8YskgxPcK7L/2Jz553CebJRVazo7pDmI4mz
         4EOydkxkzXKo+erf/IhGqCyiu7ILKL+pDWuhZ4YSHTDuHn9qxvL4zeBduSsypWbzAhib
         O8Wrik83wRFSNMi327I3wdDR1bR7i1n4SBSd/2R1KBtYKAAOAS5FAi/DVUurL7Qkcjcv
         p+2oxbcSIaCQNReGOGnQsbmM1NMlMhD2BB6h+CNr3QF08ouvANCMFBoGGatES5VqrfqQ
         Oj4A==
X-Forwarded-Encrypted: i=1; AJvYcCXLb5j5tyKen3CPm2cG4hoJ3DSgzlAXVONhY/SZiBpphiHJ76Jc9D8aHi18/ivqRoBjIRHhMxFiNHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYH8CaSaYs/cDcsLn4eAUFpSg+SF9igbfwwQjN4k8sl5UmgdCG
	Eb+bPIQLFJo+h0Rmo26EetYyhRhIMoxTf15Veq13T43qOYW+F+vkdj1AwYEMvpOVrECzRs162pM
	1Mgkj6NBdVenvSf5XoiuoqaFUcFpJXI806HCT72O3JM+4Iuo43Z5/IvFWaAiYhNiaBmU=
X-Gm-Gg: ASbGncsKs1r8BCIBXPGJ2f4QyelXkZvN6N7h/VeazKKPqH6fXyCz8JXVrOrE90aeSxI
	1Q/rSx94p98pVj8gleJAYEHPP5OlRJvOfblA/bgO6FXB7ws3PYWdEE+UR1VWQ0yGXKAJbIZIDh7
	xug+a+hunqqn3CV7OT27/PHpXT4YtM+OrIVKloBxyjTiextRbzcHgGzSA6QGfDuaVvylLiSTT2T
	i18kR8I5Td97NO+RmaoS21nOOCbcXLj6wxdq1nZ8FX4vP+Fk2BFH6qDuSxQXTLkJmzuZbRf11Uh
	vVWr41Wosbwh7mbzhxwmPGTSJtm1yr3c3b0IdNL0jw==
X-Received: by 2002:a05:6a20:9f8d:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-2095cec6f1fmr5013769637.34.1745934622852;
        Tue, 29 Apr 2025 06:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ1Hs07nM8pbCvHdyOw4NpYaP5IscOjEH/QHj+OMrXO5dOXE74CPSPs6RZSKwmRc/MVhNwhw==
X-Received: by 2002:a05:6a20:9f8d:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-2095cec6f1fmr5013719637.34.1745934622482;
        Tue, 29 Apr 2025 06:50:22 -0700 (PDT)
Received: from [192.168.1.5] ([122.181.59.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1d59d45835sm2960800a12.67.2025.04.29.06.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:50:22 -0700 (PDT)
Message-ID: <af771944-8236-462f-9097-2bf2336b361c@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 19:20:18 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: hid: allow dynamic interval configuration
 via configfs
To: hoff.benjamin.k@gmail.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwMyBTYWx0ZWRfX6r1iR+jeiVVO jG8cy9z7I7vx64Rlm3kcx6Q7g9T8fNK8lpIddNAlSMnKeAYWXa73UL5Um+O+tR6Fg07R3RpRw5I Ye9VJa24XJhSQkjG1MEb+39eN2BO+76LWCQpqTpBLI9ZcOZWsUVfQxyCMQD2ofGDBk4If/wNG5J
 7xPblwL2SD7DHUwjKgbq08NeUsqSSVDm1gCvlHy10hNeeR0GVgLL7u6+EsAyJz8HndoxJ4SwXc8 5BfUodQtpjngLTYjmPAiD7HFmNrbepw1XwbTjjtEj4O4QkXUF7YaOoxw+pI5KfZoADwJRs2D4tK DAX4IMI0yvlbCJKm0C9txyFU9oUfYUyf/UXzT2Pbrl8TO+PczJz2RWIKJ6uHGEXeUXAbOcE4YiE
 UZgJ8yu6IXvQn3FXpNGgvhfmUg/rPLY2MBTFHFMHMb5e2R52yUJjua9/ZT8tKn6jish1jaE8
X-Proofpoint-GUID: w67Yexg1JIPZIZBwgKlnw6ow1cxTbWod
X-Proofpoint-ORIG-GUID: w67Yexg1JIPZIZBwgKlnw6ow1cxTbWod
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810d920 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=AUjW7Mkc7c/oSMVHW5GiBQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=kMQm_GXyaO1MJtTyCWUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=759
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290103



On 4/29/2025 7:03 PM, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> This patch adds support for dynamically configuring the polling interval
> (bInterval) for HID function drivers using configfs. This enables
> custom HID gadgets with user-specified poll rates without recompilation.
> 
> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>   drivers/usb/gadget/function/f_hid.c | 54 ++++++++++++++---------------
>   drivers/usb/gadget/function/u_hid.h |  1 +
>   2 files changed, 27 insertions(+), 28 deletions(-)
> 

[...]

> @@ -1468,6 +1462,9 @@ static struct usb_function_instance *hidg_alloc_inst(void)
>   	if (!opts)
>   		return ERR_PTR(-ENOMEM);
>   	mutex_init(&opts->lock);
> +
> +	opts->interval = 10;
> +

The default value was 10 only for hidg_hs_descriptors_intout.
Aren't we now making it 10 for all other ep descriptors as well ?

Regards,
Krishna,

>   	opts->func_inst.free_func_inst = hidg_free_inst;
>   	ret = &opts->func_inst;
>   
> @@ -1546,6 +1543,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
>   	hidg->bInterfaceProtocol = opts->protocol;
>   	hidg->report_length = opts->report_length;
>   	hidg->report_desc_length = opts->report_desc_length;
> +	hidg->interval = opts->interval;
>   	if (opts->report_desc) {
>   		hidg->report_desc = kmemdup(opts->report_desc,
>   					    opts->report_desc_length,
> diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
> index 84bb70292855..a29dcb14f738 100644
> --- a/drivers/usb/gadget/function/u_hid.h
> +++ b/drivers/usb/gadget/function/u_hid.h
> @@ -25,6 +25,7 @@ struct f_hid_opts {
>   	unsigned short			report_desc_length;
>   	unsigned char			*report_desc;
>   	bool				report_desc_alloc;
> +	unsigned char			interval;
>   
>   	/*
>   	 * Protect the data form concurrent access by read/write

