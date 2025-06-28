Return-Path: <linux-usb+bounces-25216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3057AEC782
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A7FC1BC2AC3
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 14:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127C6221FBA;
	Sat, 28 Jun 2025 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMMjvxsB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C561D517
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751119264; cv=none; b=qskGJWV5mmJr47mB2mGUDQqfIUjZvEkXilbV8Gs+rBaxXYqmh5P4LW6miBDZSOqZ9ZPshOnEJ0EdzLQD1FtjHRtH1CePxSgFM8V6p6z4xCGbhV5f2FYOkiA7A4XDbc77Y3u/zjJDnxyUIvb+rHB9ZjfmOUbTwVHW1eHzlZTczss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751119264; c=relaxed/simple;
	bh=zsnb5IT4Nu73W2mBBV0UdtW39RJlWO97Dl+DazBOnfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTQTlQi7ErvXsA9lGcZ8vT6xqH16UTEl3DrE8jo8FCygKCK8rYGFGEzYhL/cYx6FZHfRycRdOmKB/1DBX4fTfZqlK8xuSKElxTzMLUUBP0jthpI6DdvGYawrsf3c4Ir9wlhmk3mRGE7/YUCR6cR1vfbeCTkIgq0Mjn0taPJ5/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMMjvxsB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S5gskd008442
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 14:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3JT6wnm3HmMSxPGvGdApEvmBmbOzlzJHc7HEBGLfKs=; b=dMMjvxsBPlLz7znF
	TyRro5S4OTjqx6mNav2awMV4rKk8IizEeJX5jI/W85puq+JPB/2vYVw+f5jCaYkJ
	Bn5KtLfE0OHjQqkiKuN6Ht73GvcydlfDxGVZSZYLbnPooHjHCAPi4bVrB0PXnm3P
	8zdwPX5SrEpo0+Cq5SUltCZQpwFa1xfqMeqpVPaj2k/+A7Utz+4uh6DiidfFKMh9
	8kYAK+k5wQ5X+eWVcBRRNIw60QLruk00nuzKgh50oBG4f4x90A5opYRd5wub88lv
	zkEku+rFxDtASDJW8nKrSo8E3BJ2x5toUzvN1JpsmdzWxKX3oP2vDmJyoROjXbcf
	XhG3rw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801rrg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 14:00:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso8896351cf.3
        for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 07:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751119256; x=1751724056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3JT6wnm3HmMSxPGvGdApEvmBmbOzlzJHc7HEBGLfKs=;
        b=M5dVrBSDI5uWbiiXqkgqWCVM59LGPVOh47o7I/aZx4WTsrh8LKn6ZuOL0TRLhEmCVk
         GGCnfCCiqxJBFtgVfU4wADQzYfArPX5+XepnJc/a9qPsgs3+jSLikbISEdIGCZ81C5Me
         yxxyDd/nWj291nLwoJDgvOuOFvDXXQbg3IKDp57ar6Zzduflx/L/knrjTVkMZjRLlp+d
         xlkOTcRPEQN66aNipcfgsKUhSlSTn3wZN6k0Kh1jSfYfmHHsorOfVleKEkSW1QWeOLod
         eHGEf981TWdKkZsYNDr7kV2rxdHAs6clEWmJhvuJF9xE1dClV1pl/aC2X9r9KdJ6aEnu
         LZNA==
X-Forwarded-Encrypted: i=1; AJvYcCWej4k831BdCwYpwgc1Dj+VWd4N2kPAMBKZJ+K1gjNAdBDBI1PwN54B9LzsKDeJk/lpJc3QzrtJNWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx602bJZbXv9DXW9z9FQgJpc94nB9s1e2nKHsR3xdFicDZVdlXZ
	jD2H156BSTC/cn24TjuGzkl06Tv7xVtjnljDzJVwsxUtDT+FRIX2CcmaDHUe1esb5HvZ0idwCbk
	jXuWEdO0mN7VC7/xT8++5F4qi8BTSG3D77JQRJHTjQMxOnjY0b1bGcMDza4ZVRuQ=
