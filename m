Return-Path: <linux-usb+bounces-12904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFC946989
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2024 13:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296111F21795
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2024 11:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE4514E2E8;
	Sat,  3 Aug 2024 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THo2CXuV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D13E1396
	for <linux-usb@vger.kernel.org>; Sat,  3 Aug 2024 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722685778; cv=none; b=WfcKW21z0onHifiLx538XZN6Vl2VdMa1/Evvdd+WCp4cVuRYSMui9JJcmX/7uhsSc2GqLQ0necfo1f/+sELQFO1rgF7fm9q8WsBgfxWveNWujEartgchrhyvhdHa5XIgJD/Cyre/CRHKS3yXoU54LBy1LFntJ4vr67tqOq3GNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722685778; c=relaxed/simple;
	bh=xChawDyNjps7BwfBiDb3xThISkvg55WURaxCoOEvZrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tebnGjy17cGBotfJgYJwG6cbCTGP9fNLz+XCVp9SRe2UeA6dsLCr9can3euU/CpU0j8Gr3CpkFQ4OwJOQYQj+fE7Xc5+PYquPThnVg6DiUsU1MUMR8PDGRNrYRH4cr1RZ0DtP8VmNeWzpdqzfGr8SD5/am/TEuNWlZOODPkqnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THo2CXuV; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-664ccd158b0so74193507b3.1
        for <linux-usb@vger.kernel.org>; Sat, 03 Aug 2024 04:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722685776; x=1723290576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7aRN7R9twvJ6vd0/Lmm2Qaf7LPNHeebQiNqdE65Cqo4=;
        b=THo2CXuVH7lhs/ZjT37qNgkJqUrQ9liqlE7gY73FccKjCHQd8PerPCaxdA//GgjuHJ
         ZROzr7tVdcXn8LQbV13jwiSTnBPKCvTrc+0xf+/3lXuyVOzJ5/m4J18d/YlxCTw1T1XA
         fwRoCZ0q8d+zLVA9n3+cFaYA5ZFmOQ8XKdE28z77csmIxovYODAy6CfWNMGHGkMY6Dm3
         1Ga3kvAYBIXsXGeFP+OllnYI2Ja6YavwPuA35YlVSoJq/GQWG9EeW9VBQd1goNofo8KH
         6O/qx7e+pOcqqcuXbTLW6/26smD3VDM93mO4hy9pT7ZjtwWE2V5avlk3sqZqEKMLAu4x
         Toaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722685776; x=1723290576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7aRN7R9twvJ6vd0/Lmm2Qaf7LPNHeebQiNqdE65Cqo4=;
        b=WreI0xcjXATsBM/DXnurtIXEQ1ZtKT8fraVTdgJxwHEyvHs3Jl182l94OBBQ4oUkOe
         XAGInPr0qiyyj48yLfhmgu+qrmeprtSmMPQnM6BC0H9LUl43CCgwanzDZoRrFurbKqH7
         ip1db9isR/KjZpeLBDBsttFRZMEvZHMUL09fOnR6fWwbZcShHW6XNgaG2Cxc98FupSlC
         HRdE9lM8n3xF+hXuCLr9yk7uF6FMGTW6KxtyXQJ5jZxstkwyE45o8i5scpFqoDB8yQU/
         Sj4zYSRiv1natxESEokLpq8mkwdPCxHsf9eH6ScaoPFVrDUFbi0kiK5+9WrmUfgh6dqA
         3p9g==
X-Forwarded-Encrypted: i=1; AJvYcCUXdNJS6qJfmevG1fGYNNqlo4hbjAwy+XptcYqQ8jXsgXWyQkkX8PL2F/P6sGz2bNOjBG7ZaQ8UTGx00go5Hjfg84TKsKXOZlGi
X-Gm-Message-State: AOJu0Ywl68zTLLW0S+Gmh4Sg70Q8RnYz2L8r66wzHTwmxYXrsEUJCfKs
	2aX8nrj6FPxpQGGy9ZVaYvGFhq7jfLtrk4FTfHO66RIf+FysJHpDinLmboki
X-Google-Smtp-Source: AGHT+IFklOAqf0FBKdukyrRwiTFm4UJ6AyTUPc3s/44etYkO526PzdD7aiQHl2vx5AED8MisNt9Vnw==
X-Received: by 2002:a05:6902:2702:b0:dff:3028:4631 with SMTP id 3f1490d57ef6-e0bde35d7b1mr7038830276.33.1722685776067;
        Sat, 03 Aug 2024 04:49:36 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.81.65])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7b7654befd3sm2616363a12.85.2024.08.03.04.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Aug 2024 04:49:35 -0700 (PDT)
Message-ID: <4333b4d0-281f-439d-9944-5570cbc4971d@gmail.com>
Date: Sat, 3 Aug 2024 18:49:32 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: add MeiG Smart SRM825L
To: ZHANG Yuntian <yt@radxa.com>, linux-usb@vger.kernel.org
References: <0041DFA5200EFB1B+20240803074619.563116-1-yt@radxa.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <0041DFA5200EFB1B+20240803074619.563116-1-yt@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-08-03 14:46, ZHANG Yuntian wrote:
> Add support for MeiG Smart SRM825L which is based on Qualcomm 315 chip.
> 
> T:  Bus=04 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=2dee ProdID=4d22 Rev= 4.14
> S:  Manufacturer=MEIG
> S:  Product=LTE-A Module
> S:  SerialNumber=6f345e48
> C:* #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=896mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=05(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
> E:  Ad=89(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> 

That ProdID is already used by MeiG SR815 which has the same composition 
but different Protocol values.
Is MeiG really that short of ProductID's that they have to cannibalize 
on an already used one?

lsusb for SR815:

T: Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 2 Spd=5000 MxCh= 0	
D: Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs= 1	
P: Vendor=2dee ProdID=4d22 Rev= 4.14	
S: Manufacturer=MEIG	
S: Product=LTE-A Module	
S: SerialNumber=123456	
C:* #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=896mA	
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)	
E: Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
E: Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)	
E: Ad=83(I) Atr=03(Int.) MxPS= 10 Ivl=32ms	
E: Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
E: Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)	
E: Ad=85(I) Atr=03(Int.) MxPS= 10 Ivl=32ms	
E: Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
E: Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)	
E: Ad=87(I) Atr=03(Int.) MxPS= 10 Ivl=32ms	
E: Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
E: Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)	
E: Ad=05(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
E: Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)	
E: Ad=89(I) Atr=03(Int.) MxPS= 8 Ivl=32ms	
E: Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms	
E: Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms


thanks
Lars



