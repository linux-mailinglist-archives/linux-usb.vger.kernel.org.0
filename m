Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBE6229647
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 12:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbgGVKfS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 06:35:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:46840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgGVKfS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 06:35:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35CC120656;
        Wed, 22 Jul 2020 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595414117;
        bh=y71mKkT0E5cTPJDXaqrS65YDrnae2c7rwl5cjCPbJCw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v/JEU7VDDRAYJhXZxn//+X7M07NtwuPfvbiuxtF3HB8WIqKolilqIXjmecQsCvps+
         fcyvLhSVn8mHmAfA8FajdE42qqA6BBQNQImrUb0fmWll/YZbCN4uP4bUOkVKTfCWQN
         Qt3FzrNGCd/pSrmXJi3wrqw+8pONUEIXFWap3e3k=
Date:   Wed, 22 Jul 2020 12:35:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/2] USB: Fix source path in header
Message-ID: <20200722103523.GB2824871@kroah.com>
References: <20200722094628.4236-1-hadess@hadess.net>
 <20200722094628.4236-2-hadess@hadess.net>
 <20200722095102.GA2816153@kroah.com>
 <76c0e527095fd3adbf802e9a27ba93cbd656a03b.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76c0e527095fd3adbf802e9a27ba93cbd656a03b.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 11:58:54AM +0200, Bastien Nocera wrote:
> On Wed, 2020-07-22 at 11:51 +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 22, 2020 at 11:46:28AM +0200, Bastien Nocera wrote:
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > 
> > I can't take patches without any changelog text at all, sorry.
> 
> The subject line isn't clear enough?

Maybe, maybe not, doesn't mean you shouldn't also write some text about
why you did what you did.

> > > ---
> > >  drivers/usb/core/driver.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > > index a6187dd2186c..bd346e683af3 100644
> > > --- a/drivers/usb/core/driver.c
> > > +++ b/drivers/usb/core/driver.c
> > > @@ -1,6 +1,6 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >  /*
> > > - * drivers/usb/driver.c - most of the driver model stuff for usb
> > > + * drivers/usb/core/driver.c - most of the driver model stuff for
> > > usb
> > 
> > Just drop the whole file name, it's not needed at all.
> 
> And the description after or just the filename?

The description is fine to keep.

thanks,

greg k-h
