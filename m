Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704E8478F4C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 16:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235139AbhLQPOq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 10:14:46 -0500
Received: from mga06.intel.com ([134.134.136.31]:5032 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232151AbhLQPOq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Dec 2021 10:14:46 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="300544445"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="300544445"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 07:14:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="662865998"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 17 Dec 2021 07:14:43 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 17 Dec 2021 17:14:42 +0200
Date:   Fri, 17 Dec 2021 17:14:42 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Message-ID: <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Dec 17, 2021 at 03:32:59PM +0100, Thorsten Leemhuis wrote:
> Lo! Thx for working out a fix this quickly!
> 
> I'm just the regression tracker, but I think there are a few minor
> details to improve here.
> 
> On 17.12.21 15:03, Heikki Krogerus wrote:
> > The driver must make sure there is an actual connection
> > before checking details about the USB Power Delivery
> > contract. Those details are not valid unless there is a
> > connection.
> > 
> > This fixes NULL pointer dereference that is caused by an
> > attempt to register bogus partner alternate mode that the
> > firmware on some platform may report before the actual
> > connection.
> > 
> > Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> BugLink? Is that a tag we really use? Then I'm unaware of it. Greg is
> the expert and can likely clarify, but that line afaik needs to replaced
> by this:

Although not yet documented, it is the appropriate tag for the link to
the bug. It makes it clear that the link is to the bug and not to
the discussion on the list.

> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> Link:
> https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/
> 
> Normally the last line would need a 's!linux-usb!r!', but seems the
> kernel.org redirector doesn't work well in this particular case, so I
> guess it's better this way than not at all :-/
> 
> The second line will also make the regression tracking bot automatically
> close the issue (but I fear it might also fail due to the slash at the
> end of the message-id :-/)

Greg will add the "Link" tag to the commit when, and if, he actually
takes the patch. I do not add it because I do not want any bots to
react to the patch before it has actually been accepted.

The bug shouldn't be closed before the fix has really been accepted.

> I think this line should be there as well:
> 
> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>

+Chris

This is true. I'll add the Reported-by tag if it's OK to you Chris?

thanks,

-- 
heikki
