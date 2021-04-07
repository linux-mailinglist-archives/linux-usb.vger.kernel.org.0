Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AB4356D5F
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 15:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344428AbhDGNfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 09:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344363AbhDGNfS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Apr 2021 09:35:18 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA17BC061756
        for <linux-usb@vger.kernel.org>; Wed,  7 Apr 2021 06:35:07 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e10so4984923pls.6
        for <linux-usb@vger.kernel.org>; Wed, 07 Apr 2021 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeTxAmjoTv+uSNmE4X15tF/iEdtYFSOYC5w2e5Y7C9w=;
        b=C4RpqTUZ5qteGvs3HzzxHI7dZ37a9IdKw61pYUC1LaSywSSyzvgPtrJMlKgNHGJJBj
         A8P+3RWk8edS3heMtwBH8ezLYLNuf6ERWPVNScSnOD5IKcTxocbWphuoVJhIJ85VvwMi
         T90DGbp6PQHlc3lp5g2pE/XlR4yRdeLuqmqx6kNEj3knICt3xxec6qDj7JmPVJogwgKx
         oV4h5injoUD8jct2tPvXJrztsiyH1PDV0LO5XP1rxTvOGuzmKR7TZ0UilAPmMM7/jahq
         /sFjU/mNGX+QzNzZAcv5A1EH1Hk+w+Ad1F7lj6qub1X3NXio+cevnd7wmzghFMc+tCpr
         Ubwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeTxAmjoTv+uSNmE4X15tF/iEdtYFSOYC5w2e5Y7C9w=;
        b=C3kKHciXjI22ispdqtum+As7fKNPPiUl4hu92tIFSBdqr4EegsZfolI2BarAJo2EWa
         RmAWP/XTMjb5GA47HsqjEI4FSDBNYwMv0xAa61B8faH+2ntc3Q/aRptnl1pfPEgWP5DQ
         3kHtOgZbnc2QGdXrlC9alzTRo4EzFcb3+Bo0cTpO5lgjAsGUhCjXCyqxzm+eALcdLN5c
         DrwHoPOd/YEffLdsx94KmRFjcmlgxNwuhcbk3CXXlUwnbQCFHj3MekuFwIwTm4f/mtfV
         4IzQbzaT/z/wpKFi3m0xwk0ISA/ePqcWUEdJOUSmGFZRCsg0hNB3ElUXGtl74Gl5DBN1
         Q4lw==
X-Gm-Message-State: AOAM530eHaAtZWLhLL2D4DsTHw6nkyphU1jjrsEdm6wk5WXprB12XZ0q
        qCNOjXwtXgGtbdqr/tb646m4ItnXinrcrnaGtao=
X-Google-Smtp-Source: ABdhPJysGJIIo+nEB0h+p5XeTbFsiXZJf6VAe/cVnuleqT9xuN7Zrn8x0mdrsh/WgUr8EZ9G+KCRIVtiaBJo2DWYpuY=
X-Received: by 2002:a17:90b:1e0a:: with SMTP id pg10mr2758386pjb.129.1617802507149;
 Wed, 07 Apr 2021 06:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com> <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com> <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
 <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com> <4a0869c9-6b71-5acd-e670-e4c06b44d62d@gmail.com>
 <5d8459ae-4a4c-7371-6b0a-ed817e898168@gmail.com> <7963d464-44c1-f580-398c-775c694664cb@gmail.com>
 <f24b6e66-1fdc-06f0-97b4-f2a9be3eef6b@synopsys.com> <e50114a1-f7d3-ad62-fe6d-6b8bb2b1203f@synopsys.com>
In-Reply-To: <e50114a1-f7d3-ad62-fe6d-6b8bb2b1203f@synopsys.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Apr 2021 16:34:50 +0300
Message-ID: <CAHp75Vf+3aeq8kb2oOO-qjC5jOE7ZWUgs2=MOa4mseOG08c+vA@mail.gmail.com>
Subject: Re: USB network gadget / DWC3 issue
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 7, 2021 at 3:24 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> Thinh Nguyen wrote:

...

> > I took a look at the "bad" and "normal" tracepoints. There are a few
> > 1-second delays where the host tried to bring the device back and
> > resume from low power:
> >
> >      ksoftirqd/0-10      [000] d.s.   231.501808: dwc3_gadget_ep_cmd: ep3in: cmd 'Update Transfer' [60007] params 00000000 00000000 00000000 --> status: Successful
> >      ksoftirqd/0-10      [000] d.s.   231.501809: dwc3_readl: addr 00000000d68ecd36 value 0000a610
> >      ksoftirqd/0-10      [000] d.s.   231.501810: dwc3_writel: addr 00000000d68ecd36 value 0000a710
> >           <idle>-0       [000] d.h.   232.499418: dwc3_readl: addr 00000000a15e0e35 value 00000034
> >           <idle>-0       [000] d.h.   232.499423: dwc3_readl: addr 00000000bb67b585 value 00001000
> >           <idle>-0       [000] d.h.   232.499425: dwc3_writel: addr 00000000bb67b585 value 80001000
> >           <idle>-0       [000] d.h.   232.499427: dwc3_writel: addr 00000000a15e0e35 value 00000034
> >      irq/15-dwc3-476     [000] d...   232.499480: dwc3_event: event (00000401): WakeUp [U0]
> >      irq/15-dwc3-476     [000] d...   232.499492: dwc3_event: event (00000401): WakeUp [U0]
> >      irq/15-dwc3-476     [000] d...   232.499496: dwc3_event: event (00006088): ep2out: Transfer In Progress [0] (SIm)
> >      irq/15-dwc3-476     [000] d...   232.499501: dwc3_complete_trb: ep2out: trb 00000000c7ce524e (E179:D170) buf 0000000008273540 size 1463 ctrl 00000818 (hlcS:sC:normal)
> >      irq/15-dwc3-476     [000] d...   232.499518: dwc3_gadget_giveback: ep2out: req 0000000012e296cf length 73/1536 zsI ==> 0
> >      irq/15-dwc3-476     [000] d...   232.499562: dwc3_ep_queue: ep2out: req 0000000012e296cf length 0/1536 zsI ==> -115
> >      irq/15-dwc3-476     [000] d...   232.499601: dwc3_prepare_trb: ep2out: trb 000000008c083777 (E180:D170) buf 0000000002a7e9c0 size 1536 ctrl 00000819 (HlcS:sC:normal)
> >
> >
> > Your device is operating in highspeed right? Try to turn off LPM from
> > host and see if that helps with the speed throttling issue. (If you're
> > using xHCI host, then set XHCI_HW_LPM_DISABLE). It may also help with
> > the connection issue you saw.
> >
> > It seems to be an issue from host, but I can't tell for sure unless we
> > have some USB traffic analyzer that shows what's going on. Have you
> > tried different hosts?
> >
>
> You can also disable LPM from the gadget side by setting
> dwc->dis_enblslpm_quirk.

Ferry, it can be done by adding a corresponding property to the
dwc3-pci.c for Intel Merrifield platform. I'll check also for my case
and perhaps I can collect some traces in my case later on when I have
more time for that.


-- 
With Best Regards,
Andy Shevchenko
