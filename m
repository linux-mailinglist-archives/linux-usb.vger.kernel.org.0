Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3845F2296BB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 12:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgGVK4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 06:56:15 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:40001 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgGVK4P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 06:56:15 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9DA701C0006;
        Wed, 22 Jul 2020 10:56:12 +0000 (UTC)
Message-ID: <3cf4abfa0168e32fd6c986530230fe3553a9cdd4.camel@hadess.net>
Subject: Re: [PATCH 2/2] USB: Fix source path in header
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Date:   Wed, 22 Jul 2020 12:56:12 +0200
In-Reply-To: <20200722103523.GB2824871@kroah.com>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722094628.4236-2-hadess@hadess.net>
         <20200722095102.GA2816153@kroah.com>
         <76c0e527095fd3adbf802e9a27ba93cbd656a03b.camel@hadess.net>
         <20200722103523.GB2824871@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-07-22 at 12:35 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 22, 2020 at 11:58:54AM +0200, Bastien Nocera wrote:
> > On Wed, 2020-07-22 at 11:51 +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jul 22, 2020 at 11:46:28AM +0200, Bastien Nocera wrote:
> > > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > 
> > > I can't take patches without any changelog text at all, sorry.
> > 
> > The subject line isn't clear enough?
> 
> Maybe, maybe not, doesn't mean you shouldn't also write some text
> about
> why you did what you did.
> 
> > > > ---
> > > >  drivers/usb/core/driver.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/usb/core/driver.c
> > > > b/drivers/usb/core/driver.c
> > > > index a6187dd2186c..bd346e683af3 100644
> > > > --- a/drivers/usb/core/driver.c
> > > > +++ b/drivers/usb/core/driver.c
> > > > @@ -1,6 +1,6 @@
> > > >  // SPDX-License-Identifier: GPL-2.0
> > > >  /*
> > > > - * drivers/usb/driver.c - most of the driver model stuff for
> > > > usb
> > > > + * drivers/usb/core/driver.c - most of the driver model stuff
> > > > for
> > > > usb
> > > 
> > > Just drop the whole file name, it's not needed at all.
> > 
> > And the description after or just the filename?
> 
> The description is fine to keep.

Looks like there's a lot more cleaning up that would need to be done in
the tree, so feel free to drop this patch.

Cheers

