Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E0A47B06F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 16:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236997AbhLTPiQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 10:38:16 -0500
Received: from mga02.intel.com ([134.134.136.20]:4203 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231833AbhLTPiL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 10:38:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="227493737"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="227493737"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 07:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="663651424"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 20 Dec 2021 07:38:07 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Dec 2021 17:38:06 +0200
Date:   Mon, 20 Dec 2021 17:38:06 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Chris Hixon <linux-kernel-bugs@hixontech.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Only check the contract if there is a
 connection
Message-ID: <YcCjXhuvDwgRsf+D@kuha.fi.intel.com>
References: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
 <1d90a23b-fe2f-6892-1641-7a13e38a00dc@leemhuis.info>
 <YbypYo4Ohii4fSNx@kuha.fi.intel.com>
 <f1e9d624-100d-d7af-d716-1ca57474aa97@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e9d624-100d-d7af-d716-1ca57474aa97@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 17, 2021 at 06:25:09PM +0100, Thorsten Leemhuis wrote:
> 
> 
> On 17.12.21 16:14, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Fri, Dec 17, 2021 at 03:32:59PM +0100, Thorsten Leemhuis wrote:
> >> Lo! Thx for working out a fix this quickly!
> >>
> >> I'm just the regression tracker, but I think there are a few minor
> >> details to improve here.
> >>
> >> On 17.12.21 15:03, Heikki Krogerus wrote:
> >>> The driver must make sure there is an actual connection
> >>> before checking details about the USB Power Delivery
> >>> contract. Those details are not valid unless there is a
> >>> connection.
> >>>
> >>> This fixes NULL pointer dereference that is caused by an
> >>> attempt to register bogus partner alternate mode that the
> >>> firmware on some platform may report before the actual
> >>> connection.
> >>>
> >>> Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> >>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> >> BugLink? Is that a tag we really use? Then I'm unaware of it. Greg is
> >> the expert and can likely clarify, but that line afaik needs to replaced
> >> by this:
> > 
> > Although not yet documented, it is the appropriate tag for the link to
> > the bug.
> 
> For you maybe. But it kind of becomes a mess if various people create
> different tags, as they do now (you are just one of them).
> 
> > It makes it clear that the link is to the bug and not to
> > the discussion on the list.
> 
> I agree that some clarification is needed, that's why I recently
> proposed something:
> https://lore.kernel.org/lkml/cover.1639042966.git.linux@leemhuis.info/

Hashtags would be fine by me. I'm using the "BugLink" tag only because
it has been commonly used so far.

> Maybe chime in there.
> 
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> >> Link:
> >> https://lore.kernel.org/linux-usb/bug-215117-208809@https.bugzilla.kernel.org%2F/
> >>
> >> Normally the last line would need a 's!linux-usb!r!', but seems the
> >> kernel.org redirector doesn't work well in this particular case, so I
> >> guess it's better this way than not at all :-/
> >>
> >> The second line will also make the regression tracking bot automatically
> >> close the issue (but I fear it might also fail due to the slash at the
> >> end of the message-id :-/)
> > 
> > Greg will add the "Link" tag to the commit when, and if, he actually
> > takes the patch.
> 
> No, that is another Link tag. Let me quote
> Documentation/process/submitting-patches.rst:
> 
> ```
> If related discussions or any other background information behind the
> change can be found on the web, add 'Link:' tags pointing to it. In case
> your patch fixes a bug, for example, add a tag with a URL referencing
> the report in the mailing list archives or a bug tracker;
> ```
> 
> This concept is old, but the text was reworked recently to make this use
> case for the Link: tag clearer.
> For details see: https://git.kernel.org/linus/1f57bd42b77c
> 
> As the issue was discussed in a bug tracker and on the list, please add
> Link tags to both places.

Fair enough.

thanks,

-- 
heikki
