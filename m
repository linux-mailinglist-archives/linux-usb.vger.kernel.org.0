Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA85C535942
	for <lists+linux-usb@lfdr.de>; Fri, 27 May 2022 08:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245071AbiE0GYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 May 2022 02:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbiE0GYq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 May 2022 02:24:46 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D03925C5A
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 23:24:44 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id jx22so6762509ejb.12
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 23:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13r4w1Qq3PPv7pdySc5+O1IPmCz67ECRf4Suqg3yKSI=;
        b=TRU5F8I00y6C50CLoxRL17XEpRd+LM3IOgbf549xwWGbx8vqu14nOdToWk5S57qmiN
         NvwJQAvSN7xm10Yv67YWlYk3C2Lq4XeUJK4P2F073OCRz1OSKh0ASoWAh4J+r2CnMDMl
         fiXqby7SniKgoW6g96rP/iula3wAryjlD6P2XKIRRAlhvJlHqVX3yBHNLKWlN9mFaJ12
         Hsx6QG02Ir9OIo/g8p8Sc/E1FmnI9uk7vTjwowRagHaRadjymfmslnLFO9LmckRvooGh
         b4N4gnTwlnQA/3Mh2a4DSXPE+SZcAnI14yWESiw2Q52kt1JclqlLlIuoWiartZTgPq5k
         vLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13r4w1Qq3PPv7pdySc5+O1IPmCz67ECRf4Suqg3yKSI=;
        b=O8kvc3+WRSmx8WWAv0EPXDyQqjzQwFW01+CtVztgKcRtUhklYWAukDoohZr51FDh4N
         96TxIV4NoY0OouzZAleYGmYLsYHlAbfujX4ajSyiEusCW1DpE5eHOyyrUj8NAUi2LTyn
         8t33vzPO4flx8ve7WT8DaH7M24SHCU/ccxaEW4bBq1jfoE8ysoMxFnuq4ft62Ni2YAVe
         bl9Etlv9HNek4kEefcCTgGw8mUFHBVh+L/YkZihd4Fl3IDFukea7XrronY/BEZViKDMS
         QHPB2Eh54N9tyu+C1IgamC4WjjebnCcZDijSkPCOONHx6NqSpo8mXlBpFA8Mu+S8Dxrs
         B1Ng==
X-Gm-Message-State: AOAM530XzXK0ZjzFhn99Xxd2wo65p0IDdIUIdJqF+IGybloi+KWAgNR8
        WP+XF79h5RcH/+Gk03PW2OA5jRP6K9dH4tPyAwbNjlIu/OI=
X-Google-Smtp-Source: ABdhPJxQZ9busf0W4COXDCuXdWU1kfVsqvpVqMygTNABXRWFg43NjfSWvJ+0cJfBFTV/NE1Q2ZXX6xL4HBH1Ov9UojE=
X-Received: by 2002:a17:907:2cc3:b0:6f8:5a21:4d62 with SMTP id
 hg3-20020a1709072cc300b006f85a214d62mr1456181ejc.256.1653632682828; Thu, 26
 May 2022 23:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
In-Reply-To: <Yoy7oXpMugFFmfBP@lahna>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Fri, 27 May 2022 08:24:31 +0200
Message-ID: <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
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

