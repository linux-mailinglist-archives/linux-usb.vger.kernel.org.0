Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBF75A25C
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 19:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfF1R3x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 13:29:53 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:46851 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfF1R3x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 13:29:53 -0400
Received: by mail-pl1-f175.google.com with SMTP id e5so3585634pls.13
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yyutn08BKERN09IHHkYgILg/kXQ3PabDu5Kra31J0Qc=;
        b=UkUJ2hi95liaUDk+NDojRIENkctUcB+DiNdtw7ZVEvgG/fBfJ4VfUqjyTGhS6p3ePz
         bzTMCjX9FcgAU5mV9VIo8y6aERsDd8XPkAwLqhQ9AMfb0RlEDPIzmfUM9K0B/JH92u0I
         i+gQ7Xv4Q2exxJyokEIs5Zo1Ap6swqo3Cg95DpisZj+wcFvfy+AbVsC7LPArDMOx1rn4
         tO+dfqE/wBg6Sxyp0ZZNOB6h7+blunwzQ981X3teYVhpRTGvfjdbTCl8MRJLJ7t++1se
         Eob7Tc7gmIw5IeCIPKSnCzaoocpmfxhQv/raV2wYLyIyqY1fkT70XRUAbJAkJUwX7Pgl
         d9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yyutn08BKERN09IHHkYgILg/kXQ3PabDu5Kra31J0Qc=;
        b=mjUbeidp4MX0440R5mEUrPv9Vkkyi1HuhtOiuz/QegMxRpBZCWfykoaGhMiJzEqXtY
         9H8m1esPDk4uibeUd3CCoK4KeTAaX+25EwlhY7xe2UoOdSIIbjaXB6k0FHaCJ1jkSHNR
         cXhtyBhdQQhRuV5Xks58Kal/KFfMMIdTmiJYGvShkyOrcWBVcOa/CHL14nKHtz+BRA+K
         seBsE8O5do9B7SiRdnp/nGrtAJaug5AROan51TuAZgxy4C+d63kKVJZhD88Q+UD4I9Qq
         b2iRGF5GPGXsGHineJrKja185PdN92PBy09PQYxngic5JUqsqWERvmHKsAn+YQ/IQtEw
         LuWw==
X-Gm-Message-State: APjAAAU5v7dUutqCfv1PwvksKzR/pB0SHQO5QJqnCIzuJbQ2hPpAMBJP
        EDi/r47J7vKc2gIpBChHa3to4qrxtzJue5ZYfhjCTw==
X-Google-Smtp-Source: APXvYqy+NIUBvCOclFVRJwNyPHWNGGgBN/1KVaBatqLyd/4FuPQ7DfCQYUN0hF/3LCaI0R/RW9wUU0Epc4bCtdy+iK4=
X-Received: by 2002:a17:902:4183:: with SMTP id f3mr12710166pld.336.1561742992066;
 Fri, 28 Jun 2019 10:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+y6W=w1_bJYa_T4SLYfZnRCKrtiz5o6Nvnmedq8Um2-LA@mail.gmail.com>
 <Pine.LNX.4.44L0.1906180948100.1659-100000@iolanthe.rowland.org> <CAAeHK+x7XZ0_ZON=h_4rCrBwQ3ii8A4nGMUJajbREzpUZ_ebRQ@mail.gmail.com>
In-Reply-To: <CAAeHK+x7XZ0_ZON=h_4rCrBwQ3ii8A4nGMUJajbREzpUZ_ebRQ@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 28 Jun 2019 19:29:40 +0200
Message-ID: <CAAeHK+wVdjCein2rtWVYTq5Cp9jf0pcVSEvyWHYKDEh78-1xrg@mail.gmail.com>
Subject: Re: Pass transfer_buffer to gadget drivers
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 28, 2019 at 6:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Tue, Jun 18, 2019 at 3:53 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, 18 Jun 2019, Andrey Konovalov wrote:
> >
> > > On Tue, Jun 18, 2019 at 3:31 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > >
> > > > On Fri, Jun 7, 2019 at 5:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > > >
> > > > > On Fri, Jun 7, 2019 at 5:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > >
> > > > > > On Fri, 7 Jun 2019, Andrey Konovalov wrote:
> > > > > >
> > > > > > > > > The problem is that I want to receive that data (from the data stage)
> > > > > > > > > from within my gadget driver module. But it's not passed to the
> > > > > > > > > setup() callback. And the question is: how do I do that then?
> > > > > > > >
> > > > > > > > I just caught up on this thread...
> > > > > > > >
> > > > > > > > The answer is simple: The gadget driver's setup() callback routine
> > > > > > > > submits a request for endpoint 0.  The Data Stage data is sent or
> > > > > > > > received (depending on the direction encoded in the Setup information)
> > > > > > > > by this request.
> > > > > > >
> > > > > > > Ah, OK, got it, thanks!
> > > > > > >
> > > > > > > Although while looking at the dummy_hcd implementation, I saw that it
> > > > > > > accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> > > > > > > handle_control_request(), which is called right before the setup()
> > > > > > > callback is called. So the data already available there without any
> > > > > > > additional requests. Is this an implementation detail that is specific
> > > > > > > to dummy_hcd?
> > > > > >
> > > > > > Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
> > > > > > controller and a USB device controller in a single driver.
> > > > > >
> > > > > > Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without
> > > > > > requiring the use of an explicit usb_request, because they handle the
> > > > > > entire transfer internally and don't involve the gadget driver.
> > > > > > However, they don't have access to any transfer_buffer; all they can do
> > > > > > is exchange packets with the host.
> > > > >
> > > > > OK, I see. Thanks a lot!
> > > >
> > > > Another question: do I understand correctly, that we only proceed with
> > > > submitting an URB to get the data for the control OUT request
> > > > (ctrl->bRequestType doesn't have the USB_DIR_IN bit set) if
> > > > ctrl->wLength != 0?
> >
> > That's right.  If a control-OUT transfer has wLength == 0, it means
> > there is no data stage.  (And control-IN transfers are not allowed to
> > have wLength == 0.)
>
> And another one to clarify :)
>
> So if we got a setup() callback, which denotes:
> 1. an IN transfer, we need to submit an URB with response (even if
> wLength == 0). When it completes, the transaction is over, and we will
> get the next setup() callback (if there's going to be any).
> 2. an OUT transfer, we need to submit an URB to fetch the data (even
> if wLength == 0).

Or more like: to fetch the data when wLength != 0 and to acknowledge
the request when wLength == 0.

> When it completes, the transaction is over, and we
> will get the next setup() callback (if there's going to be any).
>
> Is the above correct?
>
> >
> > > Also, does the gadget subsystem guarantee, that we get the complete()
> > > callback for the DATA stage of the OUT control request before we get a
> > > setup() callback for the next control request if there's any?
> >
> > As I recall, this isn't mentioned in the documentation.  But the UDC
> > drivers I know of do behave that way, and it's reasonable to assume
> > they all do.
> >
> > After all, a data-stage transfer can't complete _after_ the next Setup
> > packet arrives.  Reception of a new Setup packet invalidates all
> > ongoing control transfers.
> >
> > Alan Stern
> >
