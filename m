Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A04147C22D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 16:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238887AbhLUPDz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 10:03:55 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:47502 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbhLUPDz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 10:03:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACEA961630
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 15:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921AFC36AE9;
        Tue, 21 Dec 2021 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640099034;
        bh=Eh6aRsQ9T0rFidKKB796GS5k2+IQc4rFHQx50V4B7no=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2rntMbnksqVu5gsvFMfWVqL8FbMj9AQdzVrZlJ7TOJkvU8UBraSrVb4of1OZChE7s
         qFWB9Sr+NtzsSRabAFkD/Cxvz9OxtqVAEr0uJUDIlBds442m5zHgv0iBb4k/YteHVZ
         VJsoa0uefzEGqYEn4v1J9LeKvbz+ORCAzFUJ2wz8=
Date:   Tue, 21 Dec 2021 16:03:51 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Only check the contract if there is
 a connection
Message-ID: <YcHs11T7q//4FrWo@kroah.com>
References: <20211221140352.45501-1-heikki.krogerus@linux.intel.com>
 <2723c9a3-a932-3634-422b-3fbd93550bf8@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2723c9a3-a932-3634-422b-3fbd93550bf8@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 21, 2021 at 03:39:04PM +0100, Thorsten Leemhuis wrote:
> On 21.12.21 15:03, Heikki Krogerus wrote:
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
> > Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> > Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > 
> > Hi,
> > 
> > Instead of using the "BugLink" tag, I'm now using "Link" tag with the
> > link to the bug as requested.
> 
> Thx!
> 
> > There was a request to have also another Link tag pointing to some
> > other discussion on the mailing list, but I failed to understand what
> > was the point with that - I also didn't find any commits where
> > something like that had been used before.
> 
> There are quite a few commits that use more that two "Link" tags, as
> they should point to "related discussions or any other background
> information behind the change" that "can be found on the web" (Quotes
> from Documentation/process/submitting-patches.rst) -- hence there is no
> limit. That being said:
> 
> > I may be mistaken here, but I got the impression that you create the
> > mailing list discussion
> 
> You are mistaken: I created it because the bugzilla ticket was ignored
> in bugzilla for weeks and might have forgotten otherwise -- no wonder,
> was bugzilla.kernel.org is not the official place to report USB bugs
> according to the MAINTAINERS file.
> 
> > just so you can have the extra Link tag
> > pointing to it, and that Link tag you want only because you have made
> > your scripts rely on it.
> 
> They rely on it as almost all subsystems expect bug to be reported by
> mail, as they are instructed by
> Documentation/admin-guide/reporting-issues.rst
> 
> > The extra email thread in any case does not seem to contain any real
> > additional information that the bug report does not have, so the extra
> > Link tag pointing to it does not provide any real value on top of the
> > link to bug itself.
> 
> In this case that's true, as I have to tell regzbot about the fix then
> manually (the plan it to make regzbot also detect links to
> bugzilla.kernel.org, but I fear I have no time to work on that in the
> next few weeks :-/ ). But in similar cases it's different, as there the
> developers continued discussing the issue by mail -- then it's
> definitely worth linking there as well.

So for this case, what type of tag should I add here to get rezbot to
manually pick this up?

confused,

greg k-h
