Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5208C1530B9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 13:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBEM3a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 5 Feb 2020 07:29:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:33874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbgBEM3a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Feb 2020 07:29:30 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206427] go7007 driver fails to handle interrupt
Date:   Wed, 05 Feb 2020 12:29:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206427-208809-1MghLhebBP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206427-208809@https.bugzilla.kernel.org/>
References: <bug-206427-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206427

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Wed, Feb 05, 2020 at 12:24:50PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=206427
> 
>             Bug ID: 206427
>            Summary: go7007 driver fails to handle interrupt
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.3.18
>           Hardware: x86-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: josef.moellers@suse.com
>         Regression: No
> 
> Created attachment 287141
>   --> https://bugzilla.kernel.org/attachment.cgi?id=287141&action=edit
> Kernel trace shown when error is reported.
> 
> When connecting a Plextor ConvertX M402U video converter, a "BOGUS urb xfer"
> is
> reported and a Call Trace is dumped.
> I assume that the go7007 driver has not been fully supported in newer kernel
> versions as it definitely used to work in 2.x kernels!

Can you provide the full kernel log message here please?

And can you try the 5.5 kernel, 5.3.y is old and obsolete.

thanks,

greg k-h

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
