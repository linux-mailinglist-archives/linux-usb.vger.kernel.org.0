Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B267236825D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 16:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236780AbhDVOWJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 10:22:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34099 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236092AbhDVOWI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 10:22:08 -0400
Received: (qmail 245895 invoked by uid 1000); 22 Apr 2021 10:21:33 -0400
Date:   Thu, 22 Apr 2021 10:21:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Roman Mamedov <rm@romanrm.net>, linux-usb@vger.kernel.org
Subject: Re: Not enough bandwidth for new device state -- with Etron USB3
 controller only
Message-ID: <20210422142133.GA245284@rowland.harvard.edu>
References: <20210421223732.27080321@natsu>
 <YIEOcvePnzGlQtoy@kroah.com>
 <20210422160813.41e26426@natsu>
 <YIFa5uwt0ucgdi0N@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIFa5uwt0ucgdi0N@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 22, 2021 at 01:15:50PM +0200, Greg KH wrote:
> On Thu, Apr 22, 2021 at 04:08:13PM +0500, Roman Mamedov wrote:
> > Hello,
> > 
> > On Thu, 22 Apr 2021 07:49:38 +0200
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > > Not a bug, this is how USB works.  Your first hub really does not have
> > > enough bandwidth for that device.  Well, we think it doesn't, the
> > > calculation for that is really really tricky and we error on the side of
> > > "let's not take the risk and just disable the device to be safe".
> > > 
> > > Get a better hub :)
> > 
> > But why the calculation is different when the hub is plugged into the onboard
> > USB 2.0 controller -- and there it works?
> 
> You have more hubs in the way, they take up bandwidth on their own just
> sitting there.
> 
> > I hope you don't take this as a bug report to make it stop working there as
> > well. :)
> > 
> > If it's because the Etron controller is USB 3.0, and the higher speeds are
> > somehow accounted for in the bandwidth calculation, that doesn't seem right,
> > since both of the plugged in downstream hubs are 1.1/2.0-only.
> 
> USB 2 hubs plugged into a USB 3 controller require horrible things to be
> done on the wire to make everything work properly.  Part of that
> horribleness is bandwidth determination that we honestly are not the best
> at in Linux.  But again, we err on the side of safety, which means we
> guess on the low-end compared to other operating systems.

It's even worse in the case of devices plugged into an xHCI controller.  
Those controllers perform bandwidth allocation automatically in 
firmware; the kernel doesn't get any say in the matter.  With EHCI, the 
allocation is all done in software.

Alan Stern
