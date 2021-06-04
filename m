Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6318A39BAC6
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 16:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhFDORS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 10:17:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44229 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230234AbhFDORS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 10:17:18 -0400
Received: (qmail 1678687 invoked by uid 1000); 4 Jun 2021 10:15:31 -0400
Date:   Fri, 4 Jun 2021 10:15:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/4] USB: UDC: Implement udc_async_callbacks in dummy-hcd
Message-ID: <20210604141531.GA1676809@rowland.harvard.edu>
References: <20210520202152.GD1216852@rowland.harvard.edu>
 <87v96ub3y0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v96ub3y0.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 08:21:11AM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Alan Stern <stern@rowland.harvard.edu> writes:
> > @@ -990,7 +1000,6 @@ static int dummy_udc_start(struct usb_ga
> >  	spin_lock_irq(&dum->lock);
> >  	dum->devstatus = 0;
> >  	dum->driver = driver;
> > -	dum->ints_enabled = 1;
> 
> should the matching write of 0 be removed from dummy_udc_stop()?

No, it's okay to leave that one.  In practice it won't make any 
difference because now the core will always turn off async callbacks 
before doing udc_stop.  It's there for the sake of thoroughness, and it 
lets the reader know that emulated interrupts are supposed to be turned 
off whenever the UDC stops running (just like a driver for a real UDC).

Whereas this line here in dummy_udc_start would be actively wrong if it 
were to remain.

Alan Stern

> Other than that:
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>
> 
> -- 
> balbi


