Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AAF1F8F7E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 09:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgFOHZw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 15 Jun 2020 03:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:39934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbgFOHZt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 03:25:49 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208177] New: Lenovo ThinkPad P52 USB connectivity issues
Date:   Mon, 15 Jun 2020 07:25:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208177-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208177

            Bug ID: 208177
           Summary: Lenovo ThinkPad P52 USB connectivity issues
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.18
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nvaert1986@hotmail.com
        Regression: No

I've been receiving the error below when booting my Lenovo ThinkPad P52 laptop
ever since kernel 5.4.x. This issue has occurred throughout recent kernels
including 5.6.18. This issue occurs when my laptop is just connected to my
charger and not to my docking station. When my laptop is attached to my docking
station this error does not occur.

I also have the issue that my docking station only works when performing a cold
boot. When I perform a reboot my thunderbolt docking station does not get
detected anymore (I can't even use my keyboard in grub, but I'm not sure
whether this is related. I assume it's not as this is even before hardware
detection), but doesn't work in Linux either when it finishes booting. It's
just not detected. The weird part is that PCI-E passthrough works (as I do get
external display output), but none of the USB peripherals on the docking
station (NIC, Audio etc.) get detected. A cold boot always solves the issue.

[   64.477620] pcieport 0000:05:04.0: can't change power state from D3cold to
D0 (config space inaccessible)
[   64.478622] pcieport 0000:05:02.0: can't change power state from D3cold to
D0 (config space inaccessible)
[   64.478632] xhci_hcd 0000:3b:00.0: can't change power state from D3cold to
D0 (config space inaccessible)
[   64.478637] xhci_hcd 0000:3b:00.0: can't change power state from D3hot to D0
(config space inaccessible)
[   64.478663] xhci_hcd 0000:3b:00.0: Controller not ready at resume -19
[   64.478665] xhci_hcd 0000:3b:00.0: PCI post-resume error -19!
[   64.478666] xhci_hcd 0000:3b:00.0: HC died; cleaning up
[   64.478676] xhci_hcd 0000:3b:00.0: remove, state 4
[   64.478679] usb usb4: USB disconnect, device number 1
[   64.478852] xhci_hcd 0000:3b:00.0: USB bus 4 deregistered
[   64.478944] xhci_hcd 0000:3b:00.0: remove, state 4
[   64.478946] usb usb3: USB disconnect, device number 1
[   64.479126] xhci_hcd 0000:3b:00.0: Host halt failed, -19
[   64.479128] xhci_hcd 0000:3b:00.0: Host not accessible, reset failed.
[   64.479251] xhci_hcd 0000:3b:00.0: USB bus 3 deregistered
[   64.479717] pcieport 0000:05:01.0: can't change power state from D3cold to
D0 (config space inaccessible)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
