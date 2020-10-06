Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AD928543A
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 23:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgJFV7w convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 6 Oct 2020 17:59:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbgJFV7w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Oct 2020 17:59:52 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] New: dwc2 driver stops working after sudden disconnect
Date:   Tue, 06 Oct 2020 21:59:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz@grobelny.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209555

            Bug ID: 209555
           Summary: dwc2 driver stops working after sudden disconnect
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.0-rc6
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: tomasz@grobelny.net
        Regression: No

Created attachment 292875
  --> https://bugzilla.kernel.org/attachment.cgi?id=292875&action=edit
dmesg

Setup:
# uname -a
Linux odroid 5.9.0-rc6-dirty #1 SMP PREEMPT Tue Oct 6 20:04:44 UTC 2020 aarch64
aarch64 aarch64 GNU/Linux

dwc2 driver working in gadget mode on Odroid N2 using function fs
kernel: branch next from
git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git

Scenario:
Odroid connects as custom gadget (with mass storage function, see second 114
and 134), then is switched to Android Open Accessory mode and start
transmission using function fs (uses ep0,ep1,ep2 channels). Suddenly the USB
cable is pulled out (roughly second 122).

Running the same sequence of actions (second 134) does not work any more until
reboot. In dmesg one can see timeouts. Also, before enabling debug output I
could see "HANG! Soft Reset timeout GRSTCTL_CSFTRST_DONE" line in dmesg output
(drivers/usb/dwc2/core.c:538)

Therefore my conclusion is that there is something wrong with handling device
disconnect.

Due to number of produced debug messages dmesg output might be incomplete.
Please let me know if I can somehow help to fix this bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
