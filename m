Return-Path: <linux-usb+bounces-24437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA8ACBF5F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 06:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83B5188B60E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 04:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A4B1F4181;
	Tue,  3 Jun 2025 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epiK/rGd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3B41F3FE2
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748926235; cv=none; b=OMjgcFUO00KVSQ6Gn/0IchwiwMMljVf3uZci2Hp//WfX7JFgO/16W09PalRRDsn/bO0mnYBV+277kAoCyX/UYvKwcO3P1RHpTr1ejK3y7wUdBxf6EkwSgUMWXD6jtM82qBvN7y3XAn+4jneKkv3a7BxtjuhDVcdFHyMAbYZ9jqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748926235; c=relaxed/simple;
	bh=EAWMMPXYQsq5FrA4pI/irtKbs8fNougcyOgPFx6H7xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0APPP9pU5Y7D2KYuIP4QNNeku9DcSjtZItL++WJac4OylgEXsgZS7jwE40Tt1HNdhgOjj+qX7ZVihv7lQfbCUHLrJfDi/9FeTqkQ1A37I9nUdGaRCOddl3J6uigI6yGicqYB/2dWra5TYjOoQLgBzSPpUU6SCZ4AA/4JQuG3yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epiK/rGd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJQWe011053
	for <linux-usb@vger.kernel.org>; Tue, 3 Jun 2025 04:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPgbSgzbuSX+oCXLN0CPOpwtJsFOAf4HOx9xrqhDi6M=; b=epiK/rGdoF+xny/0
	VJrSdYTpZI0oBOJhhVEV/y/wJHUY9qTplfLc4k10k/oI1kd/9R8mILzYYOo8Ppty
	0AjbWAeuSK47RC5WicIbcnmA10rEPRr5L5HO1KLyli8N0XeCYi1Zran/TWNUOEdn
	lZh3fOdorweK1xT3wdQsTh141SiUnBmNnH+tNnj56wsOtY1mPiTokZVEFfWKT45t
	S3yDYKH+6Nw+OyFlTKs9t/ILZvcXs/BKhSOYrXDPxZhfKa/2AOx2wBiShRMYLW0L
	lFFOYCGR9/iWwdVhjnLfDd3kzrMLbSpww53M7ipNjzbImqdmzkRuBWNEOhIW4X0j
	7uptJA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q1b48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 04:50:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4402759b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Jun 2025 21:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748926224; x=1749531024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPgbSgzbuSX+oCXLN0CPOpwtJsFOAf4HOx9xrqhDi6M=;
        b=tlIXawm+sP9eNXK0VFsLZQRbNfHa+gv6BwBhPvsfqAZ0dE5YMfXkGLctL9GG6AblWr
         nn7vgc2eS7hprS86tS4RtaJKojOX0z/lSbTnCGAaSEYdQk7LdwuoTaW78X6uYhlW3dzU
         NEdJ73pX5xnvyY00ir6GT1DUogNUVGkIvATs/7aZl81ViXuXxC+L5lpFL1+q1IvjhXTB
         W+RWZW48XIKrxJ6j7j6Vn3rkihuDxLZei0B+KDQEzB/jsb248VOqbX5zDhMfRiIskVNi
         dcub7u49fCvGmD1r2lfXqJ1rg7WZPQyf9+w57FmTU6rl4CIeokzhDhBTDSNLIgqszxnf
         Xl2A==
X-Forwarded-Encrypted: i=1; AJvYcCXWgCA6w8KwaDTfduoZoFN0vGKc78uYwpRTnQFdengcL3aF1Sm2N3CezpjdWN2mBk5KcO4T/q1ciLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+zLsnZiNqpr43lU3n6Qra3t4MpyA94MLhaqMKC6gkYPR3Rgx8
	42sHcb04HvT77IsW5NWWzqKedQ7/+Pp+mK2+vkAZMUgzs/ay2kKZcII/yy2ZS+n7YbYTuo8TXWk
	5BSLoM/Vrnnzp5DfnJiDmMKvrKonVru9YeNeJ8OcTSvqAlDSsUDhn+F92RyfpRKE=
X-Gm-Gg: ASbGnctdACxXrAwdJ2ec7Mi9bavXjAlfrC/K/2Rrjlqw+BsfJsSOpCOycnZYcgu5hE9
	8NzcGKuJ9RrezHsA4s7t3UMU5yax3W218elk65rKgwHPhe9GyMnQHILuyyAQVtEliPFltobe7o4
	cTnUEIrK50pMyQW6rArbr5vD9Os1S6MSHudeqD5HyVoe2rxwjjWY5KRnPlgq/EmJanldnlqZbBK
	B8u8bsF9C/91t/HdBarKoalyMRNIx9xEkG7oe1odk0EKV0EQcTDqjCLBBjhSEMVm+gQNi00Ah6K
	jtUErfpTcghlLvSFf51ZY+Qd3m6UKwnADe877tEFVK3X8PsUzPhP6v1NxNXYlkVvcMQCQnlpwnN
	i
