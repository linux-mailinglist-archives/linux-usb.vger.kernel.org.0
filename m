Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4FC38C95B
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 16:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbhEUOnH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 10:43:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51235 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230336AbhEUOnG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 10:43:06 -0400
Received: (qmail 1241146 invoked by uid 1000); 21 May 2021 10:41:42 -0400
Date:   Fri, 21 May 2021 10:41:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <20210521144142.GD1239965@rowland.harvard.edu>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 03:17:46PM +0200, Johan Hovold wrote:
> On Fri, May 21, 2021 at 10:03:26AM +0200, Johan Hovold wrote:
> > So first, this should probably be rate limited.
> 
> This could actually be done using WARN_ON_ONCE() as we don't have to
> worry about syzbot fuzzing descriptors here (all control endpoints are
> bidirectional).
> 
> > Second, did you try to estimate how many call sites that get this wrong?
> > I always felt a bit pedantic when pointing out that the pipe direction
> > should match the request type to driver author's during review when (in
> > almost all cases?) this hasn't really mattered. I fear we may have
> > accumulated a fairly large number of these mismatches over the years but
> > I haven't verified that.
> 
> I did a quick review of all ctrlpipe-macro uses in usb/misc and
> usb/serial and found two instances.
> 
> A simple grep pattern looking for explicit USB_DIR/ctrlpipe mismatches
> caught another five tree wide (not including the
> sound/usb/mixer_scarlett_gen2.c which Geoffrey reported), but there are
> likely more of those out there as the request type is often not that
> explicit.
> 
> I've prepared patches for the above, excluding the sound driver Geoffrey
> said he was fixing.

Many thanks for making the effort to do this.

Alan Stern
