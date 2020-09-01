Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD8625971A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 18:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731441AbgIAQKp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 1 Sep 2020 12:10:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731340AbgIAQKn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 12:10:43 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Tue, 01 Sep 2020 16:10:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209089-208809-sAfX4t36jf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209089-208809@https.bugzilla.kernel.org/>
References: <bug-209089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209089

--- Comment #9 from Alan Stern (stern@rowland.harvard.edu) ---
(I bet you could have fixed the fstab contents by booting from the pen drive in
"rescue" mode, with no need to have FreeBSD installed.)

Changing the monikers is only a partial solution.  For example, devices that
show up as uda and udb one day could very well show up as udb and uda the next
day.

Also, suppose your system's primary hard disk was attached by USB rather than
SATA.  Then the pen drive could have been labelled uda and the primary drive
labelled udb, and your fstab would still be messed up.  This is part of the
reason why people recommend using filesystem or GUID labels for fstab entries
rather than drive names and partition numbers.

In short, changing the monikers isn't going to happen, and even if it did
happen it wouldn't fully fix your original problem.

However, there is a way to set up your system to use permanently fixed drive
names that you assign.  All you have to do is write and install an appropriate
udev script.  Then you can make the drive names be anything you want.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
