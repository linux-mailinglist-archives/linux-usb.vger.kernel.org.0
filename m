Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E413537260
	for <lists+linux-usb@lfdr.de>; Sun, 29 May 2022 21:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiE2TwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 May 2022 15:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbiE2TwK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 May 2022 15:52:10 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04121A450
        for <linux-usb@vger.kernel.org>; Sun, 29 May 2022 12:52:07 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c2so1605508edf.5
        for <linux-usb@vger.kernel.org>; Sun, 29 May 2022 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H4aTePjx5JT455eIkGmH1JECV4hQ+ZyRveIdepnTlH8=;
        b=Lm2rzgwppOWv7i2wo8LjTxjImT+zgNBWNruLzwuxpoDVGw6YT1ZYN5r2/YgIQ91nz1
         W61pVDmAIWREWpo3AUpm0N7bFaNMqU25y0SzcAGSMLMC0OLuPJOPjtvB2MyntScaS6Zq
         9JjwLuvsN4zZxyVOyPAtTjkOW90tH2lWQDhkw0oY+WwJmq8jHXJfn4aI6Bd9adAVCB9d
         LJVRQuWCf/QW935FJTyxMv1TXmCJQyGiYw2qlF+e4efxx1V7GAr8sSM6ARppqsv4JLb6
         hCXA1o61axVHpifhwrfviyW0W+sThJk+MPeRv1hE5q3VkAq5g2V9SzWERhQTbFff5f7+
         gjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4aTePjx5JT455eIkGmH1JECV4hQ+ZyRveIdepnTlH8=;
        b=7yOzXsmuSZFT8OkIcZLVDU0NsTwS5Yd/JtTC4sAKFibQst5Cu3X5zK26V0KtmHBTVz
         jXpq4C98dVks0Cy2ZK7BZjkPgSwSkq2TFzLiWp24tCBM0BjWk+EPVjnDzAY8oPIWtu9k
         XFG2L77FQblIcrvYu+QbQi1C8vfspX+bZDv1y7Z9o+nm3/zpZxExPRKgihGlhyA4gegT
         yIln2IZK8l37Su/GK/51ec4XA+TqGcI0z1lnya1RJt2haigpazA1ecRxKZX/cBoCJxSe
         dkL+q7XNZM94c5kMzTpEqVQ+XokKLe7GlHvLduAsOxqmbu9Vgcws3Zlf2R3JAY+DcBiV
         BkWg==
X-Gm-Message-State: AOAM532dMO5LqiK4bL57rw7vSCaNBaJpQycANvplXsAed9A6RIZSDqft
        Be1tb1ch6ELPc51JUTWmKUFxtHDeW0FG9ckbakc6DQ9K4xE=
X-Google-Smtp-Source: ABdhPJw6VEljwEeukM4+Uz6R4mMpIPRWZlm6YWwqSHc0oJNETZPZeBYrmQWz4DoDIT4Hexz7DZC4t0FKQmwywjiuPn0=
X-Received: by 2002:a05:6402:90d:b0:428:bda9:3e6b with SMTP id
 g13-20020a056402090d00b00428bda93e6bmr54704276edz.132.1653853925375; Sun, 29
 May 2022 12:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com> <YpCVc6eYkpmjP9AF@lahna>
In-Reply-To: <YpCVc6eYkpmjP9AF@lahna>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Sun, 29 May 2022 21:51:53 +0200
Message-ID: <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
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

Hello again :)

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
> graphics

Based on updated information, I do believe even stronger that there is
a problem specifically with Thunderbolt _somewhere_ in the stack. I am
not saying that the Linux Thunderbolt driver is the root cause :)

I have managed to wedge the system into a state where it does not know
about Thunderbolt, and now, on what I presume to be USB-C only
("usb_typec_revision" == 1.2? Seems ... low?), both DisplayPort
outputs on the docking station are now active, and I do get meaningful
entries from the DRM subsystem (and hence X). I am half-way happy: I
want exactly that over Thunderbolt for the bandwidth ;)

This is the state I see with USB-C (I only have one port == port0):

$ cd /sys/class/typec/port0

$ find . -type f -name 'svid' | xargs -i sh -c 'echo {}; cat {}'
./port0.3/svid
413c
./port0.1/svid
ff01
./port0.2/svid
413c
./port0.0/svid
8087

Based on my reading of
https://www.quantumdata.com/assets/essentials_displayport_usb-c_dp_alt_mode_protocols_webinar.pdf
the value of ff01 for SVID is defined as: "DP_SID (DisplayPort
Standard Identifier) - 16-bit Identifier assigned by the USB-IF for
the DisplayPort alt mode (FF01h) specification (standard).";
https://composter.com.ua/documents/USB_Billboard_Revision.1.2.1.pdf
suggests that the 8087 part is the Intel VID and we are talking about
power-delivery. 413c is the Dell USB vendor ID. I have no idea what
any of that means, though, way out of my domain of knowledge.

I see no "partner" entries in that scenario.

