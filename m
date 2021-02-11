Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D98318F8A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 17:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbhBKQId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 11:08:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45813 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229501AbhBKQBa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 11:01:30 -0500
Received: (qmail 822983 invoked by uid 1000); 11 Feb 2021 11:00:47 -0500
Date:   Thu, 11 Feb 2021 11:00:47 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Noam Liron <lnoam@marvell.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Yuval Shaia <yshaia@marvell.com>
Subject: Re: [EXT] Re: Enforce USB DMA allocations to specific range
Message-ID: <20210211160047.GB822348@rowland.harvard.edu>
References: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
 <X+npQe45AXcsFGu1@kroah.com>
 <BYAPR18MB2741B58F5907F65C71ACF966B98C9@BYAPR18MB2741.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR18MB2741B58F5907F65C71ACF966B98C9@BYAPR18MB2741.namprd18.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 11, 2021 at 08:38:40AM +0000, Noam Liron wrote:
> Hi Greg,
> 
> I am writing you again on the below subject, as I would like to get a "high level" opinion, and you are probably the most experienced ...
> 
> As I wrote below, I cannot rely on the DMA mask, as some USB allocation are not affected by it.
> I thought of using private DMA pool that will be allocated where I need it (at the start of physical memory). However, this means adding specific ASIC code, which is less elegant.
> Do you think that's the right way?
> 
> Thanks,
> Noam
> 
> 
> -----Original Message-----
> From: Greg KH <greg@kroah.com> 
> Sent: Monday, December 28, 2020 4:19 PM
> To: Noam Liron <lnoam@marvell.com>
> Cc: linux-usb@vger.kernel.org; Yuval Shaia <yshaia@marvell.com>
> Subject: [EXT] Re: Enforce USB DMA allocations to specific range
> 
> External Email
> 
> ----------------------------------------------------------------------
> On Mon, Dec 28, 2020 at 01:54:41PM +0000, Noam Liron wrote:
> > Hi Greg and thanks for your reply for my previous q. (Proper way to set a DMA_MASK on a USB device).
> > 
> > I am rephrasing my questions:
> > 
> > I am working on LK 4.14.76, on a SOC in which RAM starts at 0x200000000, and need to limit DMA buffer allocations to be at the range 0x200000000 -  0x220000000.
> > This is a SoC constraint.
> > Setting the controller dma_mask to 0x21FFFFFFF, didn't solve the problem, as I noticed that URB streaming DMA are first allocated by kmalloc and alike, which are not affected by the dma_mask.
> 
> Why not get support from who ever is forcing you to use that old kernel version?  You are paying them for this, right?  :)
> 
> > I plan to do the following:
> > Alloc coherent memory for the HCD using 'dma_declare_coherent_memory', and use the HCD_LOCAL_MEM so the usb core is told that it must copy data into local memory if the buffers happen to be placed in regular memory.
> > 
> > Is that the right way to deal with this case?

I think that is the correct way.  That's what the HCD_LOCAL_MEM flag was 
meant for.

Alan Stern

> Have you looked at how all of the existing host controller drivers do this?  Why will they not "just work" properly for you as well?
> What host controller driver are you using?
> 
> thanks,
> 
> greg k-h
