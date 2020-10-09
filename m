Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07023288564
	for <lists+linux-usb@lfdr.de>; Fri,  9 Oct 2020 10:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730726AbgJIIhz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 9 Oct 2020 04:37:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgJIIhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Oct 2020 04:37:54 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209137] USB is not working since update from 5.0 to 5.3.0-26.
 And with 5.4 still not working.
Date:   Fri, 09 Oct 2020 08:37:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: benjamin.tissoires@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-209137-208809-6j9o00OvkK@https.bugzilla.kernel.org/>
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

Benjamin Tissoires (benjamin.tissoires@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |benjamin.tissoires@gmail.co
                   |                            |m

--- Comment #13 from Benjamin Tissoires (benjamin.tissoires@gmail.com) ---
Created attachment 292905
  --> https://bugzilla.kernel.org/attachment.cgi?id=292905&action=edit
report descriptor of a working C52B receiver

Regarding the `lsub -v` not working, could you:
- boot on the working kernel
- use hid-recorder (as root) from
https://gitlab.freedesktop.org/libevdev/hid-tools/ to record all the "Logitech
USB Receiver" that shows up in the list

For a point of comparison, I attached the report descriptors of the working
C52B I have here (only the wireless interface).

If there is no differences between your dumps and mine, then there is something
wrong happening in the usbhid driver or lower, and we will need more logs at
that point.

FTR, this Logitech receiver I have here works fine with 5.8.4 on Fedora 32...

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
