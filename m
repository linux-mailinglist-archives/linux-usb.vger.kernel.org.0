Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E2219C69B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 17:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389623AbgDBP5v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 2 Apr 2020 11:57:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389547AbgDBP5u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 11:57:50 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207065] New: C-media USB audio device stops working from
 5.2.0-rc3 onwards
Date:   Thu, 02 Apr 2020 15:57:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florianmey@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207065-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207065

            Bug ID: 207065
           Summary: C-media USB audio device stops working from 5.2.0-rc3
                    onwards
           Product: Drivers
           Version: 2.5
    Kernel Version: >=5.2.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: florianmey@gmx.de
        Regression: No

Created attachment 288159
  --> https://bugzilla.kernel.org/attachment.cgi?id=288159&action=edit
Output of lsusb -v

Hi.
I have an external USB audio device (Bus 003 Device 005: ID 0d8c:000c C-Media
Electronics, Inc. Audio Adapter) / USB hub (Bus 003 Device 006: ID 058f:6254
Alcor Micro Corp. USB Hub). While the USB hub side of it is still working, the
audio device fails from kernel version 5.2.0-rc3 onwards. 
The error is this:
speaker-test -c2 -D hw:1,0

speaker-test 1.2.2

Playback device is hw:1,0
Stream parameters are 48000Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 96 to 262144
Period size range from 48 to 131072
Using max buffer size 262144
Periods = 4
Unable to set hw params for playback: Input/output error
Setting of hwparams failed: Input/output error

While dmesg shows: [ 1287.634587] usb 1-2.4: 1:1: usb_set_interface failed
(-110)

I bisected it and got to the following commit as the culprit:
# first bad commit: [ef513be0a9057cc6baf5d29566aaaefa214ba344] usb: xhci: Add
Clear_TT_Buffer
Last working one was:
good: [4998f1efd1904dd21697aeeead270e3eb97691dd] usb: Add devaddr in struct
usb_device

Current head gives me the same error messages as the ones above, so the bug is
still there.

I first added my report to a very similar bug
(https://bugzilla.kernel.org/show_bug.cgi?id=203419) but the kernel version at
which the problem started for me does not fit the original report there, which
is why I am opening this as a new report.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
