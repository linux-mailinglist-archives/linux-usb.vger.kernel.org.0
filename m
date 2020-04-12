Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9524D1A5E37
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2020 13:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgDLLT6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 12 Apr 2020 07:19:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:57384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgDLLT5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 12 Apr 2020 07:19:57 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207209] New: Lenovo T490s + UltraDock - USB3 failed to recover
 after ultradock powerloss
Date:   Sun, 12 Apr 2020 11:19:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alxchk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207209-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207209

            Bug ID: 207209
           Summary: Lenovo T490s + UltraDock - USB3 failed to recover
                    after ultradock powerloss
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.3
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: alxchk@gmail.com
        Regression: No

Created attachment 288379
  --> https://bugzilla.kernel.org/attachment.cgi?id=288379&action=edit
PCI after powerloss

For some reason all storage devices are not restored after dock powerloss.

After power failure the only error message about usb:

[89016.137073] usb usb4-port1: Cannot enable. Maybe the USB cable is bad?

If i try to remove PCI (echo 1 >remove), then rescan:

[89470.782104] xhci_hcd 0000:3a:00.0: xHCI Host Controller
[89470.782108] xhci_hcd 0000:3a:00.0: new USB bus registered, assigned bus
number 3
[89480.783054] xhci_hcd 0000:3a:00.0: can't setup: -110
[89480.783058] xhci_hcd 0000:3a:00.0: USB bus 3 deregistered
[89480.783155] xhci_hcd 0000:3a:00.0: init 0000:3a:00.0 fail, -110
[89480.783167] xhci_hcd: probe of 0000:3a:00.0 failed with error -110


USB/PCI device tree are in attachments.

bad-* -- after powerloss
good-* -- after reboot

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
