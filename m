Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75C72E7E5F
	for <lists+linux-usb@lfdr.de>; Thu, 31 Dec 2020 07:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgLaGGU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 31 Dec 2020 01:06:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:40284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgLaGGU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Dec 2020 01:06:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F4F022227
        for <linux-usb@vger.kernel.org>; Thu, 31 Dec 2020 06:05:40 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0E1BE81F1E; Thu, 31 Dec 2020 06:05:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209407] skb_over_panic in cdc_mbim_tx_fixup
Date:   Thu, 31 Dec 2020 06:05:39 +0000
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
Message-ID: <bug-209407-208809-ZFelR26NO6@https.bugzilla.kernel.org/>
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
     Kernel Version|5.8.12                      |5.9.13

--- Comment #1 from Jouni Seppänen (jks@iki.fi) ---
Still occurs in 5.9.13. The BUG log message is different but the call trace
still shows cdc_ncm_fill_tx_frame.

[163049.133074] BUG: unable to handle page fault for address: ffff8d3e47000000
[163049.140062] #PF: supervisor write access in kernel mode
[163049.145385] #PF: error_code(0x0003) - permissions violation
[163049.151052] PGD afa01067 P4D afa01067 PUD 12efff067 PMD 11a27f063 PTE
80000000c7000161
[163049.159073] Oops: 0003 [#1] SMP NOPTI
[163049.162839] CPU: 2 PID: 0 Comm: swapper/2 Kdump: loaded Tainted: G         
  E     5.9.13 #1
[163049.171454] Hardware name: PC Engines apu3/apu3, BIOS v4.12.0.2 06/28/2020
[163049.178437] RIP: 0010:__memset+0x24/0x30
    ------8<------
[163049.263988] Call Trace:
[163049.266552]  <IRQ>
[163049.268682]  cdc_ncm_fill_tx_frame+0x83a/0x970 [cdc_ncm]
[163049.274124]  cdc_mbim_tx_fixup+0x1d9/0x240 [cdc_mbim]
[163049.279301]  usbnet_start_xmit+0x5d/0x720 [usbnet]

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
