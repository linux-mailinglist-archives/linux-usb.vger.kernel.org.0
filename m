Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1871539744
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 21:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346891AbiEaTqL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 15:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242918AbiEaTqL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 15:46:11 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAA82B0
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 12:46:08 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v19so11603867edd.4
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 12:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wJDXk4yE93DdFeBOaN9NUCJBX4AC4BnfFSjkzHYfBPw=;
        b=jNAQLasKtU4Bc8eY3wxhnrOEQx0J7cXpN0tsTEF2j0jIgEwk3kaS/c+W8nZyCmy6q8
         T4hA5NB5up9fdDlXM+Xf2JZF11mDaZm79Ly6NX2zkH9KxNsm7hge3K0YbWVcMLELpLzL
         nxqiAVu6uZeMXmqdeBJ2w/xr3sUSndEWqttcJDzya3H24ub3MGt6R4QhW3xJQn8cmriz
         X1Z8jVNlD2N7YTnc/OIE+g8s7/NFHM6jRt8UqPHajcXygCuBeVCtecn8l9csk8M3JdJb
         xhuK2X0IW8Wvu8WC2hucS1uLjzIUggowoVivc3kizEEsvb4WFlPGM5/hrwgp0LHnjEtH
         auGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wJDXk4yE93DdFeBOaN9NUCJBX4AC4BnfFSjkzHYfBPw=;
        b=17WzI291Lai09vnPL94w0TYj35rW0b+TQlaL1rtHMCyoOveXEo6V/cxPAfiG0/iJYU
         5mhJidrXJaB2ERFGE1AOm9gPCfdlIaknwSzLGnXOndVP9Fe1pQtKLv6uTrAcQBlOFeAO
         cG1JI7MLQ7iUKKTKk3UQyKx+lbFINZV0CLH4mgwP80MX5dGMlIT7YeKuYIRansOVTrmW
         t98+C9qrf4NRSVWQxXulKa2cNdXqMavhZPSvuCQWYFJGcYszWVatPbWA1ar4j6RmJfYi
         +JV6KuJru8k/48jLhP4sOAdLKb3W2EtW+lCY9GAG+X1Sb98+GjxeD00KdET6nhPfGYxX
         dLFg==
X-Gm-Message-State: AOAM530reeMIpf4Rpo8yBaiYRpJPP3W40ToxbW/EcGie/lOOal0e70wb
        rgxvc3OP3OPWm6YghxJ/v7RhX/AmI40zqK4Oh4GLEPa1/rkRWA==
X-Google-Smtp-Source: ABdhPJz6KKtut2NLqTIIXJSC+KTcH7iuJTKpMlg3RFayMgd0w08q2RdFtUflcRBi1YlT5x5Y12d7t++T1OUZaJmPJ1E=
X-Received: by 2002:a05:6402:3594:b0:42b:65dd:489 with SMTP id
 y20-20020a056402359400b0042b65dd0489mr48987089edc.222.1654026366894; Tue, 31
 May 2022 12:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna> <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
 <YpSUSk9u5z3ueufa@lahna> <CALhB_QNh3vMn2+6H41MC_O0sKPfjiVrPeqmvpnLk=tuHUPQGdg@mail.gmail.com>
 <YpXhg6wPtotRk6c2@lahna>
In-Reply-To: <YpXhg6wPtotRk6c2@lahna>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Tue, 31 May 2022 21:45:55 +0200
Message-ID: <CALhB_QOCJfxoDpNmRi-YEKozeAh4PMZeVy3avhzR7jVcvWfXYg@mail.gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_PDS_PRO_TLD,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, fascinating, so only one Thunderbolt tunnel is established by the
Thunderbolt connection manager firmware on the Dell Inspiron 7610,
despite two screens being connected via DisplayPort.

On Tue, May 31, 2022 at 11:38 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> > 0x0039    0 0x04 0x00 0xc009048f
> >
> The bits 31:30 tell that this tunnel is active.

> > 0x0039    0 0x04 0x00 0x0009048f
>
> This one is not.

I have a second notebook, a Dell XPS 9360 Kaby Lake generation, and
there the situation (everything else identical) is

