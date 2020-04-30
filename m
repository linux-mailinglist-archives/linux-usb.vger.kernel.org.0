Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D95B1C030E
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 18:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgD3QtS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 30 Apr 2020 12:49:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgD3QtS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 12:49:18 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Thu, 30 Apr 2020 16:49:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207219-208809-bF35fzPTJj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207219-208809@https.bugzilla.kernel.org/>
References: <bug-207219-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207219

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
There's something wrong with what you did, but I can't tell what.  To start
with, before ehci-pci.ko was loaded there should have been no usbmon/3u or
usbmon/4u files, so your cat commands should have failed.  Those filenames
correspond directly to the USB bus numbers, and your lsusb output shows only
buses 1 and 2.

For another, the device numbering is off.  On bus 3, device 1 is the root hub
and device 2 is the integrated hub -- fine.  But then the Foxconn and Ricoh
devices should have been numbers 3 and 4, not 6 and 7.  Clearly something
happened before you started your monitoring.

Also, your usbmon3 trace shows the webcam working after it was initialized
using the old scheme!  It's pretty hard to tell what that means, though,
especially since the actions shown in the trace probably weren't the first time
the webcam had been initialized since the last cold reboot.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
