Return-Path: <linux-usb+bounces-25072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A95AE6CA2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 18:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F21DB188D3FD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9576B2E2F19;
	Tue, 24 Jun 2025 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guGZCIP3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C92770E2
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783228; cv=none; b=VsZTreXWNPDKepURc8nr+r6NIZzcL1NMI5mTiGWvMyity5CsignsozW8oXWJwNT9Dm3wqQVWVwOUb8H7YBhiqLczzkrYkTqb/49RPR3EVFWn3maZX2tXrZAPVuGC5y4xSdaoUMltMiONnAugnQwtTjvD9PEVP/Q0YSY7f5IDV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783228; c=relaxed/simple;
	bh=gNbfS3IQIw+ZA/Tbc1eqTzjOvW49DznDyTFvf00LwRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/sI5reyRuPI/anFikV8qsTWQhx38O4+UuuWyV5doKlO2vb/cAng6h+G48p7h4550XRy0ihsEfN6MfHFuDhRVY80m7KZwTkv90BaQoBpsAdqgzJEJEjbYIOSo5axmHKR/t2sjaODkXlCoaAPJa+BxmGpwPZK5IrNSXSk1IuAyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guGZCIP3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEmEun015366
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 16:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBz7B261UilGw8l0cFlngfc5bC9U8v/iHsxpZb5CMf0=; b=guGZCIP3M1/1JQCm
	AZvfR6qZMeXH2lAvS3ajG/CUmCcXuRUc6NnqdEd/OCxzmgWVivu8pbl+z9AIYZVp
	0MZU7VbUJ5J7/Zubc9fSwxnJ6rRcM8DKS6G2qn/Q/LLemV4sGDMFDPTPhjiI/7Oo
	wgu3M19I+UGnL31FNksrELgcMRRpPVZFn3yNzW+RWrNIOQjc6pj0Iy8dHiTzV7bO
	TSaXqVMWXEmXX0rHJbYEnCEndDkHIbgSGzP9YG12wBNZPkIdjGMiQHlAnQUQQAdg
	LTeTYsbTc0/4WvAZeIcYbQOJxK0JzOUxhMPSb5lJbYokGu9yXi2BylorbD/HSslF
	jTrvZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4p5er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 16:40:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso138525185a.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 09:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783223; x=1751388023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBz7B261UilGw8l0cFlngfc5bC9U8v/iHsxpZb5CMf0=;
        b=m9h9mh0d8yPgux2tIvGjE6TgcuIdeDSvWjMrm8acQhekQd5D6MDv0ONLVEkQ0g297h
         uipofzykRkQOtRn9aLeObIeL9Pz8/9VATWXXdal+tzIyXkV7AZQf6OX/No6+d8DhnPuH
         +gWPCU1v46I88fpE97Rk70C2rpS7cmfQrf/Q/BN52q06V2spijYddiwGV29vfxDtG8pL
         6+Y4bNwh780qqiNd6BitMSo2hrGJMFeUCO6t6F3eAFoeO2at9cy+sCPLZ+dtAPhwCUkj
         i1wj23TUnLtEoLR0Jmqny8Bjk39HQ8RmTVIy4WP1uU4hNQA/qCUcufoX1XBYVpMviJ5f
         xEyQ==
X-Gm-Message-State: AOJu0YyUWA7oZ7EKpk0MO2OrsAnPgBDlYXlaSVCtRpInqKLDquz/n7le
	p6gXfVfJ4morqp5HZb3MfL5wB+WIP4L5rRAWAGZDjhDxs0dZyTUZm0EQRy2jcx6Ig7GJEPSwHuJ
	z7dZyso6TihSXdHcyPEi0cT47GsvWTuEJ/CcKRuZPfWmQXAgNpzipAdWW1ZXmrsM=
X-Gm-Gg: ASbGnctwgm6GwS0ziZ/owQZZoQMlxB9HWtYm6qbjMYs5bMPlu2A3InZx4v0IKe3y2dQ
	ufTchjqa15ErPSoy10l6iVxl5ufAr/zSRy1hsIO9fBVFGVXylYzkYbdCTp1M1pPGakMH/24TL+q
	g0Y2c2Msp5HVKi71zzBBSwPA5OiIgPMm1t/J47wq8MR8suXyVMNPbNEo8QcRJkRiizD6b+47Vvo
	Km+tyLzu9P7cEfMpykyJzCFtmwzH1qqGkDhSJ6cyfNFrjKDBmd+4+p0REKbFE1exRfbpUd9jFZ2
	cTIGs6KMulIE3X310/JPi4mbvKOWcGH25kbf/Wvk1xtstM8JEjQ64/n2kClVeay9pl0KZQBcjrv
	FHkQ=
