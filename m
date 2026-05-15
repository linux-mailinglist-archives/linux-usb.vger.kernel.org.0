Return-Path: <linux-usb+bounces-37494-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDFOGiPyBmohpQIAu9opvQ
	(envelope-from <linux-usb+bounces-37494-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:14:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA154D217
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6290A312856D
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F813F0ABC;
	Fri, 15 May 2026 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzdnzxJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpsBnUIq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7B43C055
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837687; cv=none; b=GYCEg1DdqneYohOUiggOB2mWy19LTNQNprLD/1S0awzxwcefGNdST2GVq3YeJRn9mCzpFoHFCjB6l0rL53/kn9qyJaqzeMCohFFx3Lmscly436fKYfwkembAnebTDwzK5vE4Oth/STdYkEtC7byHiNRWVxccr1SzKu1luZZQ6EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837687; c=relaxed/simple;
	bh=d5TDtYzI9w9Jk0kTA7y3095OiTVtLkpBULbGj2ZeDdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBheGxwbqaE4s0bIqOIR+IVf2Z+rOK3uBc/fqdEtpwmfYZwTEQ/sDH596VEP/aGn8taoVruM64OPzlKQyrrlYFT6VAEiWv/WFhkL7Rq0OX3sK7piHE+3XiR3pDA0TQq9DNLWAT7alIvW1aPCI7pm0jdiUErIQ235uoZ7EADfh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzdnzxJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpsBnUIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5WPxc3512945
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Idy9O1/Dyo4K+bVwNzgOYiQX/lyoKUQI77/LaO7XvG0=; b=fzdnzxJwza6LS0PC
	ZCpxdKKi5FfX7dT8VTVbwdcSuvCZ6dGssi/sLzl6rKr/SRxfd6oBSHqhbJYTWRcR
	rUiiPaH5B2+Pau8VJt7JTKfdK5MURxb17N04y0eMGuUinR0xXfZ921k7VKFkiLKd
	3gQHNhJJvHVh2kypO4aKcLG94OvH14aBUQHxuLchoDXvpIdVgy58AtXC1ftGH5aC
	TCkJIEm0uWGQpIKGabG+3J4R3hF6Y6O9rnQYvby6hdFk1x0TgwnSF6M1bwr2JE0a
	MP5dmwi0B+61qC20vgGl0vUn/r8bt52SfIXV0+61RN9MH+LXH0j7TwQ11hu9oJ9A
	v5Hafw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vamve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:34:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631cad875f3so398319137.3
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837684; x=1779442484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Idy9O1/Dyo4K+bVwNzgOYiQX/lyoKUQI77/LaO7XvG0=;
        b=OpsBnUIqNW2jJ6Vz4KCZmop12qF9RoH+RNh37GnrN9cN3ptK+/xI9KRUVKasQH7Veq
         vODpkR0Eh2gPOzz8vNZgiiEfXVrJkD5+Hq/7Z6MKB4s/GE9QsVLK32bw6CbVA+49Lsb+
         K+CPH8ebsCcVpNuTzn2pA3N98IxDKFj/B5s6sNIoydzKL1v0Nu/VdDLos3URIV046CRT
         /ALygIUGCWsGlScNhbG0830nfCZ6Kd2m8mP781r2yQJWZO3rcFvbSA07JO8UlXZEptGZ
         CvU3Wom4EEXFNM5K4OYVVWQQW8psLDfS6Pgq6skoRTJ+fJQAQc0MG/kCqWSmw51Onk0u
         rTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837684; x=1779442484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Idy9O1/Dyo4K+bVwNzgOYiQX/lyoKUQI77/LaO7XvG0=;
        b=JNBmEJY7OnInADpfIAQ6CTuEWOPS01hCdjTHl37W4iwmkOi8bCa+yXrPWxSBszxKtu
         U4JIESHPSqiPYIQi+wWdmPW3RC0kR4w8e6lWYFszzDkBIdDRVwHJNlRL2H7Z6ydcLqc2
         k99DgfSL3hgA5AUk85Jr90ntR5glGtIhDCnWKYSm7Tcb3oT1tpYeDrerk6/LmnfIg+RJ
         XYqpfgk0os9BS1oHRRzV6fF9pHwQbRv3Q30SCZVTfVvKZJsussw2HYHzWWOfyoXy5vpW
         /a7oL1d/59CJXv33hV68KY6oqww01++f3gcAPhIEWjCRFCNX+convzqqpYfzf3nGEwtJ
         FRew==
X-Forwarded-Encrypted: i=1; AFNElJ9AkrujUD2O/B1YSOgV/cDugxf+6iQy2lHNaj3EguyiXQhXmVcdaKSp8rSU/k1r+lQOdk0NkSLwqNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6sId5O7hKJn6tP6AAq7i1Ehi+v7RcKdCh8MWd17FTnpl1YaM
	Bp+fbwvlk18SAP2V2eLaonhCHmUCpEvi8YtbJWLyx7+oncMj7wgFOdSo5vzywJ2y1ybKCAxrQyK
	ADIr+aS/9sUQ3Yk5rG7eoQZc1Q/gQX9L1mAsLoa5nTKaUcTKjF3zfizfR3QIAqZw=
X-Gm-Gg: Acq92OEuYrFvWDFKVeVdOyGSniF6cCHXYSJLrO5TcP/3TuxWSzEMbS7Cu9gv13Wil8r
	Z8/AzLXLcwnfrDlN9u6N9evIFlUaOlhCvaCrFLiccVRA9fsBcpYTkYI5k7ukfoJj0J5o050hwfo
	pyNNuN47Vf15ohmt3mW46pqw+PxGpOc1yVTnKE7Wnj1vX3GyhJkVt8hkVl+1IZCYBo2u0Fwh4yj
	7d7izVVZ0+7GULjhWLcaki94F2/cZD1rhcya0hAqRRyf961cI1W+8lKSdPWYW90nkcKX735FfCc
	L2K7M6BiXc4flsk80ypEugzNMqGYiuKSLYSbYzCeg/eZ0LNxLH7Fo5WtIpoamoQclj4veDYHH+N
	CYMIEb5CQUHiEigreAro5kZmMIYGYDePkEJRVLlt7A8BjQSxmAaz/o9F3XxONJr7IdfO5z3kGyI
	76d5w=
X-Received: by 2002:a05:6102:5e5:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-63a3f69868bmr387245137.5.1778837684030;
        Fri, 15 May 2026 02:34:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5e5:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-63a3f69868bmr387242137.5.1778837683686;
        Fri, 15 May 2026 02:34:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dea94bsm195294766b.33.2026.05.15.02.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:34:42 -0700 (PDT)
Message-ID: <b08939c6-feb3-4876-bf2b-b0f409989038@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] thunderbolt: Require nhi->ops be valid
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
 <20260513-topic-usb4_nonpcie_prepwork-v3-3-b87b5e408ac7@oss.qualcomm.com>
 <20260515063058.GH84797@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515063058.GH84797@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NSBTYWx0ZWRfXwWn8+Cp6BVtW
 TYYB8Vh89U+VaumkrYjWNhoJcSCtEhgCxAiSO8wOq33xXhUrLV+6r06aPZ2ZeRpYypVms0RVxBq
 Sc8uKrzWCCEjwnNhLhYM2mfYmF1AT05ukyeJLeJGm5hKKsviONtG9xniqa9ld34iTT9dtkvXDEc
 tWuA/SJ6KoZ4hBuDxtOpDj9LDRhhNGBUEpqhMd1rvJ+h2f57Jhp8aHbxRDp+AJ/UCqrEVgFf0p8
 03oemev1yIjiRH+R1Ycfmnj1PbCIAmdkMc6UZJpXd1LyJCsoayP89utlPrH8ZKZN1AvdKCHyUA0
 RwFFC+bQDubQvzkYEq63riIZCXzsp32UY3j1zWke9ew6UzUREdsWnm8RXTupvsiFmxcOE2PEyHu
 HLAennhxfhRyxSxmiq1MGz0EM8JaCQGB0sIxzpZYOyiyG34anKshI3zdTKAPVIQB9QMbfUL6WoQ
 aSjt7PFZrjIBeJ547Vw==
