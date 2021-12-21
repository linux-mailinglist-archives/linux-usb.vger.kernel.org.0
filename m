Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E50E47B90A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 04:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhLUDgE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 22:36:04 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50358
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231616AbhLUDgD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 22:36:03 -0500
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5AFD43F1A9
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 03:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640057762;
        bh=27svlIIYyJmJKdHJgNGFJ9+iUbEwVVejZMSUNzNpWVo=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=GFBIxoVj7qRJVwWBchzUpxn4O4liqlutXKH5mp/5qGukPq/q+TmhDq4zhul3dP2mB
         mutAkayvMUWl0miUM4fws7GNW06Sfks8Y9Pa5QHjYDOXY/8cLXKswh1+KhNSCZpQKu
         stUTfJzWB3PN0MQZx0EoAwc9dNwvAX1ljOiEYRXppXrRJ1sHU7wCOn4Xg6cBxtQy8F
         EBwoimn0l91/4iThRVaGUVr8SE9JA5SqVRYlc/Vc9+TItiDMmtbKWRcm00CJIDD3m8
         W6hMGjgPJybSoeNRSyzhhqC9lx9r5Abu0iUrAyP6jxjM7zHTsnnPFjMf7vbg9xhv9z
         NuxpHCdogWuew==
Received: by mail-oi1-f199.google.com with SMTP id s37-20020a05680820a500b002bcbae866f9so7538474oiw.6
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 19:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=27svlIIYyJmJKdHJgNGFJ9+iUbEwVVejZMSUNzNpWVo=;
        b=wQFieDygG6yCdWMMNa0cnk7w04q0KHizxkdHHbtnqF4P8v6GsoEGjVUG7Gz3LZKo+Y
         0VTKlDlVy2gG/ZZ8FLH+6ZhRPECVqbrLsa1q2oURdUx+sUPXrNZZCZ0n3DVUbwqTPwfe
         T5X+2ryPZh8vBWmZ8lpVmn03MIcPzAOagwtwjCZSNtgeamAin3ylktF29JtM+HWlRr0+
         k0BI8fH4MzdgRLW5Wofj1ppUclC3Bp4lRWt66PqjuK5kbOcJu8cDQzNQBDhb52HZTbfr
         2+BUzeYWF0GlTJ195qbej3cCI0HLBceWnZnGBikgxe0kpd3NnIytyWmENX8DKGzIRKvg
         AcfA==
X-Gm-Message-State: AOAM532Eba/uR8Tell5nTc9SDDY+cALhA1IaB/dSNBlTZxLgtcHR4ls4
        fyft9hlVPgk2dwgLQQfPYGL/UUcPuBNBRelvCGv9fBVcFRtcVAeMIRTaURLiF2XA+hHaUkJm7yc
        QFmAAkn/3mKlavAAwbgaERYOviTxcP7qWwEMK6+S22GkedJs96miK2w==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr1032222oie.41.1640057761223;
        Mon, 20 Dec 2021 19:36:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQG+WTxrFbfThc/4JBJ37wWif5mRxNvM+UlCmr6gbvcYIcVwrIbWsxVDPYfGBZpx/yFbjz+fqsK6QWnYUpBAk=
X-Received: by 2002:aca:ab84:: with SMTP id u126mr1032210oie.41.1640057760850;
 Mon, 20 Dec 2021 19:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20211126115652.1134230-1-kai.heng.feng@canonical.com>
 <745bd358-c34c-9deb-42e6-6f6a54fd3e2e@linux.intel.com> <CAAd53p7ta292yNKYBn3mtav-kPHwtd1GANy9bdCMXL=SPZK+kg@mail.gmail.com>
 <CAAd53p7uifYjFL02fh9m97i89BucdHAwAf4SjgOJkw1XiZ5ezw@mail.gmail.com>
 <66cb505d-8802-9d4c-fa3f-01c47f9734fc@linux.intel.com> <CAAd53p68P0zhRvYQj=vdtmhdyGHkk7iKPyJ0rCpW38FwyU0TMA@mail.gmail.com>
In-Reply-To: <CAAd53p68P0zhRvYQj=vdtmhdyGHkk7iKPyJ0rCpW38FwyU0TMA@mail.gmail.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 21 Dec 2021 11:35:49 +0800
Message-ID: <CAAd53p5Ab2myqQtPfDebaEuOrk-ocGZHoaujXS=vs9MXFd6czw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: core: Avoid doing warm reset on disconnect event
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andrew Lunn <andrew@lunn.ch>, Rajat Jain <rajatja@google.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 6, 2021 at 10:52 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Fri, Dec 3, 2021 at 10:16 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
> >
> > On 2.12.2021 5.10, Kai-Heng Feng wrote:
> > > On Tue, Nov 30, 2021 at 10:36 AM Kai-Heng Feng
> > > <kai.heng.feng@canonical.com> wrote:
> > >>
> > >> On Mon, Nov 29, 2021 at 6:18 PM Mathias Nyman
> > >> <mathias.nyman@linux.intel.com> wrote:
> > >>>
> > >>> On 26.11.2021 13.56, Kai-Heng Feng wrote:
> > >>>> Unplugging USB device may cause an incorrect warm reset loop:
> > >>>> [  143.039019] xhci_hcd 0000:00:14.0: Port change event, 2-3, id 1=
9, portsc: 0x4202c0
> > >>>> [  143.039025] xhci_hcd 0000:00:14.0: handle_port_status: starting=
 usb2 port polling.
