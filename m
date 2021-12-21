Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254CD47C34B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 16:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhLUPqR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 10:46:17 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33534 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhLUPqQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 10:46:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C123B81744
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 15:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B461BC36AE8;
        Tue, 21 Dec 2021 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640101574;
        bh=zdmWxBUKqv3Xfi/L0zxftdepu1DI26LQgg4HCiC17GE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R80oiOfErVat38c6WIsvitQdH8SswoAgI/ZjRsfvpJYstX2xCu6BtUrSw2K7YB1j8
         ubiJe6KNp+HXPDtzP9pcwworftnaCbGv3liSh0i59i/5+fOrxG+9mZWbdXKvknu7/Q
         zt9EsuGQTKY/5VdoHPFw6VwKxOAfTAUi0IVPH8p8=
Date:   Tue, 21 Dec 2021 16:46:11 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Only check the contract if there is
 a connection
Message-ID: <YcH2w9jmGnqUMWp4@kroah.com>
References: <20211221140352.45501-1-heikki.krogerus@linux.intel.com>
 <2723c9a3-a932-3634-422b-3fbd93550bf8@leemhuis.info>
 <YcHs11T7q//4FrWo@kroah.com>
 <364b900a-a2a2-7363-a852-9368635e886c@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364b900a-a2a2-7363-a852-9368635e886c@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 21, 2021 at 04:24:30PM +0100, Thorsten Leemhuis wrote:
> 
> 
> On 21.12.21 16:03, Greg Kroah-Hartman wrote:
> > On Tue, Dec 21, 2021 at 03:39:04PM +0100, Thorsten Leemhuis wrote:
> >> On 21.12.21 15:03, Heikki Krogerus wrote:
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
> >>> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> >>> Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> >>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> >>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >>> ---
> >>>
> >>> Hi,
> >>>
> >>> Instead of using the "BugLink" tag, I'm now using "Link" tag with the
> >>> link to the bug as requested.
> >>
> >> Thx!
> >>
> >>> There was a request to have also another Link tag pointing to some
> >>> other discussion on the mailing list, but I failed to understand what
> >>> was the point with that - I also didn't find any commits where
> >>> something like that had been used before.
> >>
> >> There are quite a few commits that use more that two "Link" tags, as
> >> they should point to "related discussions or any other background
> >> information behind the change" that "can be found on the web" (Quotes
> >> from Documentation/process/submitting-patches.rst) -- hence there is no
> >> limit. That being said:
> >>
> >>> I may be mistaken here, but I got the impression that you create the
> >>> mailing list discussion
> >>
> >> You are mistaken: I created it because the bugzilla ticket was ignored
> >> in bugzilla for weeks and might have forgotten otherwise -- no wonder,
> >> was bugzilla.kernel.org is not the official place to report USB bugs
> >> according to the MAINTAINERS file.
> >>
> >>> just so you can have the extra Link tag
> >>> pointing to it, and that Link tag you want only because you have made
> >>> your scripts rely on it.
> >>
> >> They rely on it as almost all subsystems expect bug to be reported by
> >> mail, as they are instructed by
> >> Documentation/admin-guide/reporting-issues.rst
> >>
> >>> The extra email thread in any case does not seem to contain any real
> >>> additional information that the bug report does not have, so the extra
> >>> Link tag pointing to it does not provide any real value on top of the
> >>> link to bug itself.
> >>
> >> In this case that's true, as I have to tell regzbot about the fix then
> >> manually (the plan it to make regzbot also detect links to
> >> bugzilla.kernel.org, but I fear I have no time to work on that in the
> >> next few weeks :-/ ). But in similar cases it's different, as there the
> >> developers continued discussing the issue by mail -- then it's
> >> definitely worth linking there as well.
> > 
> > So for this case, what type of tag should I add here to get rezbot to
> > manually pick this up?
> 
> Just commit it. Afterwards someone needs to send '#regzbot fixed-by:
> <commit-id>' to the thread with the report, for example as a reply to
> this mail:
> https://lore.kernel.org/linux-usb/eb34f98f-00ef-3238-2daa-80481116035d@leemhuis.info/
> 
> But you can leave that to me, regzbot will alert me anyway once it sees
> a fix with "Fixes: 6cbe4b2d5a3f". That's the commit that introduced the
> regression. But making regzbot mark the entry as fixed solely on this
> afaics would be a bad idea, as one commit can cause different
> regressions :-/

Ok, thanks, now committed to my tree, hopefully gets picked up
automagically...

greg k-h
