Return-Path: <linux-usb+bounces-21523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51292A57985
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 10:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44FFB3B4507
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 09:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC8B1AF0C1;
	Sat,  8 Mar 2025 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE84SUkc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2DF19EEBD
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741426495; cv=none; b=YzNwpbltkF5gH1KJwykmpASqOBfgejr4WmtnxWWkf0vU+xaVA7FlWfndYHIXZLBloGO/CVNO6NQqGgrNRvWOPGMSa4KazVboB8XKxZA6V3nTCTwcY6UDTzffhwSr+5Ui9K83JJgHI9W8QRXRV6OvcL7fWm95Od0MUBD5TKQwhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741426495; c=relaxed/simple;
	bh=NHC7RP2GbKdwTiWHGO8lLwZWIfTS4uViaABUpCOl+2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWNZS5jv1A4OUcY1aHoWDCG8c4Wkk+wI+/x+1bWJbmiYoAKQVrgq+3DL7TS4ADywwCJI6p3YOj4CSP+xgRTgQDaVin7Ys0jFVymZAL7D8U/PlrxS+efn5vT7Uin9LFtW/5i7syi8qpfgZ6McYBE5ZqIbCCgGVsKwwNeWqjG505I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE84SUkc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5285ubEV003692
	for <linux-usb@vger.kernel.org>; Sat, 8 Mar 2025 09:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2D2hEuOwQrEqYMvC2ATnO4j/VTIi52LI14hMdCpxT/w=; b=eE84SUkc6CSFHZFb
	YlR/83jsDZ6y8lpInTcNDS9umqGI476vp4Bf0sfLmP+hsK3D4SD5zloIf2owaxC4
	00z+cD0toWBiUEM5XTSive0iKfi2F5AIB0P+opuqoyGo7ye54QKmAWFnDWpqTDzk
	m6bvl/AlIiLUU8rTjU95XjfuiDxPtR8GvRxIqKRePDlArPL3SisDtFaqGalz0S5L
	BkTkrg+LEFE7TWMEvbhh0hNfvl2tHzPAgyC9l1gXce8JwlOb05z/j65fgJ1SlkIz
	O6U6Km+E89+bh+EjZv++nexDO02y8X5FAZeeB5Qv0i9E+kVaq630kTDo4y5vgLit
	8lGuMA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpgb8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 09:34:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so5405306d6.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Mar 2025 01:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741426490; x=1742031290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2D2hEuOwQrEqYMvC2ATnO4j/VTIi52LI14hMdCpxT/w=;
        b=StyTtzgvou9/0fFEX3+3TR2sCPF3UsnfU2XWaHr+YmtonoPIhsi8/tD1TO0bDr5H8z
         DCpiSnkXJC0ualnmUGSb5ZGIu+POcM8cUYwWXEzu4DqC+Rj0AMLFf1eIZ1y2zsxejsyR
         qAEec4b1ui8C875CUZSF1ESxLyPFizX2t4mIviiionfIfsdnuWcFTBo729yknTuITeiB
         82dqyZs/xsH3FswNVP+RcxvOnw6X1zBtE5Yw3FESocJE48FQeraMSzo2MXFom7DwNHcY
         kSBr+wrUzn9Fg+z9+/6JfAN/CsdI3vaFcNVlCSc3CIXITONSsDqSiP25N5ob/odWv0UJ
         7N5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdUv8hi0scPhiwxh+DH/aL/l4BOoLQqD0qGqQXRaQlnCjolmIaFuFUdj6Id63OLw+Mv/yS2fYBBQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBazLuWT/7HDIrKgRbaxZyEqbHm1uJc6AQNXEpPOy/b4fHEjRk
	GE2f1AQwvVMI9F/hygjBSfi5Sx7Eo0kk1C9uGq/uVWDu0l8owj5SFEXsV1Qj56RoNz4jYaD08t3
	kWKIdAMMs+FmiVt/NZE+C0BHquWtCkf14NO17/eOlHi3rEF3SAbHXsCSNGOA=
