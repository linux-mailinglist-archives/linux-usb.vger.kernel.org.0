Return-Path: <linux-usb+bounces-25167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92CAEB944
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8151C440E7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 13:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985A42DA75A;
	Fri, 27 Jun 2025 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsntuEwx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40711552FD
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032367; cv=none; b=bLa92sIvkQmIp0bmtohhrhGtXqrIiX+h9GMhablnBqI3WvDS70cc5/h8yB4y89R65caCTIEwOFmQE4nU5T6+ZfqgXiEvQzrra4zGXUXCDJAto2X/QFP1Jn7Hgij95+Oy4e0k5QaE+DGUahLNNQpybx1Wj3AL5HLvE5UQxqltQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032367; c=relaxed/simple;
	bh=h2g82fe9mvepuNu/g+7Ly66oT98Js0mrCnM26SJeiEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIAc/ZkcyAfqdKX3lNfncexJGIhgSXQt67mzCRWM0W6mT+BRMPX8o/Zj3GztrSFjPLx717EcD5LqoaECi5FwJYmf+0d+Kb+R4CcjVpw5OKlikzO8UsoWaUpZoA/udMyWkpPgOXaSZvDVvUUD51+MwQTocWFE0ovVkBxg7Z1Wbrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsntuEwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCHDhX027611
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 13:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7goEq7ICV0e2DCxTs8YHyAwcL+/nG183YkHu4mlNQQ=; b=dsntuEwxL0do60KS
	1RWl6kkDIDSqYT5BEVbGjfO2XjK7klZq3tTbAX/XHIQlH7P/BNiuSDGU7U4T3Paq
	CeoRi3a0g5e7U5m6dilUX1MKPaMEedLIL/NS3bCN7D3SKPU8KXL0AD5rt9kV4yIw
	Z4edLdkCCI4yneFADp/elBC/VXS/SlPWp/pYHvFDk829XrIudo45ezEkWghSTL8t
	iMLwTEwZ5PrHbXJdtEHJtUxtEuOYKK3V+7uJ9OhE9+kcisqaCVjlXZl1HRQvRVAo
	VZt7Kbiy9eXvVYIMYph9XLNrNZz9sE6vg0qd2lRC5yYKts5mnLytzIxJHpyyc9KC
	dvF2eQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26he3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 13:52:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3ea727700so27960985a.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 06:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032362; x=1751637162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7goEq7ICV0e2DCxTs8YHyAwcL+/nG183YkHu4mlNQQ=;
        b=YJmEfvyZFzNAEwI/CV1kq+bZo4fnbGO558ruUlHlWCE7tC3wC4KZXN0K6+1oE4QcIz
         urA7pA1130IuIM+H5nPa7ig09zfe7nYWV15YHp0OnqongNBW0EC8RHtQNcMNtVROnWwJ
         VqKhY3pc2tCqWl87kGmQgcztcxvcBcCjB2FIFND4TrAJ5FGJ2xl2Q5+oMXW1ogqk62B0
         xb2Jt6BFoCdTx+IHBozkwcomoOjxm8yUL1IMTAht5IOFcnlJcaBR12WsksDw3Xxr3VLt
         spfHSTvDWX22en5ZwI6UmBMp79vSBXXCcwMjVtpI9CMFRnQdVdSoycDysX5N6Tch2g0X
         QC9g==
X-Forwarded-Encrypted: i=1; AJvYcCXdst2b2vCXidhHzUJP7EdxaNOCqrX21WtoCUzUoj6hJnmHeXSF26zdKpm9+BPZSo6ZRUpTiNKU158=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgb0ofwuGO0LOEwdaKppNW2+xJ71o1CkQAObpau3SA23yo42NO
	tapSk1EjsWd5f4jfr0Pvo0uHpAL5Vj/VirQ9ZlfsQ2+xmA5+m66fICwABwCwfljRU+73xEcx5Ql
	9qC1j9gGGkGfsAdkt4eAuz0j9P8LiNdN1wjZjO7YqPH0vx4oCK9qXIuD4TQcYA30=
