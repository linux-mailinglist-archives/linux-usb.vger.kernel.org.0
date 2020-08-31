Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AD6257528
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 10:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgHaITd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 31 Aug 2020 04:19:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgHaITc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 04:19:32 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208911] Renesas USB controller - FW has invalid version :8224
Date:   Mon, 31 Aug 2020 08:19:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chripell@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208911-208809-oXBCcxvUQ9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208911-208809@https.bugzilla.kernel.org/>
References: <bug-208911-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208911

Christian (chripell@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chripell@gmail.com

--- Comment #15 from Christian (chripell@gmail.com) ---
Hi, I understand from #9 that the check will be removed. To corroborate that
decision, here is another data point with a still different FW version:

[    1.318773] xhci_hcd 0000:02:00.0: FW has invalid version :8228
[    1.318795] xhci_hcd 0000:02:00.0: Direct firmware load for
renesas_usb_fw.mem failed with error -2
[    1.318796] xhci_hcd 0000:02:00.0: request_firmware failed: -2
[    1.318799] xhci_hcd: probe of 0000:02:00.0 failed with error -2

Thanks for promptly working on this bug!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
