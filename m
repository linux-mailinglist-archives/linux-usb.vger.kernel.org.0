Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C607711E355
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 13:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfLMMJF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 07:09:05 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36273 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfLMMJF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 07:09:05 -0500
Received: by mail-pf1-f193.google.com with SMTP id x184so1380371pfb.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2019 04:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HBdg8NM7+HQptNIzAMC443OTDQO+44P73MQX/Q0UH7k=;
        b=LteCGafneFHNrjHtOG87xySeGd2iWeU5eIC5eu43lJlbOCefdhcciR6Dyruva1GRUf
         NoL0zkkmLIF9PKdt2/56hRbvLCSc4uerblCcFWfAXYGhWuWGNChFEzcp0q2nTuZGw4DW
         bMphVC6NFJYEvfUrY45BZO/pow30TxjTNEputmwxH+dEInapijPGktnJ+FOQ8Ogtyy9L
         1T4iIiYn/+yWdsLzP2gvCEbo6h+wYq0h/nBidcV8G3JzfkfWNOTYCBkD0IiM/RA4xEEj
         XjprhLN0r5Z7x6hqRtcSsgN6Br5olt7TwoKNpz5RFyHXD3/fCfQYYerNr0LC8vdNz+ZE
         4Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HBdg8NM7+HQptNIzAMC443OTDQO+44P73MQX/Q0UH7k=;
        b=pzjGI+TbYsYwaKpI28A+AeatlqwPDSotiR15+LF0upHQTyWgT7dXNqyE6AuIBg3uft
         RIJ89St65iLB5lH179q6z/dzDftzJiJyS5/9P/aV/Ob3ENnlK/VyF8LDVFhffBVr2IZ/
         XCO1T2+jAMVydRNzQ9CDx7m0wIBvNIreAcGjUDpA/A/SYfflCEiMRmpHF9+ojmnHo5vE
         pwSfuF40PKk/NNp/Ym4dc1I0Mlbvoi9sX8BgvapKlt/ME8s6gIhuwXIwAj8e8rYsMmg3
         Zr5avPFYBoGIz2EdHirXlGN+HX+a6ADvDK38bn+FVzzlwh3jh+5ETGwZdFcQWM2bTs/i
         7T8w==
X-Gm-Message-State: APjAAAUPFrOXatCRrJdteIa+AAJPINDdWw8YetgeBMchwBm6emphZJiu
        oWqwWfNSc5Pvwg6bEl4wTC1kckLcbyFsx0AGlJbrlA==
X-Google-Smtp-Source: APXvYqzf2MmV3+QSgxOwwfSQnv4nP4s5ElsZsP3Z+wUQGfHRxcyq0D5WO7CLE1uv8LzdDDxbBYqamIWDnubb4t6wrME=
X-Received: by 2002:a63:31d0:: with SMTP id x199mr16767949pgx.286.1576238944447;
 Fri, 13 Dec 2019 04:09:04 -0800 (PST)
MIME-Version: 1.0
References: <95e7a12ac909e7de584133772efc7ef982a16bbb.1576170740.git.andreyknvl@google.com>
 <Pine.LNX.4.44L0.1912121313030.1352-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912121313030.1352-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 13 Dec 2019 13:08:53 +0100
Message-ID: <CAAeHK+yOBcNz_iopRs6PEu=1-rZn6Gkm+Urq+iVBFQeSjSXqNA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] kcov: collect coverage from interrupts
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 12, 2019 at 7:15 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, 12 Dec 2019, Andrey Konovalov wrote:
>
> > This change extends kcov remote coverage support to allow collecting
> > coverage from interrupts in addition to kernel background threads.
> >
> > To collect coverage from code that is executed in interrupt context, a
> > part of that code has to be annotated with kcov_remote_start/stop() in a
> > similar way as how it is done for global kernel background threads. Then
> > the handle used for the annotations has to be passed to the
> > KCOV_REMOTE_ENABLE ioctl.
> >
> > Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
> > inserted callback to not bail out when called from interrupt context.
> > kcov_remote_start/stop() are updated to save/restore the current per
> > task kcov state in a per-cpu area (in case the interrupt came when the
> > kernel was already collecting coverage in task context). Coverage from
> > interrupts is collected into pre-allocated per-cpu areas, whose size is
> > controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.
> >
> > This patch also cleans up some of kcov debug messages.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
>
> > diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> > index 4c9d1e49d5ed..faf84ada71a5 100644
> > --- a/drivers/usb/gadget/udc/dummy_hcd.c
> > +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/usb/gadget.h>
> >  #include <linux/usb/hcd.h>
> >  #include <linux/scatterlist.h>
> > +#include <linux/kcov.h>
> >
> >  #include <asm/byteorder.h>
> >  #include <linux/io.h>
>
> That's the only change to this driver.  As such, it doesn't appear to
> be needed, judging by the patch description.

Right, will fix in the next version, thanks!
