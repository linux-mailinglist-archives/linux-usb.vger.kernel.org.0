Return-Path: <linux-usb+bounces-30135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69905C39F63
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 10:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7336E1887B05
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 09:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4E22E284A;
	Thu,  6 Nov 2025 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OT0fhHcV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAxYvsNZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715E2836A0
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423061; cv=none; b=X1MJnkpsDfJbmI4sTKTPymR23vDDonTfr0skF6T8Ooa2HkbEWgE/uVXJJ7x9ZaQn3aIJruTJLofFoRCDCGQW40XfvEAV7YEjWz+meEQKesGsTYoVEScXj3i77rpDT9J4PHptfMJhG6+M3eZoBoVVmC+ud7Id7RaFCG1JLIC/Y7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423061; c=relaxed/simple;
	bh=Od6eWi8YieA5ZjpB3buWKjiTobuf/oiIjsP6QM4urpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pW2GNMoojwSWzAUpcOeYGMUyXdUtryn7VB58uAbTwtK5psBQ5FAI7b4l8Xv1Db6qxgkqdAhj4iFaif7VgKE+1Siu/i3nuO39mkK7vN/8b/72C14w19RKNVdr+Ry5aMklmV0Pokef7HHN+4Ge3Y27lhJAfD41lkmeocIYB4DBKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OT0fhHcV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAxYvsNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68bpp52165126
	for <linux-usb@vger.kernel.org>; Thu, 6 Nov 2025 09:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHwjGaQEMgc8Y0wEai+3Sd8weloo0g73FAkWCac6JMM=; b=OT0fhHcVQiV+76SQ
	x4UvgCdnzyK35wBEyFa5g/ZNLbeDEyDI8oXWN0iNcUV08U68akUEWunCGvkbZ3rl
	HzZSgJlp9E3YviTxkKoBkvJnUBV3c7Lde5NiE4QMAcM1nle9dXUlbGlaCZdxThPF
	tT2WhY0LowOW+p+MRAIB9XsYeIAKdOOMCG0z5Y13vcPVqOYh6u9BlpLikrW1x6ev
	ZhOj/M6thDBgE5LeXTXnwmNahV5uUl0tiZCgsi5HwAl5ebqvpwT8A4ZolSk98k0i
	lXEtnRHhbH8Dffp6O3qqKgrwLfiZ/6qR+NrZouDi8tvP5sW3bOmQbo94xD3QZYCM
	diXUGg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6esk47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 09:57:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa9f595688so521287b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 01:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762423058; x=1763027858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHwjGaQEMgc8Y0wEai+3Sd8weloo0g73FAkWCac6JMM=;
        b=RAxYvsNZ7/TxEfc9ll1EksVGIoNdqg8ErgFqMcLLBh5kmOtxfOYYrdKroRvMHJ5nmJ
         L/VV307H++7klamJQ3m3tZEcqIQWfFrvHKeGpKrJ7nn6H+ZgSpC7PpeS89og2PzMuk9f
         OAKs5WyrwWyJWMU0V2NiByYhR5q465c1C1EOJfmHSk8BGryrxYh9wUY5Lz1xzub4Ammm
         81UJBEosq3yrowfpjP5H9R/hJDgpQqUDr/Qi9llZBWL+qOFtxXhPArKwTUAuG6lQTbg0
         AaiSMBUYv7QohrBWhA7EkTX6MCQOv/6tQyYziFQHlaltLRKzznnARjL38uuWK8Qup/ly
         JMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423058; x=1763027858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHwjGaQEMgc8Y0wEai+3Sd8weloo0g73FAkWCac6JMM=;
        b=Lwr3MENwVH/pRGsHN7wbuL3TVmB/qt8E2OKS/YNYtXnfxo3gMzTmZwyL752eyrZHbj
         Mc/REsTNon6lyCTBVj4/Vo+rrNg/ifgmnzaW3TkBXh04YW4gG7G+tVmXWEEGEDFtu8eT
         41/GfkqM7SATJYXNMrh++y8rSUQwXZIxGFq0urFaAvqZL49ZR2p/mCfBP+QnaAG25mKa
         3+tLzz1llE8Y6/AzrfK3Xz+J9cG/sQuB+vDmwOj/LQGpuiNH0WVc+h2xHjhB6JEPnam9
         mJOZBhi0U5cuNr3MenhA78q8+XgDX6GK9sr6YPJwJclym5J5vgelI2vgZNLWbqpS30C6
         yOsg==
