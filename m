Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E19E22CBAC
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgGXRIP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:08:15 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33167 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726782AbgGXRIP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:08:15 -0400
Received: (qmail 1396181 invoked by uid 1000); 24 Jul 2020 13:08:14 -0400
Date:   Fri, 24 Jul 2020 13:08:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] USB: Fix device driver race
Message-ID: <20200724170814.GA1395815@rowland.harvard.edu>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
 <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com>
 <20200724152707.GB1388675@rowland.harvard.edu>
 <e46ee6070263cd6672a42050040dbe1503036702.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e46ee6070263cd6672a42050040dbe1503036702.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 06:52:31PM +0200, Bastien Nocera wrote:
> On Fri, 2020-07-24 at 11:27 -0400, Alan Stern wrote:

> > > > +               if (new_udriver->match || new_udriver->id_table)
> > > 
> > > But match check is incorporated in the loop function.
> > 
> > Agreed, this test is redundant.  However, we should test that 
> > new_udriver != &usb_generic_driver.
> 
> Do you really want to loop over every USB device when you know for a
> fact that not a single one will match?

Think of it the other way around: How often will anybody load a 
specialized USB device driver that doesn't have a match function or ID 
table?  It wouldn't match any devices!

> I guess it's unlikely, the generic driver would be loaded before any
> device,

Since it's built into usbcore, I guess that's true.

>  and the specialised drivers need to be able to selected, so
> I've done that locally.

Okay, you're ready to submit the next version?

Alan Stern
