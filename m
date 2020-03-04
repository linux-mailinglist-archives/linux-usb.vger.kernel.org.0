Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4841E178AAE
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 07:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgCDGhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 01:37:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:53822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgCDGhj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 01:37:39 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 559D72146E;
        Wed,  4 Mar 2020 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583303857;
        bh=EXcWra+0PPwX2l99ex2f2mi9XxYPVfyD2diysp1jBx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IUMWAGVr+ZEXPEjYHy+OEHe/kikj+ZSudCYnR04kwSIF6TRnDi61CtCSujDF7VIYv
         0lCXVEyvr/DFYEmyJOkqqYpf9hO5INR5Q35lP1yF76Uz1DNXNO+mk2F9EHduK7GSst
         ZdpihP6gtaDF1dbV5ZptTLgrqIPDfzG+lEprTu7A=
Date:   Wed, 4 Mar 2020 07:37:35 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonas Karlsson <jonas.karlsson@actia.se>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
Message-ID: <20200304063735.GA1203111@kroah.com>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 03, 2020 at 08:08:38PM +0000, Jonas Karlsson wrote:
> > 
> > On Tue, Mar 03, 2020 at 03:05:50PM +0000, Jonas Karlsson wrote:
> > > Hi,
> > >
> > > We have a board with an NXP i.MX8 SoC. We are running Linux 4.19.35 from
> > NXP on the SoC.
> > >
> > > There is a modem connected to the SoC via USB through a USB hub.
> > > The modem presents it self as a cdc-acm device with 4 tty:s.
> > >
> > > Sometimes we end up in a situation where all transfers over USB generetes
> > 'USB transaction Errors".
> > > It is likely that the modem is misbehaving. When this happens we get a lot of
> > "xhci-cdns3: ERROR unknown event type 37"
> > > in the terminal indicating that the xhci event ring is full. This often leads to RCU
> > stalls and sometimes Kernel panics.
> > >
> > > If I enable dynamic debug on xhci_hcd and cdc-acm I can see that all
> > > transfers have error code -71 (-EPROTO which in xhci translates to
> > > 'USB transaction error"). When this happens it seems like xhci resets
> > > the ep, sets TR Deq Ptr to unstall the ep and then a new transfer is
> > > started which also fails. This behavior generates a lot of events on
> > > the event ring which causes 'ERROR unknown event type 37'. This loop
> > > of failing transfers seems to continue until we either unbind the USB driver or
> > get a kernel panic. The SoC almost becomes unresponsive since it spends most
> > of the time executing usb interrupts.
> > >
> > > If I pull the reset pin of the USB hub and keep it in reset state at
> > > this point, the event loop of failing transfers continues despite
> > > there is nothing on the USB bus any longer. The only way to get out of that
> > loop is to either unbind the usb driver or power cycle the board.
> > >
> > > Is this the expected behavior when USB transaction error happens for all
> > transfers when using cdc-acm class driver?
> > > Or could there be something wrong in the low level USB driver (Cadence
> > > in our case)? We need to figure out why we get all the transaction errors but
> > we also need to make sure the kernel does not die on us when we have a
> > misbehaving USB device.
> > > Does anyone have a suggestion on what we could do to improve the stability
> > of the kernel in this situation?
> > 
> > I would blame the xhci-cdns driver as it is the one controlling all of this.
> > 
> > I don't see this driver in the 4.19 tree, so I think you are going to have to get
> > support from the company that provided you with that driver as you are already
> > paying for that support from them :)
> > 
> > good luck!
> > 
> > greg k-h
> 
> Thanks for the feedback! If the cadence driver is the main suspect I totally agree with you.
> 
> The reason I posted on this mailing list was that I was afraid that the cdc-acm driver could
> be causing new transfers to be started when the previous fails due to USB transaction errors and
> then trigger this event storm.

Yes, it could, but the host controller should handle that just fine.

> The acm_ctrl_irq() function seems to submit a new urb directly if the previous fails, but I cannot 
> say that I understand that code very well yet. The acm_read_bulk_callback() function also seem
> to submit a new read urb on USB transaction Errors. But If you think this could not cause this
> behavior I will ask our supplier to fix the cdns driver.

Please ask them to fix the driver and get it merged upstream :)

thanks,

greg k-h
