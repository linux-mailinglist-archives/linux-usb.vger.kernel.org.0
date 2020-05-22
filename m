Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D66F1DE8AE
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 16:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgEVOVH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 10:21:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52345 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729399AbgEVOVG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 May 2020 10:21:06 -0400
Received: (qmail 1140 invoked by uid 1000); 22 May 2020 10:21:05 -0400
Date:   Fri, 22 May 2020 10:21:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Message-ID: <20200522142105.GA32434@rowland.harvard.edu>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
 <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
 <6551a485-5478-ccac-ca1f-d3e2ec4c9053@synopsys.com>
 <20200520165001.GD11084@rowland.harvard.edu>
 <a577925a-98ea-2e6d-da0c-b3e8dbe3dc7e@synopsys.com>
 <20200520174437.GA15590@rowland.harvard.edu>
 <3b0c3f61-2a32-3fe0-f63c-a479f6eb11ab@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b0c3f61-2a32-3fe0-f63c-a479f6eb11ab@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 22, 2020 at 01:58:43AM +0000, Tejas Joglekar wrote:
> Hi,
> On 5/20/2020 11:14 PM, Alan Stern wrote:
> > On Wed, May 20, 2020 at 05:00:50PM +0000, Tejas Joglekar wrote:
> >> Hi,
> >> On 5/20/2020 10:20 PM, Alan Stern wrote:
> >>> On Wed, May 20, 2020 at 06:41:16AM +0000, Tejas Joglekar wrote:
> >>>>>> +	urb->transfer_buffer = temp;
> >>>>>> +	urb->transfer_dma = dma_map_single(hcd->self.sysdev,
> >>>>>> +					   urb->transfer_buffer,
> >>>>>> +					   urb->transfer_buffer_length,
> >>>>>> +					   dir);
> >>>>>> +
> >>>>>> +	if (dma_mapping_error(hcd->self.sysdev,
> >>>>>> +			      urb->transfer_dma)) {
> >>>>>> +		ret = -EAGAIN;
> >>>>>> +		kfree(temp);
> >>>>>> +	} else {
> >>>>>> +		urb->transfer_flags |= URB_DMA_MAP_SINGLE;
> >>>>>
> >>>>> Not sure if using URB_DMA_MAP_SINGLE to flag that this urb is boucebuffered is
> >>>>> appropriate.
> >>>>>
> >>>>> If Greg or Alan don't object then it's fine for me as well.
> >>>>>
> >>>>>
> >>>>>
> >>>> @Greg/Alan do you suggest any change for the flag here?
> >>>
> >>> This requires care, because the core will already have set other flags 
> >>> for this URB.  I don't remember the details and I don't have time to 
> >>> check them now.  But it wouldn't be at all surprising if the core 
> >>> doesn't expect an URB both to use SG and to use DMA_MAP_SINGLE.
> >>>
> >> When this quirk is enabled and it is required to consolidate SG list to 
> >> single buffer no other flags are set for the URB.
> > 
> > I don't believe that.  What about URB_DMA_MAP_SG or 
> > URB_DMA_MAP_PAGE?  The USB core certainly would have set one of them 
> > already.  Not only would you need to clear that flag, you want also need 
> > to undo the mapping.
> >
> URB_DMA_MAP_SG or URB_DMA_MAP_PAGE flags are set for an URB in core within
> function usb_hcd_map_urb_for_dma(), with my patch the xhci_map_urb_for_dma()
> does not call usb_hcd_map_urb_for_dma() when SG list consolidation is required
> but it calls the newly added function xhci_map_temp_buffer() within that function
> only dma_map_single() is called to map consolidated SG list.

Ah, in your patch xhci-hcd's map_urb_for_dma() routine bypasses 
usb_hcd_map_urb_for_dma().  I hadn't noticed that.

Then yes, your use of the URB flags is okay.

Alan Stern

> >> Only question here is 
> >> if it is good to use DMA_MAP_SINGLE flag for the consolidated SG list 
> >> into a single temporary buffer.
> > 
> > If you call dma_map_single() then USB_DMA_MAP_SINGLE is the appropriate 
> > flag to sest.
> > 
> Yes, within xhci_map_temp_buffer(), after consolidating the SG list in a temp
> buffer I call dma_map_single() to map the temp buffer.
> 
> > Alan Stern
> > 
> 
> Thanks & Regards,
>  Tejas Joglekar
