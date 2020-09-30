Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3594027EC1F
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 17:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730236AbgI3PP1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 30 Sep 2020 11:15:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:39144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728031AbgI3PPO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Sep 2020 11:15:14 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Wed, 30 Sep 2020 15:15:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rachithas104@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209411-208809-QiOCtjqz4p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209411-208809@https.bugzilla.kernel.org/>
References: <bug-209411-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209411

--- Comment #15 from rachithas104@gmail.com ---
(In reply to Alan Stern from comment #14)
> You can get the descriptor values by running "lsusb -v".
> 
> If the phone fails when you reset it, you should change your program.  Don't
> issue the reset command!
> 
> Why did you open this bug report in the first place?

Since the device with 4.14 kernel works and 4.19 fails,I opened whether there
is any protocol change ,so that I can change my program accrordingly,I am
seeing this in syslog when issued reset command
kernel: [85237.846504] usb 1-1.2: reset high-speed USB device number 19 using
ehci-pci
 kernel: [85238.146480] usb 1-1.2: device descriptor read/64, error -71
 kernel: [85238.558551] usb 1-1.2: reset high-speed USB device number 19 using
ehci-pci
kernel: [85239.062496] usb 1-1.2: device not accepting address 19, error -71
kernel: [85239.350498] usb 1-1.2: reset high-speed USB device number 19 using
ehci-pci
 kernel: [85240.544425] usb 1-1.2: usbfs: USBDEVFS_CONTROL failed cmd ctxusb
rqt 128 rq 6 len 255 ret -71
0 kernel: [85240.838479] usb 1-1.2: reset high-speed USB device number 19 using
ehci-pci

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
