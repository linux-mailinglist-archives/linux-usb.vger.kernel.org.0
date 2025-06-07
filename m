Return-Path: <linux-usb+bounces-24553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77153AD0C45
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 11:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A216F188F9D8
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA438F6B;
	Sat,  7 Jun 2025 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7lx1wwo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D901EDA16
	for <linux-usb@vger.kernel.org>; Sat,  7 Jun 2025 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749289578; cv=none; b=TLSHnmi1omEVDn/6f3CCe9LvAJFEogqFKxK6mLZad4B9qpTvv/OYZ/1qlrYPyWYNUI9N0K4fInq9XdCu0IG4uMKE21P6VX4twXEepZYO3ZshqMPxjuUAUqotB24KoAOibZKN4rR0FsLmr/RdWRT4xxmtxi/goolh8+oJ7SdDtuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749289578; c=relaxed/simple;
	bh=RTIekZYMXT1HPwL+6JH2s6iXA9/KsXv5nouYl86M74U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Id4z3HGaZ4g9GtmKtxgfWD6MEma89x/LLWeVAs05CpPj6kY4FjKAor79kvXZYaoT5bjD4UFh+6HT+En8abEeJK8zqfOigtKDj3ZNIk+XnGs1ZW7142CFjoN1JEXik1Le7hnRjrN8ze0sDspn9/+BMn68cIgmPvGkVNZtdtLZjLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7lx1wwo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574Y7GS026967
	for <linux-usb@vger.kernel.org>; Sat, 7 Jun 2025 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOT1OH7Zs3RcqZzob/2wXtn6yUgIoxAj6wC5h6Z407U=; b=T7lx1wwoaYXYXFZu
	PWnTFfTJK53Q6R96BuWU/Vh70ppOHy0+pWHqAhGzxsvO0xQuCRKh/W4x+77rE0e7
	5KQfB9DiuhUKr2lxytKI3eP6fbnU/din7Ia8xVTf1l2il4BcF3JL2hT2X2PTNRYM
	X3kk7PUddjajdjxFZbwTRidUWCOb4ZyhecP1W0dz8xAv79OgM5GKK1V/HAcUsdnl
	pgvBpl8ilmWnew9u6KHuRjKJZzahyBUwCos3eAD0+7NDYEk8FCO/tJ/+QfxWJKo1
	NN+wmNmm3MKaGSxq+hH8N5WoTiL7HqQZgs5IYjUAuWNQMS0IsoYhY9o/f3gJsggo
	i8YnWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxgd96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 07 Jun 2025 09:46:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0a9d20c2eso56111385a.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Jun 2025 02:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749289574; x=1749894374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOT1OH7Zs3RcqZzob/2wXtn6yUgIoxAj6wC5h6Z407U=;
        b=OxEJ1/dEzae0K78HlgUamNSS8td9Co2xMEERSMWbFJmxJHYveXRw+XXy6j7AD+rixH
         1nE/USh09b6NcCKve7nNp5LBEdj4A9m2Lwihs2Xqg0FSANKMklLWJKSdPUjq5le0ZXQG
         5aBnsU1APyNdOCpMjb88Y6oCP18pRKn5w3MWtO0QFtCTosVc+ifNHFrwa5t5xUAhXxQ5
         iot2jh3VJtjPFlNesfXftNglzo7PQF9nQ3VTat3gqJ4m75oQnuJgsFqS6ZxeBQJDLDtE
         371mIE59HbUjenF+QjP85ZQWecbNICGGJujYTOYUfmvWynVmDMpn6xeyJSPi1zhKOK4q
         UKXg==
X-Forwarded-Encrypted: i=1; AJvYcCXQVu61A0k1V8ZClWoD20NoE8DUF7/Bw7hsv4DWk/cTxCsSzEai0H6zNDsmpCG0VzWFFPuOFWwobOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnR9hKFtB/GNiXorsI4dtX145OnRSJcyWe65ANXqo6CJka69C7
	P/b7C/zBOfasS0IRZv/L0d6uyTIFgGcgvvjLld7Ara9QoHG10wVORJn6BSCPoQn8Y+uXfhBB32E
	njvFyZ71i5UBW0/F9mYYllFDox7xWkN6SJCAqCUJ2kloDnNrDqn4YCokoVvLBW98=
