Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A735C33D90C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 17:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238589AbhCPQUz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 12:20:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52909 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238621AbhCPQUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 12:20:52 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lMCR8-0001pk-RR
        for linux-usb@vger.kernel.org; Tue, 16 Mar 2021 16:20:50 +0000
Received: by mail-ej1-f70.google.com with SMTP id rl7so13799092ejb.16
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VknwmHw+mafFAf+N/kI7g0yn7Vs0AliFHe5HjOF0pmE=;
        b=t+YtgifaQSoRgQbhUJ9joGar1lLnVo09oTdGLHdlSMgrTLT+lk3vkY5Cn3pWgQS4H/
         7sL+dvF1EGxlusnIYl84DpfcrodKm3pHsDKfdgBcSVyiJJC3dUEdbsAK5KIFokA/r/y0
         iiotPcSIw8Qc6l3ajNE54ESRBZ/6EQh64Oo40QMKqSVn9BBk0ih81aVPpDFuhvn+xBl3
         6zFyoLG+hMvD2vz5RwhjdxPSj2A/OApM7XTfpk+FJzbCsDZ58XI3zlo0yTpHerlIGzyq
         NKXnf1mh/gO2/07xl2+Mbgs3jezQxIyS1+yUtSmFYRcTfubykgIWF2HX02dGH0jqxIx2
         7TMw==
X-Gm-Message-State: AOAM533aIYW7HPIeHNXfhXoyhe1fEnQnMCipleq5esR9cBBrec84eMtO
        1PyuG6XC+NbpVg3tI0mVLESlXMttpwl2C+iUyWUTNVnL/f5uTMkz5MxGZBzcWXv5gw6zvAMZqDq
        2Uu3J5DCRVgkfoL1KH1dWcS3vs07xJVKSnx9xnw==
X-Received: by 2002:a05:6402:5252:: with SMTP id t18mr23741584edd.258.1615911650617;
        Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpZeCcRfGYZrR3Un/ccY9m3ltyvSDI2VewZd/JxmPKV6ZsHbXKVwP308doM2rw+/5RVmvs2A==
X-Received: by 2002:a05:6402:5252:: with SMTP id t18mr23741572edd.258.1615911650452;
        Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id gj26sm9629395ejb.67.2021.03.16.09.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 09:20:50 -0700 (PDT)
Subject: Re: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
 <0e52e932-e5d7-8116-710a-50956caaf87c@gmail.com>
 <CA+Eumj5c2i30Xh2oBGeR5R_9JkPGiAXRGNYc4hKt9s8XuHjGdA@mail.gmail.com>
 <CA+Eumj4WirHRgr3si=nkQpNdUBcCwqLXvs-ihSi2nuJokxg=Xw@mail.gmail.com>
 <d280c555-5ee4-7803-ada1-88257f809816@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f0fbc7eb-f180-453c-de64-64c3d00958f8@canonical.com>
Date:   Tue, 16 Mar 2021 17:20:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d280c555-5ee4-7803-ada1-88257f809816@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/03/2021 17:14, Dmitry Osipenko wrote:
> 16.03.2021 18:51, Krzysztof Kozlowski пишет:
>>>>
>>>> But if COMMON_CLK is disabled, then include/linux/clk.h provides a stub
>>>> for clk_get_parent(), meaning that MIPS has its own COMMON_CLK, no?
>>>
>>> Hi,
>>>
>>> It depends on the platform. Not all of them implement every clk API,
>>> so you can have failures:
>>> https://lore.kernel.org/lkml/202102170017.MgPVy7aZ-lkp@intel.com/
>>
>> Ah, you mentioned the stub, so let me clarify more. The common clk
>> stubs are not used for cases like !COMMON_CLK && HAVE_LEGACY_CLK (or
>> HAVE_CLK, I don't remember). This is why you can have a MIPS platform
>> defining some of the clock operations thus not using COMMON_CLK at all
>> (and neither the stubs).
> 
> I see now that the stubs depend on CONFIG_HAVE_CLK and not COMMON_CLK,
> thanks.
> 
> This raises question about why those platforms select CONFIG_HAVE_CLK,
> while not implementing it fully. Sounds like a better fix should be to
> add the missing stubs to the MIPS clk implementation, which should avoid
> the need to patch each driver individually.
> 
> https://elixir.bootlin.com/linux/v5.12-rc3/source/arch/mips/ar7/clock.c#L489

If such stubs as pointed by you are accepted, then indeed it would be
better approach.

Best regards,
Krzysztof
