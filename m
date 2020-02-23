Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D22169A6D
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 23:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgBWWOj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 23 Feb 2020 17:14:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:58262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgBWWOi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Feb 2020 17:14:38 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206649] New: Lenovo C940 - USB3 disk not detected if connected
 after boot
Date:   Sun, 23 Feb 2020 22:14:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: email-ext@laposte.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206649-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206649

            Bug ID: 206649
           Summary: Lenovo C940 - USB3 disk not detected if connected
                    after boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6-rc2
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: email-ext@laposte.net
        Regression: No

Created attachment 287561
  --> https://bugzilla.kernel.org/attachment.cgi?id=287561&action=edit
Dmesg after unplugging the SSD.

Hello,

I have a Lenovo C940 under Manjaro with kernel 5.6-rc2. I am using a Samsung T5
SSD USB3.1 Gen2 disk with usb C connector. If I connect the disk before
booting, it will work correctly. However If I either unplug/replug it once the
os booted or if I plug it after the boot then the disk won't be detected.

I joined my dmesg and journalctl logs, but I did not see much information from
the logs... However, by using a thunderbolt3 dock and connecting the disk to
the USB A ports, I had no problem when connecting/disconnecting the drive
several times. However, as soon as I was using the usb C ports, mapped to
thunderbolt3, directly from the laptop or with the dock, same problems
described above occurred.

This problem may be linked to this ticket:
https://bugzilla.kernel.org/show_bug.cgi?id=206459

I am enjoying a similar problem with my Thunderbolt 3 dock (OWC Thunderbolt3
dock) when not connecting it before the boot. It even leads to os crash, but I
will fill another bug report for this particular issue.

I can provide more log if required, please feel free to give me any other
commands/idea to debug this.

Thanks,

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
