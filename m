Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D284AE16B2
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 11:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390527AbfJWJxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 05:53:17 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50899 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390246AbfJWJxR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 05:53:17 -0400
Received: by mail-wm1-f68.google.com with SMTP id q13so10427351wmj.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Yt8St3Drd8h/oD7iRr4dScchwBzRRM182GxYTAj3Wdo=;
        b=CspqCuA//3OCngCe3k/+Y/FOGuuV13qirLiIJlntZ3ZNbyZD1EWLkg5yR4VbRbkf1c
         hTdhJVycjDMewqC+OwkpePKDDx0Q0GqM/0GWG+tYWLMPusXPhHxDzX9Q1oBfWW3k8e8R
         qa5h2IlT6x0ZQN7bJ0VsrmGDmcT6uyx4ny+dpVj3dVF6Nt/YjFFb6R95G3UKqtl71BXZ
         XcTKYiZ3gCu420htXe2/1JPaP/aXMmxVC3Iui9cQmWZbAuQRJWnUG29pmozSfVCq2Ddu
         laGMX5YXGrpUnZzGIxZ3mEhcdscZizytE8Ijl3kl0+r0h2v49om6OGPZoYWlXn5uIrga
         GGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Yt8St3Drd8h/oD7iRr4dScchwBzRRM182GxYTAj3Wdo=;
        b=jb7mMmNQDYujbD5B88cNojyzzzy2W9IRBVqBI0E5RR7Mw0N7SUr+Ml8YcSQxeXyYIt
         3zhefVjL0cDuVICyn04a52E3M0IOLPYDkU2P4sudHmnJPpLW3MVABJdZUMw5Vw5/Pm27
         EZqRXyzH17gRXoOz4uKgzqhs3XMH9VPVxwkQczqlbQJ+RKO9Q1hLECjPDCmqekEjH08s
         0rhDG2DdLJzCz9p/fEnzYBbgaBNRH3HfGSXsF71majI3CybvUchxQpGwdiE+Bfz6Njqj
         d29g2O5UkHE4EsFWNkyGBHcqFxwD1017LgVs5/aZLFREU4PQfW14AztW2sBboriR6UFI
         V/eQ==
X-Gm-Message-State: APjAAAXv6JAeBwXX7EamD7A8R5j23k/AuicwqPDd1YPrLdM2sUOTDOuz
        Qb14VxwtYqi8pMmBzP0M/dd5RIYNsGFP9NBxiWOiGA==
X-Google-Smtp-Source: APXvYqyOlggvEK8iJl6DlCV3t+YITk/HFloqbr1LCsxqtKA7IRuvgjuphv05hRaw9NiOfMvBJQx6/125/7Bqg+p6h8I=
X-Received: by 2002:a1c:7219:: with SMTP id n25mr7267116wmc.101.1571824393852;
 Wed, 23 Oct 2019 02:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com> <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
 <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com> <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
 <87d0fny5in.fsf@gmail.com> <52a7b158-ab76-432a-4d2c-7b731dc9c2a2@linux.intel.com>
 <CADGPSwgJMKfQChfxMNU4S_xv1vfHr7_GY6rGwgeDOVuW6+mpVg@mail.gmail.com> <CADGPSwhCPvdu=KmQP6RHMJnh292UO0uBAt+KyJqqOWY5DWDc3w@mail.gmail.com>
In-Reply-To: <CADGPSwhCPvdu=KmQP6RHMJnh292UO0uBAt+KyJqqOWY5DWDc3w@mail.gmail.com>
From:   alex zheng <tc0721@gmail.com>
Date:   Wed, 23 Oct 2019 17:52:37 +0800
Message-ID: <CADGPSwiCY9=kUpKmcUwAhvCHmvGDSrxoBXEkzgQpEpiakKEv6A@mail.gmail.com>
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        David Laight <David.Laight@aculab.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng@dji.com" <xiaowei.zheng@dji.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, all

We found that this is a known issue of synopsys DWC3 USB controller,
when the PARKMODE_SS of DWC3 is enable, the controller may hang or do
wrong TRB schedule in some heavy load conditions.

Setting DISABLE_PARKMODE_SS to 1 can work around this bug.

Thank you for your help.

