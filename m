Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810632EF0C5
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 11:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbhAHKiB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 8 Jan 2021 05:38:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:36482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727176AbhAHKiB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 05:38:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F8DD23372
        for <linux-usb@vger.kernel.org>; Fri,  8 Jan 2021 10:37:20 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6CA5481F02; Fri,  8 Jan 2021 10:37:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210351] Wrong setting baudrate for FTDI chip FT230X
Date:   Fri, 08 Jan 2021 10:37:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210351-208809-Ij8UeSpU2H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210351-208809@https.bugzilla.kernel.org/>
References: <bug-210351-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210351

--- Comment #1 from Johan Hovold (johan@kernel.org) ---
On Wed, Nov 25, 2020 at 05:14:18AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=210351
> 
>             Bug ID: 210351
>            Summary: Wrong setting baudrate for FTDI chip FT230X
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: all
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: svv75@mail.ru
>         Regression: No
> 
> Hello!
> 
> I have three chips FT232BL, FT232R and FT230X. I am using them as a VCP on
> Linux (Ubuntu 18.04). According to Application Note AN_120 from FTDI, the
> baud
> rate generators of all these chips have 8 sub-integer prescalers. Divisor =
> 3000000 / baudrate = n + 0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875.
> Where
> n is an integer between 2 and16384.
> So, I measured real baud rates, for n = 2 in combination with all possible
> sub-integer prescalers.
> And it turned out that all sub-integer prescalers worked for FT232BL, FT232R
> chips.
> 
> And for the FT230X, only a few prescalers work correctly. The following shows
> exactly how prescalers behave:
> 0          - correct
> 0.125  - correct
> 0.25     - correct
> 0.375   - WRONG! (works like 0.125)
> 0.5        - correct
> 0.625    - WRONG! (works like 0.5)
> 0.75      - WRONG! (works like 0.25)
> 0.875    - WRONG! (works like 0.125)
> 
> The same for the other n.
> 
> I think it is a driver problem, it initializes the sub-integer prescaler
> incorrectly. Since under Windows FT230X works fine with all sub-integer
> prescalers.

Thanks for the report.

It sounds like your device behaves like a FT8U232AM, which only supports
0.125, 0.25 or 0.5, then. Are you sure Windows is able to use the
others?

Is the device type being detected correctly? What does the log say when
you plug your device in? Please also post the output of "lsusb -v" for
the device.

Johan

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
