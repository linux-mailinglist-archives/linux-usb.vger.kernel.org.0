Return-Path: <linux-usb+bounces-37336-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KnwEiY/A2rO2AEAu9opvQ
	(envelope-from <linux-usb+bounces-37336-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 16:54:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6A523068
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 16:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97FF8317F613
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4933A59BC;
	Tue, 12 May 2026 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0mTunX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pqa+cs+P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43673A599D
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594321; cv=none; b=jtq3t14QWYGT/9DuEBsUbcCqw1ZQU4guPFlIKedNyHKPahltlLVu7qQEK82eQWuTAKlbuH+JPRKdOXJUr0SWTOnvJ33H7DK3LYHMC3vTOrufrRi8zW4tQ+2BlPZcC/9gXd58WiO5esrK8SfdfQ/fxmDubFH0PvktwUbL8bGPaA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594321; c=relaxed/simple;
	bh=J+JMZRqK9ZOguzeozFmWapNCXk2xSTLcc+FBiwf1pUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbAZmV+G+G1NPMZE3trwP/GvQIaXG5lZu7/JYYCB1N8JvCIlWIPbch4kbmgriIMgRsqetM4XPmBAifdPhWMM7MPn1F2vVJ7Ro8vl1JwW45xKA7Ru0wDPKEuZKQMpmVONwmM4bbKHSx4BeKEoQZiM4v+JIN/h1AnA3IXRuLd15BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0mTunX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pqa+cs+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCgsGP1409947
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iy7wYeD/e941NJ/F1ItwLJIww/GpkLrZlGMXR1RDBfc=; b=l0mTunX1SdL/ZcR3
	z2E4hwalKWkqgMd8hqze3fETLkJDflpbKMC1SmVqfqYMt7hMQVTdJlJLTPJPSaBj
	To1Zu2n1KFCLIwvqaMQE4L0Xn2dClF5oGWg+KuzokVLKI2lVIodZ7asZaCheqIM9
	FXrHPh5oXdBY4Cd5kV6/PivVen+eqJUp+qXELZjy6+o3Fetl7IHbGHg6K9TjldU4
	GEwLwIoUq5y3fzeCBU6EJ424pXW3VejQ9rbEtQUBafZ6x7QKyVamH4l5C3uK8fTI
	wsM52CYQo18+bYCUSsRoyrWs9Z0xNOg9Q6tDwPgk8x3YWObkTaSZjFcZOxmRQW+I
	vyd5oA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f308qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 13:58:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so488990e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778594318; x=1779199118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iy7wYeD/e941NJ/F1ItwLJIww/GpkLrZlGMXR1RDBfc=;
        b=Pqa+cs+P9kXFRXV4qBov/G1F9NIPhdktdPzoGPA/QzCUeXz9PHl0TiO+5/aoyji9x4
         DX077PlLqzxcpgc6w2NrIh9c7EsMC9zllyA0qI+uMoQG3ll/jgHpb0PFWleFTKijiUHT
         7yuH+68lYvyDsexq1SzArEelV0zmub2uHHA/eQW6uwq904xfx5Q+9m2WNpWyG5UL0VXs
         ZZHqjzV+A7QFQ4oXJ+VX7agqoommArs5uG4gAdDjrgjcKnVqx2BNx62MBr/yIt1lbOt7
         ubmYb5Z2UfOygGyEHfS1R3q/ZXdbe0YJKBM9MiwZZj2arzb8B5eJwQboXSGHy1SR78s5
         tTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594318; x=1779199118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy7wYeD/e941NJ/F1ItwLJIww/GpkLrZlGMXR1RDBfc=;
        b=F0k7r2VXgu39qmwpWjfLPCfrh70buGAw3Vz2iqCT/0YN6mMYhi6ocbYJbV+s7JoDZ9
         j79lPyFs2J2uvvEqIY09bUgKDYHOy+pVIET6Cfke4ZN/RfenHkb7wklKlpyvXSq1StDZ
         dlLb+ar00YxQb3wydGD1qaTMa3MusCqJY2c8Su+bAOcqPQe6fNw9L5BDzF7geh9Y0niG
         BWfcRJddVU5+QdO4zsnAX9hXoeGgHVJWvO5bxCOmiShlqh2TABVbORDYTixjtik70Mk5
         bZxyhjKwTwqBgWx7W4uJ4fI+lQH6V0amtzpds5mFufwG/TbwJNN3Cd6Rr/Ew6wimolmt
         KtrA==
X-Forwarded-Encrypted: i=1; AFNElJ+HEEAxYIlo/REjj/KwgASCFjKkchmS5/OZX7R8Yb89jP7qffKJZxN2RuzyvisLP9FXdoE/yCvLRdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywZ7RvG5X+k2c921WUaBVjUAlubI7/UfW8TQbgV+Xv57VPKhvX
	z0OeBz0/2enzZhOU82FbyBMSf/L4gqPMWrkQxYHiggkpQEGFE8m7S2ZI86Jdy6Xq5Xfwx3b7O+L
	J7JcFI6Np11+Lli8ZDqYnFazeXgUaZg+HquKXDe9O1wD3h+fguVDMmSMfieBrh6E=
X-Gm-Gg: Acq92OEGS34iFOXZOjukX+VpvYxy2qSVNij74rDovKYEAZ5xN5A6q+iw3jS0cLeXTls
	VyzaMRQd1HzXYi04qx51S4SrJUhK+IEpbJRav2rc/esXuQBG1bo6eXqbv//DMF6/Str7vSSXQnT
	PNJ3IiyKEEi4USFhteOC2sJBKV4a6E2KVgmSL7Qf3LMDSWMLOH8ZXCWFjGqRpg63UyTYHHOEgAP
	4/2fxf7nqL9bwC6DX7P93sArNd/NdYx4jENuuWNuaRci7L9/GMK/TF55LU9Tscj5rAyZcNKRkqD
	zKq9oDNWSBhNROmiocIfYomf0pvzFPBe7uBGkbzuwUlrAHomcNR2gZHNMQfzdD3XJUOstiyPWow
	i7HeVbvqaptCl7psBOo1/qDzmWJL8CYTB0ZfdCsFDUw0X7J+DpsxHZHnX9antjR2I+PVwQa6Q2V
	KndUU=
X-Received: by 2002:a05:6122:3a96:b0:575:1f1f:758d with SMTP id 71dfb90a1353d-5755b0ac2a9mr4561140e0c.0.1778594317862;
        Tue, 12 May 2026 06:58:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3a96:b0:575:1f1f:758d with SMTP id 71dfb90a1353d-5755b0ac2a9mr4561137e0c.0.1778594317407;
        Tue, 12 May 2026 06:58:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfac35c47asm352195166b.1.2026.05.12.06.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:58:36 -0700 (PDT)
Message-ID: <253ad0dc-1fc3-4e6f-841b-c7e9fd7320c7@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:58:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
 <20260504065402.GB6785@black.igk.intel.com>
 <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
 <20260512132008.GC84797@black.igk.intel.com>
 <80e0bd64-c99d-4dee-9417-3036f72658f2@oss.qualcomm.com>
 <20260512135433.GD84797@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512135433.GD84797@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eLeeSI_il7muLe1yflnYDAUHmMMoksN5
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a03320e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=kj6NfxSqUhuuyZWD8T0A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0NiBTYWx0ZWRfX0zSneZU0bNyr
 JeQ6P680ddRHWj4xL4hVErv4Hqk97PSuZAP4MjRGjJZUA2iSYVMVtpBMTlqLWyqzDqt6FW3I11d
 6RPDv02dSfJwpOzOCa5tOLYNBi8gid85xlU3Z07X4a1pfAUd3daA+bBABzMaVBRo9aYeB4itDmD
 EXaUk9psr3+CPq27bQ5HbJhiNjUpnQgBsDIkTN1bFjGCl40MGa3e39GDNxzfsAq/f1NNtG75SGr
 /OgunJwDSFVGKo/U6rbszyLzpscOCE0gR5CLzH2hIcBUhvkR7zi0ft9PBw6+lerePAo5aZJYkZA
 AYIndB8R/f0mkKnOWC432sV9r5KjZG8N7jKhR/dUW58XNgkHjPUKIJ5ryLsRNVXy4MwJTSU3DYG
 ekb0gVq6BtmjiX0sqSsbuesKrYR4ZljedxbXLQpSaTaHKwRu3HRZtFp2uYnG2nPqa+B5jATL59a
 o9sb6nAqPMvJqs6/R6w==
X-Proofpoint-GUID: eLeeSI_il7muLe1yflnYDAUHmMMoksN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120146
X-Rspamd-Queue-Id: A2A6A523068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37336-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 3:54 PM, Mika Westerberg wrote:
> On Tue, May 12, 2026 at 03:43:12PM +0200, Konrad Dybcio wrote:
>> On 5/12/26 3:20 PM, Mika Westerberg wrote:
>>> On Tue, May 12, 2026 at 03:06:58PM +0200, Konrad Dybcio wrote:
>>>> On 5/4/26 8:54 AM, Mika Westerberg wrote:
>>>>> Hi,
>>
>> [...]
>>
>>>>>> +/*
>>>>>> + * During suspend the Thunderbolt controller is reset and all PCIe
>>>>>> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
>>>>>> + * during resume. This adds device links between the tunneled PCIe
>>>>>> + * downstream ports and the NHI so that the device core will make sure
>>>>>> + * NHI is resumed first before the rest.
>>>>>> + */
>>>>>> +bool tb_apple_add_links(struct tb_nhi *nhi)
>>>>>
>>>>> Okay you moved it here good. I think we can call it in nhi_pci_probe()
>>>>> directly so no need to expose outside.
>>>>
>>>> Yeah that seems like a good idea. It's already there, behind N calls
>>>> in the software CM case.
>>>>
>>>> Do we have to check the CM type though, or do you think it'd be fine
>>>> to just call it unconditionally? (either because there are presumably
>>>> no Apple machines with ICM or because these devlinks would be harmless?)
>>>
>>> I think you can call it unconditionally. It only does something for TB1-2
>>> Apple systems.
>>>
>>> For Apple TB3 we used to start ICM firmware but this was changed as the
>>> driver learned SW CM. However, we never setup any device links so this
>>> would not change anything.
>>
>> OK. I'm keeping tb_acpi_add_link() as-is, since that's both bus- and
>> arch-independent.
>>
>> However, doing just something like:
>>
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index cb5d028de3bc..f5ddc8ddb8bb 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -3327,7 +3327,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
>>          * before the PCIe/USB stack is resumed so complain here if we
>>          * found them missing.
>>          */
>> -       if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
>> +       if (!tb_acpi_add_links(nhi))
>>                 tb_warn(tb, "device links to tunneled native ports are missing!\n");
>>
>>
>> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
>> index ca50e3584cac..e0abd1d503c5 100644
>> --- a/drivers/thunderbolt/pci.c
>> +++ b/drivers/thunderbolt/pci.c
>> @@ -294,6 +294,8 @@ static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>  
>>         pci_set_master(pdev);
>>  
>> +       tb_apple_add_links(nhi)
>> +
>>         return nhi_probe(&nhi_pci->nhi);
>>  }
>>
>>
>> Will cause the warning to show up. And adding something like
>> `nhi->device_links_done` is a little ugly.. Ideas?
> 
> Ah in Qualcomm case? We are going to add tb_of_add_links() as well, right (or
> something along thoese lines)? Then tb.c does:
> 
>        if (!tb_acpi_add_links(nhi) && !tb_of_add_links(nhi))
>                  tb_warn(tb, "device links to tunneled native ports are missing!\n");
> 
> In the meantime it is okay to have that warn because we really do want to
> have those links in place :)

No no, I meant that with the diff above, tb_apple_add_links() failing
would not lead to any warning messages, and it would always hit the
warning in tb.c

(because these two are now checked independently)

Konrad

