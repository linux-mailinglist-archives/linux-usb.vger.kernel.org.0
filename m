Return-Path: <linux-usb+bounces-3261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C10257F64C9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 18:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE9C281B40
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 17:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AB522319;
	Thu, 23 Nov 2023 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAJJH+EQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F011210C;
	Thu, 23 Nov 2023 09:03:52 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so8583725ad.0;
        Thu, 23 Nov 2023 09:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700759032; x=1701363832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbMWppXTD+nsdKUOaZh98FtIc9qszLByxh/ACBMNxDw=;
        b=fAJJH+EQvYBKs7Dn4R4bvhQUX9TWDvaxT5dBRqdjl32CVzKjyCU3fmUCxGx6TmJX0j
         M2xWY4Vw2w92RWfevjppRO6I0rnTusCKZ9zo2FdQLj8yzh3PyUgyBy+ar2x9XLEOWly2
         C4olphsgKpyWnl7KviQmfqFZYP0CmsifkQTnBlzQroQp1PuzBlk203Z2dPs0ScFkv5r+
         Wg8S0JdtdN00wIzVYBQhRcgu110hlfO+Zn4WPpVbUGz1YeXRfmhtdtXHOtHP/6XoKJwY
         5r9nghGIJxYNuRKMB/TUykCROrRuEIb7OEvn3Yi0UHj1rjPSx2jzB6MwJnHjy5N2j8/k
         0C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759032; x=1701363832;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbMWppXTD+nsdKUOaZh98FtIc9qszLByxh/ACBMNxDw=;
        b=LHQMoFJai+A+v3z00CmBqu9klkXds/AluO37/QaGzfNvVtl0ckjWyE/JZDtfjekthp
         NyMuKqgfrJri7cs0jSnJ8KVRah61ABQvD6ooHlgpMUm3ZGTf+zjwhg0zQJnpXG5h1ck6
         /fK46NFwQPkIG+ASLJUx0fCZOFpz/RfKh1I9draTp3LnRPMZ/jkFu2ywPca4NqdOyj+G
         l2Ca+8UTeFvI1grtvP64mo8OecOIEvwE5oGqtlYShLocHy3Fa65AALq3Hp9Lso70eE++
         9ijeV3H+Ouwt2btUa0t3D3cSoGaiFdgtI7pdETWCoqjKIa88JGymuCOQS/eaxtpAkrbv
         5wRA==
X-Gm-Message-State: AOJu0Yw7ry9l/cyPSJi7WKQpEMWFHklFd4ZWgC48K0z3/Aj05nLCZj47
	RiMfhYeBz1m8lQwb1VjWdRbUmCcOMgkeuQr8hT0=
X-Google-Smtp-Source: AGHT+IFfyVTA3vy3ecbuVRECRZ8aluhOsMoEBn+3dPDQSaWiezt6PPtBA1pZjl2ZSvWn6CSr5DOHTQ==
X-Received: by 2002:a17:902:7483:b0:1cf:7df0:667f with SMTP id h3-20020a170902748300b001cf7df0667fmr92476pll.44.1700759031716;
        Thu, 23 Nov 2023 09:03:51 -0800 (PST)
Received: from [172.24.5.154] ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902c65100b001cc8cf4ad14sm1583799pls.142.2023.11.23.09.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 09:03:50 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <921fc036-7ebb-43cf-b4a3-de7a7c993bbf@gmail.com>
Date: Fri, 24 Nov 2023 01:03:46 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: option: add Luat Air72*U series products
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yangyu Chen <cyy@cyyself.name>
References: <20231122141803.82844-1-SpriteOvO@gmail.com>
 <ZV9BaBBrn78i0x64@hovoldconsulting.com>
Content-Language: en-US
In-Reply-To: <ZV9BaBBrn78i0x64@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

If#= 2: AT
If#= 3: PPP + AT
If#= 4: Debug

Reference from the device documentation:
https://doc.openluat.com/wiki/21?wiki_page_id=2501

Should I send a v3 to include the serial interfaces information in the 
git message? This is my first time sending a patch to the kernel, please 
forgive me for not being particularly sure of the process.

Thanks,

On 11/23/23 20:11, Johan Hovold wrote:
> On Wed, Nov 22, 2023 at 10:18:03PM +0800, Asuna Yang wrote:
>> Update the USB serial option driver support for Luat Air72*U series
>> products.
>>
>> ID 1782:4e00 Spreadtrum Communications Inc. UNISOC-8910
>>
>> T: Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 13 Spd=480 MxCh= 0
>> D: Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs= 1
>> P: Vendor=1782 ProdID=4e00 Rev=00.00
>> S: Manufacturer=UNISOC
>> S: Product=UNISOC-8910
>> C: #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=400mA
>> I: If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
>> E: Ad=82(I) Atr=03(Int.) MxPS= 8 Ivl=4096ms
>> I: If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
>> E: Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> E: Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> I: If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
>> E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> E: Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> I: If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
>> E: Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> E: Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> I: If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
>> E: Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>> E: Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
>>
>> Co-developed-by: Yangyu Chen <cyy@cyyself.name>
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
> Thanks for the v2.
>
> Can you say something about what the three serial interfaces are used
> for (and which is which)?
>
> Johan

