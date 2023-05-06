Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212BA6F91FD
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 14:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjEFM34 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 08:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjEFM3z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 08:29:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE651569D
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 05:29:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A79460B7D
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 12:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0A9C433EF;
        Sat,  6 May 2023 12:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1683376193;
        bh=/Kfs2Cd+aHaJgOA2zlct/XxRzvwoFT2BzgOrgryCcFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a6JMvsU/x9acTYJrZvP0A1iNGP3bkuulbhZCZoUYgyvKCWN6fSa4pkEY+aFFvK4GQ
         rhjxZnppsjUYi8gk8ZzhlI54J2hN4K2BqxLpf6gz/dsRx4BQOh6sflRQJjh3NZ0C/2
         UpoZbttwOgjzMH1CjGezRobhTnYbKZFZyhHcNJeg=
Date:   Sat, 6 May 2023 14:29:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>,
        balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <2023050651-duckbill-thespian-f7d9@gregkh>
References: <20230429154733.4429-1-wlodzimierz.lipert@gmail.com>
 <2023050616-large-nastily-88a1@gregkh>
 <5ab322e6-354c-4e6f-a6be-fad88bafa6d7@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab322e6-354c-4e6f-a6be-fad88bafa6d7@rowland.harvard.edu>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 06, 2023 at 08:19:24AM -0400, Alan Stern wrote:
> On Sat, May 06, 2023 at 09:44:17AM +0900, Greg KH wrote:
> > On Sat, Apr 29, 2023 at 05:47:33PM +0200, Wlodzimierz Lipert wrote:
> 
> > > --- a/drivers/usb/gadget/epautoconf.c
> > > +++ b/drivers/usb/gadget/epautoconf.c
> > > @@ -67,6 +67,8 @@ struct usb_ep *usb_ep_autoconfig_ss(
> > >  )
> > >  {
> > >  	struct usb_ep	*ep;
> > > +	unsigned	*epmap;
> > 
> > Why "unsigned"?  Didn't checkpatch complain about this?
> 
> In other words, the preferred style in the kernel is to use "unsigned 
> int" rather than just "unsigned".  (Although there's plenty of old code 
> that still does it that way.)
> 
> > >  	if (isdigit(ep->name[2])) {
> > > -		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> > > -		desc->bEndpointAddress |= num;
> > > -	} else if (desc->bEndpointAddress & USB_DIR_IN) {
> > > -		if (++gadget->in_epnum > 15)
> > > +		num = simple_strtoul(&ep->name[2], NULL, 10);
> > > +		WARN_ON(num == 0 || num > 15);
> > 
> > You just crashed the system if this happened if panic-on-warn is enabled :(
> > 
> > Please never do this, if there is an issue, fix it up and handle it
> > properly.
> 
> I disagree; I think this is an appropriate use of WARN_ON.  It's an 
> example of "drivers should never do this, and if they do then weird, 
> unpredictable errors will occur".  For these things we _want_ to have a 
> very visible notice that a problem needs to be fixed.  (In this case it 
> wouldn't hurt to also print out the bad endpoint name as well, along 
> with the name of the UDC driver.)
> 
> If someone turns on panic-on-warn, it means they _do_ want their system 
> to crash when issues like this crop up.  Like syzbot, for example.  If 
> instead we just covered up the error then it would never get fixed.

So you want syzbot to constantly be triggered here by sending in bad
addresses?  If this is something that a user can trigger, it should
never have a WARN_ON().  Or is this only something that a badly written
driver can trigger?  It's hard to tell from the snippet above.

thanks,

greg k-h