Now, when I unwedge the system to enable Thunderbolt again, I see the
same behaviour - only one DisplayPort output can be seen (this is not
about the screens, I am looking at /sys/class/drm/. The thunderbolt
module output I have pasted at the end of this message.

Now, what irritates me is that on /sys/class/drm in the case of USB-C I get

    card0  card0-DP-1  card0-DP-2  card0-DP-3  card0-DP-4  card0-eDP-1
 card0-HDMI-A-1  card1  card1-DP-5  card1-DP-6 card1-DP-7

with card1-DP-7 being where the second port suddenly pops up, but for
no good reason? And card1-DP-5 is empty.

And with Thunderbolt

    card0  card0-DP-1  card0-DP-2  card0-DP-3  card0-DP-4  card0-eDP-1
 card0-HDMI-A-1  card1  card1-DP-5  card1-DP-6

"card1-DP-7" never is present, but then I have content in card1-DP-5,
but nothing ever in card1-DP-6.

I am just ... surprised, and don't know what observables / logging
should happen when I plug in a cable into the "second" DisplayPort
port.

BR
Stefan

$ grep thunderbolt dmesg.txt
[ 2393.181675] thunderbolt 0-1: device disconnected
[ 2393.484134] thunderbolt 0000:00:0d.2: ICM rtd3 veto=0x00000000
[ 2407.639236] thunderbolt 0000:00:0d.2: current switch config:
[ 2407.639245] thunderbolt 0000:00:0d.2:  Thunderbolt 3 Switch:
8086:15ef (Revision: 6, TB Version: 16)
[ 2407.639250] thunderbolt 0000:00:0d.2:   Max Port Number: 13
[ 2407.639253] thunderbolt 0000:00:0d.2:   Config:
[ 2407.639254] thunderbolt 0000:00:0d.2:    Upstream Port Number: 1
Depth: 1 Route String: 0x1 Enabled: 1, PlugEventsDelay: 10ms
[ 2407.639258] thunderbolt 0000:00:0d.2:    unknown1: 0x0 unknown4: 0x0
[ 2408.110732] thunderbolt 0000:00:0d.2: 1: reading drom (length: 0x66)
[ 2414.788163] thunderbolt 0000:00:0d.2: 1: DROM version: 1
[ 2414.803299] thunderbolt 0000:00:0d.2: 1: uid: 0x16b26bdc8584100
[ 2414.841453] thunderbolt 0000:00:0d.2:  Port 1: 8086:15ef (Revision:
6, TB Version: 1, Type: Port (0x1))
[ 2414.841467] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[ 2414.841472] thunderbolt 0000:00:0d.2:   Max counters: 16
[ 2414.841475] thunderbolt 0000:00:0d.2:   NFC Credits: 0x7800046
[ 2414.841479] thunderbolt 0000:00:0d.2:   Credits (total/control): 120/2
[ 2414.879467] thunderbolt 0000:00:0d.2:  Port 2: 8086:15ef (Revision:
6, TB Version: 1, Type: Port (0x1))
[ 2414.879483] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[ 2414.879488] thunderbolt 0000:00:0d.2:   Max counters: 16
[ 2414.879491] thunderbolt 0000:00:0d.2:   NFC Credits: 0x0
[ 2414.879494] thunderbolt 0000:00:0d.2:   Credits (total/control): 0/2
[ 2414.879499] thunderbolt 0000:00:0d.2: 1:3: disabled by eeprom
[ 2414.879503] thunderbolt 0000:00:0d.2: 1:4: disabled by eeprom
[ 2414.879506] thunderbolt 0000:00:0d.2: 1:5: disabled by eeprom
[ 2414.879508] thunderbolt 0000:00:0d.2: 1:6: disabled by eeprom
[ 2414.879511] thunderbolt 0000:00:0d.2: 1:7: disabled by eeprom
[ 2414.884685] thunderbolt 0000:00:0d.2:  Port 8: 8086:15ef (Revision:
6, TB Version: 1, Type: PCIe (0x100102))
[ 2414.884695] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[ 2414.884700] thunderbolt 0000:00:0d.2:   Max counters: 2
[ 2414.884702] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[ 2414.884706] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[ 2414.889725] thunderbolt 0000:00:0d.2:  Port 9: 8086:15ef (Revision:
6, TB Version: 1, Type: PCIe (0x100101))
[ 2414.889736] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[ 2414.889740] thunderbolt 0000:00:0d.2:   Max counters: 2
[ 2414.889743] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[ 2414.889746] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[ 2414.899756] thunderbolt 0000:00:0d.2:  Port 10: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))
[ 2414.899764] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[ 2414.899768] thunderbolt 0000:00:0d.2:   Max counters: 2
[ 2414.899771] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[ 2414.899774] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[ 2414.909862] thunderbolt 0000:00:0d.2:  Port 11: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))
[ 2414.909865] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[ 2414.909866] thunderbolt 0000:00:0d.2:   Max counters: 2
[ 2414.909867] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[ 2414.909868] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[ 2414.914998] thunderbolt 0000:00:0d.2:  Port 12: 8086:15ea
(Revision: 6, TB Version: 1, Type: Inactive (0x0))
[ 2414.915006] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[ 2414.915009] thunderbolt 0000:00:0d.2:   Max counters: 2
[ 2414.915012] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[ 2414.915014] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[ 2414.920095] thunderbolt 0000:00:0d.2:  Port 13: 8086:15ea
(Revision: 6, TB Version: 1, Type: Inactive (0x0))
[ 2414.920103] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[ 2414.920109] thunderbolt 0000:00:0d.2:   Max counters: 2
[ 2414.920112] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[ 2414.920114] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[ 2414.920130] thunderbolt 0-1: ACPI companion not found
[ 2414.920132] thunderbolt 0-1: No ACPI support
[ 2414.920175] thunderbolt 0-1: new device found, vendor=0x16b device=0x9010
[ 2414.920178] thunderbolt 0-1: i-tec TB3CDUALDPDOCKPD
[ 2414.940384] thunderbolt 0000:00:0d.2: ICM rtd3 veto=0x00000001