> > >>>> [  143.039051] hub 2-0:1.0: state 7 ports 10 chg 0000 evt 0008
> > >>>> [  143.039058] xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x=
4202c0, return 0x4102c0
> > >>>> [  143.039092] xhci_hcd 0000:00:14.0: clear port3 connect change, =
portsc: 0x4002c0
> > >>>> [  143.039096] usb usb2-port3: link state change
> > >>>> [  143.039099] xhci_hcd 0000:00:14.0: clear port3 link state chang=
e, portsc: 0x2c0
> > >>>> [  143.039101] usb usb2-port3: do warm reset
> > >>>> [  143.096736] xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x=
2b0, return 0x2b0
> > >>>> [  143.096751] usb usb2-port3: not warm reset yet, waiting 50ms
> > >>>> [  143.131500] xhci_hcd 0000:00:14.0: Can't queue urb, port error,=
 link inactive
> > >>>> [  143.138260] xhci_hcd 0000:00:14.0: Port change event, 2-3, id 1=
9, portsc: 0x2802a0
> > >>>> [  143.138263] xhci_hcd 0000:00:14.0: handle_port_status: starting=
 usb2 port polling.
> > >>>> [  143.160756] xhci_hcd 0000:00:14.0: Get port status 2-3 read: 0x=
2802a0, return 0x3002a0
> > >>>> [  143.160798] usb usb2-port3: not warm reset yet, waiting 200ms
> > >>>>
> > >>>> The warm reset is due to its PLS is in eSS.Inactive state. However=
, USB
> > >>>> 3.2 spec table 10-13 mentions "Ports can be disabled by either a f=
ault
> > >>>> condition (disconnect event or other fault condition)", xHCI 1.2 s=
pec
> > >>>> table 5-27 also states that "This flag shall automatically be clea=
red to
> > >>>> =E2=80=980=E2=80=99 by a disconnect event or other fault condition=
." on PED.
> > >>>>
> > >>>> So use CSC =3D 0 and PED =3D 0 as indication that device is discon=
necting to
> > >>>> avoid doing warm reset.
> > >>>
> > >>> My understanding is that PED =3D 0 in case of disconnect, error (PL=
S=3DInactive), or
> > >>> during active reset signalling. See xHCI Figure 4-27: USB3 Root Hub=
 Port State Machine.
> > >>> signal states (0,0,0,0) are PP,CCS,PED,PR.
> > >>
> > >> I think it's 1,0,0,0? So for my case, the port is in Error state (PL=
S
> > >> =3D Inactive, 1,0,0,0).
> >
> > Yes, Port power is still on, so (1,0,0,0) but PED and CCS are both 0.
> >
> > >>
> > >>>
> > >>> I'm looking at a similar case where Inactive link is reported at di=
sconnect for a while
> > >>> before missing terminations are detected and link finally goes to R=
xDetect.
> > >>
> > >> So the PLS goes from Inactive to RxDetect after a while?
> > >> Is the case you are working on also EHL?
> >
> > Not EHL this time, anoter platform.
> >
> > >>
> > >>>
> > >>> If the port was reset immediately when Inactive link state was repo=
rted the port stays stuck
> > >>> in port reset.
> > >>> This might have been related to the address0 locking issues recentl=
y fixed.
> > >>>
> > >>> Anyway, to avoid the extra reset of a removed USB3 device I started=
 polling the link state of
> > >>> the Inactive link for some time before resetting it. This gives the=
 link time to detect
