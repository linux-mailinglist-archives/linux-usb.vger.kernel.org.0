Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD221C222A
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2020 03:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgEBBwa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 May 2020 21:52:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgEBBwa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 May 2020 21:52:30 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] [BISECTED] Sony Vaio laptop built-in ricoh webcam no
 longer found on Fedora 31 with 5.4.11 kernel
Date:   Sat, 02 May 2020 01:52:29 +0000
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
Message-ID: <bug-207219-208809-pzAN8JHueI@https.bugzilla.kernel.org/>
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

--- Comment #20 from Alan Stern (stern@rowland.harvard.edu) ---
That got it.  It's kind of interesting to compare this usbmon trace with the
earlier one you made under a "good" kernel.  Here's where the difference first
shows up.  The first lines show the system asking the device for the first nine
bytes of its configuration descriptor, and the second lines show the device's
reply (the last nine hex bytes on the line).

Good trace:

ffff895e0a2063c0 123165855 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
ffff895e0a2063c0 123166213 C Ci:1:007:0 0 9 = 09026502 02010080 64

Bad trace:

ffffa0e9e4fdb680 145518314 S Ci:3:004:0 s 80 06 0200 0000 0009 9 <
ffffa0e9e4fdb680 145518517 C Ci:3:004:0 0 9 = 09027602 78f7e4ff 02

As you can see, the replies are very different.  The third and fourth bytes are
supposed to contain the descriptor's full length (16-bit little endian); the
values are 0x0265 vs. 0x0276, or 613 vs. 630 in decimal.  This explains the
difference in the next request, where the system asks the device to send the
entire configuration descriptor.  The good trace asks for 613 bytes and the bad
trace asks for 630.

Good trace:

ffff895e0a2063c0 123166260 S Ci:1:007:0 s 80 06 0200 0000 0265 613 <
ffff895e0a2063c0 123170157 C Ci:1:007:0 0 613 = 09026502 02010080 64080b00
020e0300 04090400 00010e01 00040d24 0100014d

Bad trace:

ffffa0e9e4fdb680 145518526 S Ci:3:004:0 s 80 06 0200 0000 0276 630 <
ffffa0e9e4fdb680 145522024 C Ci:3:004:0 0 630 = 09027602 78f7e4ff 029e5f02
4675e490 b197f0a3 f07b017a b0790012 28ef7404

Comparing the responses (which only contain the first 32 bytes of each reply)
shows that they are almost completely different.  It looks like the device is
sending random data in the bad trace!

As we suspected, there's nothing really wrong with the "bad" kernel.  The
difference is that it initializes the device using the old scheme instead of
the new scheme.  And the initialization works, sort of, but the device goes
crazy and starts sending garbage data.  Later on in the bad trace, the device
stops responding entirely.

Clearly the webcam is buggy.  But since it does work well enough when
initialized with the old scheme, it looks like the patch that was just accepted
is the right thing to do.

The kernel log even shows why the Foxconn device ends up being number 5 instead
of number 3.  Originally it is number 3, but then it disconnects from the USB
bus (evidently as the result of a firmware upload and a restart) and
reconnects.  The system assigns it the next device number (5) at that point.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
