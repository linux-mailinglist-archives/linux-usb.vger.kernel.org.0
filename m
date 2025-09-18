Return-Path: <linux-usb+bounces-28248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9EB82996
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 04:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8AAB188D3B5
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 02:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC486214A79;
	Thu, 18 Sep 2025 02:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="brPPoXq0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FE2629D
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160896; cv=none; b=qjwAqcHBastcTRhyHMR/S8G8hfDLuGhuw98pXhUdps9/jcijfKr5zDWPW/SSKgzCLEWTZaBhrS7PMTLaClaJbxej0u673Coo0U8E/3UdgvqnBwYkxvu0uGbytWWZMT+N2qMrYzjr7eCRsChN/Ha5AzSqB5lr2p4pnfofGy6Gicw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160896; c=relaxed/simple;
	bh=SBfy2aw9l6QAYSPL+WFnY56ROXf3Voafn/xHOw0URfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCHKMPdSmNYfq+PTWUSOSDBAr5mYcgGmY669n07fMaYx/leaz421DoE1YVrNjsdPViyVNKjq453Zi8GSyJcWuZD9b//h/GKZkdFpyh9VGB9GrHomjWnMvFYjUtrTBFRtS33n93SNIsqH0xZQDvsrvbCYkgQcw8dpCGjHmnjoeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=brPPoXq0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGYfOt029526
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eb6fb+UFN97UGMhPu3oieNOs4MieyvfsC2uXdQt5UHU=; b=brPPoXq011Xz7v0W
	Z7MEOuMLXKxd7tIuEU8x7Hsy2PVC9+ToyER8DPumFqmbYCl8hIAcPPJczRWb6+90
	6lXn9cnrIOwhPFsUpXkRwiR8oJ1gYki1NnqrYekjCeeDeNkrfrKcwrXdTlGpzgVn
	ABb46/ZaHVbrCEsPDE+PhmWGjdtuKr7zv080lBNLS6X/3/x6SiwtLop5reKOXmQM
	4TEhevZWhLy0rGfwm/ZH/FUWrZbRvR1lSSi+vXKRgtp71RgFmyUNUDyZPTM9Vggi
	L9ZofDgB8tXTCBIJknApxw2HnFnuciLYF2hbP14yTvyOmYNxnDcfTNz9wr7Dtpz4
	SmPJXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0vgsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:01:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77cd58a9939so419680b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 19:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758160893; x=1758765693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eb6fb+UFN97UGMhPu3oieNOs4MieyvfsC2uXdQt5UHU=;
        b=C11iLlMViFGcITIZt3FugQejPVrSElbAVJPZ9W/Wc3eOonGHBxTKm0NUclpJxpD9oY
         ViSPHc17ijML05u2bn4QTXpHytYSJQzZ7E/va6yYi5JKG46UTG4/AHA+Eq+S6uL53q4G
         TTiJvBh4E5AJ/r/oytjGFgnvJoxe91SIzB3XyZF2+jaLJUJtsFkRRYVkS45V62QdmtGT
         r70bWS1W+cKwFivP6240VDaQ/dW0FJfPGDelONbFLBJvbi0qrP7p30oyxhsKQS70dsf2
         2TXvU3OxTlF20Xy1TGyXQJfTBOvPNhCkpTCR/nkHUUJ9cH0exdQ3PcNZs3itsHYiSw4v
         IZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTGtJOfKEG0lvQkqIY5wiyOnnIoOuq4uoVoQtYp8TssI8tyu5t6Wy0Fd1BfY54tXQMBWDtrbV4L3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAKfBXCCzm4cZNsMPXxzvxJsHmiV6oHNYEiG/4AgcQ9LFpswDz
	wKl8vsKK49CCZ2/dHz8ISXt4Al5zSR/CYeUrnehjtEzY8S/XiTCa29MVADwXoF0fSzn2rLE251c
	A0VQ3G1S7UrJ0mXffOBWouywh1Bzw6w8tqyU6bSMIR4H3Rk6mC0cSwpRArVeM86U=
X-Gm-Gg: ASbGnctLhCF0ALPAdpZ5uHkwfMH42cc85nDMfdWN9bQRqj5Cv0U64bCIKXuizUWpebS
	X1QVKSzrowYGThVWXHuD85cAsj1BLps1BJh2Danbo2D2wN7DjteW7UNb/0aaLH+jYP5VwcKSgFn
	43Wcb3atqp3rx7/opNlLwI5zdw/dNVHKVi9xl4LU2AbkXGG71kX5Ojqv4sLTBFlY76EA3v71ndZ
	79YstYCwxBCFpuUsl4uHxomr3xf+3a9IE+Z8xQFMF5AYbWP320MjgPiZdeu5sU7ZRJ5wexTvPVN
	9DJzeUtVuZ6b9a/UplsvRNKkMBP+QOW6kze7+JP/W4fRA6ZXPuShIIOCCZeokpj0Xg==