> > >>> missing terminations and go to RxDetect, and driver can skip the re=
set.
> > >>>
> > >>> Planning on upstreaming it, patch is here:
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/com=
mit/?h=3Dfix_avoid_disconnect_reset&id=3D72d20c026b7812d096c6b5184a38888944=
01c829
> > >>
> > >> Thanks, let me test this out.
> > >
> > > The result is negative, here's the relevant log:
> > > [  128.219129] xhci_hcd 0000:00:14.0: Port change event, 2-2, id 18,
> > > portsc: 0x4202c0
> > > [  128.219143] xhci_hcd 0000:00:14.0: handle_port_status: starting po=
rt polling.
> > > [  128.219201] hub 2-0:1.0: state 7 ports 10 chg 0000 evt 0004
> > > [  128.219217] xhci_hcd 0000:00:14.0: Get port status 2-2 read:
> > > 0x4202c0, return 0x4102c0
> > > [  128.219244] xhci_hcd 0000:00:14.0: clear port2 connect change,
> > > portsc: 0x4002c0
> > > [  128.219256] usb usb2-port2: link state change
> > > [  128.219264] xhci_hcd 0000:00:14.0: clear port2 link state change,
> > > portsc: 0x2c0
> > > [  128.232326] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping
> > > port polling.
> > > [  128.244356] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2c0=
,
> > > return 0x2c0
> > > [  128.244383] usb usb2-port2: Wait for inactive link disconnect dete=
ct
> > > [  128.272342] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2c0=
,
> > > return 0x2c0
> > > [  128.272370] usb usb2-port2: Wait for inactive link disconnect dete=
ct
> > > [  128.300348] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2c0=
,
> > > return 0x2c0
> > > [  128.300375] usb usb2-port2: Wait for inactive link disconnect dete=
ct
> > > [  128.328342] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2c0=
,
> > > return 0x2c0
> > > [  128.328369] usb usb2-port2: Wait for inactive link disconnect dete=
ct
> > > [  128.356343] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2c0=
,
> > > return 0x2c0
> > > [  128.356370] usb usb2-port2: Wait for inactive link disconnect dete=
ct
> > > [  128.356374] usb usb2-port2: do warm reset, port only
> > > [  128.377500] xhci_hcd 0000:00:14.0: Port change event, 1-2, id 2,
> > > portsc: 0x206e1
> > > [  128.377515] xhci_hcd 0000:00:14.0: handle_port_status: starting po=
rt polling.
> > > [  128.377570] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0004
> > > [  128.377586] xhci_hcd 0000:00:14.0: Get port status 1-2 read:
> > > 0x206e1, return 0x10101
> > > [  128.377614] xhci_hcd 0000:00:14.0: clear port2 connect change, por=
tsc: 0x6e1
> > > [  128.377626] usb usb1-port2: status 0101, change 0001, 12 Mb/s
> > > [  128.377636] xhci_hcd 0000:00:14.0: Get port status 1-2 read: 0x6e1=
,
> > > return 0x101
> > > [  128.398304] xhci_hcd 0000:00:14.0: Port change event, 1-2, id 2,
> > > portsc: 0x202a0
> > > [  128.398319] xhci_hcd 0000:00:14.0: handle_port_status: starting po=
rt polling.
> > > [  128.412343] xhci_hcd 0000:00:14.0: Get port status 1-2 read:
> > > 0x202a0, return 0x10100
> > > [  128.412376] xhci_hcd 0000:00:14.0: clear port2 connect change, por=
tsc: 0x2a0
> > > [  128.416337] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2b0=
,
> > > return 0x2b0
> > > [  128.416368] usb usb2-port2: not warm reset yet, waiting 50ms
> > > [  128.448341] xhci_hcd 0000:00:14.0: Get port status 1-2 read: 0x2a0=
,
> > > return 0x100
> > > [  128.476335] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2f0=
,
> > > return 0x2f0
> > > [  128.476366] usb usb2-port2: not warm reset yet, waiting 200ms
> > > [  128.480332] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping
> > > port polling.
> > > [  128.484343] xhci_hcd 0000:00:14.0: Get port status 1-2 read: 0x2a0=
,
> > > return 0x100
> > > [  128.520323] xhci_hcd 0000:00:14.0: Get port status 1-2 read: 0x2a0=
,
> > > return 0x100
> > > [  128.556325] xhci_hcd 0000:00:14.0: Get port status 1-2 read: 0x2a0=
,
> > > return 0x100
> > > [  128.556353] usb usb1-port2: debounce total 125ms stable 100ms stat=
us 0x100
> > > [  128.556366] hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0004
> > > [  128.556376] xhci_hcd 0000:00:14.0: Get port status 1-2 read: 0x2a0=
,
> > > return 0x100
> > > [  128.684329] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2f0=
,
> > > return 0x2f0
> > > [  128.684360] usb usb2-port2: not warm reset yet, waiting 200ms
> > > [  128.892325] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2f0=
,
> > > return 0x2f0
> > > [  128.892357] usb usb2-port2: not warm reset yet, waiting 200ms
> > > [  129.100317] xhci_hcd 0000:00:14.0: Get port status 2-2 read: 0x2f0=
,
> > > return 0x2f0
> > > [  129.100348] usb usb2-port2: not warm reset yet, waiting 200ms
> > > [  129.100354] hub 2-0:1.0: port_wait_reset: err =3D -16
> > > [  129.100358] usb usb2-port2: not enabled, trying warm reset again..=
.
> > >
> >
> > Ok, so after port 2-2 was stuck in inactive (2c0) for long enough we re=
set it.
> > It goes to RxDetect with reset asserted(2b0), and then to polling with =
reset asserted(2f0).
> > The "RxDetect" and "polling" link states are not very reliable while re=
set is asserted.
> >
> > So problem 1 is that port stays in Inactive for a long time even if dev=
ice was disconnected.
> > Issue 2 is that reset never completes. We are stuck in reset.
> >
> > Just out of curiosity, does the link go to "RxDetect" from "inactive" i=
f we just
> > increase the retry, or is it really stuck in inactive state?
>
> The result is still negative.

Mathias,

So should I refine this patch, or do you want to dig a bit more?

Kai-Heng

>
> Kai-Heng
>
> >
> > i.e.
> > -#define DETECT_DISCONNECT_TRIES 5
> > +#define DETECT_DISCONNECT_TRIES 20
> >
> > -Mathias