X-Gm-Gg: ASbGncsvslyMSvUrBdZnGm4CPJeIK6RbvuFy15WuMZ1D70jBQnMwCBrHl38CFcx0HAw
	sZm87aAmGG6AjcnVmrn4AQQ1VKjU8xa5d3zSpjeZkbQzSFFOgLyOkSD9DaH+0hpMrBcHlYKAlqV
	zIfWEFfBAXDptvYllzFg25e2ruoEOnXLOdrcOwn7cNlixJ2xZsE2qqcUucjzGUxYX/iaCOccrvo
	bplvC9liwvnBZB5oFaV0klXF8hPcHEzNqZZM/MiEUTDvx19W+qsDfkpCgqLzCaurwURPaGCmbXJ
	cT1L1NMy1onqna6XXIGdq03I0WuhjsTRg1TJHCw9IzcFl3196mCoJN46PnbuJfBKaBMFiA==
X-Received: by 2002:a05:622a:11d0:b0:472:15be:54ad with SMTP id d75a77b69052e-47666fb5b2dmr10258801cf.14.1741426490133;
        Sat, 08 Mar 2025 01:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSQHbt0IYdZtC+FufjOVfWZsEqsYNhC+Fq/qSDVU1/CY2UA/2XqPrSX1GmY+54b8CpLYzCbg==
X-Received: by 2002:a05:622a:11d0:b0:472:15be:54ad with SMTP id d75a77b69052e-47666fb5b2dmr10258751cf.14.1741426489676;
        Sat, 08 Mar 2025 01:34:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239485bf3sm413325166b.63.2025.03.08.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 01:34:49 -0800 (PST)
Message-ID: <0401fdf9-7665-40d6-9ec7-7222b2eda866@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 10:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] usb: common: usb-conn-gpio: switch psy_cfg from
 of_node to fwnode
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Samuel Holland <samuel@sholland.org>,
        David Lechner <david@lechnology.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Purism Kernel Team <kernel@puri.sm>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250225-psy-core-convert-to-fwnode-v1-0-d5e4369936bb@collabora.com>
 <20250225-psy-core-convert-to-fwnode-v1-3-d5e4369936bb@collabora.com>
 <2025022542-recital-ebony-d9b5@gregkh>
 <lhtljyn52wkhotaf2cn6fcj2vqx3dzipv2663kzwtw2tjjlxye@5l3xytkyvocy>
 <2025030845-pectin-facility-a474@gregkh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2025030845-pectin-facility-a474@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Jr6BrCm9qT_AmyfLeR9K_PZ8IVkO4qiG
X-Proofpoint-ORIG-GUID: Jr6BrCm9qT_AmyfLeR9K_PZ8IVkO4qiG
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cc0f3b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QX4gbG5DAAAA:8 a=ag1SF4gXAAAA:8 a=vjfVVXfxOX9NMr4QhcAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=989 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080067

On 8.03.2025 6:57 AM, Greg Kroah-Hartman wrote:
> On Sat, Mar 08, 2025 at 02:10:29AM +0100, Sebastian Reichel wrote:
>> Hello Greg,
>>
>> On Tue, Feb 25, 2025 at 04:32:50AM +0100, Greg Kroah-Hartman wrote:
>>> On Tue, Feb 25, 2025 at 12:21:36AM +0100, Sebastian Reichel wrote:
>>>> In order to remove .of_node from the power_supply_config struct,
>>>> use .fwnode instead.
>>>>
>>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>> ---
>>>>  drivers/usb/common/usb-conn-gpio.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
>>>> index aa710b50791b0282be0a6a26cffdd981b794acaa..1e36be2a28fd5ca5e1495b7923e4d3e25d7cedef 100644
>>>> --- a/drivers/usb/common/usb-conn-gpio.c
>>>> +++ b/drivers/usb/common/usb-conn-gpio.c
>>>> @@ -158,7 +158,7 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
>>>>  	struct device *dev = info->dev;
>>>>  	struct power_supply_desc *desc = &info->desc;
>>>>  	struct power_supply_config cfg = {
>>>> -		.of_node = dev->of_node,
>>>> +		.fwnode = dev_fwnode(dev),
>>>>  	};
>>>>  
>>>>  	desc->name = "usb-charger";
>>>>
>>>> -- 
>>>> 2.47.2
>>>
>>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> Please just merge this patch through the USB tree.
>>
>> There are no dependencies and I will send a new version for the
>> later patches, but they won't make it to 6.15 as I want enough
>> time in linux-next for them. This patch is rather simple and
>> getting it merged now means we avoid immutable branches or
>> merging through the wrong tree in the 6.16 cycle.
> 
> Attempting to merge a single patch out of a series is hard with our
> current tools, you know that.  Please resend just the single patch if
> you want that applied.

b4 shazam <msgid> -P 3

to apply the third patch (such as this one) in a thread

unless you use some other set of tools..

Konrad

