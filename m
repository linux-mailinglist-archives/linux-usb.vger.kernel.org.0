Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC2651A611F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2020 01:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgDLXff convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 12 Apr 2020 19:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDLXff (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Apr 2020 19:35:35 -0400
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C36DC0A88B5
        for <linux-usb@vger.kernel.org>; Sun, 12 Apr 2020 16:35:35 -0700 (PDT)
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207219] New: [BISECTED] Sony Vaio laptop built-in ricoh webcam
 no longer found on Fedora 31 with 5.4.11 kernel
Date:   Sun, 12 Apr 2020 23:35:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: williambader@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207219-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 207219
           Summary: [BISECTED] Sony Vaio laptop built-in ricoh webcam no
                    longer found on Fedora 31 with 5.4.11 kernel
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: williambader@hotmail.com
        Regression: No

Linux no longer finds the built-in Ricoh webcam on my Sony Vaio laptop.

Let me know if there is anything that I can try. Steve on RedHat's bugzilla
showed me how to build kernels from source and then test patches.

/var/log/messages shows the lines below, and Linux does not create /dev/video*.

Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: config 247 has too many
interfaces: 120, using maximum allowed: 32
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: config 247 descriptor has 1
excess byte, ignoring
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: config 247 has 0 interfaces,
different from the descriptor's value: 120
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: New USB device found,
idVendor=05ca, idProduct=18c0, bcdDevice= 7.32
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: Product: USB2.0 Camera
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: Manufacturer: Ricoh Company Ltd.
Mar 30 15:00:58 scslaptop37 kernel: usb 1-1.3: can't set config #247, error -32

I did a kernel bisection and identified the 5.4.10 commit
[7cbdf96cda1fbffb17ec26ea65e1fe63c9aed430] usb: missing parentheses in
USE_NEW_SCHEME
The change is just one line:
drivers/usb/core/hub.c
-#define USE_NEW_SCHEME(i, scheme)      ((i) / 2 == (int)scheme)
+#define USE_NEW_SCHEME(i, scheme)      ((i) / 2 == (int)(scheme))
The macro is called as
  USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first ||
quick_enumeration)
so the parentheses change it from using the new scheme to using the old scheme
if old_scheme_first or quick_enumeration is set. That seems to make sense, but
the change doesn't seem to work for the webcam.

There is a discussion at https://bugzilla.redhat.com/show_bug.cgi?id=1818952

I tried applying the patches at
https://bugzilla.kernel.org/show_bug.cgi?id=203419#c27 (testpatch that doesn't
clear TT buffer after protocol STALL) but they didn't help.

Here are the results of booting unpatched kernels with
dyndbg='module xhci_hcd =pmf ; module usbcore =pmf'
and running
journalctl --no-hostname -k | grep -v audit | grep -C1 -n 'usb 1-1.3'

Good kernel (5.4.10 through 093d658a06cd1831c629ceeee207572895c1a872)

