Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182472C225D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 11:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731773AbgKXJ6x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 24 Nov 2020 04:58:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:46220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731771AbgKXJ6w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 04:58:52 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210345] New: xhci init fail
Date:   Tue, 24 Nov 2020 09:58:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernelorg@lelik.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210345-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210345

            Bug ID: 210345
           Summary: xhci init fail
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.0-53-generic #59-Ubuntu SMP
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kernelorg@lelik.org
        Regression: No

Created attachment 293801
  --> https://bugzilla.kernel.org/attachment.cgi?id=293801&action=edit
lsusb -v + dmesg

Last month I did one of the stupidiest things in my life - upgraded to Ububntu
20. With previous LTS version I almost forgot that things that I assumed as
given - like working USB, audio, filesystems that do not crash on every reboot
and dhcp assigned addresses are actually a privileges in Linux word...

Anyway, this is about USB 3.0 .

All latest kernels broke support for xhci controller and I've lost all USB3
ports. This is a bit annoying... Would be very nice if someone could fix this.
And, maybe, just maybe, in future, actually test the code before commits...

[    0.993540] xhci_hcd 0000:0b:00.0: xHCI Host Controller
[    0.993544] xhci_hcd 0000:0b:00.0: new USB bus registered, assigned bus
number 5
[    1.009565] xhci_hcd 0000:0b:00.0: Host halt failed, -110
[    1.009565] xhci_hcd 0000:0b:00.0: can't setup: -110
[    1.009568] xhci_hcd 0000:0b:00.0: USB bus 5 deregistered
[    1.009597] xhci_hcd 0000:0b:00.0: init 0000:0b:00.0 fail, -110
[    1.009602] xhci_hcd: probe of 0000:0b:00.0 failed with error -110

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
