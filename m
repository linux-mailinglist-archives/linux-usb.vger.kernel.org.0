Return-Path: <linux-usb+bounces-29565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF08BFFF6A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 10:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E7A11A05470
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 08:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE09301713;
	Thu, 23 Oct 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="n1GsVp6i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837C2FE566
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208695; cv=none; b=EvO+IiOHJyhnr3a4oeKvg7Ujd+Z+RWB2bT5mAmNHrP/mL2WgJpoOvWVWU6PMbaw/ZUS7a3q2m+kJG6bFmhs58NyG/3q7gtSMP+BYeRfRavfZjW1gCp8nJWp6jzQpWVp1wVuUGZr+N0A6FMv0vDYUADvPThu2ejkhdNMFxfu2E+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208695; c=relaxed/simple;
	bh=aFCgRoWn6hr4O8owO6CsgHqO3QDo17jbxuWEH1cK73c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fq+poET1Vw8W5WN8+s6vsTx2U0C/eSTODAIk40GJBXUWAdprBB5t24iRrABS8jjgcEGnJ6agry8nWg++8t78n0qYl0x6LifEO3AriC4YGQR3Epiyjs7SIwm6s1SjOMI2hukgMoDkBWMdQ2JeeCMn0m0xLHAeDmP1qy3NBAGfRW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=n1GsVp6i; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b4736e043f9so107839366b.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761208691; x=1761813491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUt/inqRNvCStH0GgE4cyP1lzFZ0UUVf4yEz/ZUZ2wM=;
        b=n1GsVp6iD2vwk03pMqjHdxS2dgNFtZWO70yeXIRynU2d29NDbHkyKkLvPXGo7R9TfG
         sVUjSRr22oEqvgaXACweSspqcOt37a1NSuUw67PAAQc9apZuCcbUn6CsB+FPvkVTM0VS
         0cZ64oTc0iuqsxaiHPgkf4XyD24TA9ZpMQt4G+8c4kHrmqlto3adbKaAyHC+irkHZWXK
         Hy0C05CklCaOg4/Ki05L08RTojP9Wq+EUoXCaNfaq0OiE9bp7zwCxiqf//w42Ey+IN0G
         SpyBbQTIYs9DnRsForEEiK5ql8EyLoT7ZuPVWtfZXJkgZIjJeCmyV4LZTdc/rX0Sx7jW
         hriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208691; x=1761813491;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUt/inqRNvCStH0GgE4cyP1lzFZ0UUVf4yEz/ZUZ2wM=;
        b=S5iCDDHgaVVWPO+3U7UAcWlp9QZbKhVqBO8T7rXNlAjKsiB4OZbNW+cNiJ2UaMcvNG
         OqXMe39ActPsqKBRSlFwVILU7B4vBODqcpCEbdnhn9t/GmhosT97f1jw3NwvGPUcMwpG
         sUKLUdu8sm8MJrE1L0JhCpI2R8lX38PPoIGPqYRYe+F775lt22UWYI6WqwY7VgVAGiS1
         UeD0C0R2CgyLHIoiFD+g7dgrnPxcp/mFf8phqVWbRgFwCQYFcnvEPZ7mTf0j21Epcziz
         tlw8ZrVCKA/Iuax+0J7opLNk98QdSqAtbo5z9eIJk2VBK7NPXRjgupnAnUQkdp+AZcCQ
         qgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU3Qv3T/VfXxVhY74rbD1wnhb21Nwz4cpkHyBYjJlp44Gh9k/9Olcp676cGtDCaTWdBa3VrUwX3aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw91aHdElxzezmoJhmPiQnN/tbb359Ya3b/vyEW9b1KA8XXvuR4
	vx1ENFW6+4CP+YzGzMaKPMZqrTkDKrSRy898OCokNiYSgpK+jpKkSlocgiLnO4S9c/w=
X-Gm-Gg: ASbGncv8d2mw0mogOOEi0KuJ9mLEkjYruDw3HKL7BLPMC94f6V4Fx4UQEVmDSMbe53h
	JKLc/4gYGWyL3+tGeEqltSir4PC5+aQiAM1brq38wP4Rnucu7tTMjMUQE/A5vpo0QUNgvBxzJ+c
	+h4scswbLADhy/E5uCWrrUZIAo6mS3+Fz235ycM6Es/Euhu77QNzTQkLxRf8wvTtSy5Js9Es3/Z
	aDV+0EltiUhZDo7oT/fDbUiLm6+B+6YAR4N9ZwjdCgqPYaEFZyk3+xbEgJ8mqQrWD5SiqA4ZTXh
	31f9WFq/nEXXQN/xsFwyj021kwPEfpF2FBbZA36p241DB92fl6flGC/jVVKUMRpS1V3y7IKMGkK
	wIYlRqxCEwGgQwdqZjiPiYT1IvX/rUm19WCEi+5V3RfKly2b7o3mucxr4tAeUcObrZXlDDspcRb
	8oFaG5fMtg
X-Google-Smtp-Source: AGHT+IEYctlT509BIkD5r6RIEyIRhDk3R9yLwlPD0q+eO8PeE5EUYZN1xaUEvKp653FWiTfMauLsCA==
X-Received: by 2002:a17:907:7ba7:b0:b3f:f207:b748 with SMTP id a640c23a62f3a-b6471e3c961mr3124511166b.10.1761208690969;
        Thu, 23 Oct 2025 01:38:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511d41a4sm157071566b.9.2025.10.23.01.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:38:10 -0700 (PDT)
Message-ID: <4de8ed54-e850-4685-b486-623a45145ab1@tuxon.dev>
Date: Thu, 23 Oct 2025 11:38:08 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: renesas_usbhs: Fix synchronous external abort on
 unbind
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, kuninori.morimoto.gx@renesas.com,
 geert+renesas@glider.be, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20251022124350.4115552-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWTe8t8O2H+hPU6=WC6V_YGHwTd7sF1htuhX8mVC_fUqA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWTe8t8O2H+hPU6=WC6V_YGHwTd7sF1htuhX8mVC_fUqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 10/23/25 11:07, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, 22 Oct 2025 at 15:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> A synchronous external abort occurs on the Renesas RZ/G3S SoC if unbind is
>> executed after the configuration sequence described above:
> 
> [...]
> 
>> The issue occurs because usbhs_sys_function_pullup(), which accesses the IP
>> registers, is executed after the USBHS clocks have been disabled. The
>> problem is reproducible on the Renesas RZ/G3S SoC starting with the
>> addition of module stop in the clock enable/disable APIs. With module stop
>> functionality enabled, a bus error is expected if a master accesses a
>> module whose clock has been stopped and module stop activated.
>>
>> Disable the IP clocks at the end of remove.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/usb/renesas_usbhs/common.c
>> +++ b/drivers/usb/renesas_usbhs/common.c
>> @@ -813,18 +813,18 @@ static void usbhs_remove(struct platform_device *pdev)
>>
>>         flush_delayed_work(&priv->notify_hotplug_work);
>>
>> -       /* power off */
>> -       if (!usbhs_get_dparam(priv, runtime_pwctrl))
>> -               usbhsc_power_ctrl(priv, 0);
>> -
>> -       pm_runtime_disable(&pdev->dev);
>> -
>>         usbhs_platform_call(priv, hardware_exit, pdev);
>>         usbhsc_clk_put(priv);
> 
> Shouldn't the usbhsc_clk_put() call be moved just before the
> pm_runtime_disable() call, too, cfr. the error path in usbhs_probe()?

You're right! I missed it. Thank you for pointing it.

Claudiu

