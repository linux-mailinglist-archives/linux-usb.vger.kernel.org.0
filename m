Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D80122CBB9
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGXROL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:14:11 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59707 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgGXROL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:14:11 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CCB9BFF804;
        Fri, 24 Jul 2020 17:14:08 +0000 (UTC)
Message-ID: <5b5912d7584eff4229ddb7dc1b6c6eca5fa33146.camel@hadess.net>
Subject: Re: [PATCH v4] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Fri, 24 Jul 2020 19:14:08 +0200
In-Reply-To: <20200724170814.GA1395815@rowland.harvard.edu>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
         <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
         <20200724152707.GB1388675@rowland.harvard.edu>
         <e46ee6070263cd6672a42050040dbe1503036702.camel@hadess.net>
         <20200724170814.GA1395815@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2020-07-24 at 13:08 -0400, Alan Stern wrote:
> On Fri, Jul 24, 2020 at 06:52:31PM +0200, Bastien Nocera wrote:
> > On Fri, 2020-07-24 at 11:27 -0400, Alan Stern wrote:
> > > > > +               if (new_udriver->match || new_udriver-
> > > > > >id_table)
> > > > 
> > > > But match check is incorporated in the loop function.
> > > 
> > > Agreed, this test is redundant.  However, we should test that 
> > > new_udriver != &usb_generic_driver.
> > 
> > Do you really want to loop over every USB device when you know for
> > a
> > fact that not a single one will match?
> 
> Think of it the other way around: How often will anybody load a 
> specialized USB device driver that doesn't have a match function or
> ID 
> table?  It wouldn't match any devices!
> 
> > I guess it's unlikely, the generic driver would be loaded before
> > any
> > device,
> 
> Since it's built into usbcore, I guess that's true.
> 
> >  and the specialised drivers need to be able to selected, so
> > I've done that locally.
> 
> Okay, you're ready to submit the next version?

It's compiling. Then I need to test it. I've also added a couple of
fixes/cleanups I ran into while doing this.

