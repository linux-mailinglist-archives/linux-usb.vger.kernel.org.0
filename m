Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9D1164E49
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 20:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgBSTCS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 19 Feb 2020 14:02:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgBSTCS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 14:02:18 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206603] New: Regression: Thunderbolt 3 Dock USB not working
 when connecting it for the second time
Date:   Wed, 19 Feb 2020 19:02:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: D-12twm7qq8vgi7o@maildrop.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206603-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206603

            Bug ID: 206603
           Summary: Regression: Thunderbolt 3 Dock USB not working when
                    connecting it for the second time
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.12
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: D-12twm7qq8vgi7o@maildrop.cc
        Regression: No

Created attachment 287515
  --> https://bugzilla.kernel.org/attachment.cgi?id=287515&action=edit
kernel-5.4.10-200.fc31.x86_64.log

I did submit this bug to the Fedora bug tracker in January. Since the latest
update this is now happening on Ubuntu too, which is why I'm now submitting
this to the Kernel bug tracker.

Bug at Red Hat Bugzilla for reference:
https://bugzilla.redhat.com/show_bug.cgi?id=1790889

---

I'm using this Thunderbolt 3 Dock together together with my ThinkPad T480s:

https://i-tec.cz/de/produkt/tb3hdmidock-3/ (P/N TB3HDMIDOCK)
https://web.archive.org/web/20180929103728/https://i-tec.cz/de/produkt/tb3hdmidock-3/

It contains HDMI and USB outputs.

When connecting the Dock for the second time after boot (boot, plug, unplug,
and plug again), USB devices connected to
the Dock are not working (at least I've tried keyboard, mouse and mass storage
devices).
The HDMI output continues to work.

This did work before using the following kernel versions:

- 5.4.7-200.fc31 (Fedora)
- 5.3.0-29-generic (Ubuntu)

When upgrading the Kernel, it breaks:

- 5.4.7-200.fc31 (Fedora)
- 5.3.0-40-generic (Ubuntu)

Both Fedora and Ubuntu keep old Kernel versions for a while. I can still boot
one of the older kernels and then the bug is not happening.

Steps to reproduce:

1. Boot Notebook
2. Connect Dock
(HDMI and USB devices connected to the Dock are now working.)
3. Disconnect Dock
4. Connect Dock again
(HDMI device connected to the Dock is now working again, USB devices connected
to the Dock are not working until reboot.)

This is from the kernel log:

> Jan 14 08:04:48 kernel: Registered IR keymap rc-cec
> Jan 14 08:04:48 kernel: rc rc0: DP-1 as
> /devices/pci0000:00/0000:00:02.0/rc/rc0
> Jan 14 08:04:48 kernel: input: DP-1 as
> /devices/pci0000:00/0000:00:02.0/rc/rc0/input38
> Jan 14 08:04:48 kernel: typec_displayport port1-partner.0: failed to enter
> mode
> Jan 14 08:04:48 kernel: thunderbolt 0-1: new device found, vendor=0x16b
> device=0x9003
> Jan 14 08:04:48 kernel: thunderbolt 0-1: ComDis TB3HDMIDOCK

Full log is attached.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
