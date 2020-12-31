Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B300D2E7FDA
	for <lists+linux-usb@lfdr.de>; Thu, 31 Dec 2020 13:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgLaMUq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 31 Dec 2020 07:20:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:33014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgLaMUq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Dec 2020 07:20:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2C1A2223DB
        for <linux-usb@vger.kernel.org>; Thu, 31 Dec 2020 12:20:05 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 171D881F1E; Thu, 31 Dec 2020 12:20:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] skb_over_panic in cdc_mbim_tx_fixup
Date:   Thu, 31 Dec 2020 12:20:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jks@iki.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-209407-208809-Z8OZwU99Vm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209407-208809@https.bugzilla.kernel.org/>
References: <bug-209407-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209407

Jouni Seppänen (jks@iki.fi) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.9.13                      |5.10.4

--- Comment #3 from Jouni Seppänen (jks@iki.fi) ---
Occurs in 5.10.4 too. Unfortunately the kdump tools on my system are failing to
write the dmesg dump for this kernel version, but I got some log messages via a 
serial console.

[  649.351619] BUG: unable to handle page fault for address: ffff8c3302243000
[  649.358522] #PF: supervisor write access in kernel mode
[  649.363766] #PF: error_code(0x0003) - permissions violation
[  649.369346] PGD 12e801067 P4D 12e801067 PUD 12e805067 PMD 10224c063 PTE
8000000102243161
[  649.377465] Oops: 0003 [#1] SMP NOPTI
[  649.381150] CPU: 2 PID: 0 Comm: swapper/2 Kdump: loaded Not tainted 5.10.4
#1
[  649.388292] Hardware name: PC Engines apu3/apu3, BIOS v4.12.0.2 06/28/2020
[  649.395188] RIP: 0010:__memset+0x24/0x30
   --- 8< ---
[  649.460541] kernel BUG at lib/list_debug.c:53!
[  649.468906] list_del corruption. prev->next should be ffff9c260153beb8, but
was 0000000000000000
[  649.468938] ------------[ cut here ]------------
[  649.468943] kernel BUG at lib/list_debug.c:53!
[  649.515815] Call Trace:
[  649.518294]  <IRQ>
[  649.520353]  cdc_ncm_fill_tx_frame+0x821/0x950 [cdc_ncm]
[  649.525722]  cdc_mbim_tx_fixup+0x1fb/0x260 [cdc_mbim]
[  649.530822]  usbnet_start_xmit+0x71/0x740 [usbnet]

The failing kdump-tools output is

[   53.583779] kdump-tools[844]: The kernel version is not supported.
[   53.601995] kdump-tools[844]: The makedumpfile operation may be incomplete.
[   53.610833] kdump-tools[844]: The dumpfile is saved to
/var/crash/202012311403/dump-incomplete.
[   53.629930] kdump-tools[844]: makedumpfile Completed.
[   53.651012] kdump-tools[844]: kdump-tools: saved vmcore in
/var/crash/202012311403.
[   57.611244] kdump-tools[844]: running makedumpfile --dump-dmesg /proc/vmcore
/var/crash/202012311403/dmesg.202012311403.
[   57.630883] kdump-tools[844]: dump_dmesg: Can't find some symbols for
log_buf.
[   57.649968] kdump-tools[844]: The kernel version is not supported.
[   57.665919] kdump-tools[844]: The makedumpfile operation may be incomplete.
[   57.681790] kdump-tools[844]: makedumpfile Failed.
[   57.704245] kdump-tools[844]: kdump-tools: makedumpfile --dump-dmesg failed.
dmesg content will be unavailable ... failed!
[   57.727124] kdump-tools[844]: kdump-tools: failed to save dmesg content in
/var/crash/202012311403 ... failed!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
