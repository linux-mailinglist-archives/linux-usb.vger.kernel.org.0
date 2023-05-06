Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B689D6F92C8
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbjEFPkN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 11:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbjEFPkM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 11:40:12 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0E7201A1EE
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 08:40:09 -0700 (PDT)
Received: (qmail 481346 invoked by uid 1000); 6 May 2023 11:40:09 -0400
Date:   Sat, 6 May 2023 11:40:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>,
        balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <298b489c-c096-4d94-8d58-d40a46092cfe@rowland.harvard.edu>
References: <20230429154733.4429-1-wlodzimierz.lipert@gmail.com>
 <2023050616-large-nastily-88a1@gregkh>
 <5ab322e6-354c-4e6f-a6be-fad88bafa6d7@rowland.harvard.edu>
 <2023050651-duckbill-thespian-f7d9@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023050651-duckbill-thespian-f7d9@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 06, 2023 at 02:29:49PM +0200, Greg KH wrote:
> On Sat, May 06, 2023 at 08:19:24AM -0400, Alan Stern wrote:
> > On Sat, May 06, 2023 at 09:44:17AM +0900, Greg KH wrote:
> > > On Sat, Apr 29, 2023 at 05:47:33PM +0200, Wlodzimierz Lipert wrote:

> > > >  	if (isdigit(ep->name[2])) {
> > > > -		u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> > > > -		desc->bEndpointAddress |= num;
> > > > -	} else if (desc->bEndpointAddress & USB_DIR_IN) {
> > > > -		if (++gadget->in_epnum > 15)
> > > > +		num = simple_strtoul(&ep->name[2], NULL, 10);
> > > > +		WARN_ON(num == 0 || num > 15);
> > > 
> > > You just crashed the system if this happened if panic-on-warn is enabled :(
> > > 
> > > Please never do this, if there is an issue, fix it up and handle it
> > > properly.
> > 
> > I disagree; I think this is an appropriate use of WARN_ON.  It's an 
> > example of "drivers should never do this, and if they do then weird, 
> > unpredictable errors will occur".  For these things we _want_ to have a 
> > very visible notice that a problem needs to be fixed.  (In this case it 
> > wouldn't hurt to also print out the bad endpoint name as well, along 
> > with the name of the UDC driver.)
> > 
> > If someone turns on panic-on-warn, it means they _do_ want their system 
> > to crash when issues like this crop up.  Like syzbot, for example.  If 
> > instead we just covered up the error then it would never get fixed.
> 
> So you want syzbot to constantly be triggered here by sending in bad
> addresses?

I don't know about the "constantly" part, but otherwise, yes.

>  If this is something that a user can trigger, it should
> never have a WARN_ON().  Or is this only something that a badly written
> driver can trigger?  It's hard to tell from the snippet above.

Only a badly written driver.  Or possibly (I'm not sure) a bad user of 
gadgetfs or functionfs -- but those things require superuser permission.

Alan Stern
