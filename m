Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFD1228546
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 18:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgGUQ1O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 12:27:14 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43673 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727115AbgGUQ1O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 12:27:14 -0400
Received: (qmail 1279971 invoked by uid 1000); 21 Jul 2020 12:27:13 -0400
Date:   Tue, 21 Jul 2020 12:27:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <bjorn@helgaas.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-usb@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: generic power management for USB subsystem similar to PCI one?
Message-ID: <20200721162713.GF1272082@rowland.harvard.edu>
References: <20200721155314.GA395319@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721155314.GA395319@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 21, 2020 at 09:23:14PM +0530, Vaibhav Gupta wrote:
> Hello,
> Currently I am working on removing legacy power management .suspend() and
> .resume() callbacks from PCI subsystem. The updates aim to give power management
> control to PCI core and let drivers do the only device-specific jobs without
> using any PCI helper functions.
> 
> I was wondering if similar changes can be applied to the USB subsystem?
> I explored and found that .suspend() in USB drivers also accept the pm_message_t
> type argument.
> Also, .suspend() and .resume() in usb drivers, accept "struct usb_interface *"
> type argument which seems similar to PCI legacy drivers accepting
> "struct pci_dev*" type.
> 
> Moreover, "struct usb_device_driver" seems analogous to "struct pci_driver" as
> it also has .suspend() and .resume() callback. Also, it has a bitfield
> "generic_subclass:1" which is described as, " @generic_subclass: if set to 1,
> the generic USB driver's probe, disconnect, resume and suspend functions will be
> called in addition to the driver's own, so this part of the setup does not need
> to be replicated. "
> 
> So the generic PM, talked about in USB drivers, is similar to PCI one?

I don't know what you mean by "the generic PM".  IMO, overall USB power 
management is pretty similar to the arrangement in PCI, although with 
less legacy stuff remaining.

>  The
> non-generic PM in USB is similar to legacy PM in PCI?

No, I don't think so, although it's hard to give an exact answer to such 
an imprecise question.  What sort of thing would make USB PM similar to 
legacy PCI PM?

> A similar update for the USB subsystem is possible?

I think you'll find that the power management in USB drivers already 
does only device-specific things, with overall control remaining in the 
USB core.

Maybe if you came up with some more specific examples of what you are 
thinking of, I could give better answers.

Alan Stern
