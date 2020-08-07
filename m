Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D456C23F3AC
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 22:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGUUa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 7 Aug 2020 16:20:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgHGUUa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 16:20:30 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208843] New: System freeze and hard reset when attempting to
 flash Sparkfun Red-V
Date:   Fri, 07 Aug 2020 20:20:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@michaelkloos.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208843-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208843

            Bug ID: 208843
           Summary: System freeze and hard reset when attempting to flash
                    Sparkfun Red-V
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.48-gentoo
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: michael@michaelkloos.com
        Regression: No

The Sparkfun Red-V appears as a flash drive and 2 ACM modems (UARTs).  When an
ihex file is copied to the "flash drive", the Red-V resets as it uses that file
to reflash it's SPI flash.  Every 4-5 times I attempt this procedure, the
sudden disconnection of the device causes my host system to freeze for a second
or 2 and then hard-reset.  I wish I could give more technical info, but I'm not
a kernel dev.  If you need more info, let me know and I'll try to get it for
you.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