[root@desktop-9c4gf7m ~]# dmesg | grep thunderbolt | grep HDMI
[    6.631731] thunderbolt 0000:03:00.0:  Port 9: 8086:1576 (Revision:
4, TB Version: 1, Type: DP/HDMI (0xe0101))
[    6.631989] thunderbolt 0000:03:00.0:  Port 10: 8086:1576
(Revision: 4, TB Version: 1, Type: DP/HDMI (0xe0101))
[    7.046273] thunderbolt 0000:03:00.0:  Port 10: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))
[    7.046769] thunderbolt 0000:03:00.0:  Port 11: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))

cat /sys/kernel/debug/thunderbolt/0-0/port9/regs | grep -E ^0x0039
0x0039    0 0x04 0x00 0xc009044f

cat /sys/kernel/debug/thunderbolt/0-0/port10/regs | grep -E ^0x0039
0x0039    0 0x04 0x00 0xc009044f

This would suggest that, on the XPS 9360, two Thunderbolt tunnels were
established (by the Thunderbolt connection manager firmware), which is
matched with both the 2.5K and the 4K screen working at 60 Hz.

>
> > ********** $ cat /sys/kernel/debug/thunderbolt/0-1/port11/regs
...
> > 0x003d    4 0x04 0x00 0x00c0a234
>
> This is the "local" capability and it tells that this one supports MST
> (bit 15).
>
> I wonder if this dock has the two DP outputs behind a MST "hub" or so?

The content of https://i-tec.pro/en/produkt/tb3cdualdpdockpd-2/
mentions "2x DisplayPort (1x DP++ support)" (where DP++ =3D=3D  Dual-mode
=3D=3D DisplayPort++ - and "active vs passive" whatever that means). There
is no mention of MST anywhere, and my screens are each on their own
port.

For the dock registers, while connected to the XPS 9360, I get

[root@desktop-9c4gf7m ~]# cat
/sys/kernel/debug/thunderbolt/0-1/port10/regs | grep -E ^0x003d
0x003d    4 0x04 0x00 0x00c0a214
[root@desktop-9c4gf7m ~]# cat
/sys/kernel/debug/thunderbolt/0-1/port11/regs | grep -E ^0x003d
0x003d    4 0x04 0x00 0x00c0a214

which would imply MST in both cases?

> I don't remember if you already mentioned but have you tried to connect
> the second monitor to the USB-C downstream ports on that dock? At least
> for some docks this is where the second DP OUT adapter is routed.

I own a USB-C to DisplayPort adapter; trying to go 2.5K screen ->
DisplayPort adapter -> USB-C port on both of the USB-C ports of the
dock did not impress the screen one bit. The specs say "2x USB-C Gen 2
port (10 Gbps, for data only)", so I am not surprised.

> If the second DP tunnel gets activated you should also see bits 31:30 of
> the port6/regs to be set by the connection manager firmware.

That's what I do see for the XPS 9360, but not for the Dell Inspiron 7610.

On the (working) XPS 9360,

boltctl list
=E2=97=8F i-tec TB3CDUALDPDOCKPD
  =E2=94=9C=E2=94=80 type:          peripheral
  =E2=94=9C=E2=94=80 name:          TB3CDUALDPDOCKPD
  =E2=94=9C=E2=94=80 vendor:        i-tec
  =E2=94=9C=E2=94=80 uuid:          c0030000-0080-840e-83dc-6b1282b06021
  =E2=94=9C=E2=94=80 generation:    Thunderbolt 3
  =E2=94=9C=E2=94=80 status:        authorized
  =E2=94=82  =E2=94=9C=E2=94=80 domain:     df010000-0062-6508-a2e8-71d78a7=
4c118
  =E2=94=82  =E2=94=9C=E2=94=80 rx speed:   40 Gb/s =3D 2 lanes * 20 Gb/s
  =E2=94=82  =E2=94=9C=E2=94=80 tx speed:   40 Gb/s =3D 2 lanes * 20 Gb/s
  =E2=94=82  =E2=94=94=E2=94=80 authflags:  none
  =E2=94=9C=E2=94=80 authorized:    Di 31 Mai 2022 16:38:55
  =E2=94=9C=E2=94=80 connected:     Di 31 Mai 2022 16:38:51
  =E2=94=94=E2=94=80 stored:        Fr 20 Aug 2021 08:52:32
     =E2=94=9C=E2=94=80 policy:     auto
     =E2=94=94=E2=94=80 key:        no

