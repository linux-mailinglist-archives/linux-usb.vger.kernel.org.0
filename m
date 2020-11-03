Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273802A3F14
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 09:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgKCIj4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 3 Nov 2020 03:39:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:45080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725982AbgKCIjz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 03:39:55 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210015] New: page allocation failure in usb_hub_wq hub_event
 when adding HID device
Date:   Tue, 03 Nov 2020 08:39:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jadahl@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210015-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210015

            Bug ID: 210015
           Summary: page allocation failure in usb_hub_wq hub_event when
                    adding HID device
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.16-300.fc33.x86_64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jadahl@gmail.com
        Regression: No

Created attachment 293411
  --> https://bugzilla.kernel.org/attachment.cgi?id=293411&action=edit
journal -k during the error

When docking my laptop (Lenovo T470s, to a traditional docking station),
running 5.8.16-300.fc33.x86_64, sometimes (every other time or so), the kernel
runs into a page allocation failure when adding one of the HID device
associated with the USB keyboard attached to the docking station.

When this does *not* happen, three evdev devices appear for the keyboard:

/dev/input/event11:     TypeMatrix.com USB Keyboard
/dev/input/event12:     TypeMatrix.com USB Keyboard System Control
/dev/input/event13:     TypeMatrix.com USB Keyboard Consumer Control

The third device emits events such as Volume Up, Volume Down etc. The first
emits events such as regular A-Z keys.

Available HID devices are 

/dev/hidraw3:   TypeMatrix.com USB Keyboard
/dev/hidraw4:   TypeMatrix.com USB Keyboard

The first emits A-Z keys etc, while the second emits Volume up/down etc.

When the page allocation failure happens, the raw HID devices remain the same
and functioning, but the only evdev devices that appear are event11 and
event12, missing event13, thus missing Volume up/down events.

Replugging the keyboard enough times will make it work correctly again, most of
the times.

I'm attaching a journal -k for when it happens, containing the backtrace to the
page allocation failure.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
