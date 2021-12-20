Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3147747AEDC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 16:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237974AbhLTPEd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 10:04:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:40748 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237307AbhLTPCc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 10:02:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 29CAFB80ED1
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 15:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DF0C36AE8;
        Mon, 20 Dec 2021 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640012550;
        bh=zz+cy2PoFt+c5gkJBLKE9s667eNnUhBvOw3uWYSbNN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=00VWjLV7ZOOwvSeP2e025ay16UrMTKMDw+Nl0xDyNrIIuDq2HHMtNnRLWLK1f4XtC
         V8P16PeiMygNkqJg8Opn7mOlkiZZxzCFMv8jAD0TSeAB02DOxEtG7YMHg+jauXvzDs
         jP3gbbmLBAwDXfDnyx2G9QgoukjrSrpc4lOyrSVk=
Date:   Mon, 20 Dec 2021 15:47:56 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Chris Hixon <linux-kernel-bugs@hixontech.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Message-ID: <YcCXnMKPHAS7qaS+@kroah.com>
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
 <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 17, 2021 at 05:14:42PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> On Fri, Dec 17, 2021 at 03:32:59PM +0100, Thorsten Leemhuis wrote:
> > Lo! Thx for working out a fix this quickly!
> > 
> > I'm just the regression tracker, but I think there are a few minor
> > details to improve here.
> > 
> > On 17.12.21 15:03, Heikki Krogerus wrote:
> > > The driver must make sure there is an actual connection
> > > before checking details about the USB Power Delivery
> > > contract. Those details are not valid unless there is a
> > > connection.
> > > 
> > > This fixes NULL pointer dereference that is caused by an
> > > attempt to register bogus partner alternate mode that the
> > > firmware on some platform may report before the actual
> > > connection.
> > > 
> > > Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> > > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> > BugLink? Is that a tag we really use? Then I'm unaware of it. Greg is
> > the expert and can likely clarify, but that line afaik needs to replaced
> > by this:
> 
> Although not yet documented, it is the appropriate tag for the link to
> the bug. It makes it clear that the link is to the bug and not to
> the discussion on the list.
> 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> > Link:
> > https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/
> > 
> > Normally the last line would need a 's!linux-usb!r!', but seems the
> > kernel.org redirector doesn't work well in this particular case, so I
> > guess it's better this way than not at all :-/
> > 
> > The second line will also make the regression tracking bot automatically
> > close the issue (but I fear it might also fail due to the slash at the
> > end of the message-id :-/)
> 
> Greg will add the "Link" tag to the commit when, and if, he actually
> takes the patch. I do not add it because I do not want any bots to
> react to the patch before it has actually been accepted.

The link my scripts add is to the post on lore.kernel.org, not to
anywhere else.

So if this needs to point to a different report, like Thorsten shows
above, then that needs to be done "by hand".

I guess I'll go add these on my own :(

greg k-h