On the (broken) Inspiron 7610,

=E2=97=8F i-tec TB3CDUALDPDOCKPD
  =E2=94=9C=E2=94=80 type:          peripheral
  =E2=94=9C=E2=94=80 name:          TB3CDUALDPDOCKPD
  =E2=94=9C=E2=94=80 vendor:        i-tec
  =E2=94=9C=E2=94=80 uuid:          004158c8-bd26-6b01-ffff-ffffffffffff
  =E2=94=9C=E2=94=80 generation:    Thunderbolt 3
  =E2=94=9C=E2=94=80 status:        authorized
  =E2=94=82  =E2=94=9C=E2=94=80 domain:     606de333-0530-8780-ffff-fffffff=
fffff
  =E2=94=82  =E2=94=9C=E2=94=80 rx speed:   40 Gb/s =3D 2 lanes * 20 Gb/s
  =E2=94=82  =E2=94=9C=E2=94=80 tx speed:   40 Gb/s =3D 2 lanes * 20 Gb/s
  =E2=94=82  =E2=94=94=E2=94=80 authflags:  none
  =E2=94=9C=E2=94=80 authorized:    Tue 31 May 2022 05:49:01 PM UTC
  =E2=94=9C=E2=94=80 connected:     Tue 31 May 2022 05:49:01 PM UTC
  =E2=94=94=E2=94=80 stored:        Tue 10 May 2022 06:48:15 PM UTC
     =E2=94=9C=E2=94=80 policy:     iommu
     =E2=94=94=E2=94=80 key:        no

With respect to NVM versions (which, I think, would be the Thunderbolt
connection manager?), I get

* dock =3D=3D 50.0 (cat /sys/bus/thunderbolt/devices/0-1/nvm_version)
* XPS 9360 =3D=3D 26.1 (cat /sys/bus/thunderbolt/devices/0-0/nvm_version)
* Inspiron 7610 =3D ??? - I don't see nvm_version here?

What could be reasons that the second tunnel is not established on the
Dell? I read somewhere that Intel hands off the firmware to vendors
(Dell) who then customize it for their systems? Could the vendor have
made bad customizations / configurations of that package while
integrating it?

I would imagine that plugging in a DisplayPort cable makes the dock
(firmware) signal something to the notebook (TB firmware) and a
negotiation will take place. That negotiation fails, otherwise the
tunnel would be established, and remain established? Is there a means
to trace the negotiation?

FWIW, I have read the phrase "insufficent provision of GPU Interfaces
to the TB port" (sic, on Reddit), and a lengthy related post at
https://www.dell.com/community/XPS/Understanding-Thunderbolt-docks-GPU-band=
width-and-GPU-interfaces/td-p/7678776
which I will not pretend to understand.

What I wonder about is whether the "GPU interfaces" situation would be
reliably discoverable by inspecting ... something ... anything?

Anyway, my impression, from a layering point of view, is that on the
stack (my imagination!)

* notebook hardware
* firmware (BIOS, Thunderbolt firmware / connection manager, ...)
* Linux thunderbolt driver
* Linux graphics drivers: drm / kms (i915 / nvidia / nouveau)

the graphics drivers are not involved when it comes to building /
maintaining the Thunderbolt(!) tunnel?

I am also reading "Thunderbolt Alternate Mode encapsulates DisplayPort
Alternate Mode". To my ears this sounds like "wrap the raw DisplayPort
Alternate Mode bitstream", just with more bandwidth. Pure "DisplayPort
Alternate Mode" I can force with success by way of disabling
Thunderbolt in the BIOS (at the expense of bandwidth -> bad refresh
rate). And "DisplayPort Alternate Mode" gives me _both_ screens,
apparently very much scraping along at the max protocol bandwidth,
with the 4K screen going black (out of sync?) every once in a while.

Sorry for my rambling, this is an area where I have no expertise.

Anyway, if those graphics drivers are involved for _Thunderbolt_,
please do tell me, and I'll venture over to dri-devel.

And given what I see above, is that still "Thunderbolt 4 Certified"
("Two 4K displays") in the case of the Dell Inspiron 7610?

BR and many thanks for your patience!
Stefan
