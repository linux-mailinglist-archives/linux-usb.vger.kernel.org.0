Return-Path: <linux-usb+bounces-19943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19DA24B4D
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 18:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4EF165798
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 17:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF03A1CAA86;
	Sat,  1 Feb 2025 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6SWZrMa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E6C1C5D6D
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738432143; cv=none; b=k1Njw6IiGfPiNybm9xZxAAwNb4psu9zdNCBPveeG1AMSyeJcUF2Eot/THyzWyZwe4DECFCNc2DHPSh8b9d2uWIDNPEj0lMewWZj2Lg0bmloTE6hMyuNYdIdzP17PoHd6owg8za2nYfAC8cj6TtAH+Nw5dVR7jG9El6D43kwJJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738432143; c=relaxed/simple;
	bh=AnfgOYWqbKp63gCaue5Gb7+HGJUid28TdyQ6mYs78m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYulJMJReEMbAiOel8+YpezjxvB3lvjBcHxwoCI9IivpGvY/Z8t5uayn2cq1XANvCjnU5+bXpQH/2GnoCV2ZQEskLDYhXz6fusPteo1nIZuV0TNVCajUTbKTkpwyEVLMbAw0wjJwIJ8mOZCenPTUYJpJX3ghzsqynioHBc/tN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6SWZrMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115CZ70003351
	for <linux-usb@vger.kernel.org>; Sat, 1 Feb 2025 17:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12MPIT4qFHhrchO/4zoFZ4HKBtiTiDeAxC8ksOC99EM=; b=T6SWZrMaTC758GY4
	q0c+CfP7iG1wUIm0tn52UTUZGAfsh8HHruXjX6un/29/wLWnctxz8gnba/L1SlSx
	OiXGPDmxjq3On6GjBMU2WXyklv3xm8rIEoJMZuIJyHwuoKe6WhEM6xo6GYpf6L5Y
	3BZa067TXvu23kvx4yNIFq73/Cm+2ugZ5pXtc/aQ/YtWLbDdBuIRHUny/WVcKT0P
	Gj8RiI0wWWOIBajfEz62JTrBjIT6qd6oZ4DLkYa+PO00zuOqCBhianNXTCI6vGCg
	9MCxIIWNOA/fE7PjlDZJmIpM/Lvz6AbNk45BeS9rtD//Hl8iyuhBCgHqPRrED8ko
	S3nOxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8r98eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2025 17:49:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so5902437a91.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2025 09:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738432140; x=1739036940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12MPIT4qFHhrchO/4zoFZ4HKBtiTiDeAxC8ksOC99EM=;
        b=S3OwgrV8IvcHbKEufxpxrn/omr47ok5wF+XFVUZVlSog5Utmy275dFvw+nimReCUUx
         9br5fxfCgDdYElTjX8Bqo1/nVJpYDUP+uKp1hkwVXLhFniZcunCT+dhRHBIAfrQHiT/W
         PjqRoimLp3DdnNR/nBEHQyw3buaoaikLXQ0l/kgmyQrY6ejxP6SLxdV1i8ahQeYQkkj0
         6vXex8VImr9aWLvVGhpSbA53QYaFWnDbDyAji4JXhVlFn9IG8RtvZVMglJPN928gRB2y
         6PLceJNvdJoJ9aJpYTFV5haIMxpOpmeeRaJ0G37maz8gcivbvBYT7u78kceNPN7wvuKa
         xQMA==
X-Forwarded-Encrypted: i=1; AJvYcCXW0yw2zitgTWkHQ7fpCcoBklu73itg++wX4149Q4AsBlqVUJlLMJSBRRPEYHOkVV9wz2Z15Ke+HzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygQWjdnPaV6C9AREMEg2+Chkq8EotSuRpAgnBoknGBKvynL/hs
	nd+GZIXDdv+qzgD9Nn5gOk3cTAL9OU/zfjAb1vC7sLm9xGndOhNONQyp1+ua7t72gzZuwjilrlq
	wraGRqzwfV/LShW/nxeFmD4FK8Ys04N/m5CgWjjWxvGzKsQ9v6BrvNUJPatE=
