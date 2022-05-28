Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78D2536D4A
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 16:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236338AbiE1O3n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 May 2022 10:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234642AbiE1O3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 May 2022 10:29:41 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC2318E09
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 07:29:39 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y13so13520365eje.2
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IB1phoH5TZHVzecrVXqRVj9JGXKKXw/UOnIgt6JBST8=;
        b=RciASP8qpZdGH8Z8nQdjTbrAg18hLZnO4NQPFuG96w85+1SI0wOjVZX8gIUdZrc+a3
         v8+zPxBuUAup+A3S4ENt0ufN9chDGBJQBuegPR3O1MggdSCTSsBix+W7ABuivxiR/nOS
         yUircKVjNkUov6wd4x2c9okb9fNGKdJo9IrLCYnjJOAGHZgon7mYCgaKcxoCiqgHCZO5
         N4mTg9sZIu9u27VootbyfKwERUhgx6PUBeM687JmGXYodLesL2m5XVdSO4Y6TT+0QZ+y
         9uLTFemj2FT/7BV6g7fIy6GM4uHACMk+pvR+JBGomheeiK8iF1c9kwVAkbEruFpQBi7K
         69Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IB1phoH5TZHVzecrVXqRVj9JGXKKXw/UOnIgt6JBST8=;
        b=PcKvum4x83pFEwB0zqzKBn4erjkTm579SI6McAtnevscRoq6S6f32zgWLM17n8VA5j
         7asR+65TBpF5aMKFYiI4wI8rW9xgxluzlws3tyZEZcwy5q3m6HORncaR3ha9pse9e0OO
         hIT/hG0/sXXBzmxW3QT39+8JxYwmMDMunnbx+wnxSutHSblcdwoJU0mT+x7jvflqEJ5V
         Xip2y5rYbOV2vlsz8rhLvK+B5q7DmqwB70DeMZ2OB0Up/tqt4ci7EExE+pBgUtlDvYP5
         Ygzas7mbFhi8yzpR2GpEg29QDrH/H6EZ5pK9SbV2CExc7ipBqbAdoJa+8HELIk7PRhlm
         BlMA==
X-Gm-Message-State: AOAM530/6plIPrzD4iYMewRTf6lelXoEvGA17E0wwulDU5GTNI+sZmsv
        nfb88DUbtHDT46GalQoEvQ6c8jLFKy08WApExfcKvPmH/GI=
X-Google-Smtp-Source: ABdhPJwkejBDBs98x0xQwLKxzXraAVW4JJNF7lFpkLaKGIKN0KlZOBdimymh4xL0bTPFVkw9q0cLBLJAZ2NXtcaXVVg=
X-Received: by 2002:a17:907:c05:b0:6fe:cea8:8c4 with SMTP id
 ga5-20020a1709070c0500b006fecea808c4mr28932650ejc.740.1653748177840; Sat, 28
 May 2022 07:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com> <YpCVc6eYkpmjP9AF@lahna>
