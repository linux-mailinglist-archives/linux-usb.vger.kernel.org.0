Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B711537B95B
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 11:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhELJjF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 05:39:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:35204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhELJjE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 05:39:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85CB56108D;
        Wed, 12 May 2021 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620812276;
        bh=nfC4E9UjdIapG7leuzOQijoeF2gM51r/ZfoKlupyDt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ioHjKublKX0ZazJCMS9qcXNWUkY1cH4jvXthTCGspMXs8RCGsP0D+kN6BKQ9Cw5G+
         2BNO7rZVDD527X+CAgK71z2MKG0P6XOrM6fqUyp/j6QSdS3Ci12RugEl3VMDjd7eWl
         UBRnb7ZKlw0EjyUz4tOEEZODNUPZixHHOJdP81QNgF0GQa6bWgM4Q3uig/4nEHJrnm
         yxOruUYh2KI+34LgQRl42Nq3rWWblW7pLCVdnzfGhcWOfNFNXAHxzCbs4sggpgwfUb
         yaUCIJjIlE0WgGoWvRMri5fMyYoqMKJVABLJ65y+B1sZAKcMiuVxYRDwt7uUY4QGG8
         qQjjzKQtYouYg==
Date:   Wed, 12 May 2021 17:37:48 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210512093748.GA17479@nchen>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <20210511025322.GA23868@nchen>
 <20210511191538.GC908414@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511191538.GC908414@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-05-11 15:15:38, Alan Stern wrote:
> On Tue, May 11, 2021 at 10:53:22AM +0800, Peter Chen wrote:
> > Hi Alan,
> > 
> > I fixed a similar issue for configfs, see 1a1c851bbd70
> > ("usb: gadget: configfs: fix concurrent issue between composite APIs")
> 
> Yes, I see.  That is indeed the very same problem.
> 
> > It doesn't prevent disconnect callback, the disconnect callback will check
> > if unbind has called. The same for .setup and .suspend. Did you see
> > issues using configfs or legacy gadget? For legacy gadget, just like you said
> > it is the second disconnect callback is called during the removal process,
> > the first is called at usb_gadget_disconnect. It is not easy to prevent disconnect
> > occurring, we could add some logic at composite_disconnect, and let it quit if it is
> > called the second time.
> 
> I haven't seen the race occur in operation.  It was only theoretical; I 
> noticed it while thinking about one of the commits that was just merged 
> into the -stable kernels.
> 
> > It is hard to avoid usb_gadget_driver callback until usb_gadget_udc_stop has called,
> > no matter bad hardware or threaded interrupts, my former solution is avoid
> > dereferenced pointer issue, most of callbacks handling are useless if the gadget has already
> > unbind, the only meaningful callback is disconnect, and we have already called it
> > at usb_gadget_disconnect
> 
> Agreed.
> 
> I suppose we could do something similar for the composite driver, for 
> gadgets that don't use configfs.

Originally, I intended to do at composite.c to cover all gadget drivers, but
I can't find a good way to use usb_composite_dev existing spinlock to do that.
Since most of users already used configfs, I chose to fix it at configfs directly.
If we want to fix it for legacy gadget drivers (drivers at drivers/usb/gadget/legacy/).

For .setup & .suspend, we could delay 10ms after usb_gadget_disconnect, ensure
hardware has triggered related interrupt, and we need to let all UDC drivers to
add udc->gadget->irq, in that case, the pending threaded interrupt will be handled
at synchronize_irq at usb_gadget_remove_driver.
For .disconnect, we could use cdev->config to judge if the first .disconnect
has run.

> But what about legacy gadgets?  Are 
> there any still around that don't use either configfs or the composite 
> framework?

I only find raw_gadget.c that doesn't use composite framework, and it doesn't implement
many usb_gadget_driver callbacks, eg, .disconnect and .suspend. For .setup, we could
use above solutions for legacy composite driver.

-- 

Thanks,
Peter Chen

