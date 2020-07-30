Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4CF233503
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 17:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgG3PHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 11:07:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56959 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726353AbgG3PHQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 11:07:16 -0400
Received: (qmail 6630 invoked by uid 1000); 30 Jul 2020 11:07:15 -0400
Date:   Thu, 30 Jul 2020 11:07:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Roger Quadros <rogerq@ti.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Message-ID: <20200730150715.GA6332@rowland.harvard.edu>
References: <20200729202231.GB1584059@rowland.harvard.edu>
 <20200730032744.GC26224@b29397-desktop>
 <20200730051904.GA3859261@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730051904.GA3859261@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 07:19:04AM +0200, Greg KH wrote:
> On Thu, Jul 30, 2020 at 03:28:09AM +0000, Peter Chen wrote:
> > On 20-07-29 16:22:31, Alan Stern wrote:
> > > Abusing the kernel's device model, some UDC drivers (including
> > > dwc3 and cdns3) register and unregister their gadget structures
> > > multiple times.  This is strictly forbidden; device structures may not
> > > be reused.
> > 
> > Register and unregister gadget structures multiple times should be
> > allowed if we pass a clean (zeroed) gadget device structure. I checked
> > the cdns3 code (cdns3_gadget_start), it always zeroed struct usb_gadget
> > before calling usb_add_gadget_udc when start device mode.
> 
> How do you "know" that the structure really was properly freed/released
> by the driver core at that point in time?
> 
> That's the issue, even if you do unregister it, the driver core, or any
> other part of the kernel, can hold on to the memory for an unbounded
> amount of time, due to the fact that this is a reference counted
> pointer.

In theory, you can know that the driver core is done using a structure 
if you wait for the release routine to run.  But of course, that can 
mean you have to wait an indefinitely long time.

Alan Stern

> So please, never "recycle" memory structures like this.  The
> documentation for the kernel explicitly says "do not do this!"
> 
> thanks,
> 
> greg k-h
