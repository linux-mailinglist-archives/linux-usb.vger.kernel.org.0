Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42129699D4E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 21:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjBPUEC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 15:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBPUEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 15:04:00 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B912D505F6
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 12:03:52 -0800 (PST)
Received: (qmail 1031525 invoked by uid 1000); 16 Feb 2023 15:03:51 -0500
Date:   Thu, 16 Feb 2023 15:03:51 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Message-ID: <Y+6MJ2juVmPdp15q@rowland.harvard.edu>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
 <Y+0jZScRX80mF8tS@rowland.harvard.edu>
 <20230215225337.wuzhpmikiqz5htqk@synopsys.com>
 <3b6f29e9-cc6b-d834-7c7e-7ae47b9fc44e@kernel.org>
 <20230216181132.k2jate2uwqadpqfh@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216181132.k2jate2uwqadpqfh@synopsys.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 16, 2023 at 06:11:36PM +0000, Thinh Nguyen wrote:
> On Thu, Feb 16, 2023, Roger Quadros wrote:
> > I could not find any reference to 500ms time limit for suspend/resume case.
> > The only mention of 500ms in USB2.0 spec is:
> > 
> > 	9.2.6.4 Standard Device Requests
> > 	...
> > 	For standard device requests that require data stage transfer
> > 	to the host, the device must be able to return the first data
> > 	packet to the host within 500 ms of receipt of the request.
> > 	For subsequent data packets, if any, the device must be able to
> > 	return them within 500 ms of successful completion of the
> > 	transmission of the previous packet. The device must then be
> > 	able to successfully complete the status stage within 50 ms after
> > 	returning the last data packet.
> > 
> > I don't think this applies to suspend/resume.

It's not specific to suspend/resume; it's a generic time limit.  It can 
vary depending on the application or the driver.

> Are you referring to the handshake timeout when the host tries to
> initiate resume at the link layer? It's relatively short compare to the
> software timeout and will vary depending on how many hub tiers in the
> topology. Also, that's handled by the host and device controller. We
> should care more about the software timeout after resume completed. The
> 500ms here applies if the device couldn't resume fast enough for the
> driver to prepare a transfer response to the host.

Also, keep in mind that we can increase the initial timeout limit 
following a resume, if necessary (on Linux hosts with a recent kernel -- 
obviously not on other kinds of hosts).  Or make it an adjustable 
parameter.

> > > IMO, the system suspend on the gadget side should take precedence. That
> > > is, it shouldn't depend on whether the usb gadget is in suspend or not
> > > to go through system suspend. For that to happen, the gadget must
> > > initiate soft-disconnect. Otherwise I can see we may run into
> > > complications from the delay from the system suspend. For example, what
> > > if the host initiates resume right after suspend while the gadget side
> > > is still suspending?
> > 
> > In this case, system will go all the way to suspend and then wake up.
> > It will take a few seconds more to respond than if system was already suspended.
> 
> Yes, my concern is the suspend/resume is measured in seconds.

It the gadget is too slow in responding, it shouldn't be a big deal.  
The host will assume the gadget has disconnected and then will 
re-discover it.  Pretty much the same as if the gadget had actually 
disconnected from the bus before going into system suspend.

Alan Stern
