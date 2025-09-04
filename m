Return-Path: <linux-usb+bounces-27542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E2FB436AF
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 11:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E6FC3B9A6D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59292E0407;
	Thu,  4 Sep 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdyfcqvE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD62DEA7E
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976974; cv=none; b=BQJBNtT8lXJ+rpihJBLBAMB+70yudvy5riauyhqzVm5lStyKiZFsp1h1CH9Kka8miVPSOKm/qcDj8jQyrX0JvuoHbtHS24zTbHtpcOwNdtntHsX3ihQYvpEpOycL6zzfQhj9lLJvZkEj8Xg+m0zhFwdm0JaJVY8ofWOXIMtB9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976974; c=relaxed/simple;
	bh=4ptoiSOZlq45IhzsxQ+TLFRPqh1OeqRTDKOR1x62hAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJA4oeZF4jR+0AxidjT28fiPN9K3h8oKY8340vwt/zsmlE7kmY5sVDDdtQOhhvMxwZswSNWF1oi32Wf9lhl0tJO58k4cGD6dOjPdgMp0yRWjwlXb7KWDxXhHLbZKJFvkpq90XrD9O2HjMwXGV5vuUAw+fcr8o56AGIoYO0+9AQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdyfcqvE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840qbMT001034
	for <linux-usb@vger.kernel.org>; Thu, 4 Sep 2025 09:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEtWTL0H62zWsGIet+ROceeIy3NbZhQkPlZImunblTw=; b=YdyfcqvEQkV3GQI0
	5/Q5nyeSW796cd8nuFJMf1mMsFXX8lL1nN3UddTSu1RKF4WMY8VACOV3xbeQaeQY
	AFgeUOFnro1tN8gDcyFD2b/c2W2AhfyqXCxInzlXaqI5ScSesFf30CpylM3oqh95
	eiQjGZ5jJyLGsVSfp7oyWtLSCniWXwnbealRBWTEa+5ri3P9eCjKaeM+mppxZSSy
	dLCKqJk1YUK6VoxqQJn+NpvA2z4p8phxmagr23o8rqtXnOKmuukoW/8vAbcCVPaf
	P1+mM6iCRn23T3oNd0YdnVbfDZ3CZs0iUuC9DJZLA57028CqArENLKyldcbBPZWr
	jQGCMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush36tcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 09:09:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329dca88b5aso2407747a91.1
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 02:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976971; x=1757581771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEtWTL0H62zWsGIet+ROceeIy3NbZhQkPlZImunblTw=;
        b=oBq3uJGov0j3aFF4uZ4nQcb+lIC2urY4zkj72N9IUJtsYw5y0qttMC5xz46jzL/H3x
         N3Rnmev4iIWWCYZyoCvkbY+z8hB43OusKyRmerHmw46Rr5+RSBAjWtmjuekmJXsZ7HL+
         D/UBubKPsih+kLBX2ur/0u3vXY+5bBEu+eUA0Aq26jQgRKkMaaqcRwKlhDhwovk1STTS
         vZBrwXIdia4IYW6LPArpwuNRuH4iPVw4l4qkILmqGffh7GRSEeDFpjBSukm23m6jx0M0
         CKBYT1A/PX6k8hf0MO9+lVOtApFRzG6idlUb2WBRVXiOTaN6lg6b5estIYdeqMIzE1vJ
         Y95g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7l0Z0vfguebGffzAwVV6wuP7DVDqVk2xtzvyP3hwDHEPfyMZ2H2oQHUnHG8RQmX1Z0zch0otDJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVeckiZ/AzBoJ0y8rNvMF8JqHSLd8hUsynKJqx5Z0HtMjfk6nZ
	r7XrSxwJjdhu2zMkiRHa/4Aw27yiVvyAHWMAJBXJw6hmmX0CkdrvoRJsgrzRlD68F1vTE+CHPFp
	AnSB0TtKgG5xfaH/em7ukQ+w2w8bpvEgwp4nfAnSPVu/bV7jObM7WB7Ot5yN5opg=
X-Gm-Gg: ASbGncvkuh+RbeTEAp3MRscAVKWLXRxqEHZxbBYIuGazC0Pq5T0x88FRHH2A7cVuRaf
	O+4adkKcjYiIxD1Hpu50SSPBzmn4G9Uq2rl/Rj/G2D9oPsCs7yU0vk7hWLuX4wuKf1BJTRiuOeM
	Z0HQM4qgA+6ZvlvPIBhLZbEXVu5QMd12HATEudHBItBYBtaMTahm2fP+vZnYBpQA5FlBi1eo0yR
	NKQr7lHAGeL/fKnOy+Y4oO/Q/zzXBkAjtiJmslgmE33SuBZ+sPg4RfvLkwm/8XxakYqd324JiLI
	RzkUbTsQxAqm0fyQLbwhJ9Zf3phSbYrE4cQ0JzOHxOuBKrE3VRsTzqeNuo6CBgDtx/Ic