943-Apr 12 00:10:37 kernel: psmouse serio1: synaptics: queried max coordinates:
x [..5692], y [..4714]
944:Apr 12 00:10:37 kernel: usb 1-1.3: new high-speed USB device number 4 using
ehci-pci
945-Apr 12 00:10:37 kernel: psmouse serio1: synaptics: Touchpad model: 1, fw:
7.4, id: 0x1c0b1, caps: 0xd04731/0xa40000/0xa0000/0x0, board id: 0, fw id:
631103
946:Apr 12 00:10:37 kernel: usbcore:usb_parse_configuration: usb 1-1.3: skipped
1 descriptor after configuration
947:Apr 12 00:10:37 kernel: usbcore:usb_parse_interface: usb 1-1.3: skipped 5
descriptors after interface
948:Apr 12 00:10:37 kernel: usbcore:usb_parse_endpoint: usb 1-1.3: skipped 1
descriptor after endpoint
949:Apr 12 00:10:37 kernel: usbcore:usb_parse_interface: usb 1-1.3: skipped 17
descriptors after interface
950:Apr 12 00:10:37 kernel: usbcore:usb_get_langid: usb 1-1.3: default language
0x0409
951:Apr 12 00:10:37 kernel: usbcore:usb_new_device: usb 1-1.3: udev 4, busnum
1, minor = 3
952:Apr 12 00:10:37 kernel: usb 1-1.3: New USB device found, idVendor=05ca,
idProduct=18c0, bcdDevice= 7.32
953:Apr 12 00:10:37 kernel: usb 1-1.3: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
954:Apr 12 00:10:37 kernel: usb 1-1.3: Product: USB2.0 Camera
955:Apr 12 00:10:37 kernel: usb 1-1.3: Manufacturer: Ricoh Company Ltd.
956:Apr 12 00:10:37 kernel: usbcore:usb_probe_device: usb 1-1.3:
usb_probe_device
957:Apr 12 00:10:37 kernel: usbcore:usb_choose_configuration: usb 1-1.3:
configuration #1 chosen from 1 choice
958:Apr 12 00:10:37 kernel: usbcore:usb_set_configuration: usb 1-1.3: adding
1-1.3:1.0 (config #1, interface 0)
959:Apr 12 00:10:37 kernel: usbcore:usb_set_configuration: usb 1-1.3: adding
1-1.3:1.1 (config #1, interface 1)
960-Apr 12 00:10:37 kernel: input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input4
--
1142-Apr 12 00:10:43 kernel: tun: Universal TUN/TAP device driver, 1.6
1143:Apr 12 00:10:45 kernel: usbcore:usb_port_suspend: usb 1-1.3: usb
auto-suspend, wakeup 0
1144-Apr 12 00:10:47 kernel: [drm] enabling PCIE gen 2 link speeds, disable
with radeon.pcie_gen2=0
--
1222-Apr 12 00:11:08 kernel: usbcore:hub_event: hub 1-1:1.0: state 7 ports 6
chg 0000 evt 0000
1223:Apr 12 00:11:08 kernel: usbcore:usb_port_resume: usb 1-1.3: usb
auto-resume
1224:Apr 12 00:11:09 kernel: usbcore:wait_for_connected: usb 1-1.3: Waited 0ms
for CONNECT
1225:Apr 12 00:11:09 kernel: usbcore:finish_port_resume: usb 1-1.3: finish
resume
1226:Apr 12 00:11:11 kernel: usbcore:usb_port_suspend: usb 1-1.3: usb
auto-suspend, wakeup 0
1227-Apr 12 00:11:11 kernel: usbcore:hub_suspend: hub 1-1:1.0: hub_suspend

bad kernel (Fedora distributed 5.5.15-200.fc31.x86_64):

931-Apr 12 00:29:30 kernel: Code: 1f 80 00 00 00 00 e8 9b c2 ff ff 48 8d bd 38
ff ff ff be 3d 00 00 00 48 89 85 28 ff ff ff 48 89 85 38 ff ff ff e8 2c f6 ff
ff <80> 38 69 0f 85 2b 02 00 00 80 78 01 70 0f 85 21 02 00 00 0f b6 58
932:Apr 12 00:29:30 kernel: usb 1-1.3: new high-speed USB device number 4 using
ehci-pci
933:Apr 12 00:29:30 kernel: usb 1-1.3: config 247 has too many interfaces: 120,
using maximum allowed: 32
934:Apr 12 00:29:30 kernel: usb 1-1.3: config 247 descriptor has 1 excess byte,
ignoring
935:Apr 12 00:29:30 kernel: usb 1-1.3: config 247 has 0 interfaces, different
from the descriptor's value: 120
936:Apr 12 00:29:30 kernel: usbcore:usb_parse_configuration: usb 1-1.3: skipped
7 descriptors after configuration
937:Apr 12 00:29:30 kernel: usbcore:usb_get_langid: usb 1-1.3: default language
0x0409
938:Apr 12 00:29:30 kernel: usbcore:usb_new_device: usb 1-1.3: udev 4, busnum
1, minor = 3
939:Apr 12 00:29:30 kernel: usb 1-1.3: New USB device found, idVendor=05ca,
idProduct=18c0, bcdDevice= 7.32
940:Apr 12 00:29:30 kernel: usb 1-1.3: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
941:Apr 12 00:29:30 kernel: usb 1-1.3: Product: USB2.0 Camera
942:Apr 12 00:29:30 kernel: usb 1-1.3: Manufacturer: Ricoh Company Ltd.
943:Apr 12 00:29:30 kernel: usbcore:usb_probe_device: usb 1-1.3:
usb_probe_device
944:Apr 12 00:29:30 kernel: usbcore:usb_choose_configuration: usb 1-1.3:
configuration #247 chosen from 1 choice
945:Apr 12 00:29:30 kernel: usb 1-1.3: can't set config #247, error -32
946-Apr 12 00:29:30 kernel: psmouse serio1: synaptics: queried max coordinates:
x [..5692], y [..4714]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
