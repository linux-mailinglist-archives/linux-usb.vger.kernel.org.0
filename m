Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD293CB513
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jul 2021 11:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbhGPJPO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jul 2021 05:15:14 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:55104
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231143AbhGPJPO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jul 2021 05:15:14 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 8F21B408B1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626426738;
        bh=XxeFkpT94fzaqhSrGg614mOHSF8BqPdtoH/zJQ41EJ4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Pq76nxvIq2hFcvQY+SQJDr+Gvcv9UwOuE2M2EaqpYKZmLtgNIAJYn576PRI89JYjy
         NGt+iteD5LfyePmTfrLyW6SPPp6wA9ZcsuVbXyvgGwDLqrE3jeVmuT3r7JB+p/6MfM
         9sc71ZaUdsIFFm7/41sUbUrRtR0Vokh64BFuMHhQVBlCqKqQ0DaedbNg1Tm2vuEiQ8
         pTpALo5LpEelST3WddIOg88YWWcTDdQGidbomTzAzm9/415T002dadAXUrjC95S9g2
         le5UEOb3rrkX1Sr24FC7GCmePLdQQ7ddgbVIlIcqP+ppyXrCAKvdbD8c/XHFWmeqan
         2OAPGVO06fBXA==
Received: by mail-ej1-f72.google.com with SMTP id kf3-20020a17090776c3b0290536d9b62eb6so1959116ejc.2
        for <linux-usb@vger.kernel.org>; Fri, 16 Jul 2021 02:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XxeFkpT94fzaqhSrGg614mOHSF8BqPdtoH/zJQ41EJ4=;
        b=Z9ktYjm3zxBWjqfnj+fmWVVQOsnpEILGnjoYBlwj6X+c9vJ0yhK3jM57VPYqySs9jh
         fQMGVQoPGMGaRw2lmiFQhYbCIJwwYiiJHdQY3bVi9bMVwxkwK0XEZrdshfoDFoxMUf9Z
         own2CKEZC2W0PR4s4eveJUXjqd0Trq7owmSFTuwJogApXy4Z51qfgJHvXgjOTXO8lhgp
         wNRuU00XpDEuMa8/2Lo2RUiq7tU8t5+s1DvQF7YlljMASqyfhrvKgA0XOMRY9lRAC9Kb
         0HmMB9BkHT8j0iqiP26Rb0zGb1V9z83vjE9i0zJtt1wEBkVaECB2sd8gurrXPcnHAurI
         OHVQ==
X-Gm-Message-State: AOAM531yViE7A24tr34ZTqvwmyy699bASP0dSHUgH2o9a2xFCVz1Ry9Y
        fDt82AveqK2m3dINuWFwFz+a8Ty4kXvu7laY45a9ezc2S4yDZfKAUy4MTenEsLtp6RaWtu/7tHZ
        GyqI+gprqKZDqv5XG80IsZJ8v4rf3A9TxWqo0YQ==
X-Received: by 2002:a17:906:ecb3:: with SMTP id qh19mr2748282ejb.113.1626426738229;
        Fri, 16 Jul 2021 02:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaMvFEXXfYpTa3bZrJ+/W4FPiffv73tNzG5zxnfnhbS0r8FmEL83ODvtv5wfqMkygLzhO7Sg==
X-Received: by 2002:a17:906:ecb3:: with SMTP id qh19mr2748267ejb.113.1626426738085;
        Fri, 16 Jul 2021 02:12:18 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d22sm2762654ejj.47.2021.07.16.02.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 02:12:17 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
 <e2fc4d3f-2f64-1d7e-5816-0275da23d6fa@canonical.com>
 <6fb5313e-b2c0-7b3e-84f7-6333216f4292@synopsys.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bb750c51-c01a-fb95-4ad5-2fd3f1c625f9@canonical.com>
Date:   Fri, 16 Jul 2021 11:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6fb5313e-b2c0-7b3e-84f7-6333216f4292@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 16/07/2021 11:07, Minas Harutyunyan wrote:
> Hi Krzysztof,
> 
> On 7/16/2021 12:10 PM, Krzysztof Kozlowski wrote:
>> On 16/07/2021 07:01, Marek Szyprowski wrote:
>>> Commit 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
>>> function.") changed the way the driver handles power down modes in a such
>>> way that it uses clock gating when no other power down mode is available.
>>>
>>> This however doesn't work well on the DWC2 implementation used on the
>>> Samsung SoCs. When a clock gating is enabled, system hangs. It looks that
>>> the proper clock gating requires some additional glue code in the shared
>>> USB2 PHY and/or Samsung glue code for the DWC2. To restore driver
>>> operation on the Samsung SoCs simply skip enabling clock gating mode
>>> until one finds what is really needed to make it working reliably.
>>>
>>> Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.")
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/usb/dwc2/core.h      | 4 ++++
>>>   drivers/usb/dwc2/core_intr.c | 3 ++-
>>>   drivers/usb/dwc2/hcd.c       | 6 ++++--
>>>   drivers/usb/dwc2/params.c    | 1 +
>>>   4 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
> What mean your "Acked-by" tag? Do you want to mention that this commit 
> "Tested-by" or "Reviewed-by" by you?

My "Acked-by" means exactly what Linux process defines:
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L426

Acked-by is neither Tested-by nor Reviewed-by. For the definition
of these other tags, please also see link above.

Best regards,
Krzysztof
