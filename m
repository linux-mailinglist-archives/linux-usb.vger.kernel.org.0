Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB81612AE
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 20:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbfGFSh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Jul 2019 14:37:28 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51091 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726743AbfGFSh2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Jul 2019 14:37:28 -0400
Received: (qmail 1206 invoked by uid 500); 6 Jul 2019 14:37:27 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Jul 2019 14:37:27 -0400
Date:   Sat, 6 Jul 2019 14:37:27 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Subject: Re: Virtual hub, resets etc...
In-Reply-To: <15f6a7e8cbe534cbc4f647f6f99cdef80a7b01ad.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1907061436180.406-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 6 Jul 2019, Benjamin Herrenschmidt wrote:

> On Fri, 2019-07-05 at 10:08 -0400, Alan Stern wrote:
> > On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:

> > > Sure but it would be nice if the mass storage dealt with -ESHUTDOWN
> > > properly and stopped :-) Or other errors... if the UDC HW for example
> > > dies for some reason, mass storage will lockup.
> > 
> > I suppose we could add code to check for this case and handle it, 
> > although I'm not sure what would be the right thing to do.  Delay for 
> > one second and try again?  Disable the gadget until the host does a 
> > reset?
> 
> I think just stop it until the next reset yes.

Can you test this patch?

Alan Stern



Index: usb-devel/drivers/usb/gadget/function/f_mass_storage.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/function/f_mass_storage.c
+++ usb-devel/drivers/usb/gadget/function/f_mass_storage.c
@@ -552,13 +552,14 @@ static int start_transfer(struct fsg_dev
 
 		/* We can't do much more than wait for a reset */
 		req->status = rc;
+		if (rc == -ESHUTDOWN)
+			fsg->common->running = 0;
 
 		/*
 		 * Note: currently the net2280 driver fails zero-length
 		 * submissions if DMA is enabled.
 		 */
-		if (rc != -ESHUTDOWN &&
-				!(rc == -EOPNOTSUPP && req->length == 0))
+		else if (!(rc == -EOPNOTSUPP && req->length == 0))
 			WARNING(fsg, "error in submission: %s --> %d\n",
 					ep->name, rc);
 	}

