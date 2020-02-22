Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B348C168F13
	for <lists+linux-usb@lfdr.de>; Sat, 22 Feb 2020 14:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgBVNVN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 22 Feb 2020 08:21:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:48000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVNVN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 Feb 2020 08:21:13 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206639] New: snd-usb-audio Thinkpad10 gen2 TabletDock analog
 audio device quirky
Date:   Sat, 22 Feb 2020 13:21:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thieson08@me.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206639-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206639

            Bug ID: 206639
           Summary: snd-usb-audio Thinkpad10 gen2 TabletDock analog audio
                    device quirky
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.20
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: thieson08@me.com
        Regression: No

Created attachment 287555
  --> https://bugzilla.kernel.org/attachment.cgi?id=287555&action=edit
dmesg

Inside the Thinkpad 10 gen2 Tabletdock there is an analog audio device which is
connected via usb. The ID of this device is 17ef:3053. When first listening to
this device, the audio was noisy and the audio quality was not that well. I am
using fedora 31 stable.

Inside the dmesg I found the following line:
[   31.659316] usb 1-4.4: 2:1: cannot get freq at ep 0x1

I have found the following suggestion online to this error:
https://www.raspberrypi.org/forums/viewtopic.php?p=1442317#p1442317

I have added the following command to /etc/default/grub at GRUB_CMDLINE_LINUX
and created a new grub.cfg:
snd-usb-audio.quirk_alias=17ef3053:047f02f7

After reboot, the audio quality was fine.
Nevertheless I have noticed that the volume control is still not fine.
The volume is really quiet until about % of the scale and over this, the volume
jumps up.

I am attaching the dmesg and hwinfo output as txt.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