X-Gm-Message-State: AOJu0Yw+yoSNsqZ6zGJbX30xVV1zD+rNnyoPHWz2HT8z+AD51Lm7e9VZ
	h3kn0jt/LYRBFy6hyocRBPV6/XkuafYxnOnYG7D5myM0JrWqIjM5nlN6WmN2f0ZJUI7NkbqTT0t
	EA2Hxv2W1odR5PqoGWx5RaxkRtp+4veprZLZrB/Yvw6kTlESpJtieBjTGO4qF+aWgi4HvwXhqfA
	==
X-Gm-Gg: ASbGnctKCgNooXRKV5P7+kIT17sDwov9YrJk4A3haQyMXctm1aqtWPKyGCUUClJvrrO
	h5IND1lKjkPlT9UJe70pBHLm0WI2VNn9zuHjGxbwAkqJN7W3LvvryCeHEZEf95erQ6zhZPS6B8o
	tx1HQ9ejts1P9qRhw4rj4KJvaS0RmVDV7ypHRZB6+nRfuPRMBcGm9Ch8KyI/AGFbtxzrVq01/Oz
	bE8N62Yxk+BZeSfIK5QC9U/2htdveRjt5PwnXyS4KPnjzhXaNshMTLN9Ix2GdspmSOCB4nfaNqS
	RB+UhIWSfdvmgTvAZQAcdqMy3cgkITYBa/aUotRBKC7B3IUqXwF0XaRdfXChSssw3iPfF+0No9V
	Q0Mae3uJVmg2Xv7Yp/m+OIlxZkzjTZaM=
X-Received: by 2002:a05:6a00:1304:b0:7aa:d9e2:8175 with SMTP id d2e1a72fcca58-7ae1cd57d31mr9314105b3a.2.1762423057643;
        Thu, 06 Nov 2025 01:57:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeCQeCQXQNqcYvtp6Q5uldwYhJyKOzDj9LpXFFJMjhAuT8GlF1SRgxeSFPU5aO+trbmpAVLw==
X-Received: by 2002:a05:6a00:1304:b0:7aa:d9e2:8175 with SMTP id d2e1a72fcca58-7ae1cd57d31mr9314089b3a.2.1762423057133;
        Thu, 06 Nov 2025 01:57:37 -0800 (PST)
Received: from [10.218.39.189] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af822041d1sm2164539b3a.37.2025.11.06.01.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 01:57:36 -0800 (PST)
Message-ID: <93a08563-a8f2-4004-bf91-884611b7cc7d@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 15:27:33 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: host: xhci: Release spinlock before
 xhci_handshake in command ring abort
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        wesley.cheng@oss.qualcomm.com
References: <20251022100029.14189-1-uttkarsh.aggarwal@oss.qualcomm.com>
 <8750e1e4-41fb-4fe7-b97e-9d2a26db45c6@linux.intel.com>
Content-Language: en-US
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
In-Reply-To: <8750e1e4-41fb-4fe7-b97e-9d2a26db45c6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OCBTYWx0ZWRfX6SnFGPMAzW+p
 nBkWzZc3flvU4kmFD68e9erc/mG6iDNbrMGeaOwls2K7MbX2i+z4qu4uniV9o2KqYSSdBOKl+Bc
 XYcjNhceMt8rXMzyZop3u1lH/MJ2xXgsfMAZ7KXfZ5ZAt1GUfa0pyO6YaoKx++NbesEGFzJW0Xg
 0ob5/vqxVBtMPXrv6nGxs8bQqZCosGsNKyeO6vxBQwd9c8ZrLcGZ0lf0HmlSRfxkUo2qOd8ie+H
 JUkJL94KMfIzZ6ILHzXA7YNX0S4yDOrim4ru0NhFG3MZPjyM0+b+FjRvmZdtt99bdQRg85vv+Ok
 d9d+jzwXShs5D1/Ah5UyuS4kxMqiJ0yLwHHKzaJyuy6PaAigPFtHBkWxCFNVsTKXEcR3UWwSnjn
 dDCGmDIr/9xpDYx23EokIBDVNJrWmA==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690c7112 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BIYsPkCC6ziYlbnQVyoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 58I-szx3049sdRjdb9sc6B5zWVjyD94c
