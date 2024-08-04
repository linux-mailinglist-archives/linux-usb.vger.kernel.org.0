Return-Path: <linux-usb+bounces-12920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF64946CA9
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 08:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 757B62824C8
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 06:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFDF21103;
	Sun,  4 Aug 2024 06:16:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985010A3D
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 06:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722752184; cv=none; b=A414uYNgsoELUiJRj1rH38MZiYuj6dbiP7DUyGBnxdrX3nAb5D3KpiB3GaRkQI+bFAGfHu3mEY8YRHs3X9swCzE+8573QQdkDPQTjT/vP1DPuauWzhqNh+RRi8NfJxpG6k7tsBfn4CPdVGWfTFZYSzv/UXh27DSewwrZ3Wg3g50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722752184; c=relaxed/simple;
	bh=W6zvdBGcaX5upb1CxEHNRU8rYoZhXOPqYwX/SYt3AXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=kvITxd00g0gahtpxwzzBpM4HU6+vYxWlzCqUuVBiNUd4d51+Kwfupvc1z64FzjIMcvG/zLR+UxaRWzn29Glx3fymiu+dzHiNBdQ8uqYmOzY4pcOyuDpCdpwdgj7tTFe/RYgQ5DP2V+TvTZJDGzsmIPbFbv/BGkQQO3cZbCIYYOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: bizesmtpsz8t1722752152tbn106l
X-QQ-Originating-IP: GASrj9PFvOM7QcwKRD17RmxCl/ADsoFLy8gwvnORosc=
Received: from [192.168.2.20] ( [183.15.206.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Aug 2024 14:15:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9749360959036494741
Message-ID: <42534B0B4B3429F6+e90a78ec-66c1-4688-ac01-ccd465f17c34@radxa.com>
Date: Sun, 4 Aug 2024 14:15:50 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: add MeiG Smart SRM825L
To: Lars Melin <larsm17@gmail.com>
References: <0041DFA5200EFB1B+20240803074619.563116-1-yt@radxa.com>
 <4333b4d0-281f-439d-9944-5570cbc4971d@gmail.com>
Content-Language: en-US
From: ZHANG Yuntian <yt@radxa.com>
Organization: Radxa Computer Co., Ltd
Cc: linux-usb@vger.kernel.org
In-Reply-To: <4333b4d0-281f-439d-9944-5570cbc4971d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1

Hi Lars,

On 2024/8/3 19:49, Lars Melin wrote:
> On 2024-08-03 14:46, ZHANG Yuntian wrote:
>> Add support for MeiG Smart SRM825L which is based on Qualcomm 315 chip.
>>
>> T:  Bus=04 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
>> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
>> P:  Vendor=2dee ProdID=4d22 Rev= 4.14
>> S:  Manufacturer=MEIG
>> S:  Product=LTE-A Module
>> S:  SerialNumber=6f345e48
>> C:* #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=896mA
>> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
>> E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
>> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
>> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
>> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
>> E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
>> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
>> E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
>> E:  Ad=05(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> E:  Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
>> E:  Ad=89(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
>> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
>>
> 
> That ProdID is already used by MeiG SR815 which has the same composition 
> but different Protocol values.
> Is MeiG really that short of ProductID's that they have to cannibalize 
> on an already used one?

Unfortunately I think this is the case. In fact, my initial research is 
actually based on this SRM815 discussion thread:

https://whrl.pl/Rgk1Lv

I'm currently using this exact command sequence (supposedly for SRM815) 
on my OpenWrt router to get the card working. The patch is separately 
tested on a ROCK 4SE since it is easier for me to build Debian kernel 
than OpenWrt kernel.

Here is the ATI output from my card, which confirms that it is indeed a 
different model:

Manufacturer: MEIG INCORPORATED
Model: SRM825L
Revision: SRM825L_6.0.5_EQ100
IMEI: [REDACTED]
+GCAP: +CGSM

I did not add SRM815 support (despite the Protocol values are also 
available on that thread) because I don't have the device to test, and I 
don't know if there are more such devices.

> 
> lsusb for SR815:
> 
> T: Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 2 Spd=5000 MxCh= 0
> D: Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs= 1
> P: Vendor=2dee ProdID=4d22 Rev= 4.14
> S: Manufacturer=MEIG
> S: Product=LTE-A Module
> S: SerialNumber=123456
> C:* #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=896mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
> E: Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E: Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> E: Ad=83(I) Atr=03(Int.) MxPS= 10 Ivl=32ms
> E: Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E: Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> E: Ad=85(I) Atr=03(Int.) MxPS= 10 Ivl=32ms
> E: Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E: Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> E: Ad=87(I) Atr=03(Int.) MxPS= 10 Ivl=32ms
> E: Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E: Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E: Ad=05(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E: Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E: Ad=89(I) Atr=03(Int.) MxPS= 8 Ivl=32ms
> E: Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E: Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> 
> 
> thanks
> Lars
> 
> 
> 

-- 
Best regards,

ZHANG, Yuntian

Operating System Developer
Radxa Computer Co., Ltd
Shenzhen, China

