Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA19C41EFA2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 16:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353685AbhJAOjH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Oct 2021 10:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhJAOjH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Oct 2021 10:39:07 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE73FC06177C
        for <linux-usb@vger.kernel.org>; Fri,  1 Oct 2021 07:37:22 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so39897343lfd.12
        for <linux-usb@vger.kernel.org>; Fri, 01 Oct 2021 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVU9fXiM8g1pH7koqYPYX1n75qM66AiSkIRtsIE6Mik=;
        b=rjdp3uSFyx/KPmILmOXA7zcMX2+9jvG1S5UIOIMptwVjPZDLmd2m2GUsZlCHaAW145
         3MAbPK9byBkqxyqigd/bPNlnHnU5aQO3Sb9i4E0G6+8b4lShKSFQ6cOdQ4GBXEx3h4kR
         RexBLqYY+OWrmoGwvKy3/kio2LVbujF88ta8dsAcdGTqnC7YCbpDYLlFYAct6DmFCt5G
         crMGo4xuxnDknabvbiAq5xJJISgd/dp2iZ+4O8nuRqdo59bmmCKL7czZCbXAAQCfu/nd
         GXUzqvgWtpYHJpzlm7ZpLul8ysD3f3vTc5ftQMqnENyFLhXoSleoB35xsL/rwShU4xsu
         mAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVU9fXiM8g1pH7koqYPYX1n75qM66AiSkIRtsIE6Mik=;
        b=KGKH5Q/S3LsG5u28LbGNqmY8bBP1dBeOks1A+geNaiL58MGQfOide0cClC4VmT9vmY
         sB6KXgi05W0bQJ4ej4Qc/1uHSJ/BxNGldRNcrqTf5pC1TlkwMeQqSWr7350D+3nZI7eX
         plzzhGIu3f3a54f+E4t2NYNpTxfOBVI3+MuLL3Kxx4S4TuIy/M6koiMgYNkVd2GSZ05o
         hQ9Ug0SYaJUjTRJDg8lktWfkpC86BA/hcePfIIZJpuIYZLACfwOmslTgZt104PdWxF1B
         4M9DPksHc4Htmhk+T4EYDKMsOP1Ta+9gppAbPwaP3FJ1DsOVaMmpzWf3pS9eCloDBXZF
         t8Gw==
X-Gm-Message-State: AOAM530ief0tDe7xPCF+lQLFOk+3rwpQkN+4jO6Zj0ZgeznENIwmexto
        1YhtRfcCABpjLN0UjUkXbJEkKlKnkDYvd8JLWGR8JA==
X-Google-Smtp-Source: ABdhPJzoa2d4NLaXfyZ7/92L/e88lFw9mt5p0hvXF87bHS92UJ1JIvsfDpz1WLHt81/6+mvdON7qC703SsoiVg2R0Mc=
X-Received: by 2002:a05:6512:3095:: with SMTP id z21mr5857247lfd.167.1633099040779;
 Fri, 01 Oct 2021 07:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 1 Oct 2021 16:36:44 +0200
Message-ID: <CAPDyKFog31OatzU0fHUMfN5FRsX+8Thm8TfipA4QisgFepU+rA@mail.gmail.com>
Subject: Re: [PATCH v13 00/35] NVIDIA Tegra power management patches for 5.16
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>
> All patches in this series are interdependent and should go via Tegra tree.
>
> Changelog:
>
> v13: - Fixed compile-test error reported by build bot by reverting the
>        mmc/ patch to v11. The sdhci_suspend/resume_host() functions aren't
>        available with the disabled CONFIG_PM_SLEEP, some code needs the
>        ifdef.
>
>      - Added last r-b from Rob Herring for the DT patches.
>
>      - Corrected clk/ PM domain-support patch by not using the
>        devm_tegra_core_dev_init_opp_table_common() helper, which I
>        utilized in v12. The clk driver implements its own power domain
>        state syncing and common helper shouldn't be used. This fixes driver
>        probing for some clocks on some devices. It was reported by
>        Svyatoslav Ryhel for PLLE OPP error on T30 Asus Transformer tablet.

Dmitry, I have looked through the series and besides those comments
that I have posted, I have nothing more to add. Overall it looks good
to me.

Kind regards
Uffe
