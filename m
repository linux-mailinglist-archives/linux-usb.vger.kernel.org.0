Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B8928762F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Oct 2020 16:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgJHOf5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 8 Oct 2020 10:35:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730618AbgJHOf5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Oct 2020 10:35:57 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209137] USB is not working since update from 5.0 to 5.3.0-26.
 And with 5.4 still not working.
Date:   Thu, 08 Oct 2020 14:35:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209137-208809-50R6LR7DlY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209137-208809@https.bugzilla.kernel.org/>
References: <bug-209137-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209137

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
Did you run lsusb as root?  I ask because the report descriptors are missing
from the output, and this is typically what happens when lsusb is run as a
normal user, not root.

Also, the dmesg logs indicate that you weren't running the -stable kernel
versions.  It's possible that this problem has already been fixed in those
versions.  For the same reason, you might try running a 5.8 kernel.

If none of those work, you can always try running git-bisect to find the
particular commit which caused the problem to appear somewhere between 5.0 and
5.4.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
