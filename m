Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B101BA65F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 16:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgD0O31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 10:29:27 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43893 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727012AbgD0O31 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 10:29:27 -0400
Received: (qmail 19184 invoked by uid 500); 27 Apr 2020 10:29:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Apr 2020 10:29:26 -0400
Date:   Mon, 27 Apr 2020 10:29:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Peter Chen <peter.chen@nxp.com>
cc:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <20200427012719.GA6782@b29397-desktop>
Message-ID: <Pine.LNX.4.44L0.2004271027540.17025-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 27 Apr 2020, Peter Chen wrote:

> On 20-04-10 11:53:20, Alan Stern wrote:
> > On Fri, 10 Apr 2020, Andrey Konovalov wrote:
> > 
> > > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > 
> > > > Have you implemented wedge as well as halt?  Wedge is needed for the
> > > > mass-storage protocol; as far as I know it isn't used anywhere else.
> > > 
> > > No, I didn't know about "wedge" at all :) Looks like the API for it is
> > > really simple, just usb_ep_set_wedge(). I'll need to figure out what
> > > it is and how it works, and I'll send a patch that adds halt/wedge
> > > support then.
> > 
> > usb_ep_set_wedge(ep) does almost the same thing as 
> > usb_ep_set_halt(ep).  The difference is that a Clear-Feature(halt) 
> > request from the host will un-halt an endpoint if it is merely halted, 
> > but it won't un-halt a wedged endpoint.  (I don't think this is 
> > documented anywhere, unfortunately.)
> 
> Hi Alan,
> 
> It is documented at drivers/usb/gadget/udc/core.c, function
> usb_ep_set_wedge.

Ah, that's where it ended up.  Thanks.

Maybe at some point we should move these documentation comments out of 
various random .c files and into the apropriate header files...

Alan Stern

