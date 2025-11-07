Return-Path: <linux-usb+bounces-30193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719BC3F6A7
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 11:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B0373B106E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 10:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7BC30505E;
	Fri,  7 Nov 2025 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HlL5YhZL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6FE3043D6
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511177; cv=none; b=bNP3Zgrh6dyxAlg+VTGy6Pj3CQzEZ8ivKUjXoAfmYdckKSfQHznniIL9PwQMS0PuAga7T04SuuNqwUk+lscUL0b28aPlybTsjCIENKFPY3gtXK5oAdlCNohBBY3Y2GMPBGlEk+IIPsLNP5HmpQ/K4kE1Zrkls37+Sk4lNRp5HfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511177; c=relaxed/simple;
	bh=LGcFhKwNxbTo6FEBaMFoRmwm1H19/gfgfV3Fd7+7fAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cN36vZBcsXmTD+NlJ6chPv+Smw29PPuFLKisL8Uldd0F9NIQGzhr02OfK3xnNNH4v/bjk/lv1vB2anIQgKx0ORaGNY1B5cbOpKD4oSju9Tl6ldLNLeffNcHz916T9DxHOA6JiuaU466fq6DTKP4y8btXEFSbSIz9+75QJbnJcOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HlL5YhZL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47721743fd0so2478785e9.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 02:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762511173; x=1763115973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JLfAqpF7xziLmCEc9gxa6Bh242jm+dSUlXZ1fREtBI=;
        b=HlL5YhZLhR6S0j6f+B3iFOwo5UAYB8ANg/1/ypHnc1o/H52+J6WN8XPRSnx9I/ixtQ
         lsUPPB/548X+yasj+GWHh+S4KuHdziw+G0q+s51iL15qZyikiPZbWa4HKQEhkL5Iy99o
         MaPkUoC9J6OKnGfvIERTGYuwYT1hNi0JMqqJTP+C7w8sdIlazfZ0cBFokhzQt11L/6rZ
         YzVDr9XgN25D7zl20gYhGW0+7L1a1ZpF7PQkttjbd2QCvK2yhH3Z7fw66Zw4fg3phJc8
         +kw6TTZaJp9mqH/AVIA0h8Rbssz+hShfCiB9JH8aqzS4ZKyQVk2aAaSKtoiBn+kQBC1H
         qiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511173; x=1763115973;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JLfAqpF7xziLmCEc9gxa6Bh242jm+dSUlXZ1fREtBI=;
        b=N++rxTzDsNvZ0L6HolbZuLZve6kXO9Fk/jbrKYZl7cjcG+ZtlHVRTKDA9dekA/WxZi
         bcUkecW2xBkm2ujaf95I0/Rkvm6YnGWL/cd9+WlkF04jBzxR686rzfSA1VEtOpu5lpG6
         12p/kvlcdvWaRFA/jd5yo8YF2D9fzr6XXyBYb1CDYq1O0Ggtd+O72vHEaW36FL8i5fi3
         dvYMqRZciL7aepOfZwy3E2kwZLUlP7eyZ1bX55sBN2XcfpEu5zxWIdLIaNaKc+FFsUKq
         82DsZDf7VKf8Jw/USQpT7L/11YNr925/gUdtyRNlw8m73kD5BAXGotwhf+pMzaAe62mi
         umOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK9hYXTOhLzr/liUw1S6sKRnzLNN9MmcZH9S8Tmw3Z6xmSlklJ1//RWiTUpmoafzOsVcizIwNWmQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9oxZSa1v9raeYN29jrgzDM5h7tnX25FFWZoYxSSg5HSAVjRLz
	lerC3ubsAVuKTamxnfQMRsHXHu9IBnQ3bH5eNizvqrE4QE9blvU+8cDuh5LspDWeSTM=