X-Received: by 2002:a05:620a:4708:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d3f98b4b8dmr960282285a.2.1750783223037;
        Tue, 24 Jun 2025 09:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPqHhsv+zekMkO/9EZrbowlEpSkryyjGSkX63Yw6hzZKBV3xkpzSKd1B0PRQ0dVJYh0CwAyA==
X-Received: by 2002:a05:620a:4708:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d3f98b4b8dmr960280485a.2.1750783222328;
        Tue, 24 Jun 2025 09:40:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209a93sm899311366b.166.2025.06.24.09.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:40:21 -0700 (PDT)
Message-ID: <67d4d34a-a15f-47b1-9238-d4d6792b89e5@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 18:40:19 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8ea2d32-4e8e-49da-9d75-000d34f8e819@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ad4f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=kec498a_61XqED03bvkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ncl--8g14cCssvk6YW_io82EQZjflfCT
X-Proofpoint-ORIG-GUID: ncl--8g14cCssvk6YW_io82EQZjflfCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzOSBTYWx0ZWRfXxJmy+jtnHqcP
 VoG0uivlFD/YxMEFhQBqQIKEi7blIhnRkRWWQwB2ttI8jcouYExHP8DOLZrdoVlBcgX5TkU6dV9
 JR4VZy7+Z0E+PMF5oFqCsL6R4YWr2YmRZv+YzSygdM+NJEh/3PMRttRLJfZW3n+olQ2jdJhhmSe
 Zkk7VkYHzoxJYrdPqajDuDIfhBrd/ZqU7rmyiF8AKQl7no1W4TkguC7UrBvR4TZlaQsW6fJfViC
 mEljQxMymDp2s19ZP2U6VsTkszi+zk0YjIpQxMf+Suu6UlxpnshcDiayS/0caQVS7PCnbambP8I
 fWwMVI2HYMWHRKY09wCUYQESk/33NihleDBoc4J1XIaaibSwGJIuB9E2aKsf3M6Ve3aMF0jpJ+Y
 yO6N7nqZ7Cxxw4byj0psVfwOHaG9BNh02DyTJu0Vp+ujR5cdmHus9jAyDVwjTAuyZQBbP6FG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240139

