Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BA6229739
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 13:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgGVLOC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 07:14:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbgGVLOB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 07:14:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBE7C20729;
        Wed, 22 Jul 2020 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595416441;
        bh=/CZI05UsgzW8nXGf57dneDvTArf7y1QcJ+YN40nPFnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qOc7GMd7DH3b06rnhpTCU/p4UucRPEQjVskbd4Z41YSAj+Aa8jj0VdLokV3qnkUFK
         m8zUcRnkvyMG2M4HugLg+ZNataLN/wIaNeP923oN8AWGTWqAzNig6pyWEw4yfmKMbl
         mn81YPkDByENzXH8gGQ25coMg4j/AFk3soh3UF/M=
Date:   Wed, 22 Jul 2020 13:13:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: usbfs: stop using compat_alloc_user_space
Message-ID: <20200722111313.GA2914116@kroah.com>
References: <20200722073655.220011-1-hch@lst.de>
 <20200722080959.GA2800885@kroah.com>
 <20200722082153.GA27215@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722082153.GA27215@lst.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 10:21:53AM +0200, Christoph Hellwig wrote:
> On Wed, Jul 22, 2020 at 10:09:59AM +0200, Greg KH wrote:
> > On Wed, Jul 22, 2020 at 09:36:55AM +0200, Christoph Hellwig wrote:
> > > Just switch the low-level routines to take kernel structures, and do the
> > > conversion from the compat to the native structure on that.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  drivers/usb/core/devio.c | 126 +++++++++++++++++++++------------------
> > >  1 file changed, 69 insertions(+), 57 deletions(-)
> > 
> > No objection to this, but why?  Are you trying to get rid of
> > compat_alloc_user_space()?
> 
> Eventually, yes.  Al has been doing a fair amount of work on it,
> and Linus hates it with passion.
> 
> > 
> > And do you want me to take this through my tree, or do you need to take
> > it through yours?
> 
> I have no tree where this would fit in, so please take it.
> 

Ok, will do, thanks!
