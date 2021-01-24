Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C67F30197E
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 05:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbhAXEfz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 23 Jan 2021 23:35:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:41276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726223AbhAXEfy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Jan 2021 23:35:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5375422C9F
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 04:35:13 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3FB1781F0C; Sun, 24 Jan 2021 04:35:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211325] New: usbhid.mousepoll kernel cmd option not working
Date:   Sun, 24 Jan 2021 04:35:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mathias.steiger@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211325-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=211325

            Bug ID: 211325
           Summary: usbhid.mousepoll kernel cmd option not working
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11-rc3
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mathias.steiger@gmail.com
        Regression: No

It doesn't matter what value I use, it is treated as if unset (i.e. "0").

I guess if I had a module to reload, it would probably set the correct value.
But the kernels on ARM hardware often have such drivers build in the kernel
directly.

I want to stress that this is important on ARM systems. With the normal polling
rate of 100Hz, Youtube may use up to 60% additional CPU in Firefox on a 2017 TV
box, making either 1080p videos stutter or throttle down to 144p all the time.
With a gaming mouse that defaults to 1000Hz, it may totally max out the CPU
even on 480p. On a TV box, people rather use low-accuracy mini-keyboard
trackpads than normal mice. Those can be set to 20Hz and as low as 10Hz without
any difference in usability. As a person might use both the remote
mini-keyboard from the couch to watch TV and also a normal set of
mouse/keyboard when sitting in front of the TV and using the TV box for office
applications or browsing, it would be best if mousepoll could be set per device
instead.

usbhid.mousepoll=50

> cat /sys/module/usbhid/parameters/mousepoll
50

> ./evhz
HID 0e8f:2517 Mouse: Latest    62Hz, Average    91Hz
HID 0e8f:2517 Mouse: Latest   125Hz, Average    91Hz
HID 0e8f:2517 Mouse: Latest    62Hz, Average    91Hz
HID 0e8f:2517 Mouse: Latest   125Hz, Average    91Hz
...
Razer Razer DeathAdder: Latest  1000Hz, Average   921Hz
Razer Razer DeathAdder: Latest  1000Hz, Average   921Hz
Razer Razer DeathAdder: Latest  1000Hz, Average   921Hz
Razer Razer DeathAdder: Latest  1000Hz, Average   921Hz

It is working on my 5.10.9-arch1-1 x86 PC with module reload, unplugging and
plugging the cable back in.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
