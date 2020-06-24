Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFBA206B84
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 07:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbgFXFFu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 24 Jun 2020 01:05:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:44870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388036AbgFXFFu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jun 2020 01:05:50 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208307] New: Alcor Micro Corp. Multi Flash Reader [058f:6366]
 keeps being detected and removed continuously
Date:   Wed, 24 Jun 2020 05:05:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jian-hong@endlessm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208307-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208307

            Bug ID: 208307
           Summary: Alcor Micro Corp. Multi Flash Reader [058f:6366] keeps
                    being detected and removed continuously
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8-rc2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jian-hong@endlessm.com
        Regression: No

Created attachment 289855
  --> https://bugzilla.kernel.org/attachment.cgi?id=289855&action=edit
The full dmesg

We have a laptop equipped with AMD Ryzen 5 4500U with Radeon Graphics.  The
Alcor Micro Corp. Multi Flash Reader keeps being detected and removed
continuously.  Then, once the storage modules try to access it, there will be
the failure.  These messages keep showing up like floods in the kernel message
log.

[    8.371606] usb 3-1: new high-speed USB device number 9 using xhci_hcd
[    8.501528] usb 3-1: New USB device found, idVendor=058f, idProduct=6366,
bcdDevice= 1.00
[    8.501529] usb 3-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    8.501530] usb 3-1: Product: Flash Card Reader/Writer
[    8.501531] usb 3-1: Manufacturer: Generic
[    8.501531] usb 3-1: SerialNumber: 058F63666485
[    8.501914] usb-storage 3-1:1.0: USB Mass Storage device detected
[    8.502053] scsi host3: usb-storage 3-1:1.0
[    9.547020] scsi 3:0:0:0: Direct-Access     Multiple Card  Reader     1.00
PQ: 0 ANSI: 4
[    9.547104] sd 3:0:0:0: Attached scsi generic sg1 type 0
[    9.966614] usb 3-1: reset high-speed USB device number 9 using xhci_hcd
[   10.204353] usb 3-1: USB disconnect, device number 9
[   10.211655] sd 3:0:0:0: [sdb] Read Capacity(10) failed: Result:
hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[   10.211657] sd 3:0:0:0: [sdb] Sense not available.
[   10.211661] sd 3:0:0:0: [sdb] 0 512-byte logical blocks: (0 B/0 B)
[   10.211662] sd 3:0:0:0: [sdb] 0-byte physical blocks
[   10.211670] sd 3:0:0:0: [sdb] Write Protect is off
[   10.211671] sd 3:0:0:0: [sdb] Mode Sense: 00 00 00 00
[   10.211678] sd 3:0:0:0: [sdb] Asking for cache data failed
[   10.211678] sd 3:0:0:0: [sdb] Assuming drive cache: write through
[   10.218103] sd 3:0:0:0: [sdb] Read Capacity(10) failed: Result:
hostbyte=DID_NO_CONNECT driverbyte=DRIVER_OK
[   10.218106] sd 3:0:0:0: [sdb] Sense not available.
[   10.218132] sd 3:0:0:0: [sdb] Attached SCSI removable disk

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
