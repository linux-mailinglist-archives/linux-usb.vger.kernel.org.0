Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA3C1569C8
	for <lists+linux-usb@lfdr.de>; Sun,  9 Feb 2020 10:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgBIJSS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 9 Feb 2020 04:18:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:52938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbgBIJSS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Feb 2020 04:18:18 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206471] New: Connecting Yi 4K+ to Tthinkpad T495, "usb
 usb2-port3: Cannot enable. Maybe the USB cable is bad?"
Date:   Sun, 09 Feb 2020 09:18:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lucas.vacek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206471-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206471

            Bug ID: 206471
           Summary: Connecting Yi 4K+ to Tthinkpad T495, "usb usb2-port3:
                    Cannot enable. Maybe the USB cable is bad?"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.18-050418-lowlatency #202002051737 SMP PREEMPT Wed
                    Feb 5 22:52:51 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: lucas.vacek@gmail.com
        Regression: No

Created attachment 287255
  --> https://bugzilla.kernel.org/attachment.cgi?id=287255&action=edit
Output of cat /sys/kernel/debug/usb/usbmon/2u

I can reproduce the same problem on 5.5.2 and 5.4.3 as well.

When connecting Yi 4K+ camera to USB port on Thinkpad T495 I get following
error:

[ 6376.553655] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6377.441641] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6377.441714] usb usb2-port3: attempt power cycle
[ 6378.641657] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6379.529678] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6379.529752] usb usb2-port3: unable to enumerate USB device
[ 6408.857408] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6409.745778] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6409.745843] usb usb2-port3: attempt power cycle
[ 6410.945496] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6411.833866] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6411.833940] usb usb2-port3: unable to enumerate USB device
[ 6598.002122] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6598.890212] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6598.890275] usb usb2-port3: attempt power cycle
[ 6600.090213] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6600.978772] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[ 6600.978825] usb usb2-port3: unable to enumerate USB device

There is no problem when connecting other devices to the USB ports, there is no
problem when I connect the camera to USB ports on dock station. If I try to
connect the camera to the laptop via USB-C nothing happens.

The camera works fine when connected to other PCs too (Thinkpad T420 running
Ubuntu 14.04 and another PC with Windows 7). 

I am attaching output of `cat /sys/kernel/debug/usb/usbmon/2u` when connecting
the camera ot the USB port (file "usbmon_fail").

Hope this helps, I'm happy to provide further assistance in debugging.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
