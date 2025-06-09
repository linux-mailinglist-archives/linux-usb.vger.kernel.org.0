Return-Path: <linux-usb+bounces-24589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1656AD18EA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 09:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890563A8D28
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 07:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDD219B3CB;
	Mon,  9 Jun 2025 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKc3w8VC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7894258A
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749453441; cv=none; b=ZqYKiPXaxqgqkHr9/gN6q9z6cpikzeYLK1poKz1BIP22+N+I1Ak8Pi5lYKi63jgNuuMS5cAvlJijXn5Z/LYAltHm/R2al/827g1MzVnfShTqHgtxv1CloP0ucP6BRqqAfXoaJjmiu4aUa+IX3R0/Dy1OPLX1h10xJyZOEkjbTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749453441; c=relaxed/simple;
	bh=dnOOCHxE/dICMo1ItkE+yCkFIQkdWx5eFZ5lfhxhpo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAK1zXMgTDDohTPFWiMDLtHrLpexxoisc3OifhbiU4oM1nzv3sUCcyEflCnQD1AAEaXcCAHHfJEaWYPFaXMZ6vxWftINsw91s+W9Z1kgRc/Xq4ZiQiWct+h8ZMlPgWB/n4aHJoHqLA/o3kHlvryVLm7JZ3gPm8mZvbQ0YBRomXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKc3w8VC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558KvoCe006202
	for <linux-usb@vger.kernel.org>; Mon, 9 Jun 2025 07:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykt1m8wMBYY0GbBmpdFucNObSEG06qB6oOFyulI3RIQ=; b=RKc3w8VCApEr4HRZ
	h6eKGZSki85kIXwn45ia71nSMmmjQMWHUkgeWEwJ5dG+giLPXXeONpaEGC/eXRhT
	/m+IM5BcBHRvSnXdcDxA9ofAmQLV7Qe5HjDURXWkf90s3AC4/cJi7CxnrTUOSRM0
	msnaxK58N/RkpeWX19Yju7p3EFafHp/vK5HjxZnLRFj/+SShAqJ+t9ji9rd6sUCF
	VDbNgDOx53rrHl3uxtSmmAJczueEuVTEDXlVPF/5tiVeFvP+IgSO3fdJb1vXdAcP
	x5l6naKx2FFQpxq6e51VNULHB1uv7NqT7err8Q66vgKrMV2CwuRJl7XXHGtLfddj
	DI2XYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxn8ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Jun 2025 07:17:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fae67a352bso63547376d6.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Jun 2025 00:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749453437; x=1750058237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykt1m8wMBYY0GbBmpdFucNObSEG06qB6oOFyulI3RIQ=;
        b=lBJ6O3QfbcOXprbxMt2+sOIYbkNZtq9qIag7GSYdNrGziWzsl+GQ/AMIdyuhd0eb2b
         sKc3Bg4pWP8Jxpvdm8je90WpCUCMeqkLRMtPGG34WApkg3dxOGb5pC2XrnKtry85Fll1
         IkT2QVjNr7c8asma/SqNtYBq5d6UyYB3Ulz+p236Grta2VhSBJS/8kJr4HI56Eenus6L
         u+jWZse126FSVB0L9GfqgV4KckoJorUdVGPpjG7pLhtG893PZ4Mpe4Tdn4JXQoQVduVF
         BQbPKiUkTR5VfKRC/aZOhwQnZGXxJJ4C04O0OSckfSJWqo4pxXIrtaNKZ2924msZqr23
         J0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh+72a8O1xgt29xJrhcNg1d+JluB1nTbCCCgFbg+SlI2HSJ8OK7XXM1fE6W54YhFsc5eRVLnx/1es=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDs/bGDSvMpNCbUdbw3AnxUN7UXL/raXID3p/4BwlbnnIEYK47
	hCdTJ7UpWto+MLVdkADFSiiNTQQ1s3FaHsPbwBNSjPRTgvVV2rmpITEZbtOkKVqkbhnb4vUzhIU
	YfC7OFy3xueG7IBH2tdGbqpZ7/AFE96p16/dvZ7BRvUVoyvhBi1ANUYxQL7tz9eNJIe8Ks7E=
X-Gm-Gg: ASbGnct8XJLdHXCfgLxktWYJahq2TzC9Xnt5LuC4v4qgBfbFCbv6Geppz1oa9MCZcuk
	Q/xawVGDs7tgzgovC6Qw/OOQrYe6fJo8GAjNzspw8ngoX7vP8fJFYEQte9MpIQ4nmOb/1P426a3
	+JRiv5czptL3cmzhnO8HgLkcq99Cs2z4G+3qjfyKa02AApavtpkqeclBV4WPH6Ov7QLVsvg3WIs
	zy9KwP48fMWh0zmJgvchnqaiPxkrmq8NaxHwJASJsc32IyOJ1+NTdRGcxevzFntPZ7lwyywormC
	JQ8C3124zc1Gqezt34GShkd/ZIMcZpop+r0IwRG/EzQ4awLMfN+SOr+hfn9dKbB2x7lsoKnTfia
	xm7dKOvM7Y7REvg+JBf6Qn1fe