X-Gm-Gg: ASbGnct+FIEwTB4tjY/CoB5MGlApY6uBchFyFnuu9Zhid2M+jB8LrVcR6A9ExEEBLxk
	ly4PlyrKMTkmckmonarXRD6Rpez5KH9xJ2EutA83sJj7N4MSgAMRocLdXwUhwHTzjKpDwzHUIpP
	PtpXQcJ3nW+/xiOocc4qCXcisy93XRsSADiu6hi9e6nNCzMcUWh8lMjjdeZSqhzW02eHADZ5D3g
	tWcbgV69VtG9sZD0ajfH4D8eO3Tz5QL9W1eDH5OpJe97N+1AXM8ZtTrmI/rzrYWJYvEapZOmMMZ
	dzXzzEORgwI/Fo2jRpc9yEFH5jAUFxDjXfEf
X-Received: by 2002:a05:6a00:a01:b0:725:b201:2353 with SMTP id d2e1a72fcca58-72fd0bffc63mr22581509b3a.13.1738432139723;
        Sat, 01 Feb 2025 09:48:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6mOcQwyHZwztbQjbRSIJh2uqt55INfpn47cvWz3s/xhtpfHXX1EFbzoAQJjbv5vxPaB5YBg==
X-Received: by 2002:a05:6a00:a01:b0:725:b201:2353 with SMTP id d2e1a72fcca58-72fd0bffc63mr22581474b3a.13.1738432139118;
        Sat, 01 Feb 2025 09:48:59 -0800 (PST)
Received: from [10.92.182.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe653a9basm5276563b3a.78.2025.02.01.09.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 09:48:58 -0800 (PST)
Message-ID: <1ef209d9-816f-4446-b658-846825e8cfe7@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 23:18:52 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Fix timeout issue during controller enter/exit
 from halt state
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@ti.com" <balbi@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
        "dh10.jung@samsung.com" <dh10.jung@samsung.com>,
        "naushad@samsung.com" <naushad@samsung.com>,
        "akash.m5@samsung.com" <akash.m5@samsung.com>,
        "h10.kim@samsung.com" <h10.kim@samsung.com>,
        "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "thiagu.r@samsung.com" <thiagu.r@samsung.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <CGME20250131110910epcas5p25ee5f0ab53949ad3759c0825d11170b3@epcas5p2.samsung.com>
 <20250131110832.438-1-selvarasu.g@samsung.com>
 <20250201001506.jr3yw4twwr7zutzd@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250201001506.jr3yw4twwr7zutzd@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fIY52MrQeD4MY6d7Yl6OXwxi05J2Lgx_
X-Proofpoint-ORIG-GUID: fIY52MrQeD4MY6d7Yl6OXwxi05J2Lgx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010154



On 2/1/2025 5:45 AM, Thinh Nguyen wrote:
> On Fri, Jan 31, 2025, Selvarasu Ganesan wrote:
>> There is a frequent timeout during controller enter/exit from halt state
>> after toggling the run_stop bit by SW. This timeout occurs when
>> performing frequent role switches between host and device, causing
>> device enumeration issues due to the timeout. This issue was not present
>> when USB2 suspend PHY was disabled by passing the SNPS quirks
>> (snps,dis_u2_susphy_quirk and snps,dis_enblslpm_quirk) from the DTS.
>> However, there is a requirement to enable USB2 suspend PHY by setting of
>> GUSB2PHYCFG.ENBLSLPM and GUSB2PHYCFG.SUSPHY bits when controller starts
>> in gadget or host mode results in the timeout issue.
>>
>> This commit addresses this timeout issue by ensuring that the bits
>> GUSB2PHYCFG.ENBLSLPM and GUSB2PHYCFG.SUSPHY are cleared before starting
>> the dwc3_gadget_run_stop sequence and restoring them after the
>> dwc3_gadget_run_stop sequence is completed.
>>
>> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   drivers/usb/dwc3/gadget.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index d27af65eb08a..4a158f703d64 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2629,10 +2629,25 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
>>   {
>>   	u32			reg;
>>   	u32			timeout = 2000;
>> +	u32			saved_config = 0;
>>   
>>   	if (pm_runtime_suspended(dwc->dev))
>>   		return 0;
>>   
> 
> Can you add some comments here that this was added through experiment
> since it is not documented in the programming guide. It would be great
> to also note which platform you used to test this with.
> 

I did see this issue during pullup_exit() in SM6375 and SM8150 targets. 
The exact code logic worked out for me downstream.

Regards,
Krishna,