X-Received: by 2002:a05:6a00:1a88:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-747fe0592ebmr1545673b3a.10.1748926224393;
        Mon, 02 Jun 2025 21:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/MNuXs73ZR7bdTTIBXIjCQZZHAjylXKanogS/OWyKFVp5YdY/f9egp4CsPahXdsrioevBJA==
X-Received: by 2002:a05:6a00:1a88:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-747fe0592ebmr1545650b3a.10.1748926223981;
        Mon, 02 Jun 2025 21:50:23 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafac9sm8492120b3a.112.2025.06.02.21.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 21:50:23 -0700 (PDT)
Message-ID: <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 12:50:18 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: he8rOh6I8wJq7T6NejO-lpTZla_Z-h9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAzOSBTYWx0ZWRfX9ixAuo4G4TOl
 M0DghhbiiWGECEl2OVCF9VJjMZOvr8d9hewJSVSOb2CPpH8gjtydK6iiozagjTShSxH+AC2+w9F
 wNDjOGRC7p0t32p9Gha5dwytfGdLWZuHY4TzIEUQpmVeg6dJGFUobTCoXZDTfywyItqYdW15t2x
 s0ZO1SuusI509oHIcv29dwd7o2PrJyE+TSGxVnNIY4elbpEkEJabdEdij86izG7o9KKYGuG6zbp
 kkguHLcbpFSgIt1Sl7YzduBohG0adK4WBxSETQGlnGrMXF3XEBOEsAmvDwFd3yQrUUO9BKVwmfu
 eFqlGxVuIsDdGX3S+n3PytrKjMCj1qkXxbfMOEQU5QikkgG916kt6OEUdKiQmbgYKbzfi//c6vs
 VyMcIhjmF77dmbSugGCWx7fNhc4WdApVwYoE0z9yd+A685tfRoN6sPu9cmH1fMRc97LBCxkO
X-Proofpoint-ORIG-GUID: he8rOh6I8wJq7T6NejO-lpTZla_Z-h9O
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683e7f11 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=vB8V-zSZfwPQ_sZj9vMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030039


On 6/2/2025 2:17 PM, Dmitry Baryshkov wrote:
> On Fri, May 30, 2025 at 03:35:07PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add state_of_health power supply property to represent battery
>> health percentage.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   Documentation/ABI/testing/sysfs-class-power | 10 ++++++++++
>>   drivers/power/supply/power_supply_sysfs.c   |  1 +
>>   include/linux/power_supply.h                |  1 +
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>> index 22a565a6a1c509461b8c483e12975295765121d6..74e0d4d67467500c3cd62da3ae0b2e4a67e77680 100644
>> --- a/Documentation/ABI/testing/sysfs-class-power
>> +++ b/Documentation/ABI/testing/sysfs-class-power
>> @@ -562,6 +562,16 @@ Description:
>>   
>>   		Valid values: Represented in microohms
>>   
>> +What:		/sys/class/power_supply/<supply_name>/state_of_health
>> +Date:		May 2025
>> +Contact:	linux-arm-msm@vger.kernel.org
>> +Description:
>> +		Reports battery power supply state of health in percentage.
>> +
>> +		Access: Read
>> +
>> +		Valid values: 0 - 100 (percent)
> What does it mean that battery has 77% of health?

I will update this to explain it better:

Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.

>> +
>>   **USB Properties**
>>   
>>   What:		/sys/class/power_supply/<supply_name>/input_current_limit
>> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
>> index dd829148eb6fda5dcd7eab53fc70f99081763714..12af0d0398822ff23d8970f6bdc8e3ef68081a1d 100644
>> --- a/drivers/power/supply/power_supply_sysfs.c
>> +++ b/drivers/power/supply/power_supply_sysfs.c
>> @@ -221,6 +221,7 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
>>   	POWER_SUPPLY_ATTR(MANUFACTURE_MONTH),
>>   	POWER_SUPPLY_ATTR(MANUFACTURE_DAY),
>>   	POWER_SUPPLY_ATTR(RESISTANCE),
>> +	POWER_SUPPLY_ATTR(STATE_OF_HEALTH),
>>   	/* Properties of type `const char *' */
>>   	POWER_SUPPLY_ATTR(MODEL_NAME),
>>   	POWER_SUPPLY_ATTR(MANUFACTURER),
>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index de3e88810e322546470b21258913abc7707c86a7..dd0108940231352ac6c6f0fa962d1ea904d81c7a 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -175,6 +175,7 @@ enum power_supply_property {
>>   	POWER_SUPPLY_PROP_MANUFACTURE_MONTH,
>>   	POWER_SUPPLY_PROP_MANUFACTURE_DAY,
>>   	POWER_SUPPLY_PROP_RESISTANCE,
>> +	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
>>   	/* Properties of type `const char *' */
>>   	POWER_SUPPLY_PROP_MODEL_NAME,
>>   	POWER_SUPPLY_PROP_MANUFACTURER,
>>
>> -- 
>> 2.34.1
>>
>>