X-Received: by 2002:a05:6a00:3a1d:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-77ce08f3559mr2056192b3a.6.1758160892866;
        Wed, 17 Sep 2025 19:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzPSMD+5HGPO/cxrBCgCsxRrR2tgIDSepWt3elrwuhXweOPyoaFCCEh+2YZA14TET9o4YWpg==
X-Received: by 2002:a05:6a00:3a1d:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-77ce08f3559mr2056145b3a.6.1758160892313;
        Wed, 17 Sep 2025 19:01:32 -0700 (PDT)
Received: from [10.239.30.180] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc24b4f6sm703065b3a.37.2025.09.17.19.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 19:01:31 -0700 (PDT)
Message-ID: <d9db8b82-9000-478b-a7b5-93792f1e1bea@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:01:24 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] power: supply: qcom_battmgr: handle charging state
 change notifications
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
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
 <fa258ad4-1efa-4fe8-9636-d70c5ea9c8e1@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <fa258ad4-1efa-4fe8-9636-d70c5ea9c8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ymKqthTwYIZdbZ3Lt2hu4yTcyrniTKCy
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cb67fd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8
 a=0T6ucZLnF1w6DCYMrR4A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ymKqthTwYIZdbZ3Lt2hu4yTcyrniTKCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8USQD1G53deo
 aUDggoPN7/HebW/fBND2jtL92tepedUn4jr9BZ5ZVVv2wEycBtedpDAc9rH/GgOE58rP/UgWdOr
 noHvRpX9KseVHXctT4Cd9ZmD0xbOvNjq4AutBncCFuR45/VKoGS5GFmUhdxTCCsK/BDPhO/jatD
 q22nFXLoKLYA8NWNq2k44CfsGjmgzwlTEBwztPvCV33XAdNL/dc6PK5qW3VUDwFFh1GW2uTfXke
 nM0Bs5Hy+pfApbjhpJgarEdBySHF9UYTky5TcpFfDbhcpBsMHUs5sIjmy3AYOJZQI7c4ys7H2B9
 Mo8dv6qHbK3APBevd29qma3HVPKD6HG8/qIHUol8YIeEw3h+s9GWLElI20JwH9w/A722xbmmf2k
 Nle6Vkhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/17/2025 7:14 PM, Konrad Dybcio wrote:
> On 9/17/25 12:15 PM, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> The X1E80100 battery management firmware sends a notification with
>> code 0x83 when the battery charging state changes, such as switching
>> between fast charge, taper charge, end of charge, or any other error
>> charging states. The same notification code is used with bit[16] set
>> if charging stops due to reaching the charge control end threshold.
>> Additionally, a 2-bit value is added in bit[18:17] with the same code
>> and used to indicate the charging source capability: a value of 2
>> represents a strong charger, 1 is a weak charger, and 0 is no charging
>> source. The 3-MSB [18:16] in the notification code is not much useful
>> for now, hence just ignore them and trigger a power supply change event
>> whenever 0x83 notification code is received. This helps to eliminate the
>> unknown notification error messages.
> Thank you for explaining the technical background.
>
> Please hit enter somewhere in your commit message, this is a very
> long paragraph, making it difficult to read.
I just realized I made a mistake on the bit position, it should be 
bit[8] for reaching to the charge control threshold, bit[10:9] for 
charging source capability. I don't know what I was thinking when 
writing the commit text :(. I will correct them in the next patch.
>
> I believe this maps to:
>
> 0 -> POWER_SUPPLY_CHARGE_TYPE_NONE
> 1 -> POWER_SUPPLY_CHARGE_TYPE_TRICKLE
> 2 -> POWER_SUPPLY_CHARGE_TYPE_FAST (or _STANDARD, I see battmgr code
> reports them both as 2)
>
> However, we already set it to none/trickle/standard(taper) based on
> the usual notifications, so I'm not sure if these are more common or
> arrive outside the normal state changes - if so, perhaps we can take
> them into account as well?

This is not related with the real charging status. I double checked in 
the battery management firmware, it is checking the charging source 
power capability by multiplying maximum voltage and current reading from 
the PDOs. Any charger adapter with a maximum power below 60W is 
identified as a slow/weak charger.

>
> I think it also warrants a:
>
> Reported-by: Sebastian Reichel <sebastian.reichel@collabora.com>
ACK
> Konrad

