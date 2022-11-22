Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D9A6337CC
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 10:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbiKVJCK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 04:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbiKVJCI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 04:02:08 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72139A456;
        Tue, 22 Nov 2022 01:02:07 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id x21so9821944qkj.0;
        Tue, 22 Nov 2022 01:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7GGsdQ+7EVwz1XvGhev+Xy4/In4783cOO3O+rmimJY=;
        b=MdaAMO5X4rrnfLSxECbaK5/Tz4R6kQtgy96f17JCBj32vru0LwpjuyLSPKXLJLNZoD
         IlUbFKKo6SNagxau6QOrEKNnTzf26DFzUawil/83nvC7xyqQ3HjURYoXOttihQMhozBq
         eKLH/OqyUj4yKbzFhnsAbr2Dy2hHJvr6KmMdP2aHqZVqrzj+sTO7geEiKa2+cFr5BgZz
         UhBWeoRIz6qDl+yJOvaRGZfpNxhkyif3MFCp/eGx31XYmS4Ic4MzsW52OFHcfLKLQ70E
         px7h8eplLERYqmE+gcM83G5YdWiTTTDvH3VMIv5TvRFbSDCn8aGlnKqfNtymB6etw4cs
         frJQ==
X-Gm-Message-State: ANoB5pmII+up+yl+3haixLt9mTZUCG8Mh5Kiek1QV6eeHmIHEGqt8ExI
        EpVYGmJgwlf2AnYUXkuMYxv+qZyJM0XW3g==
X-Google-Smtp-Source: AA0mqf7L1HLxqA963pOAohBg2SwZaM9hIID72zALosQYZMOMfmzyVh8vyrlrQwJhWIl/4yQODi+CgQ==
X-Received: by 2002:a05:620a:14a4:b0:6fa:2f16:88d1 with SMTP id x4-20020a05620a14a400b006fa2f1688d1mr3671549qkj.462.1669107726314;
        Tue, 22 Nov 2022 01:02:06 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id q46-20020a05620a2a6e00b006fbcab95d70sm9279160qkp.101.2022.11.22.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 01:02:05 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id v184so1202815ybv.6;
        Tue, 22 Nov 2022 01:02:05 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr3143112ybq.89.1669107725187; Tue, 22 Nov
 2022 01:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
 <20221114111513.1436165-3-herve.codina@bootlin.com> <a1a7fdf4-2608-d6c9-7c7a-f8e8fae3a742@linaro.org>
 <c9a77262-f137-21d9-58af-eb4efb8aadbf@linaro.org> <20221115150417.513955a7@bootlin.com>
 <20221118112349.7f09eefb@bootlin.com> <d9bd5075-9d06-888d-36a9-911e2d7ec5af@linaro.org>
 <20221121165921.559d6538@bootlin.com> <4e54bfb4-bb67-73b8-f58f-56797c5925d3@linaro.org>
 <CAMuHMdU=-ZUzHSb0Z8P3wsLK9cgGVCPdMi6AcjTH23tUQEeEBA@mail.gmail.com>
 <a3e1332e-fc15-8a78-0ddd-6d5b26197f11@linaro.org> <CAMuHMdXzqZB4sKMmroriq5oPp7z=yXiHk=+eQKwSyPhNbYqgYA@mail.gmail.com>
 <1f12883b-1e37-7f2b-f9e9-c8bad290a133@linaro.org> <CAMuHMdVbzg8y2So+A=z8nUwHMoL+XKUrvoXp9QdbCnUve1_Atw@mail.gmail.com>
 <191a7f3e-0733-8058-5829-fe170a06dd5a@linaro.org>
In-Reply-To: <191a7f3e-0733-8058-5829-fe170a06dd5a@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Nov 2022 10:01:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1Y4Ldq2Hu5X8awTOWYTHq4DPYWCMkyg-9TQY=DaxREg@mail.gmail.com>
Message-ID: <CAMuHMdV1Y4Ldq2Hu5X8awTOWYTHq4DPYWCMkyg-9TQY=DaxREg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: renesas,r9a06g032-sysctrl: Add
 h2mode property
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Herve Codina <herve.codina@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Krzysztof,

On Tue, Nov 22, 2022 at 9:42 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 22/11/2022 09:25, Geert Uytterhoeven wrote:
> > On Tue, Nov 22, 2022 at 8:45 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 21/11/2022 21:46, Geert Uytterhoeven wrote:
> >>>> This does not change anything. Herve wrote:
> >>>>
> >>>>> probe some devices (USB host and probably others)
> >>>>
> >>>> Why some can be probed earlier and some not, if there are no
> >>>> dependencies? If there are dependencies, it's the same case with sysctrl
> >>>> touching the register bit and the USB controller touching it (as well
> >>>> via syscon, but that's obvious, I assume).
> >>>>
> >>>> Where is the synchronization problem?
> >>>
> >>> The h2mode bit (and probably a few other controls we haven't figured out
> >>> yet) in the sysctrl must be set before any of the USB devices is active.
> >>> Hence it's safest for the sysctrl to do this before any of the USB drivers
> >>> probes.
> >>
> >> Again, this does not differ from many, many of other devices. All of
> >> them must set something in system controller block, before they start
> >> operating (or at specific time). It's exactly the same everywhere.
> >
> > The issue here is that there are two _different drivers_ (USB host
> > and device). When both are modular, and the driver that depends on the
> > sysctrl setting is loaded second, you have a problem: the sysctrl change
> > must not be done when the first driver is already using the hardware.
> >
> > Hence the sysctrl driver should take care of it itself during early
> > initialization (it's the main clock controller, so it's a dependency
> > for all other I/O device drivers).
>
> I assumed you have there bit for the first device (which can switch
> between USB host and USB device) to choose appropriate mode. The
> bindings also expressed this - "the USBs are". Never said anything about
> dependency between these USBs.
>
> Are you saying that the mode for first device cannot be changed once the
> second device (which is only host) is started? IOW, the mode setup must
> happen before any of these devices are started?

Exactly.

> Anyway with sysctrl approach you will have dependency and you cannot
> rely on clock provider-consumer relationship to order that dependency.
> What if you make all clocks on and do not take any clocks in USB device?

Enabling the clocks does not have anything to do with this ordering.
Clock consumers that are part of the clock domain are probed after
clock providers.  If the clock is missing, that would be an incorrect
description in DTS.

> Broken dependency. What if you want to use this in a different SoC,
> where the sysctrl does not provide clocks? Broken dependency.

This is the "renesas,r9a06g032-sysctrl" DT bindings document.
It talks about this SoC implementation specifically.
This is not a random synthesizable IP Core that can appear anywhere.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
