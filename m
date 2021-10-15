Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDFD42F3CC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Oct 2021 15:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239850AbhJONlI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Oct 2021 09:41:08 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51019 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239855AbhJONlE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Oct 2021 09:41:04 -0400
Received: (qmail 969088 invoked by uid 1000); 15 Oct 2021 09:38:57 -0400
Date:   Fri, 15 Oct 2021 09:38:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     braewoods@braewoods.net, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add compatibility quirk flags for iODD
 2531/2541
Message-ID: <20211015133857.GA968676@rowland.harvard.edu>
References: <20211014015504.2695089-1-braewoods+lkml@braewoods.net>
 <20211014022049.GB910341@rowland.harvard.edu>
 <8466fa531529630936ee0f0e290b54b2@braewoods.net>
 <YWkzxWyIhW08ZCcX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWkzxWyIhW08ZCcX@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 15, 2021 at 09:54:45AM +0200, Greg KH wrote:
> On Fri, Oct 15, 2021 at 01:29:20AM -0500, braewoods@braewoods.net wrote:
> > On 2021-10-13 21:20, Alan Stern wrote:
> > > In the future, you should always include a version number in the email
> > > Subject: line (for example, "[PATCH v2]") so that readers will know
> > > which patch is which.  And you should include, here just below the "---"
> > > line, a description of how this version differs from the previous
> > > version.  See the email archives for examples of multi-version patches.
> > > 
> > > Nevertheless, this looks okay.
> > > 
> > > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > Noted. I'll do that for future patches. On a side note, any idea how long it
> > normally takes to get a simple patch like this committed? I've had mixed
> > experiences with getting feedback on patches. Sometimes my patches just get
> > totally ignored.
> 
> Depends on the subsystem and the patch submitted.

Greg tends to be quite good at merging patches in a timely manner.  They 
generally are committed within a few weeks.

In this case, should the patch also be added to the -stable kernels?

Alan Stern

> Also always use scripts/get_maintainer.pl to properly copy the needed
> maintainers and mailing lists.  Sometimes patches get lost in the noise
> if the right people are not copied.
> 
> thanks,
> 
> greg k-h
