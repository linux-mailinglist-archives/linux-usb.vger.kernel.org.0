Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0AF20227C
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jun 2020 09:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgFTH5x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 20 Jun 2020 03:57:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:43996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgFTH5x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 20 Jun 2020 03:57:53 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208257] New: Kingston USB flash drive repeatedly disconnected
 after "Set SEL for device-initiated U2 failed."
Date:   Sat, 20 Jun 2020 07:57:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julroy67@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208257-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208257

            Bug ID: 208257
           Summary: Kingston USB flash drive repeatedly disconnected after
                    "Set SEL for device-initiated U2 failed."
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: julroy67@gmail.com
        Regression: No

Created attachment 289755
  --> https://bugzilla.kernel.org/attachment.cgi?id=289755&action=edit
Fedora kernel 5.7.4 dmesg log

Hello, I have a Kingston 32GB USB flash drive failing to get mounted. Dmesg
show that the flash drive gets repeatedly disconnected after "Set SEL for
device-initiated U2 failed."

I'm able to reproduce the problem on the following laptops:
* Dell XPS 7390 (connected through official Dell USB-C to USB-A adapter)
* Sony Vaio SVP132A1CM (no adapter, directly connected)

The USB drives works on the following devices:
* Multiple office desktop computer, all running Windows
* Nvidia Shield TV 2015 edition (4.9.140 kernel)

Please let me know if I can do something to help out or if some additional
information is needed.

Note:
I first reported the bug as #1801627 on Fedora's Bugzilla:
https://bugzilla.redhat.com/show_bug.cgi?id=1801627

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
