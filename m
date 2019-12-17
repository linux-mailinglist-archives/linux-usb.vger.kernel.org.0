Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D91122A32
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 12:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfLQLf0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 06:35:26 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:36513 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfLQLf0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 06:35:26 -0500
Received: by mail-qv1-f68.google.com with SMTP id m14so3477743qvl.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fZdgUh+3fq9U6L3+p94OehUQ70Eb7XI14xqgdmXCu0g=;
        b=U7G1uuURLEW0k1zpqBNbqSokpnyhi+5QnETsayOUPDLxY45TSRhyUK/3m2l+fT2gz/
         ut1wULFzlavyxyt+rF3yubDjAuv3AUzL1LMSHqYJncH+EC9i6lDHWg44xMlloRV5AyY3
         DtgmJf9z6QHB95Feo7mn2QGJSnjoSyFu778Zx+GloOyQK5AtseTF4MuM795qK3Jjmkgd
         QuTfb5jABlLLSheeLpfhFikVlRXy8Hk2b1MePaXcuZJhHAHBQ5x6Zqa9WMaq19kA7/6a
         MEYxilrylXJIL5ZIAXLuoX0mUFBW/mEvIaUbJdSZjWWzz87QLUplyFrp93J2IY/tPXYD
         jeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fZdgUh+3fq9U6L3+p94OehUQ70Eb7XI14xqgdmXCu0g=;
        b=F2qoTcbT4d2EG6rIETdUTgh76d+ZHcPHZuPL5TYcDu2j4aFmyWSXomU1FE8SKlFYNa
         H7Yp7dDihHdkny3nmTtjI2XMnDRdcyjp9smwuJpmi44Y197Fsh7kR1JOKogTE+sz0UFK
         XPTNWVJ1Y7f7SqoWdqyEQic8lAPC0DkOUmM1CXUZaqgaq0Re4leWA3+YMrMYqlYG4QeJ
         sQWGQtZN3L6nzJ6dn5o5lfOVVTcW7P967r7xM/p7LD195sbRooXAJnwFRVW+nbk+r7hd
         00NDtVmc6MialmilFZwOkgM9QFu2BYRvGG1XjFFEDcbSCWsKU2rTBp4dHWoaIQnAHXbr
         xBzA==
X-Gm-Message-State: APjAAAU70IsuO/QnocT2Zft31BbTL3ku3G0xLdLIbn8ZZKLeIGYKL5X6
        OqRZYwM7wNRWEJHRcyRFZkDXDU0Y+KalSvlaTpBxKA==
X-Google-Smtp-Source: APXvYqz4Oc/yoEJ/14nt/DX7bhsOQyEb5x7FbrSFmpJ7UILMAmG24P9U1jbidVmgS2x9fi9bXJQhdgdz6YgqoKVJYlI=
X-Received: by 2002:ad4:4c84:: with SMTP id bs4mr4130682qvb.34.1576582524752;
 Tue, 17 Dec 2019 03:35:24 -0800 (PST)
MIME-Version: 1.0
References: <95e7a12ac909e7de584133772efc7ef982a16bbb.1576170740.git.andreyknvl@google.com>
 <Pine.LNX.4.44L0.1912121313030.1352-100000@iolanthe.rowland.org>
 <CAAeHK+yOBcNz_iopRs6PEu=1-rZn6Gkm+Urq+iVBFQeSjSXqNA@mail.gmail.com>
 <CACT4Y+aN20NXxXhe9qv_WRLntAHbL98Shj8NAvg0WafDw8C=jA@mail.gmail.com> <CAAeHK+xyVh6QkbUp6z+fLrv5f9sODkgFuvmBU1jB8borQ9M65g@mail.gmail.com>
In-Reply-To: <CAAeHK+xyVh6QkbUp6z+fLrv5f9sODkgFuvmBU1jB8borQ9M65g@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 17 Dec 2019 12:35:13 +0100
Message-ID: <CACT4Y+a+8u=OoUeC247he4EM1x=CJEeMvix=XViQVfkiU_Kk2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] kcov: collect coverage from interrupts
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 17, 2019 at 12:16 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > On Thu, Dec 12, 2019 at 7:15 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Thu, 12 Dec 2019, Andrey Konovalov wrote:
> > > >
> > > > > This change extends kcov remote coverage support to allow collecting
> > > > > coverage from interrupts in addition to kernel background threads.
> > > > >
> > > > > To collect coverage from code that is executed in interrupt context, a
> > > > > part of that code has to be annotated with kcov_remote_start/stop() in a
> > > > > similar way as how it is done for global kernel background threads. Then
> > > > > the handle used for the annotations has to be passed to the
> > > > > KCOV_REMOTE_ENABLE ioctl.
> > > > >
> > > > > Internally this patch adjusts the __sanitizer_cov_trace_pc() compiler
> > > > > inserted callback to not bail out when called from interrupt context.
> > > > > kcov_remote_start/stop() are updated to save/restore the current per
> > > > > task kcov state in a per-cpu area (in case the interrupt came when the
> > > > > kernel was already collecting coverage in task context). Coverage from
> > > > > interrupts is collected into pre-allocated per-cpu areas, whose size is
> > > > > controlled by the new CONFIG_KCOV_IRQ_AREA_SIZE.
> > > > >
> > > > > This patch also cleans up some of kcov debug messages.
> > > > >
> > > > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > > > ---
> > > >
> > > > > diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> > > > > index 4c9d1e49d5ed..faf84ada71a5 100644
> > > > > --- a/drivers/usb/gadget/udc/dummy_hcd.c
> > > > > +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> > > > > @@ -38,6 +38,7 @@
> > > > >  #include <linux/usb/gadget.h>
> > > > >  #include <linux/usb/hcd.h>
> > > > >  #include <linux/scatterlist.h>
> > > > > +#include <linux/kcov.h>
> > > > >
> > > > >  #include <asm/byteorder.h>
> > > > >  #include <linux/io.h>
> > > >
> > > > That's the only change to this driver.  As such, it doesn't appear to
> > > > be needed, judging by the patch description.
> > >
> > > Right, will fix in the next version, thanks!
> >
> > Please also post a github or gerrit link. These small scraps of
> > changes without context and better visualisation are extremely hard to
> > review meaningfully.
>
> The link is in the cover letter:
>
> https://linux-review.googlesource.com/c/linux/kernel/git/torvalds/linux/+/2224/1

Sorry, missed. Now I can read it!
