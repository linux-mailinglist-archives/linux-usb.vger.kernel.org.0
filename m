Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931D647B07C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 16:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbhLTPlZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 10:41:25 -0500
Received: from mga12.intel.com ([192.55.52.136]:2019 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231171AbhLTPlZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 10:41:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220217613"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="220217613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 07:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="663652201"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Dec 2021 07:41:22 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Dec 2021 17:41:22 +0200
Date:   Mon, 20 Dec 2021 17:41:22 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Chris Hixon <linux-kernel-bugs@hixontech.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Message-ID: <YcCkIp1U7YVAK/O3@kuha.fi.intel.com>
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
 <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
 <YcCXnMKPHAS7qaS+@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcCXnMKPHAS7qaS+@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 03:47:56PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 17, 2021 at 05:14:42PM +0200, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Fri, Dec 17, 2021 at 03:32:59PM +0100, Thorsten Leemhuis wrote:
> > > Lo! Thx for working out a fix this quickly!
> > > 
> > > I'm just the regression tracker, but I think there are a few minor
> > > details to improve here.
> > > 
> > > On 17.12.21 15:03, Heikki Krogerus wrote:
> > > > The driver must make sure there is an actual connection
> > > > before checking details about the USB Power Delivery
> > > > contract. Those details are not valid unless there is a
> > > > connection.
> > > > 
> > > > This fixes NULL pointer dereference that is caused by an
> > > > attempt to register bogus partner alternate mode that the
> > > > firmware on some platform may report before the actual
> > > > connection.
> > > > 
> > > > Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> > > > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> > > BugLink? Is that a tag we really use? Then I'm unaware of it. Greg is
> > > the expert and can likely clarify, but that line afaik needs to replaced
> > > by this:
> > 
> > Although not yet documented, it is the appropriate tag for the link to
> > the bug. It makes it clear that the link is to the bug and not to
> > the discussion on the list.
> > 
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> > > Link:
> > > https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/
> > > 
> > > Normally the last line would need a 's!linux-usb!r!', but seems the
> > > kernel.org redirector doesn't work well in this particular case, so I
> > > guess it's better this way than not at all :-/
> > > 
> > > The second line will also make the regression tracking bot automatically
> > > close the issue (but I fear it might also fail due to the slash at the
> > > end of the message-id :-/)
> > 
> > Greg will add the "Link" tag to the commit when, and if, he actually
> > takes the patch. I do not add it because I do not want any bots to
> > react to the patch before it has actually been accepted.
> 
> The link my scripts add is to the post on lore.kernel.org, not to
> anywhere else.
> 
> So if this needs to point to a different report, like Thorsten shows
> above, then that needs to be done "by hand".
> 
> I guess I'll go add these on my own :(

OK... so I don't prepare v2 then.


thanks,

-- 
heikki