X-Gm-Gg: ASbGncvYJfaqiDM30zEFM9Mh1tABtjHT8liSGebmPMf9F/GMA/4ANxmrSlgHMc/udDa
	gXO8zN3U8MukUh0MAgBDi37Er6L3e8v4lHmWma6Ctepwo5DSr44U1hS6jpz589AYuN29Cnezo/p
	55RqtQdtyqPshqOJfGCK9X13Tq59mrPlvwRtHOTC8cI7ygUdpAys/eKgDTYjw+gkDcPdXZuOJZf
	hZO+CUKy8zKY6m/hZjeLEhqVAIAjjvrZeWi6bW3a1MRJPqMhkja/aKkN7rJz96dSeD5dTLT6C1b
	SPKsqgmOII2PAI1Q/NOxGwic8CaamHUnjsCzUhF+Pf612pe5pDHda09Ckt0Hb1BJ0pxHwVi0J0K
	z
X-Received: by 2002:a05:622a:ca:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-4a6691b6c5emr32043891cf.12.1749289574329;
        Sat, 07 Jun 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwWPtI2+ioHKumywO8IMNaOAQ5iYNQdemythHKIGMF/B1bpE+Qxn0ZZITwuEqzQ+j9BmQlPQ==
X-Received: by 2002:a05:622a:ca:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-4a6691b6c5emr32043651cf.12.1749289573920;
        Sat, 07 Jun 2025 02:46:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c0581sm2174164a12.51.2025.06.07.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:46:13 -0700 (PDT)
Message-ID: <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
Date: Sat, 7 Jun 2025 11:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0EX2LF9hL8O62jOXutRvsLsYgnupb-yS
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68440a67 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=j_8uj707ZTFaWRZCUGIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0EX2LF9hL8O62jOXutRvsLsYgnupb-yS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA2OSBTYWx0ZWRfX+fN9z8i31PbL
 4ghKTrQkYnMSPpTl7d3HcJj7JNbyxKBLArenz3ZBR6Nq2q4gWqN4QV7XdncsoEgPV0Ey1eJJx7i
 FZJ3GW+LrVdqlXnnsxhyStIxvnRfPrnmewD7hbo/7qyCu8ygNPH8P8zfgnH/gi9TJzQvztYAh+H
 CsqmFAQpUs5lziJgn4yMh/w3XtPHdFR/NAiWTWRlxPhuYMOpyPpo/ZThfx2UTXeqJ/qg7mD/+QD
 T75NwA+Fb5fB6TwJjz3nlMEbtgkM3C82puVUumibj5+7+9cps9qO3keChYkMIifA39MlnB/5+zo
 Yty7sJ3FIb6NwqhfeBseNmV708JzMW6GwY2ridkf9S3FUVLBkXXL6/EuK4ezCQM/yOzemXLwIxk
 x9sphOL07tUF/2kikr45oSpSw7SMdEIeF98A8JwNob9K/0paBU1V2+/Nc44N3YDB23KcUIFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=637 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070069

On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>
>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>> Add charge control support for SM8550 and X1E80100.
>>>
>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
>>> well, I finally don't have to worry about leaving my laptop plugged in
>>> for too long.
>>>
>>> One small thing I noticed is that after setting the sysfs values and
>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>> though, so it seems that the firmware does keep the values, but Linux
>>> does not read them back. Indeed, looking at the code, it seems that
>>> actually reading back the values is only implemented for the SM8550.
>>
>> Right.
>>
>> Based on offline information, X1E80100 doesn't support reading back those
>> threshold values in battery management firmware, so I can only use the
>> cached values for sysfs read.
> 
> Which limits usablity of the attribute, it is now impossible to identify
> whether it is enabled or disabled. Is there a chance of fixing that for
> the X1E80100 platform?

Is there a chance we store that value in SDAM and can read it back?

Konrad

