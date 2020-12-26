Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF3C2E2EAB
	for <lists+linux-usb@lfdr.de>; Sat, 26 Dec 2020 17:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgLZQxM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Dec 2020 11:53:12 -0500
Received: from netrider.rowland.org ([192.131.102.5]:46723 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726010AbgLZQxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Dec 2020 11:53:12 -0500
Received: (qmail 607118 invoked by uid 1000); 26 Dec 2020 11:52:30 -0500
Date:   Sat, 26 Dec 2020 11:52:30 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: dwc2 gadget rejecting new AIO transfer when bus is suspended
Message-ID: <20201226165230.GB606763@rowland.harvard.edu>
References: <20201224125012.4df1d26c@gmail.com>
 <ff11cf43-f185-b123-6cb5-f218ef148d89@synopsys.com>
 <20201226004627.657ba339@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201226004627.657ba339@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 26, 2020 at 12:46:27AM +0000, Vincent Pelletier wrote:
> Hello Artur,
> 
> On Fri, 25 Dec 2020 10:56:02 +0000, Artur Petrosyan <Arthur.Petrosyan@synopsys.com> wrote:
> > According your debug log core enters suspend on receiving an 
> > GINTSTS_ErlySusp interrupt. It means that the driver goes to L2 state 
> > (suspend). In suspend mode accepting and processing EP requests can lead 
> > to unexpected behavior. That is why the driver rejects EP request with 
> > -EAGAIN.
> > 
> > As core may use power saving modes which are initiated by the Suspend 
> > interrupt, then in any suspend mode whether it is hibernation or partial 
> > power down the core registers are not available. This is why we avoid to 
> > get new EP requests.

This seems like a design mistake.  Even though the controller may be in 
a low-power state, there's no reason the UDC driver can't accept new 
requests or unlink old ones.  It even ought to be willing to halt 
endpoints.

None of these actions require the driver to touch the hardware.  The 
hardware-specific parts of the actions can be carried out when the 
controller returns to full power.

> This is my understanding from reading the commit history, yes.
> 
> But from userland's point of view this causes a weird situation:
> - sequence 1:
>   - userland submits buffer (ex: to receive the next host request)
>   - UDC is suspended
>   - UDC is awoken by host initiating a transfer
>   Result: the AIO completes successfully, the suspension was completely
>   invisible to userland, and I'm happy.
> - sequence 2:
>   - UDC is suspended
>   - userland submits buffer (ex: to receive the next host request)
>   Result: the AIO completes with an error, the suspension got in the
>   way, and I'm confused about what I need to make my code do to
>   recover: should I change my IO completion codepath so that it
>   resubmits any EAGAIN completion, hoping to catch the UDC at a time it
>   is awoken so the AIO finally sticks and everything can sleep until an
>   actual transfer completion ?

Indeed, the same problem will occur with synchronous (non-AIO) 
submissions.

> I do not know if it makes sense from a kernel point of view, but would
> it be possible for the dwc2 module to sit on the AIO requests while the
> controller is suspended, and submit them when it wakes up rather than
> failing them immediately and sending them back to userland ?
> I expect that this code actually knows (without polling) when the
> controller is awoken.

The kernel shouldn't have to sit on anything.  The requests should be 
accepted immediately.

Alan Stern
