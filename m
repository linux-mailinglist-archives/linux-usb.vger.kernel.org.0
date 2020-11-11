Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA98E2AEFC6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 12:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgKKLjI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 06:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgKKLjC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 06:39:02 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61D0C0617A7
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2020 03:39:01 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id 128so967678vso.7
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2020 03:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T0V5oiWQkvHXwmhtDU+OoF9iMxPj6y0LTly2Lqt4DuE=;
        b=eHuOUIaS6IQ/Oqu0OgOBN3unkL3XIi+Fk4dITGJA16P8o+NlqUHYybky26m5NVdFR3
         nEj77IcCvuVVn+06U+bT8lGz7uajjKyyW7FwNmgKPtbnVhkVbc/cbaQN9K5iNZEDqwN8
         nVQaDyp75O3xA21xpf2HF2/4nmB5ZZWZ4qIBAUAFOV005XJOvP7dFdsSa13fRian8kWs
         nlTaeO+OWJaahsba2PoUYHfcaaNFyOAgkVI/2smnCnTClDA1XqlICigzABWFlOngodfE
         4zfFtHsuUV8spOrU42OjsyzgiiWT7pqurb12j6T+fkPcno/GvbG0zKznsHZsamzHUppY
         mnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T0V5oiWQkvHXwmhtDU+OoF9iMxPj6y0LTly2Lqt4DuE=;
        b=srjnBbK+ZjKJO2ZVJWJnG9bXfy0JUY77PXjJ6HZVxR07hzS0lZmmcVPiZNy5lx9InW
         BouB5kAC1a9+RCCjT3lRB3cf7mUwzKLv4rA6osiyLkvd0OgMkkK/hzJ29WpWMGqAGFHy
         REZsZ1o15r5vNrnbgvufchHB9/iqLwLBriZVX0zVNhYvzV1rEOVc1Ei8EB08NQE1p4Nz
         mCKfJs3ai67aOjAwuEaYpvsRgjQ73WrZJ1wcibhiuDWIdzRq5u7TcK/28dID4ViqOiiM
         IxuSuIs4Qk6hG5Bep4UCBfA2i7GjqpT/m00IiSKTfHilwc99jEUZqvQr0ywJsKHgz8O1
         BbNw==
X-Gm-Message-State: AOAM531DaqQT3AMQPdxqI4IdJdTWgGCM1oR/16WHZgiGAtiBv+w+69Ty
        xKnt6DA2Ib82N221GoqmD5ZCsc3vDK5dtHTcz/BKrQ==
X-Google-Smtp-Source: ABdhPJycXgZgkNrggh2D47nvGhRFVQi/de+PIfj6XhXa1n8Wfiv9NfQ9xufbyRB0WVwWMZQ6Ct+Whjrl/7D/IIfrgqM=
X-Received: by 2002:a67:f417:: with SMTP id p23mr14435741vsn.42.1605094740774;
 Wed, 11 Nov 2020 03:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com> <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com> <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
In-Reply-To: <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Nov 2020 12:38:23 +0100
Message-ID: <CAPDyKFqUMsH9dCZ=OYqfdLt==+-8NjK9n=S5jGGNXZu6Y9q=2w@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 8 Nov 2020 at 13:19, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 05.11.2020 18:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 05.11.2020 12:45, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > ...
> >> I need some more time to review this, but just a quick check found a
> >> few potential issues...
> >
> > Thank you for starting the review! I'm pretty sure it will take a coupl=
e
> > revisions until all the questions will be resolved :)
> >
> >> The "core-supply", that you specify as a regulator for each
> >> controller's device node, is not the way we describe power domains.
> >> Instead, it seems like you should register a power-domain provider
> >> (with the help of genpd) and implement the ->set_performance_state()
> >> callback for it. Each device node should then be hooked up to this
> >> power-domain, rather than to a "core-supply". For DT bindings, please
> >> have a look at Documentation/devicetree/bindings/power/power-domain.ya=
ml
> >> and Documentation/devicetree/bindings/power/power_domain.txt.
> >>
> >> In regards to the "sync state" problem (preventing to change
> >> performance states until all consumers have been attached), this can
> >> then be managed by the genpd provider driver instead.
> >
> > I'll need to take a closer look at GENPD, thank you for the suggestion.
> >
> > Sounds like a software GENPD driver which manages clocks and voltages
> > could be a good idea, but it also could be an unnecessary
> > over-engineering. Let's see..
> >
>
> Hello Ulf and all,
>
> I took a detailed look at the GENPD and tried to implement it. Here is
> what was found:
>
> 1. GENPD framework doesn't aggregate performance requests from the
> attached devices. This means that if deviceA requests performance state
> 10 and then deviceB requests state 3, then framework will set domain's
> state to 3 instead of 10.
>
> https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/base/power/doma=
in.c#L376

As Viresh also stated, genpd does aggregate the votes. It even
performs aggregation hierarchy (a genpd is allowed to have parent(s)
to model a topology).

>
> 2. GENPD framework has a sync() callback in the genpd.domain structure,
> but this callback isn't allowed to be used by the GENPD implementation.
> The GENPD framework always overrides that callback for its own needs.
> Hence GENPD doesn't allow to solve the bootstrapping
> state-synchronization problem in a nice way.
>
> https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/base/power/doma=
in.c#L2606

That ->sync() callback isn't the callback you are looking for, it's a
PM domain specific callback - and has other purposes.

To solve the problem you refer to, your genpd provider driver (a
platform driver) should assign its ->sync_state() callback. The
->sync_state() callback will be invoked, when all consumer devices
have been attached (and probed) to their corresponding provider.

You may have a look at drivers/cpuidle/cpuidle-psci-domain.c, to see
an example of how this works. If there is anything unclear, just tell
me and I will try to help.

>
> 3. Tegra doesn't have a dedicated hardware power-controller for the core
> domain, instead there is only an external voltage regulator. Hence we
> will need to create a phony device-tree node for the virtual power
> domain, which is probably a wrong thing to do.

No, this is absolutely the correct thing to do.

This isn't a virtual power domain, it's a real power domain. You only
happen to model the control of it as a regulator, as it fits nicely
with that for *this* SoC. Don't get me wrong, that's fine as long as
the supply is specified only in the power-domain provider node.

On another SoC, you might have a different FW interface for the power
domain provider that doesn't fit well with the regulator. When that
happens, all you need to do is to implement a new power domain
provider and potentially re-define the power domain topology. More
importantly, you don't need to re-invent yet another slew of device
specific bindings - for each SoC.

>
> =3D=3D=3D
>
> Perhaps it should be possible to create some hacks to work around
> bullets 2 and 3 in order to achieve what we need for DVFS on Tegra, but
> bullet 1 isn't solvable without changing how the GENPD core works.
>
> Altogether, the GENPD in its current form is a wrong abstraction for a
> system-wide DVFS in a case where multiple devices share power domain and
> this domain is a voltage regulator. The regulator framework is the
> correct abstraction in this case for today.

Well, I admit it's a bit complex. But it solves the problem in a
nicely abstracted way that should work for everybody, at least in my
opinion.

Although, let's not exclude that there are pieces missing in genpd or
the opp layer, as this DVFS feature is rather new - but then we should
just extend/fix it.

Kind regards
Uffe