On 6/24/25 11:47 AM, Mathias Nyman wrote:
> On 23.6.2025 23.31, Konrad Dybcio wrote:
>> On 6/11/25 1:24 PM, Mathias Nyman wrote:
>>> USB3 devices connected behind several external suspended hubs may not
>>> be detected when plugged in due to aggressive hub runtime pm suspend.
>>>
>>> The hub driver immediately runtime-suspends hubs if there are no
>>> active children or port activity.
>>>
>>> There is a delay between the wake signal causing hub resume, and driver
>>> visible port activity on the hub downstream facing ports.
>>> Most of the LFPS handshake, resume signaling and link training done
>>> on the downstream ports is not visible to the hub driver until completed,
>>> when device then will appear fully enabled and running on the port.
>>>
>>> This delay between wake signal and detectable port change is even more
>>> significant with chained suspended hubs where the wake signal will
>>> propagate upstream first. Suspended hubs will only start resuming
>>> downstream ports after upstream facing port resumes.
>>>
>>> The hub driver may resume a USB3 hub, read status of all ports, not
>>> yet see any activity, and runtime suspend back the hub before any
>>> port activity is visible.
>>>
>>> This exact case was seen when conncting USB3 devices to a suspended
>>> Thunderbolt dock.
>>>
>>> USB3 specification defines a 100ms tU3WakeupRetryDelay, indicating
>>> USB3 devices expect to be resumed within 100ms after signaling wake.
>>> if not then device will resend the wake signal.
>>>
>>> Give the USB3 hubs twice this time (200ms) to detect any port
>>> changes after resume, before allowing hub to runtime suspend again.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 2839f5bcfcfc ("USB: Turn on auto-suspend for USB 3.0 hubs.")
>>> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> ---
>> Hi, this patch seems to cause the following splat on QC
>> SC8280XP CRD board when resuming the system:
>>
>> [root@sc8280xp-crd ~]# ./suspend_test.sh
>> [   37.887029] PM: suspend entry (s2idle)
>> [   37.903850] Filesystems sync: 0.012 seconds
>> [   37.915071] Freezing user space processes
>> [   37.920925] Freezing user space processes completed (elapsed 0.001 seconds)
>> [   37.928138] OOM killer disabled.
>> [   37.931479] Freezing remaining freezable tasks
>> [   37.937476] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>> [   38.397272] Unable to handle kernel paging request at virtual address dead00000000012a
>> [   38.405444] Mem abort info:
>> [   38.408349]   ESR = 0x0000000096000044
>> [   38.412231]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   38.417712]   SET = 0, FnV = 0
>> [   38.420873]   EA = 0, S1PTW = 0
>> [   38.424133]   FSC = 0x04: level 0 translation fault
>> [   38.429168] Data abort info:
>> [   38.432150]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
>> [   38.437804]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>> [   38.443014]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [   38.448495] [dead00000000012a] address between user and kernel address ranges
>> [   38.455852] Internal error: Oops: 0000000096000044 [#1]  SMP
>> [   38.461693] Modules linked in:
>> [   38.464872] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.16.0-rc3-next-20250623-00003-g85d3e4a2835b #12226 NONE
>> [   38.475880] Hardware name: Qualcomm QRD, BIOS 6.0.230525.BOOT.MXF.1.1.c1-00114-MAKENA-1 05/25/2023
>> [   38.485096] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   38.492263] pc : __run_timer_base+0x1e0/0x330
>> [   38.496784] lr : __run_timer_base+0x1c4/0x330
>> [   38.501291] sp : ffff800080003e80
>> [   38.504718] x29: ffff800080003ee0 x28: ffff800080003e98 x27: dead000000000122
>> [   38.512069] x26: 0000000000000000 x25: 0000000000000000 x24: ffffbc2c54fcdc80
>> [   38.519417] x23: 0000000000000101 x22: ffff0000871002d0 x21: 00000000ffff99c6
>> [   38.526766] x20: ffffbc2c54fc1f08 x19: ffff0001fef65dc0 x18: ffff800080005028
>> [   38.534113] x17: 0000000000000001 x16: ffff0001fef65e60 x15: ffff0001fef65e20
>> [   38.541472] x14: 0000000000000040 x13: ffff0000871002d0 x12: ffff800080003ea0
>> [   38.548819] x11: 00000000e0000cc7 x10: ffffbc2c54f647c8 x9 : ffff800080003e98
>> [   38.556178] x8 : dead000000000122 x7 : 0000000000000000 x6 : ffffbc2c5133c620
>> [   38.563526] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
>> [   38.570884] x2 : 0000000000000079 x1 : 000000000000007b x0 : 0000000000000001
>> [   38.578233] Call trace:
>> [   38.580771]  __run_timer_base+0x1e0/0x330 (P)
>> [   38.585279]  run_timer_softirq+0x40/0x78
>> [   38.589333]  handle_softirqs+0x14c/0x3dc
>> [   38.593404]  __do_softirq+0x1c/0x2c
>> [   38.597025]  ____do_softirq+0x18/0x28
>> [   38.600825]  call_on_irq_stack+0x3c/0x50
>> [   38.604890]  do_softirq_own_stack+0x24/0x34
>> [   38.609220]  __irq_exit_rcu+0xc4/0x174
>> [   38.613108]  irq_exit_rcu+0x18/0x40
>> [   38.616718]  el1_interrupt+0x40/0x5c
>> [   38.620423]  el1h_64_irq_handler+0x20/0x30
>> [   38.624662]  el1h_64_irq+0x6c/0x70
>> [   38.628181]  arch_local_irq_enable+0x8/0xc (P)
>> [   38.632787]  cpuidle_enter+0x40/0x5c
>> [   38.636484]  call_cpuidle+0x24/0x48
>> [   38.640104]  do_idle+0x1a8/0x228
>> [   38.643452]  cpu_startup_entry+0x3c/0x40
>> [   38.647507]  kernel_init+0x0/0x138
>> [   38.651026]  start_kernel+0x334/0x3f0
>> [   38.654828]  __primary_switched+0x90/0x98
>> [   38.658990] Code: 36000428 a94026c8 f9000128 b4000048 (f9000509)
>> [   38.665273] ---[ end trace 0000000000000000 ]---
>> [   38.670045] Kernel panic - not syncing: Oops: Fatal exception in interrupt
>> [   38.677126] SMP: stopping secondary CPUs
>> Waiting for ssh to finish
> 
> Thanks for the report.
> Does reverting this one patch fix the issue?

It seems to, but the bug is not 100% reproducible (sometimes it takes
2+ sus/res cycles to trigger). Alan's change doesn't seem to have a
consistent effect.

> What does ./suspend_test.sh look like?

Nothing special:

# Set up RTC wakeup
echo +10 > /sys/class/rtc/rtc0/wakealarm;
# Go to sleep
echo mem > /sys/power/state

# Dump the AOSS sleep stats
grep ^ /sys/kernel/debug/qcom_stats/*

> Could it be triggered by (system) suspending the hub while the delayed work
> is still pending?

Maybe. What I was able to confirm is that kicking USB nodes off of DT (i.e.
removing USB controllers from the system) makes the platform no longer crash.

Konrad