X-Proofpoint-GUID: eRHx_yFgTXt8FbPkdQn3EQOtjYmi7GaX
X-Proofpoint-ORIG-GUID: eRHx_yFgTXt8FbPkdQn3EQOtjYmi7GaX
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06e8b4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uV_RWfb6zAIlQyuJedoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150095
X-Rspamd-Queue-Id: 66FA154D217
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37494-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 8:30 AM, Mika Westerberg wrote:
> On Wed, May 13, 2026 at 06:23:34PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Because of how fundamental ops->init_interrupts() is, it no longer
>> makes sense to consider cases where nhi->ops is NULL.
>>
>> Drop some boilerplate around it and add a single sanity-check in
>> nhi_probe() instead.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/thunderbolt/nhi.c    | 32 ++++++++++++++++++--------------
>>  drivers/thunderbolt/switch.c |  6 +++---
>>  2 files changed, 21 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index 740c10ee852b..2a8d1b3716c0 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -559,7 +559,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
>>  	if (!ring->descriptors)
>>  		goto err_free_ring;
>>  
>> -	if (nhi->ops && nhi->ops->request_ring_irq) {
>> +	if (nhi->ops->request_ring_irq) {
> 
> I wonder if it makes this more readable if we wrap these like:
> 
> 	if (nhi_request_ring_irq(nhi)) {

The UFS subsystem does that, and it results in a ton of boilerplate,
i.e. for each op you need to define something like a:

static inline T nhi_foo_bar(struct tb_nhi *nhi, ...)
{
	if (nhi->ops->foo_bar)
		return nhi->ops->foo_bar(...);

	return 0;
}

I can do that, but I don't see real value here

Konrad