X-Gm-Gg: ASbGnctAK0YGJEDUjMBLmdLxFaomHCnDt5cWcFzDNKHEdgO/DKj3psfFYkP3Jxi3df1
	hal1JolzIU4uKBraRr3yJ7gI49gvf+iTGixwgVswKtUyYGRD3InQezzW9wuC45WIy3AZlZBcSDN
	7H7GLKw75l0e0jmhKSa9LABI0pFL9FCpF8i7hwNP50ik14+JshZ6EQnoCundF0E2nMvPDzC9tCz
	RK96pM+zT8Oas+kxz1j7DkmosGRk3bRuPM+y0LxGNnSSV7h8ANMaAz8ndIWyQikBPrO0U2DSCIN
	2JB8up5xMP+qNSiJZXHkG9DdoCRbQh6D2C6njp3x52Dj+rNVSlbiT1rZ1Ahwhhjz4W6hJ7wya4O
	+iRU=
X-Received: by 2002:a05:620a:2729:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d44c24928dmr146913485a.8.1751119255474;
        Sat, 28 Jun 2025 07:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQ1yZeX8lDjDdM01e59r5DUWZcp4ZcpJ6o87OE6ncVesod8eJLazoWlAAUYkOLQCQ3gI54A==
X-Received: by 2002:a05:620a:2729:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7d44c24928dmr146909385a.8.1751119254533;
        Sat, 28 Jun 2025 07:00:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0427bsm312587266b.84.2025.06.28.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:00:53 -0700 (PDT)
Message-ID: <19507b60-ef03-4fac-96dc-f8700f74c0e1@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:00:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com>
 <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b7mv4u2parcyzrm67yufuor3cwx265kaoae23rksbbuu4aaayl@7a6xxfmganof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AxY8d0rvvCC9gjbOz_G1rL37Kghc0yVz
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=685ff598 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QAmXqGSAIpqigZKsxncA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: AxY8d0rvvCC9gjbOz_G1rL37Kghc0yVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfX3a9H6sb8W3ey
 AwhE21gvzU5TYq9NuoIkBVSZ1OuKSBpJdclMF32RLWSIrrb1p9nL8s1Q6u5EA4PtwPTjNd0LKZu
 fPsSURsUk35DjemFYfoeQ7+lgQtt0YGS0cNhQsoQl/AKewQQLeQ2KKlxpxZGqLDMuyU6R3Z7nRJ
 vQ3xpIiZpd2cq2BirQI5jTd43m8H4/iNRrR+jX3xX4pS18kBKZ7hLcolLSk/KMp2yyYmJNtDBpC
 QxakIcRU7uzPi+eauciz4OtJ1MGPWzgNyEe9gtwQsBhkH5emr4ngADv0ZKNMJsHbQRHKBexxgJI
 uR2/fne0FII5f+J/MTw1qYDdP4a7+lx+VvQLbavfT/qkkobWB/oUrMr1NMYFCpdkmoVwX0RsL5q
 C/C1SxRx9eG8ABglmTPzBGZQNLRhvlbIn21IneQyKhQoP//cCjuIM+lci9yuf6Bzgot5yP0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280117

On 6/28/25 7:44 AM, Dmitry Baryshkov wrote:
> On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
>> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
>> as read-only for HLOS, enforcing access restrictions that prohibit
>> direct memory-mapped writes via writel().
>>
>> Attempts to write to this region from HLOS can result in silent failures
>> or memory access violations, particularly when toggling EUD (Embedded
>> USB Debugger) state. To ensure secure register access, modify the driver
>> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
>> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
>> protected memory regions, enabling reliable control over EUD state.
>>
>> SC7280, the only user of EUD is also affected, indicating that this could
>> never have worked on a properly fused device.
> 
> Most likely SC7280 Chrome platforms were fused differently or used a
> different configuration of the TZ.

They were not fused for production, as I understand

> The question is whether there can be other platforms (e.g. SC7180 Chrome
> or SDM845 Cheeza prototypes) which should use direct register access
> instead of going through the SCM.

TF-A currently needs an update to the SCM MMIO R/W address whitelist,
but in any case, a write from !TZ is not going to be accepted by the
hardware

Konrad

