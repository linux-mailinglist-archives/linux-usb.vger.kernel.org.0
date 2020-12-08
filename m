Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DEA2D33AF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 21:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgLHUXA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 8 Dec 2020 15:23:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728750AbgLHUW6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 15:22:58 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210565] New: Regression: Upgrading from 5.9.8 to 5.9.9 stops
 ME906s LTE mobile modem from working.
Date:   Tue, 08 Dec 2020 20:22:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nelg@linuxsolutions.co.nz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210565-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210565

            Bug ID: 210565
           Summary: Regression: Upgrading from 5.9.8 to 5.9.9 stops ME906s
                    LTE mobile modem from working.
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.9
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nelg@linuxsolutions.co.nz
        Regression: No

The device:  12d1:15c1 Huawei Technologies Co., Ltd. ME906s LTE M.2 Module
has been working perfectly, up until kernel release  5.9.9.  

On 5.9.9, I get errors like:


Dec 09 08:40:25 x1 NetworkManager[531]: <info>  [1607456425.9474] device
(cdc-wdm0): Activation: successful, device activated.
Dec 09 08:40:41 x1 ModemManager[570]: [/dev/cdc-wdm0] unexpected port hangup!
Dec 09 08:40:41 x1 ModemManager[570]: [/dev/cdc-wdm0] channel destroyed
Dec 09 08:40:41 x1 ModemManager[570]: <info>  [modem2] connection to mbim-proxy
for /dev/cdc-wdm0 lost, reprobing
Dec 09 08:40:41 x1 NetworkManager[531]: <info>  [1607456441.0644] device
(cdc-wdm0): state change: activated -> unmanaged (reason 'removed',
sys-iface-state: 'removed')
Dec 09 08:41:06 x1 kernel: cdc_ether 1-2:2.0 wwan0: register 'cdc_ether' at
usb-0000:00:14.0-2, Mobile Broadband Network Device, 02:1e:10:1f:00:00
Dec 09 08:41:06 x1 kernel: usbcore: registered new interface driver cdc_ether
Dec 09 08:41:06 x1 kernel: cdc_ether 1-2:2.0 wwp0s20f0u2c2: renamed from wwan0
Dec 09 08:41:07 x1 kernel: cdc_ether 1-2:2.0 wwp0s20f0u2c2: unregister
'cdc_ether' usb-0000:00:14.0-2, Mobile Broadband Network Device

It works fine if I downgrade to 5.9.8.

I have also tested 5.9.10, 5.9.11 and 5.9.12, all of which this device no
longer works.

I can see commit ebc047afe9d2f04fdfd81d74e6c32bb3671b4670 in the change log
that touches the cdc driver, so wonder if this is related.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
