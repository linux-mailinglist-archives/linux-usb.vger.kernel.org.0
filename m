Return-Path: <linux-usb+bounces-30160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD1C3BF26
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 16:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FEBD1893555
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF283451CD;
	Thu,  6 Nov 2025 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="n6FuvJYS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F313446A2
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441149; cv=none; b=ttlpoEKsYb/YzUYAKj9wiBNi6YVBN2UKbuhrAtV+8G03uqW7Xc5VYM3/bPiBWKH8Iqeyrg2OPZOdOtD1BUy4k8lNTz1lBn7pn6mSI3v6c8zLc0cbDXlVqyla3yoxswjWsfxMyd0PvVdG/K3/lbMbyJq5Lz9dO2QoSFo9pkQ4bCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441149; c=relaxed/simple;
	bh=jRlH1jPcF1waR7uAVHwWqhLwUm4a/DhOStRRSFZCfDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbBm0b/cDrAsS0msS0I3OTVnvZcpuN+oBJeTYYB7ds+nbUXoO7/HJQ+78Skpz/xKRW4jrSc/e24ihAQdlPFgny27gFNxTplBspTAQXU/9kD7AyMUeNRmvkhDk6BWw0Yx57iC1/1eGMYDwIhfbAVSVKdZEIgcR38bUCzpTTZZMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=n6FuvJYS; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-421851bcb25so578927f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762441145; x=1763045945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b626QGmxPl5C2QrlyoCoUJ4MIPcPPxdOo7HYuQFmV1Y=;
        b=n6FuvJYSrqWVO7Wx6N/HwemXMhxj/KMbXqiMl4cd8wx0wbiEhmeGl+s1cdWSanhZrZ
         8ys/KS7Qzmbx+0fNnqggrDCr1HG+f9c36Jr+sdUvYr0A5mE99U235jbH5QOnafEYlW9m
         9fF7+Z14Yz9i7nIc0W6VXSks8cju/CdxLnMy7un4/cFzodWoW3HCkzO0LKUMDsZdyjgQ
         5C4+wU4HR9qZKIee/01/9spvT29S7ez1S+Gv/KHFOETYhZ2FDO1RmOcVXjLN+aBFm/It
         aGYwm9m5P46QSku4yKVka2X/kDIkCkECuhQA9/MTP2W80qOKWUc+lqC/bNAcxxGLOa6e
         umtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441145; x=1763045945;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b626QGmxPl5C2QrlyoCoUJ4MIPcPPxdOo7HYuQFmV1Y=;
        b=LztRekFXdpJ6JP2IuN0EitBv9KZTvDRuI/WIizXwQXu1i6e2TJ9fTY283lYZ2mtH57
         qO2By5goaAnsYtNIHF3vBjOhy0BeO+7JEz62nS+p7nGWD6GaOnnimVCQ1CQN1DasQhE8
         l1w6b4y6tDjYJEID4veE1lIFj1TqXdx5NWcZ9d2kdGduY96vlMJ+UBt8VBTalisyts3r
         HK5V+egahhPmXUEEMnr3cTF0IH/FRtLMGuh3GhQ39n5OB5upe9fd545DONQtibWt6AyP
         m7uLd/8QSERUcgbdBCoaNlt6+zT1e3S1qTLkcynZv1QOu1mytqBiqFbUHKkcGnSc1/h2
         VjAA==
X-Forwarded-Encrypted: i=1; AJvYcCVZiNCC8Qg8Y1tAn2feZH3/D8tigeSUMqnerqicQVl9H+JG8x8kL+gzjvf2natT1SmnKU/7/tD4tmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8JCkFqYNlmqS0Gzh49SBHzrPFezvFTzyM/aONRcUXfFh4J6Yk
	+9s2djjAX/8A8vbrNABXq5bC0WjZb+siDy6pAVfYDxg/hKS6pq5giYcFv6DAjWd4Naw=
X-Gm-Gg: ASbGncuhcnZRrL75unFmyCCdG9XjDE2yjuaazLlP/IhK4+9Ysint7eF9xVOPY5dynBq
	iotgJGCdYTQvm+3YlR88ssJ8PBTt4QwxlduTQ1PtKHHeK7E9PcVUHwr+euaBDW+YgWyWU7yBz+l
	iXMCflq2CqxO826SVzVfzyKby8+kXLo0y2vy3yFRnYpm47J1nKfL1YGiDFOAxCaR9SsxA3Dku+h
	XfevZsskokCJ6Zq45ru8HVonDhEK8XBbFiFPBl0iAqpluMz2u5aC3uL5yRlTEJLpjWOTCFRCSBT
	J34wPmZijypTUpXTCEchoGz7oXgSbmFdngbdhIP8UVRs3lPL0S6kN4eEInjQcqKDxYKmgheT2jK
	5BV2T/SgEq7qvkG3fcYZfIfy/zID8TPTmNSM1OBsGQdiyyVJ5TKle9pe7Td3V10tVvzMw+JC7Ht
	Pbf5gOuFZEELoo7p1c/WM=
X-Google-Smtp-Source: AGHT+IFb2ZH77ClbG1Xsvtkj0gasa0VqifKoeJXf8nrkxhdUagrhEY/I6njHvkpHzuiPm1mVcmqaIA==
X-Received: by 2002:a05:6000:4182:b0:429:cd3f:f43a with SMTP id ffacd0b85a97d-429e32c841amr4419135f8f.7.1762441144704;
        Thu, 06 Nov 2025 06:59:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40375bsm5348089f8f.8.2025.11.06.06.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:59:03 -0800 (PST)
Message-ID: <64c74f86-7438-49da-b164-a8a113e47c32@tuxon.dev>
Date: Thu, 6 Nov 2025 16:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] usb: host: ehci-platform: Call reset assert/deassert
 on suspend/resume
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
 p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, kuninori.morimoto.gx@renesas.com,
 geert+renesas@glider.be, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
 <20251106143625.3050119-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWDGpqdhCsA0MJqoL1JAiyVR-TA2YqDe+-S9Xf6c5O-gA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWDGpqdhCsA0MJqoL1JAiyVR-TA2YqDe+-S9Xf6c5O-gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 11/6/25 16:52, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
>> of the SoC components is turned off, including the USB blocks. On the
>> resume path, the reset signal must be de-asserted before applying any
>> settings to the USB registers. To handle this properly, call
>> reset_control_assert() and reset_control_deassert() during suspend and
>> resume, respectively.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/usb/host/ehci-platform.c
>> +++ b/drivers/usb/host/ehci-platform.c
>> @@ -454,6 +454,17 @@ static int __maybe_unused ehci_platform_suspend(struct device *dev)
>>         if (pdata->power_suspend)
>>                 pdata->power_suspend(pdev);
>>
>> +       ret = reset_control_assert(priv->rsts);
>> +       if (ret) {
>> +               if (pdata->power_on)
>> +                       pdata->power_on(pdev);
>> +
>> +               ehci_resume(hcd, false);
>> +
>> +               if (priv->quirk_poll)
>> +                       quirk_poll_init(priv);
> 
> I have my doubts about the effectiveness of this "reverse error
> handling".  If the reset_control_assert() failed, what are the chances
> that the device will actually work after trying to bring it up again?
> 
> Same comment for next patch.

I wasn't sure if I should do this revert or not. In my mind, if the reset
assert fails, the reset signal is still de-asserted.

Thank you,
Claudiu

> 
>> +       }
>> +
>>         return ret;
>>  }
>>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


