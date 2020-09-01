Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5585259A56
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 18:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbgIAQsU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 1 Sep 2020 12:48:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:53280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728077AbgIAQsP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 12:48:15 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Tue, 01 Sep 2020 16:48:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bourne.identity@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209089-208809-8WJd5sUx5T@https.bugzilla.kernel.org/>
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

--- Comment #10 from Manish Jain (bourne.identity@hotmail.com) ---
Hi Allan,

Although I am pretty much resigned that the change I am requesting won't
happen, our discussion certainly keeps getting more interesting - particularly
if you are willing to accept the possibility that each of your statements in
the previous message was incorrect.

Here are your statements:

1) "Changing the monikers is only a partial solution.  For example, devices
that show up as uda and udb one day could very well show up as udb and uda the
next day." I have been using my computer for I don't remember how many years,
but it has never happened even once that I needed to simultaneously attach two
USB mass storage devices. In other words, you don't have to worry about udb -
there will usually only be a uda in the ud* series.

2) "Also, suppose your system's primary hard disk was attached by USB rather
than SATA.  Then the pen drive could have been labelled uda and the primary
drive labelled udb, and your fstab would still be messed up.  This is part of
the reason why people recommend using filesystem or GUID labels for fstab
entries rather than drive names and partition numbers." a) We should perhaps
restrict ourselves to the the real world where people want their primary hard
disk to never be attached by USB. The primary hard disk will always be attached
via SATA/NVME. The SSD that I attach to my system via USB is not my primary
hard disk and never will be - it is my backup device to which I perform my
daily rsync. b) I find using UUIDs to be a bad idea, perhaps even abhorrent. I
strongly prefer my fstab and grub configuration wired for device nodes, so that
when I need to fsck, I clearly remember which device nodes to fsck. There is
another use-case - folks might want a triple-boot computer with Windows 10 +
Linux + FreeBSD with Windows 10 somewhere outside the first primary disk. That,
as it happens, is only possible by disabling UUIDs in Linux's fstab/grub. I am
emailing to you my document on how to set up such a computer. Once you have
read the document, you will probably realize that such use cases might exist
where UUID usage was strongly undesirable.

3) "In short, changing the monikers isn't going to happen, and even if it did
happen it wouldn't fully fix your original problem." My bad luck if the
monikers cannot be changed. But the change WOULD fully fix my original problem,
I humbly assure you.

4) "However, there is a way to set up your system to use permanently fixed
drive names that you assign.  All you have to do is write and install an
appropriate udev script. Then you can make the drive names be anything you
want." This is a post-install procedure. The moniker fix will solve the problem
when it occurs at Linux installation time.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
