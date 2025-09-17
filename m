Return-Path: <linux-usb+bounces-28203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E13B7DC3C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 14:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D863236A4
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 11:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8792EC0A5;
	Wed, 17 Sep 2025 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2+PVpD+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CA2BEFEE
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107674; cv=none; b=kNdYtJES2msaJngl2Ttd6PpieR7G8ejpzH5RH78yOAaNhnb+RK77nknOmPKBK52j32HPvzmeG2FHyQqnhsC1exQxaYM7KAam5VA/W7BLJGQG9OL2yeV4T8L7TQMF0zVYj1T9lC+adCHEnn7OvmkBsWktPpKePWebkhJQV0NdDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107674; c=relaxed/simple;
	bh=gr9F60Me7a60bNWj3SiJcwOQULQ8APfwa1823sZVpIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuMgZPJ3mloB3p00eQE2sjgzNLVcHpf6FNnBh/Vyq7HUHT2bmX6U6XIlzjXZFnkzilb/98ZEeE5oy2kBimB8bzjxQdO7F4fprf3IdMcyWAHhoqgqqbq3jekz+LlkQJ8AhQlJ/V1TT91SlXQNva/Zk332GC5L749wIOYROo9uLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2+PVpD+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZNm021417
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 11:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjIVIub8Wket+d8VfqHLW16P1fmhDt81FIBdsCC9eCk=; b=m2+PVpD+JX68xdNA
	e6xGaMzZ2V9W8QeokHqxPURe4dJtCFtGFHq+OxOmaPE4rRv1UxUwfKFmYx/A7XiQ
	cvcPvOILvHD/y1NpaWwONYtYw1bEObfadFOhPRLB0iq4eyFVmx4PYk7ONHW1uHXP
	iIdjyKxmkhqBYTpMoZNFFQwhkaAEW8SnyRrL0x/jxWEKvUl46MBd9LskkdSZbuj8
	5ro/SMmh9Rcrr+GQGChDUbLYQVvsM+U1ImXl1yrubRtPlJNHQOak0cZW3nENXU49
	xISItLnkeQzXKnixLD9usp5TqPO22lsZBIk6swlTbQjefYxhivU/nHBHI1k0zlMA
	AIL1Eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5a2ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 11:14:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b79d4154c9so13872541cf.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 04:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758107671; x=1758712471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjIVIub8Wket+d8VfqHLW16P1fmhDt81FIBdsCC9eCk=;
        b=AiES3DDteslks5jWk5heLttRlPdCTiSm+ZuVki2uRjRWIxmptIP7wFUTcdgWjcPkjT
         AS7uXOHyBGIS+1bkPZx9u397LALXWNqLRZyfLQxb26VoQ2dIJ3Hlc1Mi++jKB+g9p8o0
         KKDxBVx3N+Wo+2LEgYR0LqMR7g9p3XmpRM+hoDOrPn3P9WQ319H/xH+TrSN6Hx7eCla6
         lFiyIdNuZIDhRoRbBcDKkvSoEpjvaIz5fO16NABgUViIMfmydpQcM6Ee8jwTp2hjbLeN
         tauZ0ouPEuBhLGPPQ+xP2OeH1i7ij+PsxsmH0u5I9bL7mx7fsWsvZQMC0Hw+ZOKOmxy+
         u+vg==
X-Forwarded-Encrypted: i=1; AJvYcCXCDf+ixYbCpWsQfQE+I8lMbK833DXCg/OEovzG3lmbTwdnLruEhoYX6VIBrSdHdCxFTRVjwKVEkEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMFGzuIJ1jQo9OaPXetNhVolFb+c9zDk94b9zF0PhDuAOEXAW
	/W7SP1/oXh1dZrn4LDxpPLZpd38+C1dw+H8pVIFTuWxu/hMmacuH+EmuedHEqPdPFsWXomOouHu
	Z5Ehhh1bXfEQPYZMqsYhrvDOyx3ju8GcLQurVm9tyvRrc7ovWCu3pddFBU4WL4ng=
