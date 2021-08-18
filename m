Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A853EF9B0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 06:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237728AbhHRExp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 00:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbhHRExo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 00:53:44 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF3AC061796
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 21:53:10 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y11so914887pfl.13
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 21:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kgo3ZwF8d7W983KtizalzC2ru/H2SpB8LzsDQMLtI5c=;
        b=X1QQTCYEVSdpcv7LPo5DMu5ThQZHRIN1vUWMb/xPREu32xkehgWsrv/Uo6unkDbF4G
         AoDyB6fSRBBNuzc/D7jqakJbtjjF5e+sVAqA9zK2BFKOLs/SwJUQpYjA0HGspNF0+msz
         Uhn8+rb+9Ssd6W+bxIsn3Ox7Kh+/mgbFClTQ0gwAHdQ6KDjWDqoh4HodnaZ5OMyBTCce
         SeZwC527t8OK35PgyHP2RAMN9FyTt5uTW9EgE8CEyWj3oORLtmuKDR7Uu54Exp/kDsIh
         ZevMl3yzOgovs9Qq8xVzo0escEqP8KWDhHlK6OTdbyMg2H9X29vdHPjqwD56DIVdFe+l
         SCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kgo3ZwF8d7W983KtizalzC2ru/H2SpB8LzsDQMLtI5c=;
        b=dBN52W89b64P6yKZbLlnH4vkGji88cSY5M28HpsNb3ohmBFfoeXiHNqdp2BXNLlgaf
         QVVEpCqctYmu8Du8x/p2k4LGMetYCxPdBbc1wrhGavWDpfFNH9uDjqjwKxcxTF6tuxKF
         wxNVT5co87gxbezMO28+JGzH6a3oBz+c6icw85b0S7ok0mAhii4lPGoIPaT7x+ihSNzE
         GvmA+QXWkSoLITyEyhyE4vwQR8tgDh9KUO3Uym+U3/auXwv9vrlf8oPUxlTCVc2lrekI
         9KWP/v/iRPE9Gg1c63q72oUjyIj6UJ0i/TH7V/IXJlrVF7fZ7eSNrJUEwp+MWVJHRtrQ
         TC3A==
X-Gm-Message-State: AOAM532ShXpziqPYN1h/bk10VIy0RkLpQLuD33nICUiblEIRmJ4LKRAt
        6ZRZUaYLFG3zrfnxxGDS1/xXCw==
X-Google-Smtp-Source: ABdhPJzwiLUKe1Kt++F6gvgGbPK1s/bs6166Bxm5seAYHtcHQUq24Xe4cVB15wUgeXiCsrvDZou4sg==
X-Received: by 2002:aa7:8c14:0:b029:3e0:235a:5d58 with SMTP id c20-20020aa78c140000b02903e0235a5d58mr7255693pfd.57.1629262389909;
        Tue, 17 Aug 2021 21:53:09 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id fu10sm3555274pjb.8.2021.08.17.21.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 21:53:09 -0700 (PDT)
Date:   Wed, 18 Aug 2021 10:23:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818045307.4brb6cafkh3adjth@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18-08-21, 07:37, Dmitry Osipenko wrote:
> This will set voltage level without having an actively used hardware.
> Take a 3d driver for example, if you set the rate on probe and
> rpm-resume will never be called, then the voltage will be set high,
> while hardware is kept suspended if userspace will never wake it up by
> executing a 3d job.

What exactly are we looking to achieve with this stuff ? Cache the
current performance state with genpd (based on the state bootloader's
has set) ?

Or anything else as well ?

-- 
viresh
