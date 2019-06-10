Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55ADD3B940
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 18:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404128AbfFJQUs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 12:20:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35368 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388996AbfFJQUs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 12:20:48 -0400
Received: (qmail 5253 invoked by uid 2102); 10 Jun 2019 12:20:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Jun 2019 12:20:47 -0400
Date:   Mon, 10 Jun 2019 12:20:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <fd2b71b53a5ca4b6ab635dc6d04676d157c2c46c.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1906101208450.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 10 Jun 2019, Andrea Vai wrote:

> Il giorno lun, 10/06/2019 alle 10.40 -0400, Alan Stern ha scritto:
> > 
> > 
> > [...]
> 
> Thank you Alan and Greg for your patience and answer. I will carefully
> consider all the advice you gave me, but one in particular stands out
> to me first:
> 
> >         Not setting up the .config file properly for each build.
> 
> How should I set up the .config file properly for each build? What I
> did so far was
> 
> cp -v /boot/config-$(uname -r) .config
> 
> (when I was using a "working kernel", maybe the Fedora one) before the
> first build, then never touched the .config dir again during the
> bisection.

In theory, the best approach is to always start from a single, fixed 
configuration, such as the one your Fedora kernel came with.  In 
practice it may not matter very much.

> (Also, I use to press ENTER to accept all default choices when
> compiling, is that correct?)

As long as the resulting kernel runs okay and includes the drivers you 
need, it's okay.  Just try to minimize the differences among the 
various kernels you build.

Alan Stern

