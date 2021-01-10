Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2307F2F086E
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jan 2021 17:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbhAJQop (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 11:44:45 -0500
Received: from netrider.rowland.org ([192.131.102.5]:54997 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726080AbhAJQop (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Jan 2021 11:44:45 -0500
Received: (qmail 1162387 invoked by uid 1000); 10 Jan 2021 11:44:04 -0500
Date:   Sun, 10 Jan 2021 11:44:04 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eugene Korenevsky <ekorenevsky@astralinux.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] ehci: fix EHCI host controller initialization sequence
Message-ID: <20210110164404.GB1161376@rowland.harvard.edu>
References: <20210109181828.GA7585@himera.home>
 <20210109210452.GA1136657@rowland.harvard.edu>
 <20210110073737.GA10541@himera.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110073737.GA10541@himera.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 10, 2021 at 10:37:37AM +0300, Eugene Korenevsky wrote:
> > > -	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
> 
> > You should not remove the ehci_readl call above.  With that line gone, 
> > the PCI bus might not send the new value of configured_flag to the 
> > controller until after the 5-ms sleep has ended, which makes the msleep 
> > useless.
> 
> Could not find reads from USBCMD in similar drivers (for
> example here: https://github.com/NetBSD/src/blob/trunk/sys/dev/usb/ehci.c#L625).

I don't know why NetBSD doesn't do this.  However, note that the 
following poll loop does a read every millisecond, so the first time 
through the loop, the earlier writes will be unblocked.

> Is this feature (reading from USBCMD for unblocking posted writes)
> documented anywhere or it is found empirically?

USBCMD is nothing special; it's just a convenient register to read.  Any 
other register in the controller would do just as well.

This is part of the PCI spec.  Writes are posted (meaning they aren't 
delivered to the device right away), but a read will cause all 
previously posted writes for any address on the same device to be 
delivered before the read finishes.

Alan Stern
