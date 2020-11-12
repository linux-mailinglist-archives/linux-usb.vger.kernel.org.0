Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C1B2B0938
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 16:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbgKLP7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 10:59:07 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41135 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728356AbgKLP7G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 10:59:06 -0500
Received: (qmail 278516 invoked by uid 1000); 12 Nov 2020 10:59:05 -0500
Date:   Thu, 12 Nov 2020 10:59:05 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>, g@rowland.harvard.edu
Cc:     Kyungtae Kim <kt0755@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Message-ID: <20201112155905.GB276702@rowland.harvard.edu>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
 <20201111194710.GA245264@rowland.harvard.edu>
 <20201112090042.GA19895@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112090042.GA19895@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 12, 2020 at 09:01:11AM +0000, Peter Chen wrote:
> On 20-11-11 14:47:10, Alan Stern wrote:
> > There's still a possible race, although it's a different one: The 
> > gadget's delayed status reply can race with the host timing out and 
> > sending a new SETUP packet:
> > 
> > 	Host sends SETUP packet A
> > 
> > 	Function receives A and decides
> > 	to send a delayed status reply
> > 
> > 					Function thread starts to
> > 					process packet A
> > 
> > 	Host times out waiting for A status
> > 
> > 	Host sends new SETUP packet B
> > 
> > 	Composite core receives packet B
> > 	and resets cdev->delayed_status
> 
> resets cdev->delayed_status? Where to do that?

Sorry, for some reason I though I read a line that set delayed_status to 
0 in composite_setup().  I must have been fantasizing...

>  Even the host re-try the
> control transfer, it should send the same control request, eg,
> SET_CONFIGURATION, and increase cdev->delayed_status. There is a description
> for possible host sends next control request before receiving status
> packet at USB 2.0 Spec, CH 5.5.5 Control Transfer Data Sequences
> 
> 	  If a Setup transaction is received by an endpoint before a previously
> 	  initiated control transfer is completed,
> 	  the device must abort the current transfer/operation and
> 	  handle the new control Setup transaction. A Setup
> 	  transaction should not normally be sent before the completion
> 	  of a previous control transfer. However, if a
> 	  transfer is aborted, for example, due to errors on the bus,
> 	  the host can send the next Setup transaction
> 	  prematurely from the endpoint’s perspective.

Yes.  The composite core does not abort the current transfer/operation 
when a new Setup transaction occurs.  But it should -- and it should set 
delayed_status back to 0.  (Maybe this is what I was fantasizing.)

> > 					Function thread finishes and calls
> > 					usb_composite_setup_continue()
> > 
> > 					The composite core sends a status
> > 					reply for packet A, not packet B
> > 
> > 	Host receives status for A but thinks
> > 	it is the status for B!
> > 
> > 					Function thread processes packet B
> > 
> > 					Function thread finishes and calls
> > 					usb_composite_setup_continue()
> > 
> > 					The composite core sees
> > 					cdev->delayed_status == 0 and WARNs.
> > 
> > At the moment I don't see how to prevent this sort of race from 
> > happening.  We may need to change the API, giving the composite core a 
> > way to match up calls to usb_composite_setup_continue() with the 
> > corresponding call to composite_setup().  But even that wouldn't fix 
> > the entire problem.
> > 
> 
> Hi Alan,
> 
> I more think a possible reset or disconnect occurrence between them, and
> composite_disconnect is called.

That sounds reasonable.

This is why I think we will need to change the API.  There has to be a 
way to tell usb_composite_setup_continue() which SETUP it is being 
called for.  A new SETUP or a disconnect should invalidate the old 
SETUP, and then usb_composite_setup_continue() would ignore any calls 
that were for the old SETUP packet.

Alan Stern
