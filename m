Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 932F95B463E
	for <lists+linux-usb@lfdr.de>; Sat, 10 Sep 2022 14:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiIJMkl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Sep 2022 08:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiIJMkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Sep 2022 08:40:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CC93FA05
        for <linux-usb@vger.kernel.org>; Sat, 10 Sep 2022 05:40:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F5D360B97
        for <linux-usb@vger.kernel.org>; Sat, 10 Sep 2022 12:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFEEEC433D6
        for <linux-usb@vger.kernel.org>; Sat, 10 Sep 2022 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662813637;
        bh=8e0FEIyESNl2swxVQIrEFETKbdahdJOl1pzMMv6a0u0=;
        h=From:To:Subject:Date:From;
        b=XImsTpbFYudRIf4UwjmzP6O1HXJqr8HxbriMszwmLr0jOGjzSa0Zc8+qwOewXPACN
         rFBpyCF6+6YlTULo7HWLpEKzlkDwI5XF63l3cnvYBWVZhlnvqZD0Z/P30e+X9svkvu
         SnOCYAUw1LC0SENXqRmJeXFm++YFVtnSprm1s2eg63UudryiLbCcBskC6K4YBWRO8z
         jtE4uTpXIvFAvGNPhQ5ffTiA9SjjLOe/sMPdNPvwPZ+iOp1zJ0gHCTtf0v0q7CUd3c
         A1ugCvO99mYDRvgXoS06H+8r7hiwSxWXVWazY9e7MzAEfGzIMqkpJ9xyRgoajw8rRn
         6d03npwapXslw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CFA77C433E4; Sat, 10 Sep 2022 12:40:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216470] New: [Regression] xhci_hcd 0000:08:00.2: xHC error in
 resume, USBSTS 0x401, Reinit
Date:   Sat, 10 Sep 2022 12:40:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216470-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216470

            Bug ID: 216470
           Summary: [Regression] xhci_hcd 0000:08:00.2: xHC error in
                    resume, USBSTS 0x401, Reinit
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.8
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: aros@gmx.com
        Regression: No

I don't remember this error in kernel 5.18 or earlier kernels, so I consider
this a regression. Maybe my memory is wrong.

This error/warning message is logged after suspend/resume.

I only have USB keyboard, mouse and onboard/built-in BT adapter connected b=
ut
all of them are connected to USB2 ports and this driver AFAIK is responsible
for USB3.

$ lspci

00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Ro=
ot
Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Starship/Matisse IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:01.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse GPP
Bridge
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:05.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:07.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:07.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse
Internal PCIe GPP Bridge 0 to bus[E:B]
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PC=
Ie
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse
Internal PCIe GPP Bridge 0 to bus[E:B]
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 61)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Matisse/Vermeer Data
Fabric: Device 18h; Function 7
01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Matisse Switch Upstr=
eam
02:01.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Matisse PCIe GPP Bri=
dge
02:05.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Matisse PCIe GPP Bri=
dge
02:08.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Matisse PCIe GPP Bri=
dge
02:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Matisse PCIe GPP Bri=
dge
02:0a.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Matisse PCIe GPP Bri=
dge
03:00.0 Non-Volatile memory controller: Sandisk Corp Device 501e
04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 26)
05:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse Reserved SPP
05:00.1 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller
05:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller
06:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Contro=
ller
[AHCI mode] (rev 51)
07:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Contro=
ller
[AHCI mode] (rev 51)
08:00.0 VGA compatible controller: NVIDIA Corporation TU116 [GeForce GTX 16=
60
Ti] (rev a1)
08:00.1 Audio device: NVIDIA Corporation TU116 High Definition Audio Contro=
ller
(rev a1)
08:00.2 USB controller: NVIDIA Corporation TU116 USB 3.1 Host Controller (r=
ev
a1)
08:00.3 Serial bus controller: NVIDIA Corporation TU116 USB Type-C UCSI
Controller (rev a1)
09:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse PCIe Dummy Function
0a:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Starship/Matisse Reserved SPP
0a:00.1 Encryption controller: Advanced Micro Devices, Inc. [AMD]
Starship/Matisse Cryptographic Coprocessor PSPCPP
0a:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller
0a:00.4 Audio device: Advanced Micro Devices, Inc. [AMD] Starship/Matisse HD
Audio Controller

$ lsusb -vt
/:  Bus 08.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M
        ID 2109:0813 VIA Labs, Inc. VL813 Hub
/:  Bus 07.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        ID 2109:2813 VIA Labs, Inc. VL813 Hub
    |__ Port 3: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 1.5M
        ID 046d:c31d Logitech, Inc. Media Keyboard K200
    |__ Port 3: Dev 3, If 1, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 1.5M
        ID 046d:c31d Logitech, Inc. Media Keyboard K200
    |__ Port 4: Dev 4, If 0, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
        ID 046d:c084 Logitech, Inc. G203 Gaming Mouse
    |__ Port 4: Dev 4, If 1, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
        ID 046d:c084 Logitech, Inc. G203 Gaming Mouse
/:  Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 5: Dev 2, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
        ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth Adapter
    |__ Port 5: Dev 2, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
        ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth Adapter
    |__ Port 6: Dev 3, If 0, Class=3DVendor Specific Class, Driver=3D, 12M
        ID 0b05:18f3 ASUSTek Computer, Inc.=20
    |__ Port 6: Dev 3, If 2, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
        ID 0b05:18f3 ASUSTek Computer, Inc.=20
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
