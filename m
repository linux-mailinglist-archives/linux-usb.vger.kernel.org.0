Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99F35123CF
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 22:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbiD0UYT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 16:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiD0UYS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 16:24:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF84488A0
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 13:21:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9983661CEA
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 20:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1551C385A7
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651090864;
        bh=WAn1oBCWG0hfb32ynJUkYz8BIi7Zk0wauyiMHqCBlX0=;
        h=From:To:Subject:Date:From;
        b=UL78ZeEuWexSW484/dHbMPvHyihJubcJUZ5FVblZskJx4L2jxSjP9hYheOj5mX9X0
         ok2qbDNK9Hvly+vulxw79B/nzJFFf8RYpaY8onPFp+FK4td0EtoWqk70pBE2wcfoTB
         MkqrImK1+dYJaVZB/mHEOvfIg+ka+Pj7Z586a7tP5+rm+q0dc5ZxQjcnHTit6CVp49
         welHAckL3wN1obQ21qsrpE15ePJ0Pe7TaLeC/06aYal8NFUa5oRPa8Omo/dFCF1efL
         wnrOF6oM1iXUhP0obfIMBDBv2kmaS9zLMS0Z2yr3xVJL4zww89q2HE8IbclTytC0Yd
         42H0nhs+qiWwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D32F7C05FCE; Wed, 27 Apr 2022 20:21:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] New: DMAR fault when connected usb hub (xhci_hcd)
Date:   Wed, 27 Apr 2022 20:21:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qba100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215906-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

            Bug ID: 215906
           Summary: DMAR fault when connected usb hub (xhci_hcd)
           Product: Drivers
           Version: 2.5
    Kernel Version: Tested on 5.15.0-27,  5.17.0-051700-generic (from
                    https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/)
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: qba100@gmail.com
        Regression: Yes

Since kernel 5.15 (with kernel 5.13 I see no problem) I have a problem with=
 my
USB hub. The device stops working shortly after starting the system.
In dmesg log I see DMAR fault on usb controller


[kwi27 22:03] usb 5-1.2: new high-speed USB device number 3 using xhci_hcd
[  +0,100440] usb 5-1.2: New USB device found, idVendor=3D1a40, idProduct=
=3D0101,
bcdDevice=3D 1.11
[  +0,000004] usb 5-1.2: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[  +0,000002] usb 5-1.2: Product: USB 2.0 Hub
[  +0,001002] hub 5-1.2:1.0: USB hub found
[  +0,000133] hub 5-1.2:1.0: 4 ports detected
[  +0,702453] usb 5-1.2.2: new full-speed USB device number 4 using xhci_hcd
[  +0,471198] usb 5-1.2.2: New USB device found, idVendor=3D047f, idProduct=
=3Dc025,
bcdDevice=3D 1.35
[  +0,000004] usb 5-1.2.2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[  +0,000002] usb 5-1.2.2: Product: Plantronics C320-M
[  +0,000001] usb 5-1.2.2: Manufacturer: Plantronics
[  +0,000001] usb 5-1.2.2: SerialNumber: B13D8BE491B04E73AEB4C95E162DBE2B
[  +0,255862] mc: Linux media interface: v0.10
[  +0,001057] input: Plantronics Plantronics C320-M as
/devices/pci0000:00/0000:00:1c.5/0000:04:00.0/usb5/5-1/5-1.2/5-1.2.2/5-1.2.=
2:1.3/0003:047F:C025.0004/input/input21
[  +0,060275] plantronics 0003:047F:C025.0004: input,hiddev1,hidraw3: USB H=
ID
v1.11 Device [Plantronics Plantronics C320-M] on usb-0000:04:00.0-1.2.2/inp=
ut3
[  +0,859655] usb 5-1.2.2: Warning! Unlikely big volume range (=3D8192),
cval->res is probably wrong.
[  +0,000003] usb 5-1.2.2: [11] FU [Sidetone Playback Volume] ch =3D 1, val=
 =3D
0/8192/1
[  +0,584234] usbcore: registered new interface driver snd-usb-audio
[  +0,229229] xhci_hcd 0000:04:00.0: WARNING: Host System Error
[  +0,000014] DMAR: DRHD: handling fault status reg 2
[  +0,000004] DMAR: [DMA Read NO_PASID] Request device [04:00.0] fault addr
0xfffca000 [fault reason 0x06] PTE Read access is not set
[  +0,031993] xhci_hcd 0000:04:00.0: Host halt failed, -110
[kwi27 22:04] xhci_hcd 0000:04:00.0: xHCI host not responding to stop endpo=
int
command.
[  +0,000003] xhci_hcd 0000:04:00.0: USBSTS: HSE EINT
[  +0,032011] xhci_hcd 0000:04:00.0: Host halt failed, -110
[  +0,000002] xhci_hcd 0000:04:00.0: xHCI host controller not responding,
assume dead
[  +0,000017] xhci_hcd 0000:04:00.0: HC died; cleaning up
[  +0,000042] usb 5-1: USB disconnect, device number 2
[  +0,000003] usb 5-1.2: USB disconnect, device number 3
[  +0,000002] usb 5-1.2.2: USB disconnect, device number 4
[  +0,000114] usb 5-1.2.2: 1:0: usb_set_interface failed (-110)
[  +0,000016] usb 5-1.2.2: 1:1: usb_set_interface failed (-19)
[  +0,000011] usb 5-1.2.2: 1:0: usb_set_interface failed (-19)

04:00.0 USB controller: VIA Technologies, Inc. VL805/806 xHCI USB 3.0
Controller (rev 01) (prog-if 30 [XHCI])
        Subsystem: Micro-Star International Co., Ltd. [MSI] VL805/806 xHCI =
USB
3.0 Controller
        Flags: bus master, fast devsel, latency 0, IRQ 31, IOMMU group 12
        Memory at f7100000 (64-bit, non-prefetchable) [size=3D4K]
        Capabilities: <access denied>
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
