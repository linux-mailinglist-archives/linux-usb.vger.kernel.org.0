Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1451BE03D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 16:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgD2OIW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 10:08:22 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52403 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727119AbgD2OIW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 10:08:22 -0400
Received: (qmail 29755 invoked by uid 500); 29 Apr 2020 10:08:21 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2020 10:08:21 -0400
Date:   Wed, 29 Apr 2020 10:08:21 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: raw-gadget: fix gadget endpoint selection
In-Reply-To: <CAAeHK+yVWgLD9DLNea_vBt3zj=3fLfw2Ai5U8=9sJ+QvmK0o-Q@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004291006500.28180-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 29 Apr 2020, Andrey Konovalov wrote:

> On Wed, Apr 29, 2020 at 3:14 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, 28 Apr 2020, Andrey Konovalov wrote:
> >
> > > Hi Alan,
> > >
> > > This patch uses the approach that I mentioned in the discussion about
> > > endpoint selection. Does this look acceptable?
> >
> > I haven't had time to look through it yet.
> >
> > > I'm not sure which endpoint limits it makes sense to expose via
> > > USB_RAW_IOCTL_EPS_INFO. I'm more or less sure about maxpacket_limit
> > > and max_streams, but I don't exactly know what maxburst is used for.
> > > Maybe there are some others?
> >
> > maxburst is a USB-3 thing.  It mainly affects just throughput, not
> > functionality, and it's handled pretty much entirely by the hardware.
> > You shouldn't worry about it, at least, not now.
> 
> The question is whether it will be needed when/if I ever add proper
> USB3 support. It would be good to figure out which endpoint attributes
> we need to expose now, rather than having to add another ioctl later.

You might as well expose anything that looks like it might be relevant.  
Better to include things that will never be needed than to omit things
which may be needed later.

Alan Stern

