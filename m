Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBC92AB086
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 06:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgKIFMG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 00:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIFMF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 00:12:05 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4434FC0613CF
        for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2020 21:12:05 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c20so6996448pfr.8
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2020 21:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9NivTOlvjK/Ba6sd1R/nO7+Ag7q8swSruWnqhahAopA=;
        b=tp5iGDWUBJG38ehlRwddPMdGWPeEgd/9hxrOkPBXCZ+SO+iKPWOTmiDH+Cwobq6HPT
         7vViE0zYr9ka9ct70t9K8SnqDWzqSZUNXqheS/mqDinvCmYbULlqw2fzNKKZZaDq/JNb
         SWH5tFz0k2jHt20E9oRMK11Ae5ls9HWwjMDNYTyHI5Kbrg2pXvF7zI87YhubQ1EzyJad
         mYObBw7x8IKnecPqF3HhzwVgvVPOJjAHFuR3lQc5Ja5UpKwpy+OW+jfM2KcYeMFpwo6k
         xonZDBUdvpRiXtq7I+1C2kznYzCUVp0KodvX7o2vRCAs/T26JnMogAFl+HGWAbBD7yH/
         NzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=9NivTOlvjK/Ba6sd1R/nO7+Ag7q8swSruWnqhahAopA=;
        b=X81uxCd+6ryFCUAWDXz/wgmREqx9jHhE4Smpc3nb9ag5jomM9kaKkSBUcEF317amKK
         jtniQowbi+JcoPKIE7azBNRsMX86PHLK33mXJclHgeMYUHsee7gRi3Bu5hH8UISZqlKF
         bB8dRbze/hyDrjWqz0NjJufknsdLq7zeyJLaiOEQn0fs2cNLk09hNkXiOWPJf3Py6wEX
         L/G1Aa9wwlfVLLGx7Qd+X0YV8zfWQ6Xt9YnZ8dzhRntoI4/SX0AgAqhmIaDh34V8ltRc
         9ZZOPvgI2gZQcSCm29YydL8oD+1GACmrdWrRZGbm0Ep7h6G6ftpjGsfUITmfKHNEQy62
         xMlQ==
X-Gm-Message-State: AOAM533wFP5tOw9AHkHslsPbTcUSzfIreBGchDppXXqFCnMfDJwFpW2H
        QOowt0QxXgZValOBWoaqS/bTwQ==
X-Google-Smtp-Source: ABdhPJwQdhAu2WnSRc9rOfl6s0FMnSAISb0fkEJE0pdYKUv8rT41JTM2g1xJQDNhC7f/+oC7XdSzGA==
X-Received: by 2002:a17:90a:8086:: with SMTP id c6mr11331387pjn.147.1604898724873;
        Sun, 08 Nov 2020 21:12:04 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id v23sm9687090pfn.141.2020.11.08.21.12.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 21:12:04 -0800 (PST)
Date:   Mon, 9 Nov 2020 10:42:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Chen <Peter.Chen@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201109051202.e4lkosy6kk334akq@vireshk-i7>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <20201109044354.ljd5pomhob6b7u5v@vireshk-i7>
 <713b319e-bb7b-4743-59f0-b9892c3da92d@gmail.com>
 <aba1fcac-74b8-f370-ab45-312975da66e6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aba1fcac-74b8-f370-ab45-312975da66e6@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09-11-20, 08:10, Dmitry Osipenko wrote:
> 09.11.2020 07:47, Dmitry Osipenko пишет:
> > 09.11.2020 07:43, Viresh Kumar пишет:
> >> On 08-11-20, 15:19, Dmitry Osipenko wrote:
> >>> I took a detailed look at the GENPD and tried to implement it. Here is
> >>> what was found:
> >>>
> >>> 1. GENPD framework doesn't aggregate performance requests from the
> >>> attached devices. This means that if deviceA requests performance state
> >>> 10 and then deviceB requests state 3, then framework will set domain's
> >>> state to 3 instead of 10.
> >>
> >> It does. Look at _genpd_reeval_performance_state().
> >>
> > 
> > Thanks, I probably had a bug in the quick prototype and then overlooked
> > that function.
> > 
> 
> If a non-hardware device-tree node is okay to have for the domain, then
> I can try again.
> 
> What I also haven't mentioned is that GENPD adds some extra complexity
> to some drivers (3d, video decoder) because we will need to handle both
> new GENPD and legacy Tegra specific pre-genpd era domains.
> 
> I'm also not exactly sure how the topology of domains should look like
> because Tegra has a power-controller (PMC) which manages power rail of a
> few hardware units. Perhaps it should be
> 
>   device -> PMC domain -> CORE domain
> 
> but not exactly sure for now.

I am also confused on if it should be a domain or regulator, but that
is for Ulf to tell :)

-- 
viresh
