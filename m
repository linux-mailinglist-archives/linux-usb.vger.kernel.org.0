Return-Path: <linux-usb+bounces-20979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B2A4232E
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 15:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8832E1895CC0
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 14:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF67824397B;
	Mon, 24 Feb 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="irli+lCE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7D24634F
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407441; cv=none; b=s5nqmUXybdPlJHMedZ30TJChK99AP6vgkGyVbdYTpZrItf892CzERDH57qyqkuEXsS9NWtruq8CO8sko72fNShcO2v/2JiX4ZQQ0dCWlCpp3nHeq2VN6qZDUTVPS08ZH+DVk/ITRnRc30gV1yAmObOFiaK2UEsNTB0X9CaBEAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407441; c=relaxed/simple;
	bh=A4sO6cN1cpNqJvgaPAPM6bHpcQPbDrtPOMb89oj9Pm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeaTK6s9DAwKGs75lkDViplktJgVSk+dO+iabpvmG+ulOMEtNoR6+E4oR+tpqtX+M2Z6D1K/i116tALz2yg+4YmmjZpaUQ77Skb6joIN2BM04HXZQSX07L2/d5R7r1XQmQuYonTGKEa0yqPgVbGplB5t95onNE3R4WNlsTqeYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=irli+lCE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2586951f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740407437; x=1741012237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cji69n3WY8P4L0jP3m5wYY9M3Sin0x61QBvMV9h4TzY=;
        b=irli+lCEAWS9ghxiU8a5WV1LzzcD2q2FEcRUyaG+SkpyarTws8Nu5h7eZi9foLcfsU
         PsY2nsOJYyDnM0P7TKxWmkMLQfJ6ldnINR8F0YFficriXB1dJeQzk4U/+61fMiOCdzdF
         B4r8v7N523VhvysVjBU/x5AEW9NpEroCja5Pj0fUI6k2gl/sbXmWJ1GVsmrPJ5dmevsA
         BrllEdcZ16gZqwRrguI6f10MrUQsLzZCsaVZ7m1Rz004pT/+vs1sFt7kU9Mglsp+w86z
         lFikmDgqzAgM2acawAXawEKmgvJdS2YvWQqYTJfo0eeUutdCk5pp4pgGEXicoWy6ayB7
         4YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407437; x=1741012237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cji69n3WY8P4L0jP3m5wYY9M3Sin0x61QBvMV9h4TzY=;
        b=OiWwEXWIIPJFLxbZrsiHNlkJ+bQ2UXVSrRbXpLjYiR4j5J9ySZILNFB1gm4fbJTuFL
         uzOvzx4kBxYdSTJzKIY5b/sOGyhXGQ9AhTbCuSqi6+Kn7lAJYt0MseR4TnaFlc1rzG27
         w51zvjxid6d9S1ihLqnZ5PAPTA20W/NaUIG2YxVgPjfK2E+197lQe/UixLhqNYbC4U4Z
         t4lfl+XRj0jnHzZzuit9aiJ7JhTuAslfVUNq0Cin9lBDD/SxNpWwm154Q1sc0PIuSQqg
         EGdc8OWWuTwroy+vPtOVZJkPesb8YVByT7kCQfIyjIRg49ahkD/pLkjlfxpRFrSC/6y1
         ysPw==
X-Forwarded-Encrypted: i=1; AJvYcCXxkNBwRVyF6Ce8dYtdflXhXIt7Rt/nFfBvsgFxA5r5KPwlKFPE81R0mILGO6a0Nn3fIjrwAyFdGwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3S6lTeFf16HVqE+d0gpTTqUtNdIwZRWCK0EP02HAwu3Mvantj
	5tZHXPYAPxDzX2nSUEXTJLrp0XbeMKJjd9C+S3rAR3qOTP9ZwgfUiYV7jKVHDS8=
X-Gm-Gg: ASbGncs2emjC42HbM12W9QYacvDBdXKbjKclrnf24VhREP6PdgytpIqhJtOFGkziXkr
	+fIgDLm6saPKqh3qzxou3cUTkN/VKyZMmq1GZJxWG9HzpX8lJILZNHkFlXyO3QQfZQmrEAOd7JT
	7488YH41T5gyHq4U/5ZD8Vaqod2eO/j/xW4PJH7zkGyXThqyrNjSYx4Bos/t5fto0I4vo8kv6VC
	XewlWU8QpzKwrkGg+wX9smgn/jiru5RoiiiSbcV2lFKw0UcraiAKXbOUbYhDY0iVDu0nBXc0ibb
	yv7QM0chEES2Ylt9pFYR4ogxuvQR6bNpO3W+RIP8ycoUvIbdKAJjNU2zz/kQM5hN3U1rlVoUhQ=
	=
X-Google-Smtp-Source: AGHT+IEC7mdR0hWAg4+Gqbpyo8+1P9D8qUn8hGBjBBnsIrJNrEh/GPTRe144zpuW/58kf6KoAeRu3w==
X-Received: by 2002:a5d:6d85:0:b0:38f:2726:bc0e with SMTP id ffacd0b85a97d-38f6f09750dmr12138802f8f.44.1740407436620;
        Mon, 24 Feb 2025 06:30:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123? ([2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5eeesm32323805f8f.63.2025.02.24.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:30:36 -0800 (PST)
Message-ID: <41849f69-ee2a-4cee-85d8-2d3b0993b907@baylibre.com>
Date: Mon, 24 Feb 2025 15:30:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add ports property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "macpaul@gmail.com" <macpaul@gmail.com>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 =?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
 <Chris-qj.Chen@mediatek.com>, =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?=
 <pablo.sun@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
 <0e58bfb8f2f7b7e83e3da6075986ddbcc84531fc.camel@mediatek.com>
 <fd173075-df66-4ee7-a9fa-07e840976f26@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <fd173075-df66-4ee7-a9fa-07e840976f26@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/02/2025 13:18, AngeloGioacchino Del Regno wrote:
> Il 22/02/25 09:35, Chunfeng Yun (云春峰) ha scritto:
>> On Thu, 2025-02-20 at 22:22 +0800, Macpaul Lin wrote:
>>> Define the ports property in the mediatek,mtu3 device tree binding
>>> schema.
>>> Include definitions for port@0 and port@1, specifying their roles as
>>> High Speed (HS) and Super Speed (SS) data buses, respectively.
>>>
>>> Suggested-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>   .../devicetree/bindings/usb/mediatek,mtu3.yaml       | 12
>>> ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> index d4e187c78a0b..21fc6bbe954f 100644
>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> @@ -155,6 +155,18 @@ properties:
>>>         property is used. See graph.txt
>>>       $ref: /schemas/graph.yaml#/properties/port
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: High Speed (HS) data bus.
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: Super Speed (SS) data bus.
>>> +
>>>     enable-manual-drd:
>>>       $ref: /schemas/types.yaml#/definitions/flag
>>>       description:
>> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
>> Thank you
>>
> 
> Is everyone okay if I pick this (and the XHCI one [1]) in the MediaTek trees?
> 
> This is so that I don't get devicetree warnings when picking the DT patches
> that are adding USB MUX/TCPC to the MediaTek boards.

Sound good to me.
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