X-Gm-Gg: ASbGncvmkAy3E6+zIA9p7OLLuTHpzy7yDgcPKYEW89RxUHPQmI3WGVnM3rMMG5gNDS2
	/BOydcG5OI9eDBCrr5l829Bz8HH8XtwfkogbCNPjlg6rEMfnXRjmQLXk8ucS5L80jzDV5XjeI3Q
	ssDsZcBLuBNclG7LY1ZY5Oa66G1qeDnmGTvFw5hVVzSZQff/wagAz/oiepcHi/W6cUUL8Utwpw8
	1+680ST3AK8kcOpRXBXLJcV7R1qqhx6z2woT5z7iESf74Lz5Pm90NfDvPj/ped93Wz4dj6L1c7W
	fd5ZnkgVYJKQUAaVZFwpAgjlkxrUTzUQlDm2wwQaPHCSo419zjga6G4M1gHIY7j8GtdYUK1FAL6
	nlNM=
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr169184385a.11.1751032362525;
        Fri, 27 Jun 2025 06:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERn5uRXVkw8HV3B2jwAit+YLZNyYtStkQkZZCCgZYSA4YkPXRYS7Ag4ajpLBWEyG0RWSQQxA==
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr169182885a.11.1751032362104;
        Fri, 27 Jun 2025 06:52:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm1488696a12.34.2025.06.27.06.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:52:41 -0700 (PDT)
Message-ID: <4eee56c5-f061-454a-a832-b62c0e31b10e@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:52:39 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] usb: hub: Fix flushing and scheduling of delayed work
 that tunes runtime pm
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, oneukum@suse.com, stable@kernel.org
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
 <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
 <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
 <50cbe7a8-c103-4922-b06b-d183a37ee08d@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <50cbe7a8-c103-4922-b06b-d183a37ee08d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExNSBTYWx0ZWRfX9Mz5omvc1ayW
 avzLhny/dAalB5oEapk96tTumjoHdblKd+O6Y0HrrtATbyBdHdY11daqPf3N8rwTr9rRcfgmk0D
 WF3uKqUSWm7lXfD7BdU4wsO/rZQcn4BJ3H3H8KwkcS9okSXcwvFwR57xzAgQ2zh/sSGhwsq3UE2
 qujWgExxmyXAfG5VkJYzFv0BXBy6lUHeU1r5wkShrgJk3IuQhMPLbXEvHSYBee0mwC8GGvbSlV8
 wI+eDT95s4R8sag6Sz5K47UGaM6ZdJY6pIbteWR123Qi8Bw4qANS12/iBEjurxX998xCpHz60l8
 aJLXvVy2pfCBFXQ9dObJRKmJHX68H48Nv/DWL53LwHFAYHRxA9gBFT1o6sI3UGFpZ38wlBBYHyi
 QS77aK7SlnvgR2kozwgd1tNrdk0N9x8Os5LzagbK9fdgA+uni1c4TFKMxzErKvWBA712uthp
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ea22b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qNABUOcEAAAA:8 a=JPsCghpZtJJkO44O8g0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Ytm653ucTKQjCvbzLygB:22
X-Proofpoint-GUID: Ise3pvr_NEhlGAeerL3Ml3QM_p0PexmR
X-Proofpoint-ORIG-GUID: Ise3pvr_NEhlGAeerL3Ml3QM_p0PexmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270115

On 6/27/25 3:51 PM, Mathias Nyman wrote:
> On 27.6.2025 12.58, Mark Brown wrote:
>> On Thu, Jun 26, 2025 at 04:01:02PM +0300, Mathias Nyman wrote:
>>> Delayed work to prevent USB3 hubs from runtime-suspending immediately
>>> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
>>> of high tier USB3 devices behind suspended hubs").
>>>
>>> This delayed work needs be flushed if system suspends, or hub needs to
>>> be quiesced for other reasons right after resume. Not flushing it
>>> triggered issues on QC SC8280XP CRD board during suspend/resume testing.
>>>
>>> Fix it by flushing the delayed resume work in hub_quiesce()
>>
>> I'm seeing NFS boot failures on the Raspberry Pi 3B+ in pending-fixes
>> which bisect to this commit.  The networking fails to come up so the
>> rootfs can't be mounted, the ethernet on these boards is USB based.
>>
>> Full log:
>>
>>     https://lava.sirena.org.uk/scheduler/job/1516948#L1142
>>
> 
> Thanks for the report
> 
> The Raspberry Pi 3B+ doesn't have USB3 ports, so it should not be due
> to pending post resume work.
> 
> The same hub->init_work is however used for other purposes as well, it
> could be that we end up flushing some other work.
> 
> If I write a v2 patch that puts this post resume work into its own
> dedicated work item, and only flushes that, could you try it out
> on the Raspberry Pi 3B+
> 
> Same with the QC SC8280XP CRD board, would be grateful if Konrad could
> try out a version 2.

Keep me CCd and I gladly will!

Konrad