X-Gm-Gg: ASbGncufXmrcJVnnvNl2geXdlBOLO7N1DdLuozAmdwH7BfWd7MOminC2I+NuB5/auiK
	yCuW1kWRcV/dYRbhaPxpTMDMxM4DPs5pXvaaIqVTg5ujx9iBUf9N/2pXgR1OLHaH16+1Gt/jzq9
	9H9yNxFqGDcvZ5eDBJ//jWOAQOSWYUyY6bghe//L4a0pNGWbOfuVoZ9pEFRCN2JQDOZPlljjbaI
	4r3UrSDuYpmKkLGERJIr2r14o0o16jGCMhxVPhLtzxVzn6GgWXUAdM2UT6X3wchovPtKnQY6zvW
	x1HHwWw076wk/pDWbHb7OsxSeFXlwV8CRjdPkYGtIBnQH5nw2PsB2KwWvoFIVfzRo3ijNAXEsgn
	yd1gxjzkbRQ6ugs6NmQAI7sPZqwMBy/XWrvfhGz5LqWKBQz/1Lkbzo1gZjAhNoE16TenlSBIKw2
	A2RE3Tv7Pd
X-Google-Smtp-Source: AGHT+IGbfRm1ylVwr41G5PrCFDvGfnyzEnXmg06azPDzpF/FJaIwBpkNvlqPk8vcllppOjFCA6uh9Q==
X-Received: by 2002:a05:600c:1c9a:b0:45f:2922:2aef with SMTP id 5b1f17b1804b1-4776bcbf80emr28311595e9.28.1762511172761;
        Fri, 07 Nov 2025 02:26:12 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e86fc9sm39128915e9.2.2025.11.07.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:26:12 -0800 (PST)
Message-ID: <5edec052-5e65-4d00-a182-6675ce579be1@tuxon.dev>
Date: Fri, 7 Nov 2025 12:26:11 +0200
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
 <64c74f86-7438-49da-b164-a8a113e47c32@tuxon.dev>
 <CAMuHMdXG8w9jR9gr4av15VT69XNouqys5z4Rxx-nidnvnbN3dA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXG8w9jR9gr4av15VT69XNouqys5z4Rxx-nidnvnbN3dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 11/7/25 10:01, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 6 Nov 2025 at 19:56, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 11/6/25 16:52, Geert Uytterhoeven wrote:
>>> On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
>>>> of the SoC components is turned off, including the USB blocks. On the
>>>> resume path, the reset signal must be de-asserted before applying any
>>>> settings to the USB registers. To handle this properly, call
>>>> reset_control_assert() and reset_control_deassert() during suspend and
>>>> resume, respectively.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>>> --- a/drivers/usb/host/ehci-platform.c
>>>> +++ b/drivers/usb/host/ehci-platform.c
>>>> @@ -454,6 +454,17 @@ static int __maybe_unused ehci_platform_suspend(struct device *dev)
>>>>         if (pdata->power_suspend)
>>>>                 pdata->power_suspend(pdev);
>>>>
>>>> +       ret = reset_control_assert(priv->rsts);
>>>> +       if (ret) {
>>>> +               if (pdata->power_on)
>>>> +                       pdata->power_on(pdev);
>>>> +
>>>> +               ehci_resume(hcd, false);
>>>> +
>>>> +               if (priv->quirk_poll)
>>>> +                       quirk_poll_init(priv);
>>>
>>> I have my doubts about the effectiveness of this "reverse error
>>> handling".  If the reset_control_assert() failed, what are the chances
>>> that the device will actually work after trying to bring it up again?
>>>
>>> Same comment for next patch.
>>
>> I wasn't sure if I should do this revert or not. In my mind, if the reset
>> assert fails, the reset signal is still de-asserted.
> 
> Possibly.  Most reset implementations either cannot fail, or can
> fail due to a timeout.  What state the device is in in case of the latter is
> hard to guess...

In theory there are also failures returned by the subsystem code (e.g. if
reset is shared and its reference counts don't have the proper values, if
not shared and ops->assert is missing).

In case of this particular driver and the ochi-platform one, as the resets
request is done with devm_reset_control_array_get_optional_shared() the
priv->resets is an array and the assert/de-assert is done through
reset_control_array_assert()/reset_control_array_deassert() which, in case
of failures, reverts the assert/de-assert operations. It is true that the
effectiveness of the revert operation is unknown and depends on the HW, but
the subsystem ensures it reverts the previous state in case of failure.

For the case resets is not an array, it is true, it depends on the reset
driver implementation and hardware.

Could you please let me know how would you suggest going forward with the
implementation for the patches in this series?

Thank you,
Claudiu

