Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CF2259580
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 17:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIAPwW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 1 Sep 2020 11:52:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728674AbgIAPrv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 11:47:51 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Tue, 01 Sep 2020 15:47:50 +0000
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
Message-ID: <bug-209089-208809-gBTIndJGBV@https.bugzilla.kernel.org/>
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

--- Comment #8 from Manish Jain (bourne.identity@hotmail.com) ---
Hi Allan,

Thanks for tuning in.

The following has happened to me a couple of times, and the only way a third
occurrence could be avoided is if USB mass storage devices nodes use a
different nomenclature series vis-a-vis SATA disks.

Here is the incident:

I installed Linux using a memstick (USB pen drive), which got enumerated as sda
while my internal hard disk got enumerated as sdb. When installation finished,
my system was ready for reboot - except that I was not aware that my hard disk
will next time appear as sda, not sdb as was the case during installation. So
my fstab was all a mess, and it took me hours to figure out why my Linux was
failing to boot. The only way I could correct the situation was to boot into
FreeBSD and set up my Linux fstab correctly.

Now as for your assertion "many USB drives actually are SATA drives attached
via a USB-SATA adapter". It could not be more true. I have an internal SATA SSD
myself that I occasionally attach to my system as an external USB device using
a USB-SATA adapter. The right thing for Linux to do is allocate the device node
for the SSD depending on the interface via which it was plugged in. Meaning, if
it was plugged in as an internal SATA disk, it will acquire the moniker sd*.
But if it is plugged in via the USB interface, it should get the moniker ud*
(or anything different from sd*).

I hope I have made my case clearly enough.

Thank you,
Manish Jain

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