On Tue, May 24, 2022 at 1:04 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, May 24, 2022 at 01:55:23PM +0300, Heikki Krogerus wrote:
> > +Mika
> >
> > On Fri, May 20, 2022 at 12:22:50PM +0200, Stefan Hoffmeister wrote:
> > > I am trying to diagnose a problem where I get video output on
> > > Thunderbolt on one DisplayPort, but no output on the second
> > > DisplayPort.
> > >
> > > I would love to turn on all the (kernel-level) logging output that
> > > there is, but do not know how to do that.
> > >
> > > Basically, on a Dell Inspiron 16 Plus (7610) laptop with Thunderbolt
> > > 4, I am running Fedora Linux 36 with kernel 5.17+.
> > >
> > > Connecting that laptop to a Thunderbolt docking station (Intel
> > > Thunderbolt 3 chip inside),
> > > with two screens attached via DisplayPort, I get only one screen up and running.
> > >
> > > I'd like to discover more about this apparent error mode, because
> > > attaching a different TB3
> > > setup works fine. I am looking for some means to enable logging or to
> > > get debugging insight.
> > >
> > > Generally speaking, I suspect that this specific Dell laptop
> > > (configuration) has some challenges
> > > in the BIOS, and with Thunderbolt in general, but am totally blind to
> > > what is going on.
> > >
> > > This system offers potential for fun, this being a hybrid PRIME
> > > configuration, with an Intel iGPU passing through to an Nvidia dGPU
> > > which seems to be the only wired-up way to get DisplayPort output.
>
> In that system all the tunneling is done by the firmware so there is
> really not much you can debug on the kernel side. You can add
> "thunderbolt.dyndbg" in the command line to get more verbose logging but
> I doubt it reveals anything useful.
>
> How do you connect the monitors to the dock and what dock it is?

The dock is an i-tec Thunderbolt3/USB-C Dual DisplayPort 4K Docking
Station + Power Delivery 85W
(https://i-tec.pro/en/produkt/tb3cdualdpdockpd-2/). This dock exposes
two DisplayPort outs, to which I have connected one 2.5K screen and
one 4K screen "natively", for running at 60 Hz. According to lspci
from the "broken" Dell 7610 (BIOS version 1.7.0) the dock looks like
this:

[stefan@fedora ~]$ lspci -vt
-[0000:00]-+-00.0  Intel Corporation 11th Gen Core Processor Host
Bridge/DRAM Registers
          +-01.0-[01]--+-00.0  NVIDIA Corporation GA106M [GeForce RTX
3060 Mobile / Max-Q]
          |            \-00.1  NVIDIA Corporation Device 228e
          +-02.0  Intel Corporation TigerLake-H GT1 [UHD Graphics]
          +-04.0  Intel Corporation TigerLake-LP Dynamic Tuning
Processor Participant
          +-06.0-[02]----00.0  KIOXIA Corporation Device 0001
          +-07.0-[03-3a]----00.0-[04-05]----02.0-[05]----00.0  Intel
Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge DD 2018]
          +-08.0  Intel Corporation GNA Scoring Accelerator module
...

For reference, when I attach a Dell XPS 9360 (also on Fedora 36),
which works perfectly (both screens at expected resolution and refresh
rate), I get this output

[stefan@xps13 ~]# lspci -vt
-[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v6/7th Gen Core
Processor Host Bridge/DRAM Registers
          +-02.0  Intel Corporation HD Graphics 620
          +-04.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen
Core Processor Thermal Subsystem
          +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
          +-14.2  Intel Corporation Sunrise Point-LP Thermal subsystem
          +-15.0  Intel Corporation Sunrise Point-LP Serial IO I2C
Controller #0
          +-15.1  Intel Corporation Sunrise Point-LP Serial IO I2C
Controller #1
          +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
          +-1c.0-[01-39]----00.0-[02-39]--+-00.0-[03]----00.0  Intel
Corporation DSL6340 Thunderbolt 3 NHI [Alpine Ridge 2C 2015]
          |
+-01.0-[04-38]----00.0-[05-38]----02.0-[06]----00.0  Intel Corporation
JHL7540 Thunderbolt 3 USB Controller [Titan Ridge DD 2018]
          |                               \-02.0-[39]--
          +-1c.4-[3a]----00.0  Intel Corporation Wi-Fi 6 AX200
 ...

On the broken Dell 7610 (BIOS version 1.7.0), everything else on the
dock works fine - the NIC, USB ports (forwarding to the next hub,
too), power delivery.

Even any single one of the screens alone works fine, in isolation and
solitude, on any of the dock DisplayPort outs (turning dock on/off in
between). Only with both screens attached, only the "first" screen
seems to be detected (and "first" really seems to translate to the
physical DisplayPort out next to the power input socket on the dock).