X-Received: by 2002:a05:6a20:3d05:b0:246:5be:ca74 with SMTP id adf61e73a8af0-24605becd4emr8441768637.31.1756976971036;
        Thu, 04 Sep 2025 02:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLv+hn51mr8k9PeObgZVml5EeyzkCqh5Ccxi7rWL5vvE9UtLeMLYyJeRakW3elUbjIcyYVeA==
X-Received: by 2002:a05:6a20:3d05:b0:246:5be:ca74 with SMTP id adf61e73a8af0-24605becd4emr8441738637.31.1756976970531;
        Thu, 04 Sep 2025 02:09:30 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bf561sm18976292b3a.59.2025.09.04.02.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:09:29 -0700 (PDT)
Message-ID: <745a2b9c-078d-45eb-97a7-3a27a4bc5191@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:39:26 +0530
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
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250904000003.b4j7fnucronjf6ej@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX+WhwHILcmJp1
 slbBq0ap80RfmU/4CjzXBz8I/9M9foRnwPOirSDhaomGKCYGqiSdsGMPycn9/mAxMvqi6ZhFb41
 lA6fc8sd5IIQ+5TzJ8LYUEpfVSh9XrEFNaXaHsHa55PiyH8+BNQeQ3prfJnFbtzwNvVg8lwN0kc
 ZObScwP7xipSMxPxKEF80yj3g1zSqDl60mzyao6APaEkAGCX9dNYKhVw5TURSyz8QSk0yDXjwZw
 ahFqhrdy0eHAX1LLuYoFY/hBW9VGCeKF21JYHD3KlX/G41CQddcakdTcc7Pf4B4uyKUUIVcoSe9
 WrCd5DlkcT5yGsCBFK7iQumCKeSJWyQllkdBqAsow5PjDEpue5pqJCqcF6TjMy7v2nHzD9jeCcw
 GFvnNzv/
X-Proofpoint-ORIG-GUID: yGFcHeoCLOO2UU0nkYcagLsVHvOqUMWP
X-Proofpoint-GUID: yGFcHeoCLOO2UU0nkYcagLsVHvOqUMWP
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b9574c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VI8qmIfRFIV6H3Uo1AcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032



On 9/4/2025 5:30 AM, Thinh Nguyen wrote:
> On Wed, Sep 03, 2025, Prashanth K wrote:
>>
>>
>> On 9/3/2025 5:14 AM, Thinh Nguyen wrote:
>>> On Mon, Sep 01, 2025, Prashanth K wrote:
>>>>
>>>>
>>>> On 8/29/2025 4:18 AM, Thinh Nguyen wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, Aug 25, 2025, Prashanth K wrote:
>>>>>> When multiple DWC3 controllers are being used, trace events from
>>>>>> different instances get mixed up making debugging difficult as
>>>>>> there's no way to distinguish which instance generated the trace.
>>>>>>
>>>>>> Append the device name to trace events to clearly identify the
>>>>>> source instance.
>>>>>
>>>>> Can we print the base address instead of the device name? This will be
>>>>> consistent across different device names, and it will be easier to
>>>>> create filter.
>>>>>
>>>> Did you mean to print the iomem (base address) directly?
>>>> I think using device name is more readable, in most cases device name
>>>> would contain the base address also. Let me know if you are pointing to
>>>> something else.>>
>>>
>>> Yes, I mean the device base address. PCI devices won't have the base
>>> address as part of the device name.
>>>
>> But the base address (void __iomem *base) wouldn't be helpful.
>> Using the base address, i guess we would be able to differentiate the
>> traces when there are multiple instances, but it wouldn't help us
>> identify which controller instance generated which trace.
>>
>> And for PCI devices, i agree that it doesn't have  address in device
>> name, but i think we should be able to identify the correct instance
>> based on the bus/device numbers, right ?
>>
> 
> We may not have the PCI domain numbers if it's a child device as in the
> case of dwc3-pci or dwc3-haps.
> 
> The base address _does_ tell you exactly which device the tracepoints
> correspond to. The device name is inconsistent between different device
> types and only relevant if we have access to the system to know which
> name belongs to which instance.

Yes, I agree that device name would be inconsistent for different for
PCI (and HAPS) devices. But IMO using base address (virtual) would just
make it more harder to read and identify the instance.

Perhaps we can cache the register addr and use it, what do you think?
Here we can at least differentiate the instances based on HW addr.

snprintf(dwc->inst, sizeof(dwc->inst), "0x%08llx", (unsigned long
long)res->start);
dev_info(dwc->dev, "addr:%s\n", dwc->inst);

Output --> [    4.521746] dwc3 a600000.usb: addr:0x0a600000
Regards,
Prashanth K

