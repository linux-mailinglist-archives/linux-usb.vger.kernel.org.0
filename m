Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1D1BEFC2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 12:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfIZKjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 06:39:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44019 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfIZKjL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 06:39:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id q17so1836725wrx.10
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aX5oyJZTw8yupOBLlQH+6KsUSfYBbPleGyGnZwtmEao=;
        b=VcCZZGpOlAzvXFSXeVCl1szzGGB7SWZW40KzWyyRIguZ1YNNhPC6mjNUvO9lD1IhUa
         fdT712sLvN0b91in5DP2abK4rjZFlOGnxwaZMchGZKXDQ5ruL8+o/5BF6+jBClOJrvJ7
         H4y7CEip7rZ+153vVDnaTd0ga3IRucicq6JdiZtFdyFAty6gC1S/12gvTSUwINMmjri0
         yvtaz188E982I/G4BbTzchaxGMC5y9Nu55X9afZ5M98yI4trAAU5qLduFWn8qK8rLPbB
         W+ezu4+7uSowl1FlVYBZBGkHCZ5BJWis2+I9TvgAam5jFii27VtlrLlBP6w3o8IZYXPZ
         34Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aX5oyJZTw8yupOBLlQH+6KsUSfYBbPleGyGnZwtmEao=;
        b=QP/F+9U0+ReFI6Bx0kDAbH4n95mthyVs1DXs8aGDMwE6ZQiVp7QOCC0ZdUtT1N/lt9
         +z4JEbsH8PFyJiktiZyz1PAMO7M5ShhEzBvPufz2mznpCkxOC6YhCd7NgxcyHOmOjYQl
         wKhdB/cb6aK3vOHH8okP0bSkp+/M3+GuOYeW8Mvos+MF2bZlEiHihDSOJSUw1Z7rst+N
         A2k/n5QbjFX6yNIkC2LNveqvxfZKggtvShcP7E3I/VBTY2oxzpmYrouStVxyNfGwD6Rh
         gUFV7N23lyaoplW7z3nUdQPwpf8bHPQ2RY3MMJkh3aORV/fBMRnbzS1YbcewcoVAQsu0
         DRcQ==
X-Gm-Message-State: APjAAAVHEbcq9Ehf8JSaAB6sezcYhMoff+1CliSQBwhaAzq06jpAtLs5
        eFubJx1iCLjF7OcvEn28GGATI8dZAKTjC8OT0eQ=
X-Google-Smtp-Source: APXvYqzLAWMk4aqPRc+xLXt6EamPy7vwad9pct5UlPgwDA/qpS5Hq2UN/02PsdeDTfORSdCsAOM18EUp4uBoZx7myN0=
X-Received: by 2002:a5d:6943:: with SMTP id r3mr2311563wrw.21.1569494349006;
 Thu, 26 Sep 2019 03:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADGPSwj3aTJjjHvPSZVgxNRGikznL5i=-8Q2hOUb1LoLbWcRDA@mail.gmail.com>
 <87a7avh8uu.fsf@gmail.com> <CADGPSwjTn1KwMcxKdajNwxbLi09-SQ1Eu=1m57Z+LNnj0i2BeA@mail.gmail.com>
 <106544ca-7a01-0a86-e785-c7c520ebdc4b@linux.intel.com> <CADGPSwi87a5+3mCGAgptHgpBsQk9STQrEKs-kC6Nw55nPdRtOw@mail.gmail.com>
 <5431a9df-3816-b525-c3bc-4e7462d0f38f@linux.intel.com> <f5cd8ff1767c48a0bd86e743ae128b10@AcuMS.aculab.com>
 <87d0fny5in.fsf@gmail.com> <52a7b158-ab76-432a-4d2c-7b731dc9c2a2@linux.intel.com>
