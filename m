Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3A3684EA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 18:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238011AbhDVQd2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 12:33:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237972AbhDVQd1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 12:33:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2714161209
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619109172;
        bh=EF14xTJb67tR3sNGgQSlFcsQM6VcCmr8kK6GNeCqHMI=;
        h=From:To:Subject:Date:From;
        b=XZG5vOizYpfBH8qRi7Fya7VpIXBuNJG5EVbyXP6oMbRV09H/nETVzhNRyuoXHPuVE
         RORDu9zUHIVGD09g+BHxzFTetrE8eDVs7TxpJtieV+7ccbKz4vgTtyXyJ5n0BxVIxv
         U73YOudrV3tmT5B546zOktbEwvsPT2BXXIRlsfAc+RbjrDNq0UNxp32sqMEnGpQBJa
         5G/QwMtfFm/Mb43eQqhzwWRwb6fpVgs1nsCZkraGro9CDmIVR4tBbZLpuiRk3YQM7b
         QeFxSTzpFsuwOOp5vydUvl/5SDReM53QOmMDlyb6TPL9ZQYng5i/SmH/83aR95/kwC
         wOS+vTkJiKpYQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2220A6113B; Thu, 22 Apr 2021 16:32:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212751] New: acm_port_activate - usb_submit_urb(ctrl irq)
 failed after kernel update
Date:   Thu, 22 Apr 2021 16:32:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johann.wilhelm@wilhelm.consulting
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212751-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212751

            Bug ID: 212751
           Summary: acm_port_activate - usb_submit_urb(ctrl irq) failed
                    after kernel update
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.30
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: johann.wilhelm@wilhelm.consulting
        Regression: No

Something between 5.10.26 and 5.20.30 broke (at least) the USB CDC
implementation by ST Microsystems on their STM32 devices.

On opending of the device following error occurs:
[ 1333.790160] cdc_acm 1-10:1.0: acm_port_activate - usb_submit_urb(ctrl ir=
q)
failed


5.10.26 works - 5.10.30 does not.

Tested on the 2 identical devices with 2 different firmware (read: different
firmware from 2 different developers) on different ports (USB3&USB2) with a=
nd
without hub.

Additionally, someone else reports similar problems here:
https://forum.manjaro.org/t/usb-device-dev-ttyacm0-throws-i-o-error-on-conn=
ect/61385


lsusb dump under 5.10.30:

Bus 001 Device 016: ID 0483:5740 STMicroelectronics Virtual COM Port
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         2 Abstract (modem)
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x0483 STMicroelectronics
  idProduct          0x5740 Virtual COM Port
  bcdDevice            2.00
  iManufacturer           1 STMicroelectronics
  iProduct                2 STM32 Virtual ComPort
  iSerial                 3 204E37773453
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0043
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0=20
      CDC Header:
        bcdCDC               1.10
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              16
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0=20
      bInterfaceProtocol      0=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
