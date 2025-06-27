Return-Path: <linux-usb+bounces-25184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC7AEBB92
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 155687A6ACE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE782E8DEE;
	Fri, 27 Jun 2025 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QK/jLgIR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7C2980BF
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037798; cv=none; b=NVDqzyJtSlXGe9nF7wGCnMwXbV7NVCeGnMq2SlN2GtLcWawLvDJqtNI5/QYUmIfcU1T2XFgAL31DeCYOKlJ9aDYh6LIqa05dr08hVwfFbovg86dcUBdqktUMrToiHtwfYIVxeZ9Y/ELgRG8p3ISRRtEqojo6YFJV69YhPV4kv64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037798; c=relaxed/simple;
	bh=CPtnQCTFJ8L0AFPVtpIGBemngVMMTxJLyL+7mrOUHZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPlWqeDqIdK0TQkVyfRWz8aBPmxz1RI+i5G/gwFjuwMf1JhsmkNY0fGGNpaxQ9ciZ0bbKdqTv4UxmLd2XrnGqL5/RDQiPNof91fydKXRPGB60hhLWV/fQ0iJ5lbdsFnM9N+wyiVCW+SVEK9Qhdaa5TIOpiQeEo1Xap6eJPDA+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QK/jLgIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBVp43015157
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+Y6TFEWUi2XeGAPN4yjE/UIBosspCkowFLz0U70rLM=; b=QK/jLgIRZ9IGYANJ
	ofpsl9MevF4Ca5q6DoEyhBP+OWp9m41rhpFS00Fu8KcBEK2jOj7EnP3SaoeBr6S+
	omI2RpSP79MgGejyPDTJ1haVd7CKSvPx6zOpSz4EqqRq3oI22ZEPzdYGD42pvoyY
	wcZlHyDVAtrq9u12f6HEJoBO1r/8f9CjoHvYuWXO8PKDADuJmKxLVKmRJ/76iztZ
	RnvYbewgMd+BpSmjjYMVeUZ3Tv3JhdxJiR8UOQw839G9gmHa7Ca5dXBiIRPRECFH
	CpoWCY4P3WVuC5M4XYObnZuxMX0m1O6Db7wNWOo8jSkk5hx1ChzUsT+FTrjLbHxl
	lyl3UQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn12xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:23:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso62247885a.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 08:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037795; x=1751642595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+Y6TFEWUi2XeGAPN4yjE/UIBosspCkowFLz0U70rLM=;
        b=sYYUgIidFSryQV/mwEA2S1Ri9EZhAes9mMtkQYNsl+Q2Px9xIv5kIIvYcpoTiAbEs4
         CCarP8KEed/3dTWhoPDw+5bVD+dXcocw/M7Q6H11eqYCYUoZuUFbhS/ytB5L1FDFG5cP
         twxPeHcY1KtOcB7F+cJab9HMMwWKQ/79NTRYZ1XPZQv28/m/wizhtlgfFj6CS88hn25i
         FLDdNCkO4uxE2MdDdyUXXyf4RG8r2Zck9Ysftv8kXCp2XwjyIZzNsYgwNt6wPNf13cix
         y7htt7NYAqokO50TKeWh0fYgxUQYP6AbCrXoMTjSnmb2VtzCaszEDZQdGYSy1UAIHQMB
         GW9w==
X-Forwarded-Encrypted: i=1; AJvYcCU5QzyDrUWnF41vdtTV5snQD9m4E5fl/Zwwn+MekqZsqWO94e/XVgTT2++/kNQj/CZMKbpjc9APoMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmkiCy1GTmxdpp/OoNGF7AWBIJmMoshNDG++dmKnY7F6feNRO
	Ka7KA2LdVt9LECAkAF7HD+If4kKrj82FxBJL0YIdARRGkBGG98F3d+7KC1+Uu3vLlypwKi8QTXf
	yfmi85pBuKD64A04mZPGsNx3jnFZQyFjAkF+jQSWfg2Me9xsvus032fEAOrS3IKc=