X-Gm-Gg: ASbGncsVtRQmR8ef/G0p+/FrECDbuENlFC6hT1/cHYpGuFxJBVnSVUxOT9T8O1tI4BI
	uLvRoiNdFWjIcfk+Kt45QIgioiA+cod8ssM+xfdteB2kNU1SOBZM4SCyu8lTAotrFZVXxtdLERs
	Q68+JJSNcFnXJDtwG3J4iOSy0EiDTb9z11Iv+dIDcWuV9GqCam+VFnjsBJcwb4h/AbXbtfNyNh9
	Y7VSjGjunDh8QwKVRcjoABlMr7Ya2o4o0PC6WYbYgSg8858nBtBS5jGHMBJBjuACV2pJB1pPApx
	+hQoEbWvJxwAzq+IA+7ajkzi4NvyGniSOaKfknKxTEIvkUFhx2hbIKRjXeH4pXaHGVXJLvUrECO
	5zQBpNt8LgX/si+1PTL3pKg==
X-Received: by 2002:a05:622a:342:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4ba671e5e91mr10613571cf.1.1758107670633;
        Wed, 17 Sep 2025 04:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZWiiFXjANyc5iNlBf2sAU8oL2kw0kwLhnJKg6xlVKg4vTUbDuuDVuoJ15JMc/ewmK01gkw==
X-Received: by 2002:a05:622a:342:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4ba671e5e91mr10613251cf.1.1758107670045;
        Wed, 17 Sep 2025 04:14:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b136ee12326sm485898366b.51.2025.09.17.04.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 04:14:29 -0700 (PDT)
Message-ID: <fa258ad4-1efa-4fe8-9636-d70c5ea9c8e1@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 13:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] power: supply: qcom_battmgr: handle charging state
 change notifications
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com>
 <20250917-qcom_battmgr_update-v5-9-270ade9ffe13@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250917-qcom_battmgr_update-v5-9-270ade9ffe13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DcFFcJxJd0PXiJJ5chVuH9rXlvrmbpgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7wbwUupNDjjh
 CC+oqNjTe1t+5LXyWX9c2sy3/MbFzLldE630QRAgxk0CGYUDf4BsnbrRJgScIi2AHpFjuborGXt
 hMfPnguO1aVKX7m1Bn2ztpnXc/vkF2xobThZcIJXSjCZWAsL/r3emkp1bEI9AWXj6TABseYD5se
 LRa5JhjaGhhzOBvRtV+lNpLVNEPkujtnpIhrfT7PwUDB/jhYy6qcQdF0LUpmopRdjBzGyKu230A
 XNvAn41vOqpxszbjUtVNMcenj+755+sBcK9KfK6Z4SxNdpCmheO75peAFJelV///fZxKlUX55o2
 iWxS/Im+VWIdu/aUjJtk9TDzVni2SU1wxoN65QlC60ZgqakMuQgFW+05qhcfxcUyFjx0rWSA7EA
 pP5PqXpA
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68ca9817 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=DHQ_eFf6vkL4qwDZSiYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: DcFFcJxJd0PXiJJ5chVuH9rXlvrmbpgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 12:15 PM, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> The X1E80100 battery management firmware sends a notification with
> code 0x83 when the battery charging state changes, such as switching
> between fast charge, taper charge, end of charge, or any other error
> charging states. The same notification code is used with bit[16] set
> if charging stops due to reaching the charge control end threshold.
> Additionally, a 2-bit value is added in bit[18:17] with the same code
> and used to indicate the charging source capability: a value of 2
> represents a strong charger, 1 is a weak charger, and 0 is no charging
> source. The 3-MSB [18:16] in the notification code is not much useful
> for now, hence just ignore them and trigger a power supply change event
> whenever 0x83 notification code is received. This helps to eliminate the
> unknown notification error messages.

Thank you for explaining the technical background.

Please hit enter somewhere in your commit message, this is a very
long paragraph, making it difficult to read.


I believe this maps to:

0 -> POWER_SUPPLY_CHARGE_TYPE_NONE
1 -> POWER_SUPPLY_CHARGE_TYPE_TRICKLE
2 -> POWER_SUPPLY_CHARGE_TYPE_FAST (or _STANDARD, I see battmgr code
reports them both as 2)

However, we already set it to none/trickle/standard(taper) based on
the usual notifications, so I'm not sure if these are more common or
arrive outside the normal state changes - if so, perhaps we can take
them into account as well?

I think it also warrants a:

Reported-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Konrad