alex zheng <tc0721@gmail.com> =E4=BA=8E2019=E5=B9=B49=E6=9C=8826=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:34=E5=86=99=E9=81=93=EF=BC=9A
>
> add log file.
>
> alex zheng <tc0721@gmail.com> =E4=BA=8E2019=E5=B9=B49=E6=9C=8826=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:38=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > Mathias Nyman <mathias.nyman@linux.intel.com> =E4=BA=8E2019=E5=B9=B49=
=E6=9C=8826=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:19=E5=86=99=E9=
=81=93=EF=BC=9A
> > >
> > > On 26.9.2019 8.45, Felipe Balbi wrote:
> > > >
> > > > Hi,
> > > >
> > > > David Laight <David.Laight@ACULAB.COM> writes:
> > > >> From: Mathias Nyman
> > > >>> Sent: 25 September 2019 15:48
> > > >>>
> > > >>> On 24.9.2019 17.45, alex zheng wrote:
> > > >>>> Hi Mathias,
> > > >> ...
> > > >>> Logs show your transfer ring has four segments, but hardware fail=
s to
> > > >>> jump from the last segment back to first)
> > > >>>
> > > >>> Last TRB (LINK TRB) of each segment points to the next segment,
> > > >>> last segments link trb points back to first segment.
> > > >>>
> > > >>> In your case:
> > > >>> 0x1d117000 -> 0x1eb09000 -> 0x1eb0a000 -> 0x1dbda000 -> (back to =
0x1d117000)
> > > >>>
> > > >>> For some reason your hardware doesn't treat the last TRB at the l=
ast segment
> > > >>> as a LINK TRB, instead it just issues a transfer event for it, an=
d continues to
> > > >>> the next address instead of jumping back to first segment:
> > > >>
> > > >> That could be a cache coherency (or flushing (etc)) issue.
> > >
> > > The Link TRB is written very early, right after the ring segment is a=
llocated,
> > > and before any other TRBs. 255 other TRBs were written and handled by=
 hw
> > > on this segment after this, so not very likely a flushing/cache coher=
ency issue.
> > >
> > I  add a flush_cache_all() after queue_trb everytime but it make no
> > use. It seems
> > not a flushing/cache coherency issus.
> >
> > flush like this:
> >      inc_enq(xhci, ring, more_trbs_coming);
> >   + flush_cache_all();
> >
> > > >
> > > > XHCI has a HW-configurable maximum number of segments in a ring. AF=
AICT,
> > > > xhci driver doesn't take that into consideration today. Perhaps the=
 HW
> > > > in question doesn't like more than 3 segments.
> > > >
> > > > Mathias, what was the register to check this? Do you remember?
> > > >
> > >
> > > I only recall a limit for the event ring in the HSCPARAMS2 register(E=
RST MAX),
> > > not for transfer rings.
> > >
> > > Other things to look at would be
> > >
> > > - check that Toggle Cycle bit is correct for last segments link TRB (=
incomplete logs)
> >
> > I dump an other error log, more complete logs see attached
> > file(transfer_error_0926.cap), in the log:
> > the error link TRB:
> > 0x1d00dff0: TRB 000000001d068000 status 'Invalid' len 0 slot 0 ep 0
> > type 'Link' flags e:c
> > and last segment link TRB:
> > 0x1eb0aff0: TRB 000000001d00d000 status 'Invalid' len 0 slot 0 ep 0
> > type 'Link' flags e:C
> >
> > > - some old xHCI hardware needed the Chain bit set in link TRB for som=
e isoc rings
> > xhci ver is 1.1:
> > 6.888570] c1 46 (kworker/u8:1) xhci-hcd xhci-hcd.0.auto: HCIVERSION: 0x=
110
> >
> > > - was ring recently expanded?, usually rings start with only two segm=
ents
> > The extra segments are expanded after raw data test run a while,
> > especially when the RNDIS test(iperf3) begin to run.
> >
> > Other info:
> > 1. This issue seems only happened when the raw bulk data test and the
> > rndis test(other pair endpoints) run at the same time, and happens
> > more often if we queue trb more quick.
> > 2. The raw bulk data test case is a libusb test use ep4(in) & ep3(out)
> > to transfer raw bulk data, and I use iperf3(tcp) to test USB rndis.
> > 3. The log file attached only show ep4(in) enqueue/dequeue log for
> > more readable,
> > 4. More test result show as below:
> >    1)  run just one raw bulk data test  -->  (always fine)
> >    2)  run raw rulk data test + rndis test run at the same
> >         time --> (transfer error in 10 minutes)
> >    3)  run two raw bulk data test run at the same time (with
> >         two pair endpoint) --> (transfer error in 10 minutes)
> > 5. I try to modify the DWC3 hw registers like TX/RX FIFO size,
> >     GTXTHRCFG/GRXTHRCFG , but also did not work.
> > 6. Related interface info:
> >     8801 I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3De0(wlcon) Sub=3D01
> >     Prot=3D03 Driver=3Drndis_host
> >     8802 E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D32ms
> >     8803 I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00
> >      Prot=3D00 Driver=3Drndis_host        -----> used in rndis test
> >      8804 E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
> >      8805 E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
> >      8809 I:* If#=3D 3 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D43
> > Prot=3D01 Driver=3D(none)    -----> used in raw bulk test
> >      8810 E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
> >      8811 E:  Ad=3D84(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
> >      8820 I:* If#=3D 7 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D43
> > Prot=3D01 Driver=3D(none)     ----> used in double raw bulk test
> >      8821 E:  Ad=3D06(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
> >      8822 E:  Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
> >
> > It seems that there are some conflicts when multiple endpoints work at
> > the same time on our SOC. Are there any other way can try?
> >
> > >
> >
> > > Mathias
