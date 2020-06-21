Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2209202AE8
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 15:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgFUN5K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 21 Jun 2020 09:57:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729649AbgFUN5K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Jun 2020 09:57:10 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208267] New: usbip broken with latest kernels?
Date:   Sun, 21 Jun 2020 13:57:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: forum@docmax.my.to
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208267-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208267

            Bug ID: 208267
           Summary: usbip broken with latest kernels?
           Product: Drivers
           Version: 2.5
    Kernel Version: Linux t420 5.7.4-arch1-1 #1 SMP PREEMPT Thu, 18 Jun
                    2020 16:01:07 +0000 x86_64 GNU/Linux
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: forum@docmax.my.to
        Regression: No

[root@t420]: /home/docmax># usbip list -l
 - busid 1-1.1 (0572:6831)
   Conexant Systems (Rockwell), Inc. : DVBSky S960 DVB-S2 tuner (0572:6831)

 - busid 1-1.2.3 (057e:0306)
   Nintendo Co., Ltd : Wii Remote Controller RVL-003 (057e:0306)

 - busid 1-1.2.4 (045e:0719)
   Microsoft Corp. : Xbox 360 Wireless Adapter (045e:0719)

 - busid 1-1.3 (147e:2016)
   Upek : Biometric Touchchip/Touchstrip Fingerprint Sensor (147e:2016)

 - busid 1-1.4 (0a5c:217f)
   Broadcom Corp. : BCM2045B (BDC-2.1) (0a5c:217f)

 - busid 1-1.6 (04f2:b221)
   Chicony Electronics Co., Ltd : integrated camera (04f2:b221)

 - busid 4-1 (152d:0567)
   JMicron Technology Corp. / JMicron USA Technology Corp. : JMS567 SATA 6Gb/s
bridge (152d:0567)

 - busid 4-2 (152d:0567)
   JMicron Technology Corp. / JMicron USA Technology Corp. : JMS567 SATA 6Gb/s
bridge (152d:0567)

 - busid 3-1.2 (174c:5136)
   ASMedia Technology Inc. : ASM1053 SATA 3Gb/s bridge (174c:5136)

[root@t420]: /home/docmax># usbip -d bind -b 1-1.2.4
usbip: debug: usbip.c:129:[run_command] running command: `bind'
usbip: debug: sysfs_utils.c:24:[write_sysfs_attribute] error writing to
attribute /sys/bus/usb/drivers/usbip-host/bind
usbip: error: error binding device 1-1.2.4 to driver: No such device
usbip: error: could not bind device to usbip-host

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