X-Proofpoint-ORIG-GUID: 58I-szx3049sdRjdb9sc6B5zWVjyD94c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060078



On 10/22/2025 6:19 PM, Mathias Nyman wrote:
> On 10/22/25 13:00, Uttkarsh Aggarwal wrote:
>> Currently xhci_handshake is a polling loop that waits for change of 
>> state.
>> If this loop is executed while holding a spinlock with IRQs disabled, it
>> can block interrupts for up to 5 seconds.
>>
>> To prevent prolonged IRQ disable durations that may lead to watchdog
>> timeouts, release the spinlock before invoking xhci_handshake() in
>> xhci_abort_cmd_ring().
>>
>> The spinlock is reacquired after the handshake to continue with 
>> controller
>> halt and recovery if needed.
> 
> Is this a real issue?
> 
> It should be extremely rare that commands need to be aborted, and even
> less likely that it takes five seconds to stop the command ring.
> 
> Can you take logs and traces of this (if it's reproducible).
> I suspect there is some other issue that needs to be fixed.
> 
> I agree that keeping the spin lock for up to five seconds isn't a good 
> idea, but
> just unlocking before the command ring has stopped opens up new race risks.
> 
> We need to ensure that queuing a new command mid ring abortion, before 
> ring stopped,
> doesn't cause new issues, or that handling command completion events, 
> including the
> "stop command ring" event, before polling for a stopped ring works fine.
> 

Hi Mathias,

Yes, actually when we do usb headset connected, no audio playing, resume 
the device and do some operations like volume +/-, there will be 
xhci_handle_command_timeout.

logs:

It’s wdog bark, we can see : xhci_handle_command_timeout kicked in since 
68346, but not end till 68356 dog bark.

[68346.109071][T25562] [2025:09:04 23:19:02](2)[25562:kworker/2:3]lwz 
debug: xhci_handle_command_timeout start
[68346.109081][T25562] [2025:09:04 23:19:02](2)[25562:kworker/2:3]lwz 
debug: xhci_handle_command_timeout xhci_abort_cmd_ring start
[68346.109083][T25562] [2025:09:04 23:19:02](2)[25562:kworker/2:3]lwz 
debug: xhci_abort_cmd_ring start
[68346.109084][T25562] [2025:09:04 23:19:02](2)[25562:kworker/2:3]lwz 
debug: xhci_abort_cmd_ring xhci_trb_virt_to_dma
[68346.109087][T25562] [2025:09:04 23:19:02](2)[25562:kworker/2:3]lwz 
debug: xhci_abort_cmd_ring xhci_handshake_check_state start
….
[68356.215787][    C1] [2025:09:04 23:19:10](1)msm_watchdog 
17600000.qcom,wdt: Causing a QCOM Apps Watchdog bite!
[68356.215790][    C1] [2025:09:04 23:19:10](1)[RB/E]rb_sreason_str_set: 
sreason_str set wdog_bite

Call Trace:
xhci_configure_endpoint hang in below call stack.

Stack:
__switch_to+0x1a8
schedule+0xacc
schedule_timeout+0x4c
wait_for_common+0xc0
wait_for_completion+0x18
xhci_configure_endpoint+0xe4
xhci_check_bandwidth+0x1a8
usb_hcd_alloc_bandwidth+0x37c
usb_disable_device_endpoints+0xb0
usb_disable_device+0x30
usb_disconnect+0xd0
hub_event+0xc4c
process_scheduled_works+0x208
worker_thread+0x1c0
kthread+0xfc
ret_from_fork+0x10

Finally crash on dog bite.

sdei_wdg_bite_cb[qcom_sdei]+0x110
sdei_event_handler+0x3c
do_sdei_event+0x88
__sdei_handler+0x48
__sdei_asm_handler+0x110
__const_udelay+0x148
xhci_handshake+0x58
xhci_handle_command_timeout+0x248
process_scheduled_works+0x208
worker_thread+0x1c0
kthread+0xfc
ret_from_fork+0x10

Based on the logs and crash stacks I have collected so far, including 
the watchdog bark and the prolonged execution of 
xhci_handle_command_timeout,
it seems likely that there's an underlying issue causing the ring to 
hang during xhci_configure_endpoint.

Thanks,
Uttkarsh,

