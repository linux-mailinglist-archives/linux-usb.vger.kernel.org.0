Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F63C38D457
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 09:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhEVH6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 03:58:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:35662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhEVH6H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 May 2021 03:58:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEDB660698;
        Sat, 22 May 2021 07:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621670202;
        bh=Kj6Z1pZdhbWvx9pa+63Tywxw+dg+g3Ooed50cE/RjwU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dtw1EKBWBH6G97DvbH4ouFFhxYv8If/OO4ULUVxnvCvwPCxQsLLukc0y20GFi66gU
         vPswMPxPzPbTJ9cHJPCMiPnK9RieH77PdgRcXJVqELkJPCThcN0cPmHQ0J0m9UMuFD
         YC3TSHkXebvNhkWzuR7zYGIv5a2FbLthf4HXYbNTqZSOgLplLLiTaV7X1lmWH9NwK6
         4I4E4SnTPeYfePsn49o6trAV8c4hRw7mt2BYO14ZRxT0Ltgl3xSsMgsmiS9RxB0zLv
         6KINsZzWfk3bKFrp4qiTbUCVXQilfskjhrjcvIxeaKa/h7woO/XAQ+QqetH6HuroJM
         930eN4hpEluNQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lkMV1-0007u9-HN; Sat, 22 May 2021 09:56:43 +0200
Date:   Sat, 22 May 2021 09:56:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKi5O5mDxxo48+Y+@hovoldconsulting.com>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <20210521143823.GB1239965@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521143823.GB1239965@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:38:23AM -0400, Alan Stern wrote:
> On Fri, May 21, 2021 at 10:03:26AM +0200, Johan Hovold wrote:
> > On Thu, May 20, 2021 at 04:20:56PM -0400, Alan Stern wrote:
> 
> > > +		if (usb_pipeout(urb->pipe) != is_out)
> > > +			dev_WARN(&dev->dev, "BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> > > +					urb->pipe, setup->bRequestType);
> 
> > While I agree with intention here, I'm worried that this will start
> > flooding the logs of users.
> > 
> > So first, this should probably be rate limited.
> 
> So change it to dev_WARN_ONCE()?  You and Greg think that will be good 
> enough?

I think so, yes. In the unlikely event that there are more than one
driver in use that gets this wrong in a system it'll only take a little
longer to root them all out.

Johan
