Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E72F688825
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 21:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbjBBUQC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 15:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbjBBUQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 15:16:00 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1375556480
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 12:15:58 -0800 (PST)
Received: (qmail 537669 invoked by uid 1000); 2 Feb 2023 15:15:58 -0500
Date:   Thu, 2 Feb 2023 15:15:58 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
Subject: Re: Explicit status phase for DWC3
Message-ID: <Y9wZ/rgw4CqZ6RxB@rowland.harvard.edu>
References: <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
 <Y9vONL8ZyQdEVkr0@rowland.harvard.edu>
 <9da07e03-7cd2-cfeb-8c67-4562948aa948@ideasonboard.com>
 <Y9vmrgeblXC7zeQj@rowland.harvard.edu>
 <20230202194823.jqhyevhbjw3x7sen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202194823.jqhyevhbjw3x7sen@synopsys.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 02, 2023 at 07:48:29PM +0000, Thinh Nguyen wrote:
> On Thu, Feb 02, 2023, Alan Stern wrote:
> > > > Keep in mind that there are two separate issues here:
> > > > 
> > > > 	Status/data stage for a control-IN or 0-length control-OUT
> > > > 	transfer.
> > > > 
> > > > 	Status stage for a non-0-length control-OUT transfer.
> > > > 
> > > > The USB_GADGET_DELAYED_STATUS mechanism was meant to help with the
> > > > first, not the second.  explicit_status was meant to help with the
> > > > second; it may be able to help with both.
> 
> While we may not have a convenient function to do the status completion,
> the gadget driver can always use the same mechanism for delayed status
> and explicitly queue the status stage on the OUT data completion. The
> dwc3 driver should already be able to handle that. However, it's better
> to have a convenient function for that, and probably remove any warning
> we have in the composite layer.

Indeed.  The difficulty is that gadget drivers have to work with all UDC 
drivers, not just with dwc3, and the others may not support explicit 
queuing of status transactions.  The explicit_status mechanism was 
designed to make this work correctly in all cases (or, at least as 
correctly as it works now).

> > > Ack - thanks. That thread I linked was very informative, I wish I'd found it
> > > sooner!
> > 
> > There is still a race in the gadget layer's handling of control 
> > requests.  The host can send a SETUP packet at any time.  So when a 
> > function driver queues a usb_request for ep0, how does the UDC driver 
> > know whether it is in response to the SETUP packet that just now arrived 
> > or in response to one that arrived earlier (and is now superseded)?
> 
> Different stages of different the control transfers shouldn't
> interleave. If a new SETUP packet is received before completing the
> previous control transfer, the previous control transfer is canceled.
> Control transfer doesn't have something like bulk stream-id to allow for
> interleaving.
> 
> The gadget driver should handle the different control transfers
> synchronously.

Unfortunately gadget drivers cannot always do that, because sometimes 
the work they need to do in response to a control transfer cannot be 
carried out in interrupt context.  Since ->setup() is called as part of 
an interrupt handler, the gadget driver may not be able to complete the 
necessary operations before returning from the callback.  Therefore the 
status stage of a control transfer may have to be handled asynchronously 
-- which obviously opens up possibilities for races.

> > This race exists even at the hardware level, and I'm pretty sure that a 
> > lot of UDC controllers don't handle it properly.  But there's nothing we 
> > can do about that...
> 
> I can't speak for other controllers, but this is for dwc3 controllers:
> 
> If the host sends a new SETUP packet without finishing with the previous
> control transfer data/status, the data/status TRB would be completed
> with "SETUP_PENDING" status. This indicates that the host canceled the
> previous control transfer and the UDC driver needs to setup a SETUP TRB
> to service the new SETUP packet. The previous control transfer would be
> returned with a canceled status.

Hans Selasky mentioned in a recent email that the only controllers he 
trusts to get this right are the ones that use a "transaction log" sort 
of approach, like xHCI does.  I'm not claiming that controllers using 
other approaches will always be wrong, but this does explain why dwc3 is 
able to manage control transfers correctly.

Alan Stern
