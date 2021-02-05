Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F80831081C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 10:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbhBEJoL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 04:44:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:44784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhBEJmB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 04:42:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC5860241;
        Fri,  5 Feb 2021 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612518080;
        bh=9mxbHfoCH/XKm74XMkUAQ5WTFH7IvxJv0SkLXlLvCd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=07H82tRrfwXJ7DTQpU9wIyzFIjkK5jaTALiQPiR5Q5F5cd3zrK+DVxOML+UIOuTAu
         yUNQZMW5LQKrA5M/hl45sPfCbdvF98tpcLQr4vQIGnLsjpk99rWghU7hVC0MAGdDUE
         Br1RTEMsHeZ4TFFI1fDE5NqqozyI2zGohmFTbTBs=
Date:   Fri, 5 Feb 2021 10:41:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
Message-ID: <YB0Sudllcc8f4lN+@kroah.com>
References: <7077bb0f5691732b9814ea76d38ae8e9312a61f5.1612412038.git.Thinh.Nguyen@synopsys.com>
 <YB0PRf9H2erqMGB6@kroah.com>
 <e81699b8-1768-d54c-0419-3cbdf5b84ee8@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e81699b8-1768-d54c-0419-3cbdf5b84ee8@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 05, 2021 at 09:39:37AM +0000, Thinh Nguyen wrote:
> Greg Kroah-Hartman wrote:
> > On Wed, Feb 03, 2021 at 08:14:37PM -0800, Thinh Nguyen wrote:
> >> The check for bounded gadget driver in dwc3_gadget_start() was to
> >> prevent going through the initialization again without any cleanup. With
> >> a recent update, the UDC framework guarantees this won't happen while
> >> the UDC is started. Also, this check doesn't prevent requesting threaded
> >> irq to the same dev_id, which will mess up the irq freeing logic. Let's
> >> remove it.
> > What "recent update" caused this?  Is this a fix for something that
> > needs to be backported?  If so, can you provide a "Fixes:" tag on here?
> > Or is this just a general cleanup that is good to do now.
> >
> > thanks,
> >
> > greg k-h
> 
> It's general cleanup. The "recent update" is not in mainline yet but on
> your "usb-next" branch so I'm not sure how to properly reference it.
> 
> But here's the commit on your branch I was referring to: 49d08cfc7830
> ("usb: udc: core: Introduce started state")

Please refer to this commit just like this, as the id is not going to
change.  Can you redo this patch with that information in it?

thanks,

greg k-h