In-Reply-To: <YpCVc6eYkpmjP9AF@lahna>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Sat, 28 May 2022 16:29:26 +0200
Message-ID: <CALhB_QPHsrNExE_b0wnCzu9v-dqg0v1CjovrQDUDmBWopAPysg@mail.gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_PDS_PRO_TLD,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, May 27, 2022 at 11:10 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Fri, May 27, 2022 at 08:24:31AM +0200, Stefan Hoffmeister wrote:
> > Hi,
> >
> > On Tue, May 24, 2022 at 1:04 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, May 24, 2022 at 01:55:23PM +0300, Heikki Krogerus wrote:
> > > > +Mika
> > > >
> > > > On Fri, May 20, 2022 at 12:22:50PM +0200, Stefan Hoffmeister wrote:
> > > > > I am trying to diagnose a problem where I get video output on
> > > > > Thunderbolt on one DisplayPort, but no output on the second
> > > > > DisplayPort.
> > > > >
> > > > > I would love to turn on all the (kernel-level) logging output that
> > > > > there is, but do not know how to do that.
> > > > >
> > > > > Basically, on a Dell Inspiron 16 Plus (7610) laptop with Thunderbolt
> > > > > 4, I am running Fedora Linux 36 with kernel 5.17+.
> > > > >
> > > > > Connecting that laptop to a Thunderbolt docking station (Intel
> > > > > Thunderbolt 3 chip inside),
> > > > > with two screens attached via DisplayPort, I get only one screen up and running.
> > > > >
> > > > > I'd like to discover more about this apparent error mode, because
> > > > > attaching a different TB3
> > > > > setup works fine. I am looking for some means to enable logging or to
> > > > > get debugging insight.
> > > > >
> > > > > Generally speaking, I suspect that this specific Dell laptop
> > > > > (configuration) has some challenges
> > > > > in the BIOS, and with Thunderbolt in general, but am totally blind to
> > > > > what is going on.
> > > > >
> > > > > This system offers potential for fun, this being a hybrid PRIME
> > > > > configuration, with an Intel iGPU passing through to an Nvidia dGPU
> > > > > which seems to be the only wired-up way to get DisplayPort output.
> > >
> > > In that system all the tunneling is done by the firmware so there is
> > > really not much you can debug on the kernel side. You can add
> > > "thunderbolt.dyndbg" in the command line to get more verbose logging but
> > > I doubt it reveals anything useful.
> > >
> > > How do you connect the monitors to the dock and what dock it is?
> >
> > The dock is an i-tec Thunderbolt3/USB-C Dual DisplayPort 4K Docking
> > Station + Power Delivery 85W
> > (https://i-tec.pro/en/produkt/tb3cdualdpdockpd-2/). This dock exposes
> > two DisplayPort outs, to which I have connected one 2.5K screen and
> > one 4K screen "natively", for running at 60 Hz. According to lspci
> > from the "broken" Dell 7610 (BIOS version 1.7.0) the dock looks like
> > this:
> >
> > [stefan@fedora ~]$ lspci -vt
> > -[0000:00]-+-00.0  Intel Corporation 11th Gen Core Processor Host
> > Bridge/DRAM Registers
> >           +-01.0-[01]--+-00.0  NVIDIA Corporation GA106M [GeForce RTX
> > 3060 Mobile / Max-Q]
> >           |            \-00.1  NVIDIA Corporation Device 228e
> >           +-02.0  Intel Corporation TigerLake-H GT1 [UHD Graphics]
> >           +-04.0  Intel Corporation TigerLake-LP Dynamic Tuning
> > Processor Participant
> >           +-06.0-[02]----00.0  KIOXIA Corporation Device 0001
> >           +-07.0-[03-3a]----00.0-[04-05]----02.0-[05]----00.0  Intel
> > Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge DD 2018]
> >           +-08.0  Intel Corporation GNA Scoring Accelerator module
> > ...
> >
> > For reference, when I attach a Dell XPS 9360 (also on Fedora 36),
> > which works perfectly (both screens at expected resolution and refresh
> > rate), I get this output
> >
> > [stefan@xps13 ~]# lspci -vt
> > -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v6/7th Gen Core
> > Processor Host Bridge/DRAM Registers
> >           +-02.0  Intel Corporation HD Graphics 620
> >           +-04.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen
> > Core Processor Thermal Subsystem
> >           +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
> >           +-14.2  Intel Corporation Sunrise Point-LP Thermal subsystem
> >           +-15.0  Intel Corporation Sunrise Point-LP Serial IO I2C
> > Controller #0
> >           +-15.1  Intel Corporation Sunrise Point-LP Serial IO I2C
> > Controller #1
> >           +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
> >           +-1c.0-[01-39]----00.0-[02-39]--+-00.0-[03]----00.0  Intel
> > Corporation DSL6340 Thunderbolt 3 NHI [Alpine Ridge 2C 2015]
> >           |
> > +-01.0-[04-38]----00.0-[05-38]----02.0-[06]----00.0  Intel Corporation
> > JHL7540 Thunderbolt 3 USB Controller [Titan Ridge DD 2018]
> >           |                               \-02.0-[39]--
> >           +-1c.4-[3a]----00.0  Intel Corporation Wi-Fi 6 AX200
> >  ...
> >
> > On the broken Dell 7610 (BIOS version 1.7.0), everything else on the
> > dock works fine - the NIC, USB ports (forwarding to the next hub,
> > too), power delivery.
> >
> > Even any single one of the screens alone works fine, in isolation and
> > solitude, on any of the dock DisplayPort outs (turning dock on/off in
> > between). Only with both screens attached, only the "first" screen
> > seems to be detected (and "first" really seems to translate to the
> > physical DisplayPort out next to the power input socket on the dock).
>
> OK, I think this is not a Thunderbolt issue but rather related to
> graphics so I would try to ask from the graphics folks if they have any
> ideas what might be the issue or how to debug further. There is not much
> the Linux Thunderbolt driver does here because it is the firmware that
> creates these tunnels, and I think it works here as expected.

I see the very same undesirable / defective behaviour across operating
systems; what I see on the Linux side ("only one DisplayPort") is also
exactly the same behaviour I see on a dual-booted Windows 11 Pro. So,
in a way, that would rule out the (Linux) Thunderbolt _driver_.

With the firmware (AKA "the Dell BIOS"?) creating tunnels, are there
failure modes where that firmware might be setting up those tunnels
"partially" wrong? After all, one DisplayPort works... Are there any
magic words I can use, like ACPI? Routing? Anything beyond "tunnel"?
My knowledge about these low-level things basically does not exist,
sorry.

FWIW, the dock NVM version is at "50", the working Dell at 26.1 and
the broken Dell at 26 - would that be the firmware you are referring
to?

> Probably dri-devel@lists.freedesktop.org is a good mailing list to ask
> graphics related help.

Many thanks for the pointer! This will be rough because my notebook
has an Nvidia GPU, the OSS nouveau driver barely doesn't die on that
relatively new chip (GA106), and, of course, DisplayPort out is
physically wired to the Nvidia hardware...
