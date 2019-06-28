Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1896A5A13A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 18:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfF1Qoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 12:44:32 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:38742 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfF1Qoc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 12:44:32 -0400
Received: by mail-pg1-f181.google.com with SMTP id z75so2832566pgz.5
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4DCaxzGgloiyL+M5RvLxBZWcpLmdSoh10/TmTTXIrxg=;
        b=myVwsY0hFvIXRwD/mh9tmE5uofxcQP3gjTULOHz4OuHpPnMYbDfe6r45Rnk/Hbko7O
         huDrh9+zpYe+FZ9yWhtwaQSNTVSvWRYcnksCpnvLhh2zGYNc9a5fTJmEVVS376eW3bJZ
         U/h8U4qzmWh4s3BNtyo/vPJHg8in9Xxqy692C2MbAzlsqJJVSZKSciU97zJOl4s32MOY
         R0WvqD1huHzii6t3p4waBqNi1oIp/yCHdFhrno7EIIEK4WdFgeEvYxkUcXBlJvkF14cK
         uZR2lbdBqrdvDPnPBmbbLvO2Gf8avoXfsEj3n3XgYUYNO3kr2AxZJzah8QQwFYdO9vct
         bDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4DCaxzGgloiyL+M5RvLxBZWcpLmdSoh10/TmTTXIrxg=;
        b=C6ysFylHkK/WESXDiC5QNkvEasicFHaPKw5Jt/0lijVRuKUJ1bsgvDlB1wBPhmxGvh
         HrdMG/trRHhlL1wEaKSxEWwMco/ckyVGFCJPSTPgwoKgWd797JVNPww50acb0b0eQgKo
         BupSiuEQ5z9DwWTTSNZ7CT0ODciTKhTMwSbaJ1oLrUbE2jHPNshBwk54FRDIQawHvCOX
         nVcTG0bayMCi8xR1MtDGdMzHs0bfNI1qg0UYSqCPIPWSkcBfzOHZsYR8wtIzJc5X9x4p
         cXxrdsvr+i6ElO8moLGrhh+Z0rvIPoWAeaCplOtUruGWJ36cPtdnyQ4n/c1L6UCHtjeD
         lxqw==
X-Gm-Message-State: APjAAAWD/OFmAsiUqQY7JKApX9ZSwwr1av4udFtVX05JvbZZLcU1Nni0
        VcVKJ43VIhOXIk+JTpPLujkDMVtoR6Rw3ytB8oiLug==
X-Google-Smtp-Source: APXvYqwbfTsvluG8GZkGs4n1CBa6lhsnxwKDBpnVYLQKvpxyfFnvMnQIU00lr0UZw6XSKjM4iQT9K8VdIFxyTx7p+qM=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr1840713pgq.130.1561740270897;
 Fri, 28 Jun 2019 09:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+y6W=w1_bJYa_T4SLYfZnRCKrtiz5o6Nvnmedq8Um2-LA@mail.gmail.com>
 <Pine.LNX.4.44L0.1906180948100.1659-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906180948100.1659-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 28 Jun 2019 18:44:19 +0200
Message-ID: <CAAeHK+x7XZ0_ZON=h_4rCrBwQ3ii8A4nGMUJajbREzpUZ_ebRQ@mail.gmail.com>
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

On Tue, Jun 18, 2019 at 3:53 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 18 Jun 2019, Andrey Konovalov wrote:
>
> > On Tue, Jun 18, 2019 at 3:31 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > On Fri, Jun 7, 2019 at 5:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > > >
> > > > On Fri, Jun 7, 2019 at 5:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > >
> > > > > On Fri, 7 Jun 2019, Andrey Konovalov wrote:
> > > > >
> > > > > > > > The problem is that I want to receive that data (from the data stage)
> > > > > > > > from within my gadget driver module. But it's not passed to the
> > > > > > > > setup() callback. And the question is: how do I do that then?
> > > > > > >
> > > > > > > I just caught up on this thread...
> > > > > > >
> > > > > > > The answer is simple: The gadget driver's setup() callback routine
> > > > > > > submits a request for endpoint 0.  The Data Stage data is sent or
> > > > > > > received (depending on the direction encoded in the Setup information)
> > > > > > > by this request.
> > > > > >
> > > > > > Ah, OK, got it, thanks!
> > > > > >
> > > > > > Although while looking at the dummy_hcd implementation, I saw that it
> > > > > > accesses usb->transfer_buffer in case USB_REQ_GET_STATUS in
> > > > > > handle_control_request(), which is called right before the setup()
> > > > > > callback is called. So the data already available there without any
> > > > > > additional requests. Is this an implementation detail that is specific
> > > > > > to dummy_hcd?
> > > > >
> > > > > Yes, it is.  dummy-hcd is unusual in that it combines both a USB host
> > > > > controller and a USB device controller in a single driver.
> > > > >
> > > > > Normal UDC drivers do handle USB_REQ_GET_STATUS on their own without
> > > > > requiring the use of an explicit usb_request, because they handle the
> > > > > entire transfer internally and don't involve the gadget driver.
> > > > > However, they don't have access to any transfer_buffer; all they can do
> > > > > is exchange packets with the host.
> > > >
> > > > OK, I see. Thanks a lot!
> > >
> > > Another question: do I understand correctly, that we only proceed with
> > > submitting an URB to get the data for the control OUT request
> > > (ctrl->bRequestType doesn't have the USB_DIR_IN bit set) if
> > > ctrl->wLength != 0?
>
> That's right.  If a control-OUT transfer has wLength == 0, it means
> there is no data stage.  (And control-IN transfers are not allowed to
> have wLength == 0.)

And another one to clarify :)

So if we got a setup() callback, which denotes:
1. an IN transfer, we need to submit an URB with response (even if
wLength == 0). When it completes, the transaction is over, and we will
get the next setup() callback (if there's going to be any).
2. an OUT transfer, we need to submit an URB to fetch the data (even
if wLength == 0). When it completes, the transaction is over, and we
will get the next setup() callback (if there's going to be any).

Is the above correct?

>
> > Also, does the gadget subsystem guarantee, that we get the complete()
> > callback for the DATA stage of the OUT control request before we get a
> > setup() callback for the next control request if there's any?
>
> As I recall, this isn't mentioned in the documentation.  But the UDC
> drivers I know of do behave that way, and it's reasonable to assume
> they all do.
>
> After all, a data-stage transfer can't complete _after_ the next Setup
> packet arrives.  Reception of a new Setup packet invalidates all
> ongoing control transfers.
>
> Alan Stern
>
