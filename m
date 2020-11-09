Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7B72AB0E1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 06:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgKIFfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 00:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729335AbgKIFfu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 00:35:50 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A375C0617A6
        for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2020 21:35:50 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q5so4068553pfk.6
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2020 21:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IJUnC1qet5XGxBxbk2JzSrwVUK3/0sjfx2cNNTG8d4M=;
        b=LstmlGWFsa5jYxw8Vkksf7r52gSPeNdq2rFCsHGIk3c7l0AwqeEGR2gU2Hu2jp53nQ
         Y9/SJc2XbWbXfLNrk3m8dwkMzOadrr18+gXJf6HMX70IUW4vYncHLxcCR110tbXhs55a
         EQhxbUj76xTKdvrpBlPVjubbEjZl+Y5zbMCqwugKbJnzkoNSIiP+wDGvpyOw7QL37cSI
         4aW76kahFRWDdxouicRCqdqVzxB3wv8Aa83PxGUToWRNF9HLbIG9/Gni9TZvQv8NC382
         ydqorAlKhtADyq79PaRSMdNHK43d74XsaHTphlRarNe6XqB7vDtVzeq4Rj/iiWEks7Q4
         L/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IJUnC1qet5XGxBxbk2JzSrwVUK3/0sjfx2cNNTG8d4M=;
        b=omHSfu2/vduKAVKUev6Ek08LKpcdcAYd4gvY9tbQhYtSraZt4GNG/mZsEnoIYG83W3
         Fj7p+z50RL3ueRE0XmB+WS/CprYZhzVTmrzSa760qqDObH1nXbsNaYSrjYrNr1ubu3Et
         A0b2WOZYdViySlgGUsVNY4Jkj+Q8uiiTTB6s9vhsyzGK7N52tH0MdNrWonyh2z/XAmpw
         Gd7vdgOhYFOeVE7iV1I9cXkvh+eo0+jEtpLIoVl5XRE35pbdKt79Op/f2+tHJcB60DAG
         YTZlTp7g8nWaYocXci3hHw/nLpQm+LEZbdn6/zLtnO5+vhRsy3WxwoYVYgbdOVdYBREM
         9m0w==
X-Gm-Message-State: AOAM530KubpXD3+FJlWzl07ppemYCmsJ+se4XFV+7M1CGs4317t304iH
        EY5mPD38gslKlJPpuHtFhNuPwg==
X-Google-Smtp-Source: ABdhPJyFGt53uc1RwZIWqNmOTufjNhL6TQqNB7dxd3bb+lEFg1bJQu36bKwaT5Mj2KBhPEtooXzYdQ==
X-Received: by 2002:a65:4144:: with SMTP id x4mr11299072pgp.432.1604900149527;
        Sun, 08 Nov 2020 21:35:49 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id e10sm10531236pfl.162.2020.11.08.21.35.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 21:35:48 -0800 (PST)
Date:   Mon, 9 Nov 2020 11:05:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Frank Lee <tiny.windzz@gmail.com>,
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
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        driver-dev <devel@driverdev.osuosl.org>,
        linux-pwm@vger.kernel.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, linux-usb@vger.kernel.org,
        "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
Message-ID: <20201109053546.xupmmsx5qccn46tr@vireshk-i7>
References: <20201104234427.26477-18-digetx@gmail.com>
 <CAOh2x==sy1w7_oEV8=toC6uQnSN44wyOixbP_X0BrMsnm1AUFg@mail.gmail.com>
 <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
 <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
 <20201109051014.oa6bt4g3ctm2hnuy@vireshk-i7>
 <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09-11-20, 08:19, Dmitry Osipenko wrote:
> Thanks, I made it in a different way by simply adding helpers to the
> pm_opp.h which use devm_add_action_or_reset(). This doesn't require to
> add new kernel symbols.

I will prefer to add it in core.c itself, and yes
devm_add_action_or_reset() looks better. But I am still not sure for
which helpers do we need the devm_*() variants, as this is only useful
for non-CPU devices. But if we have users that we can add right now,
why not.

> static inline int devm_pm_opp_of_add_table(struct device *dev)
> {
> 	int err;
> 
> 	err = dev_pm_opp_of_add_table(dev);
> 	if (err)
> 		return err;
> 
> 	err = devm_add_action_or_reset(dev, (void*)dev_pm_opp_remove_table,
> 				       dev);
> 	if (err)
> 		return err;
> 
> 	return 0;
> }

-- 
viresh
