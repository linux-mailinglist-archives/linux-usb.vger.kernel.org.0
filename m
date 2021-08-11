Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549193E87C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 03:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbhHKBvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 21:51:33 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34171 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231430AbhHKBvc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 21:51:32 -0400
Received: (qmail 618720 invoked by uid 1000); 10 Aug 2021 21:51:08 -0400
Date:   Tue, 10 Aug 2021 21:51:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, USB <linux-usb@vger.kernel.org>
Subject: Re: dwc3 spin_lock_irq flags
Message-ID: <20210811015108.GA618534@rowland.harvard.edu>
References: <a034f2ef-c2a3-962e-d72b-0db6a34e67a2@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a034f2ef-c2a3-962e-d72b-0db6a34e67a2@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 10, 2021 at 10:10:00PM +0000, Thinh Nguyen wrote:
> Hi,
> 
> Typically when we use spin_lock_irqsave and spin_unlock_irqrestore,
> we save the irq state in the "flags" variable and pass it down to any
> function that may need to do spin_unlock_irqrestore and update the flags
> again.
> 
> I don't see that we're doing it for dwc3 when we give back the requests:
> 
> void dwc3_gadget_giveback(struct dwc3_ep *dep, struct dwc3_request *req,
> 		int status)
> {
> 	struct dwc3			*dwc = dep->dwc;
> 
> 	dwc3_gadget_del_and_unmap_request(dep, req, status);
> 	req->status = DWC3_REQUEST_STATUS_COMPLETED;
> 
> 	spin_unlock(&dwc->lock);
> 	usb_gadget_giveback_request(&dep->endpoint, &req->request);
> 	spin_lock(&dwc->lock);
> }
> 
> Then we would use the stale "flags" to do spin_unlock_irqrestore() at a later
> time. Maybe someone can help shed some light on what issue this would cause
> (if any). From our hardware testing, there's no obvious failure or performance
> impact that we see.

There are no issues with this code pattern; it is perfectl valid.  Its 
only effect is that sometimes the request's completion handler will be 
called with interrupts disabled when in theory, it could have been 
called with interrupts enabled.  This won't cause any problem because 
completion handlers are _always_ called with interrupts disabled; this 
is mentioned in the kerneldoc for the @complete member of struct 
usb_request.

When the spin_unlock_irqrestore() call runs later on, its "flags" 
argument won't be stale.  It will accurately reflect whether interrupts 
were enabled when the original spin_lock_irqsave() ran.  By themselves, 
spin_unlock() and spin_lock() don't change the enable state for 
interrupts.

Alan Stern
