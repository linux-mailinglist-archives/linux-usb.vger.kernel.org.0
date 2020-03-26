Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DEA193641
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 04:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgCZDFg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 25 Mar 2020 23:05:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZDFf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Mar 2020 23:05:35 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206901] Valve Index HMD breaks the USB controller it's
 connected into
Date:   Thu, 26 Mar 2020 03:05:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: carlo@alinoe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206901-208809-03458VwXks@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206901-208809@https.bugzilla.kernel.org/>
References: <bug-206901-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206901

Carlo Wood (carlo@alinoe.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |carlo@alinoe.com

--- Comment #1 from Carlo Wood (carlo@alinoe.com) ---
I have the same problem.

The Valve Index HMD uses the xhci_hmd driver for a USB 3 connection.
The culprit shows usually in dmesg as:

[77865.729313] xhci_hcd 0000:08:00.0: xHCI host not responding to stop endpoint
command.
[77865.729989] xhci_hcd 0000:08:00.0: xHCI host controller not responding,
assume dead
[77865.729995] xhci_hcd 0000:08:00.0: HC died; cleaning up

After which obviously no new connections can be made anymore.

I compiled vanilla 5.6.0-rc7 with

>grep XHCI .config
CONFIG_USB_XHCI_HCD=m
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PCI=m
# CONFIG_USB_XHCI_PLATFORM is not set

reloading the xhci_pci module restores the controller.

If someone has patches to try out then I can apply them
and test it out.

If any other info is needed please ask!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