In-Reply-To: <52a7b158-ab76-432a-4d2c-7b731dc9c2a2@linux.intel.com>
From:   alex zheng <tc0721@gmail.com>
Date:   Thu, 26 Sep 2019 18:38:32 +0800
Message-ID: <CADGPSwgJMKfQChfxMNU4S_xv1vfHr7_GY6rGwgeDOVuW6+mpVg@mail.gmail.com>
Subject: Re: BUG report: usb: dwc3: Link TRB triggered an intterupt without
 IOC being setted
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "xiaowei.zheng@dji.com" <xiaowei.zheng@dji.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Mathias Nyman <mathias.nyman@linux.intel.com> =E4=BA=8E2019=E5=B9=B49=E6=9C=
=8826=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:19=E5=86=99=E9=81=93=
=EF=BC=9A
>
> On 26.9.2019 8.45, Felipe Balbi wrote:
> >
> > Hi,
> >
> > David Laight <David.Laight@ACULAB.COM> writes:
> >> From: Mathias Nyman
> >>> Sent: 25 September 2019 15:48
> >>>
> >>> On 24.9.2019 17.45, alex zheng wrote:
> >>>> Hi Mathias,
> >> ...
> >>> Logs show your transfer ring has four segments, but hardware fails to
> >>> jump from the last segment back to first)
> >>>
> >>> Last TRB (LINK TRB) of each segment points to the next segment,
> >>> last segments link trb points back to first segment.
> >>>
> >>> In your case:
> >>> 0x1d117000 -> 0x1eb09000 -> 0x1eb0a000 -> 0x1dbda000 -> (back to 0x1d=
117000)
> >>>
> >>> For some reason your hardware doesn't treat the last TRB at the last =
segment
> >>> as a LINK TRB, instead it just issues a transfer event for it, and co=
ntinues to
> >>> the next address instead of jumping back to first segment:
> >>
> >> That could be a cache coherency (or flushing (etc)) issue.
>
> The Link TRB is written very early, right after the ring segment is alloc=
ated,
> and before any other TRBs. 255 other TRBs were written and handled by hw
> on this segment after this, so not very likely a flushing/cache coherency=
 issue.
>
I  add a flush_cache_all() after queue_trb everytime but it make no
use. It seems
not a flushing/cache coherency issus.

flush like this:
     inc_enq(xhci, ring, more_trbs_coming);

                                                  +
flush_cache_all();

> >
> > XHCI has a HW-configurable maximum number of segments in a ring. AFAICT=
,
> > xhci driver doesn't take that into consideration today. Perhaps the HW
> > in question doesn't like more than 3 segments.
> >
> > Mathias, what was the register to check this? Do you remember?
> >
>
> I only recall a limit for the event ring in the HSCPARAMS2 register(ERST =
MAX),
> not for transfer rings.
>
> Other things to look at would be
>
> - check that Toggle Cycle bit is correct for last segments link TRB (inco=
mplete logs)

I dump an other error log, more complete logs see attached
file(transfer_error_0926.cap), in the log:
the error link TRB:
0x1d00dff0: TRB 000000001d068000 status 'Invalid' len 0 slot 0 ep 0
type 'Link' flags e:c
and last segment link TRB:
0x1eb0aff0: TRB 000000001d00d000 status 'Invalid' len 0 slot 0 ep 0
type 'Link' flags e:C

> - some old xHCI hardware needed the Chain bit set in link TRB for some is=
oc rings
xhci ver is 1.1:
6.888570] c1 46 (kworker/u8:1) xhci-hcd xhci-hcd.0.auto: HCIVERSION: 0x110

> - was ring recently expanded?, usually rings start with only two segments
The extra segments are expanded after raw data test run a while,
especially when the RNDIS test(iperf3) begin to run.

Other info:
1. This issue seems only happened when the raw bulk data test and the
rndis test(other pair endpoints) run at the same time, and happens
more often if we queue trb more quick.
2. The raw bulk data test case is a libusb test use ep4(in) & ep3(out)
to transfer raw bulk data, and I use iperf3(tcp) to test USB rndis.
3. The log file attached only show ep4(in) enqueue/dequeue log for
more readable,
4. More test result show as below:
           1)  run just one raw bulk data test  -->  (always fine)
           2)  run raw rulk data test + rndis test run at the same
time --> (transfer error in 10 minutes)
           3)  run two raw bulk data test run at the same time (with
two pair endpoint) --> (transfer error in 10 minutes)
5. I try to modify the DWC3 hw registers like TX/RX FIFO size,
GTXTHRCFG/GRXTHRCFG , but also did not work.
6. Related interface info:
             8801 I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3De0(wlcon) Sub=3D01
Prot=3D03 Driver=3Drndis_host
             8802 E:  Ad=3D82(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D32ms
             8803 I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00
Prot=3D00 Driver=3Drndis_host        -----> used in rndis test
             8804 E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
             8805 E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
             8809 I:* If#=3D 3 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D43
Prot=3D01 Driver=3D(none)    -----> used in raw bulk test
             8810 E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
             8811 E:  Ad=3D84(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
             8820 I:* If#=3D 7 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D43
Prot=3D01 Driver=3D(none)     ----> used in double raw bulk test
             8821 E:  Ad=3D06(O) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms
             8822 E:  Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms

It seems that there are some conflicts when multiple endpoints work at
the same time on our SOC. Are there any other way can try?

>

> Mathias
