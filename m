Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF52EF999
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 21:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbhAHUxC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 8 Jan 2021 15:53:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:50134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728222AbhAHUxB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 15:53:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 31FBA23A7F
        for <linux-usb@vger.kernel.org>; Fri,  8 Jan 2021 20:52:21 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1F6E28162A; Fri,  8 Jan 2021 20:52:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211095] New: Linux accidentally hangs at EHCI HCD
 initialization at VirtualBox
Date:   Fri, 08 Jan 2021 20:52:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ekorenevsky@astralinux.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211095-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=211095

            Bug ID: 211095
           Summary: Linux accidentally hangs at EHCI HCD initialization at
                    VirtualBox
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ekorenevsky@astralinux.ru
        Regression: No

Created attachment 294575
  --> https://bugzilla.kernel.org/attachment.cgi?id=294575&action=edit
dmesg of hung EHCI HCD initialization

VirtualBox 6.1.8 r137981
Guest: Xubuntu 20.04, kernel 5.4.0-33-generic

Steps to reproduce: try to boot several times. The guest hangs at least in 10%
cases.


Last dmesg messages:


[    0.000000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.000000] ehci-pci: EHCI PCI platform driver
[    0.000000] ehci-pci 0000:00:0b.0: EHCI Host Controller
[    0.000000] ehci-pci 0000:00:0b.0: new USB bus registered, assigned bus
number 1
[    0.000000] ehci-pci 0000:00:0b.0: irq 19, io mem 0xf1840000

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
