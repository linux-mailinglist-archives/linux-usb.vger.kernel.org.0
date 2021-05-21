Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02E938C950
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 16:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhEUOjt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 10:39:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55111 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230239AbhEUOjr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 10:39:47 -0400
Received: (qmail 1240938 invoked by uid 1000); 21 May 2021 10:38:23 -0400
Date:   Fri, 21 May 2021 10:38:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <20210521143823.GB1239965@rowland.harvard.edu>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKdpThmE1xenUjhI@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:03:26AM +0200, Johan Hovold wrote:
> On Thu, May 20, 2021 at 04:20:56PM -0400, Alan Stern wrote:

> > +		if (usb_pipeout(urb->pipe) != is_out)
> > +			dev_WARN(&dev->dev, "BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> > +					urb->pipe, setup->bRequestType);

> While I agree with intention here, I'm worried that this will start
> flooding the logs of users.
> 
> So first, this should probably be rate limited.

So change it to dev_WARN_ONCE()?  You and Greg think that will be good 
enough?

> Second, did you try to estimate how many call sites that get this wrong?

No.  I couldn't think of a good way to search for them.  My guess is 
that the number isn't terribly big, but I don't know.

> I always felt a bit pedantic when pointing out that the pipe direction
> should match the request type to driver author's during review when (in
> almost all cases?) this hasn't really mattered. I fear we may have
> accumulated a fairly large number of these mismatches over the years but
> I haven't verified that.

Alan Stern
