Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0923F229359
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 10:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgGVIV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 04:21:57 -0400
Received: from verein.lst.de ([213.95.11.211]:55444 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728599AbgGVIV4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 04:21:56 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0DB446736F; Wed, 22 Jul 2020 10:21:54 +0200 (CEST)
Date:   Wed, 22 Jul 2020 10:21:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: usbfs: stop using compat_alloc_user_space
Message-ID: <20200722082153.GA27215@lst.de>
References: <20200722073655.220011-1-hch@lst.de> <20200722080959.GA2800885@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722080959.GA2800885@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 10:09:59AM +0200, Greg KH wrote:
> On Wed, Jul 22, 2020 at 09:36:55AM +0200, Christoph Hellwig wrote:
> > Just switch the low-level routines to take kernel structures, and do the
> > conversion from the compat to the native structure on that.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  drivers/usb/core/devio.c | 126 +++++++++++++++++++++------------------
> >  1 file changed, 69 insertions(+), 57 deletions(-)
> 
> No objection to this, but why?  Are you trying to get rid of
> compat_alloc_user_space()?

Eventually, yes.  Al has been doing a fair amount of work on it,
and Linus hates it with passion.

> 
> And do you want me to take this through my tree, or do you need to take
> it through yours?

I have no tree where this would fit in, so please take it.