X-Gm-Gg: ASbGnctZHRcHMsWwEiaLycHUk10K1rSf2JPEoak8mgGvdSMtzITAokc7v/YmP33JX1M
	8RCaVNg8Xx+jXRi6WkQSyqHE/96Cz9PxXWyw8Sea9mfqFhaxO895YgsuBSEtOI63gGIJPrJ/8hK
	IOp+xtyY9aFMWb7TkfxX2ra7jv/POQwrr/YZT93qItaySV0nMkq2371ByOGM0Sfwd53fMirP2Nf
	7umcMDaueBzavt0I5g/QzmtLKjjlH5ISEVttnVZQGlLEVlcCx9cmYXryAxm5DEwygEcmzfZTXRA
	m0zc6u8dqlmHr3Ij3Rl5OAIrajweicxb1TtIax3G4elBjcmFO7iM+mpqUg5mKatUaFHbKmFYVJ6
	51lI=
X-Received: by 2002:a05:622a:1f8f:b0:4a7:9cb6:52fe with SMTP id d75a77b69052e-4a7fca385damr23674161cf.7.1751037793748;
        Fri, 27 Jun 2025 08:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnPixyTgSG4Km5EjWAkQfogQ8KfDuDs/xLYje7sxLqLysuS1mjGTH33B9uspV8dRDpAFzh3g==
X-Received: by 2002:a05:622a:1f8f:b0:4a7:9cb6:52fe with SMTP id d75a77b69052e-4a7fca385damr23673931cf.7.1751037793233;
        Fri, 27 Jun 2025 08:23:13 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbfdsm138552766b.115.2025.06.27.08.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:23:12 -0700 (PDT)
Message-ID: <344dd9c9-07af-4e22-8cf2-1fbd0b4e5869@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:23:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, oneukum@suse.com, stable@kernel.org
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
 <e42dad63-cb3c-4bc8-9b1e-d43c8e976313@sirena.org.uk>
 <6f251f36-cdfb-4cf3-9066-e84d5842c875@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6f251f36-cdfb-4cf3-9066-e84d5842c875@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uovxrzUUhh9Ixp3EkmB-ESRwX8tmIgLH
X-Proofpoint-ORIG-GUID: uovxrzUUhh9Ixp3EkmB-ESRwX8tmIgLH
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685eb764 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1qrwJ_KKHa6Qu6ACZrgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfXxntq+dGRpaoA
 /k5K6hrgoHJOlbMcLFtS2PaxJBSmFx+96Tj2juCe4uNhe1Z3WoA18TolCFkMAMDFj1m5zJgjH5k
 ntY3K4NjH0wmG774CvMPvn5GyPAZYobWwBRq+/vfo/qGxcH0yGJKggj7ik1P6VZS6WHbnKLaG3W
 P9QK6VkXQBKA5cOMGKHiJwOVMvF87sM/4IH+CrbGgdSIfv4k6cDkly7o/0CuhGJB/ojxYb/usrk
 xo1JHu4FQ92D/41OjjidPYno6HfCfrwPYde4JGlE+UPqDawVeJpOs0ZIIcYg1HKIfmBf2RPVxNs
 u4LS9eS9oGHxkLrl8NZkg3zoPcTqhTakqwENDj9DekutuHR/SJDFJsDC7DxreZdqkJROQ8FdKj1
 nWO7iYw2cW9C9yF4fB366Tie2iGT/fUwgAS83KDo3ngBJ2MzCMgF1l3YxaRUlzpXCu83GEBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=902 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270125

On 6/27/25 4:52 PM, Mathias Nyman wrote:
> On 27.6.2025 17.34, Mark Brown wrote:
>> On Fri, Jun 27, 2025 at 05:20:44PM +0300, Mathias Nyman wrote:
>>> Delayed work to prevent USB3 hubs from runtime-suspending immediately
>>> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
>>> of high tier USB3 devices behind suspended hubs").
>>
>> This doesn't apply for me against any of mainline, pending-fixes or
>> -next.
> 
> Ah, right, -next of course already has version 1 of  "usb: hub: Fix
> flushing and scheduling of delayed work that tunes runtime pm"
> 
> I'll rebase this patch on top of that

FWIW I applied this one on next-20250624 (not containing the v1 fix)
and ran some testing, with no issues seen

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD

Konrad

