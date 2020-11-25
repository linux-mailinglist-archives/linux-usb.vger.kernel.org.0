Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A112C3862
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 06:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgKYFOU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 25 Nov 2020 00:14:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:34294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgKYFOT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 00:14:19 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210351] New: Wrong setting baudrate for FTDI chip FT230X
Date:   Wed, 25 Nov 2020 05:14:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: svv75@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210351-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210351

            Bug ID: 210351
           Summary: Wrong setting baudrate for FTDI chip FT230X
           Product: Drivers
           Version: 2.5
    Kernel Version: all
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: svv75@mail.ru
        Regression: No

Hello!

I have three chips FT232BL, FT232R and FT230X. I am using them as a VCP on
Linux (Ubuntu 18.04). According to Application Note AN_120 from FTDI, the baud
rate generators of all these chips have 8 sub-integer prescalers. Divisor =
3000000 / baudrate = n + 0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875. Where
n is an integer between 2 and16384.
So, I measured real baud rates, for n = 2 in combination with all possible
sub-integer prescalers.
And it turned out that all sub-integer prescalers worked for FT232BL, FT232R
chips.

And for the FT230X, only a few prescalers work correctly. The following shows
exactly how prescalers behave:
0          - correct
0.125  - correct
0.25     - correct
0.375   - WRONG! (works like 0.125)
0.5        - correct
0.625    - WRONG! (works like 0.5)
0.75      - WRONG! (works like 0.25)
0.875    - WRONG! (works like 0.125)

The same for the other n.

I think it is a driver problem, it initializes the sub-integer prescaler
incorrectly. Since under Windows FT230X works fine with all sub-integer
prescalers.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