X-Received: by 2002:a05:6214:d0c:b0:6fb:1db:e9e7 with SMTP id 6a1803df08f44-6fb08f55c4amr210052636d6.10.1749453436843;
        Mon, 09 Jun 2025 00:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdkd6CyJurG1kbBol7Erd8qyoJpOICpwacKz5TVDzmXLohtAPsAPvsf/9GyQC+BvRxwRlLJQ==
X-Received: by 2002:a05:620a:1787:b0:7c5:47c6:b886 with SMTP id af79cd13be357-7d2298ec4bbmr1913052985a.43.1749453422860;
        Mon, 09 Jun 2025 00:17:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b34742sm9904481fa.32.2025.06.09.00.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 00:17:01 -0700 (PDT)
Message-ID: <b938b358-301a-4842-bdf6-93ec3c459d41@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 10:17:00 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
 <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
 <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
 <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zPLQolkgKCsz48LuedqwzOZjYCArVyLO
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68468a7e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NtchbJF2b19TUD_QsiUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zPLQolkgKCsz48LuedqwzOZjYCArVyLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA1NiBTYWx0ZWRfX2ly9Fr0hmqlz
 9Q/BKlPXavDMe884mCcDixDyZGVsBYuPdvkirMsa/NDWBwIwZvJSb+gA0gMpA1OL/niPvqWu7bK
 afsfaeCZ9SWy+zx9JmPxrcmeOCLjdK7jzBDETfBkgE3LywEIpDXBie9ztJv/8FwwXy2YDU/uxG1
 lq2NhmMFYcxAg/o7fvHMBSLWdv4Qc9svNeFm9x+3IIMmkaD4Tf2vB76K6XR5+MM7xDLZ6HkMzzV
 NtQ8wT2vzRG+xvEXg/p43AJ3D+4qW99A7lgGcNH2DKpL8quZfqlSli0GxOcG8Lcrmv+0FngQdgW
 Ct3X9IjMe/Ed7vPLweC6/Rt51Bj1hq6qMFtq6egicCRyW1FUMRdxfSq4OoV3dDN3YktqHCEEu7I
 UN2BEw9Mcoj+KuYi6dJ47uH9wEmrykHHX3HZD6VA/XvUb1rmtkYtFtns2Vex1n8J0EfHoaJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=915 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090056

On 09/06/2025 05:39, Fenglin Wu wrote:
> 
> On 6/7/2025 5:46 PM, Konrad Dybcio wrote:
>> On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>>>> Add charge control support for SM8550 and X1E80100.
>>>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting 
>>>>> works
>>>>> well, I finally don't have to worry about leaving my laptop plugged in
>>>>> for too long.
>>>>>
>>>>> One small thing I noticed is that after setting the sysfs values and
>>>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>>>> though, so it seems that the firmware does keep the values, but Linux
>>>>> does not read them back. Indeed, looking at the code, it seems that
>>>>> actually reading back the values is only implemented for the SM8550.
>>>> Right.
>>>>
>>>> Based on offline information, X1E80100 doesn't support reading back 
>>>> those
>>>> threshold values in battery management firmware, so I can only use the
>>>> cached values for sysfs read.
>>> Which limits usablity of the attribute, it is now impossible to identify
>>> whether it is enabled or disabled. Is there a chance of fixing that for
>>> the X1E80100 platform?
>> Is there a chance we store that value in SDAM and can read it back?
>>
>> Konrad
> 
> The thresholds are stored in PMIC SDAM registers by ADSP after receiving 
> the set requests, and ADSP reads them back during initialization. This 
> is why ADSP retains them upon device reboot.
> 
> I spoke with the battery management firmware team, and they have no 
> plans to update the battery management firmware for X1E80100 further. 
> Consequently, they cannot provide any interfaces to read these 
> thresholds through PMIC Glink.
> 
> Reading them from the existing SDAM registers requires adding "nvmem- 
> cells" DT properties to specify the SDAM registers. However, the 
> "pmic_glink.power-supply" device is an auxiliary device created by the 
> pmic_glink driver and does not have an associated DT node. Is there any 
> method to create a DT node and add DT properties for an auxiliary device?

Auxiliary-bus devices don't have their OF nodes. Instead they use the 
main device's of node thanks to the call to device_set_of_node_from_dev().

-- 
With best wishes
Dmitry

