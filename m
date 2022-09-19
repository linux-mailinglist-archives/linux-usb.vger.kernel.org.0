Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D732E5BC394
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 09:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiISHm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 03:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiISHm5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 03:42:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DADA175B9
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 00:42:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB1A8B811E3
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 07:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 783E5C433D7
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663573373;
        bh=4nl+Gr0Wv50fsJH4J1NrXC9fK+PQGYb09X5p59URGug=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jjbQe8EPEPHPt1mldsVD39mZPEPPrJNNeyQ8f6KAhuzDLQoU3a7zYeTdEDXCPx6G0
         IEPzO5r/ARTbJaEJ24M9jASoCTpO04wO8yDIvcztaZw7qf95YqtNye77pMVZwSTJBE
         Ke0XDjXl8vwY4cd5+SL0BHIYjK47hIVmlHCxvFPR36TFaV1Iy8AcI/SQn4zyivxw6G
         woL/3Bz6wqEPFF811uplPejvU02VGwj2GAXgfdsTxHFudI6CDwj81nFcPuTI5Cc0i5
         Sq/cIgfJp7OZNUBCr8k3j54qtTZqU4wzBP0+M5mXGUJGV6+Wu/tlxVhxVJm3vZQBDY
         ugetlBmllu3eA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 505D1C433E9; Mon, 19 Sep 2022 07:42:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Mon, 19 Sep 2022 07:42:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists@nerdbynature.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216497-208809-qFTh3rZdQB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

Christian Kujau (lists@nerdbynature.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lists@nerdbynature.de

--- Comment #4 from Christian Kujau (lists@nerdbynature.de) ---
When plugging in a Yubico USB-C dongle to this Lenovo T470 (with the latest
BIOS 1.71 installed), this happens with 5.19.9-200.fc36.x86_64 today (upgra=
ded
from 5.19.8-200.fc36.x86_64 where it worked just fine):


Sep 19 09:34:40 kernel: pci 0000:05:00.0: [8086:15c0] type 01 class 0x060400
Sep 19 09:34:40 kernel: pci 0000:05:00.0: enabling Extended Tags
Sep 19 09:34:40 kernel: pci 0000:05:00.0: supports D1 D2
Sep 19 09:34:40 kernel: pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot
D3cold
Sep 19 09:34:40 kernel: pci 0000:06:00.0: [8086:15c0] type 01 class 0x060400
Sep 19 09:34:40 kernel: pci 0000:06:00.0: enabling Extended Tags
Sep 19 09:34:40 kernel: pci 0000:06:00.0: supports D1 D2
Sep 19 09:34:40 kernel: pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot
D3cold
Sep 19 09:34:40 kernel: pci 0000:06:01.0: [8086:15c0] type 01 class 0x060400
Sep 19 09:34:40 kernel: pci 0000:06:01.0: enabling Extended Tags
Sep 19 09:34:40 kernel: pci 0000:06:01.0: supports D1 D2
Sep 19 09:34:40 kernel: pci 0000:06:01.0: PME# supported from D0 D1 D2 D3hot
D3cold
Sep 19 09:34:40 kernel: pci 0000:06:02.0: [8086:15c0] type 01 class 0x060400
Sep 19 09:34:40 kernel: pci 0000:06:02.0: enabling Extended Tags
Sep 19 09:34:40 kernel: pci 0000:06:02.0: supports D1 D2
Sep 19 09:34:40 kernel: pci 0000:06:02.0: PME# supported from D0 D1 D2 D3hot
D3cold
Sep 19 09:34:40 kernel: pci 0000:05:00.0: PCI bridge to [bus 06-3d]
Sep 19 09:34:40 kernel: pci 0000:05:00.0:   bridge window [mem
0xd4000000-0xea0fffff]
Sep 19 09:34:40 kernel: pci 0000:05:00.0:   bridge window [mem
0xb0000000-0xd1ffffff 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:06:00.0: PCI bridge to [bus 07]
Sep 19 09:34:40 kernel: pci 0000:06:00.0:   bridge window [mem
0xea000000-0xea0fffff]
Sep 19 09:34:40 kernel: pci 0000:06:01.0: PCI bridge to [bus 08-3c]
Sep 19 09:34:40 kernel: pci 0000:06:01.0:   bridge window [mem
0xd4000000-0xe9efffff]
Sep 19 09:34:40 kernel: pci 0000:06:01.0:   bridge window [mem
0xb0000000-0xd1ffffff 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:3d:00.0: [8086:15c1] type 00 class 0x0c0330
Sep 19 09:34:40 kernel: pci 0000:3d:00.0: reg 0x10: [mem 0xe9f00000-0xe9f0f=
fff]
Sep 19 09:34:40 kernel: pci 0000:3d:00.0: enabling Extended Tags
Sep 19 09:34:40 kernel: pci 0000:3d:00.0: supports D1 D2
Sep 19 09:34:40 kernel: pci 0000:3d:00.0: PME# supported from D0 D1 D2 D3hot
D3cold
Sep 19 09:34:40 kernel: pci 0000:3d:00.0: 8.000 Gb/s available PCIe bandwid=
th,
limited by 2.5 GT/s PCIe x4 link at 0000:06:02.0 (capable of 31.504 Gb/s wi=
th
8.0 GT/s PCIe x4 link)
Sep 19 09:34:40 kernel: pci 0000:06:02.0: PCI bridge to [bus 3d]
Sep 19 09:34:40 kernel: pci 0000:06:02.0:   bridge window [mem
0xe9f00000-0xe9ffffff]
Sep 19 09:34:40 kernel: pci_bus 0000:06: Allocating resources
Sep 19 09:34:40 kernel: pci 0000:06:01.0: bridge window [io  0x1000-0x0fff]=
 to
[bus 08-3c] add_size 1000
Sep 19 09:34:40 kernel: pci 0000:06:02.0: bridge window [io  0x1000-0x0fff]=
 to
[bus 3d] add_size 1000
Sep 19 09:34:40 kernel: pci 0000:06:02.0: bridge window [mem
0x00100000-0x000fffff 64bit pref] to [bus 3d] add_size 200000 add_align 100=
000
Sep 19 09:34:40 kernel: pci 0000:05:00.0: bridge window [io  0x1000-0x0fff]=
 to
[bus 06-3d] add_size 3000
Sep 19 09:34:40 kernel: pci 0000:05:00.0: BAR 13: no space for [io  size
0x3000]
Sep 19 09:34:40 kernel: pci 0000:05:00.0: BAR 13: failed to assign [io  size
0x3000]
Sep 19 09:34:40 kernel: pci 0000:05:00.0: BAR 13: no space for [io  size
0x3000]
Sep 19 09:34:40 kernel: pci 0000:05:00.0: BAR 13: failed to assign [io  size
0x3000]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 15: failed to assign [mem size
0x00200000 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:06:01.0: BAR 13: no space for [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:01.0: BAR 13: failed to assign [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 13: no space for [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 13: failed to assign [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 15: no space for [mem size
0x00200000 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 15: failed to assign [mem size
0x00200000 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 13: no space for [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: BAR 13: failed to assign [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:01.0: BAR 13: no space for [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:01.0: BAR 13: failed to assign [io  size
0x1000]
Sep 19 09:34:40 kernel: pci 0000:06:00.0: PCI bridge to [bus 07]
Sep 19 09:34:40 kernel: pci 0000:06:00.0:   bridge window [mem
0xea000000-0xea0fffff]
Sep 19 09:34:40 kernel: pci 0000:06:01.0: PCI bridge to [bus 08-3c]
Sep 19 09:34:40 kernel: pci 0000:06:01.0:   bridge window [mem
0xd4000000-0xe9efffff]
Sep 19 09:34:40 kernel: pci 0000:06:01.0:   bridge window [mem
0xb0000000-0xd1ffffff 64bit pref]
Sep 19 09:34:40 kernel: pci 0000:06:02.0: PCI bridge to [bus 3d]
Sep 19 09:34:40 kernel: pci 0000:06:02.0:   bridge window [mem
0xe9f00000-0xe9ffffff]
Sep 19 09:34:40 kernel: pci 0000:05:00.0: PCI bridge to [bus 06-3d]
Sep 19 09:34:40 kernel: pci 0000:05:00.0:   bridge window [mem
0xd4000000-0xea0fffff]
Sep 19 09:34:40 kernel: pci 0000:05:00.0:   bridge window [mem
0xb0000000-0xd1ffffff 64bit pref]
Sep 19 09:34:40 kernel: xhci_hcd 0000:3d:00.0: xHCI Host Controller
Sep 19 09:34:40 kernel: xhci_hcd 0000:3d:00.0: new USB bus registered, assi=
gned
bus number 3
Sep 19 09:34:40 kernel: xhci_hcd 0000:3d:00.0: hcc params 0x200077c1 hci
version 0x110 quirks 0x0000000200009810
Sep 19 09:34:40 kernel: xhci_hcd 0000:3d:00.0: xHCI Host Controller
Sep 19 09:34:40 kernel: xhci_hcd 0000:3d:00.0: new USB bus registered, assi=
gned
bus number 4
Sep 19 09:34:40 kernel: xhci_hcd 0000:3d:00.0: Host supports USB 3.1 Enhanc=
ed
SuperSpeed
Sep 19 09:34:40 kernel: usb usb3: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 5.19
Sep 19 09:34:40 kernel: usb usb3: New USB device strings: Mfr=3D3, Product=
=3D2,
SerialNumber=3D1
Sep 19 09:34:40 kernel: usb usb3: Product: xHCI Host Controller
Sep 19 09:34:40 kernel: usb usb3: Manufacturer: Linux 5.19.9-200.fc36.x86_64
xhci-hcd
Sep 19 09:34:40 kernel: usb usb3: SerialNumber: 0000:3d:00.0
Sep 19 09:34:40 kernel: hub 3-0:1.0: USB hub found
Sep 19 09:34:40 kernel: hub 3-0:1.0: 2 ports detected
Sep 19 09:34:40 kernel: usb usb4: New USB device found, idVendor=3D1d6b,
idProduct=3D0003, bcdDevice=3D 5.19
Sep 19 09:34:40 kernel: usb usb4: New USB device strings: Mfr=3D3, Product=
=3D2,
SerialNumber=3D1
Sep 19 09:34:40 kernel: usb usb4: Product: xHCI Host Controller
Sep 19 09:34:40 kernel: usb usb4: Manufacturer: Linux 5.19.9-200.fc36.x86_64
xhci-hcd
Sep 19 09:34:40 kernel: usb usb4: SerialNumber: 0000:3d:00.0
Sep 19 09:34:40 kernel: hub 4-0:1.0: USB hub found
Sep 19 09:34:40 kernel: hub 4-0:1.0: 2 ports detected
Sep 19 09:34:40 kernel: typec port0: bound usb3-port1 (ops connector_ops)
Sep 19 09:34:40 kernel: typec port0: bound usb4-port1 (ops connector_ops)
Sep 19 09:34:40 kernel: DMAR: DRHD: handling fault status reg 2
Sep 19 09:34:40 kernel: DMAR: [INTR-REMAP] Request device [3d:00.0] fault i=
ndex
0x8200 [fault reason 0x25] Blocked a compatibility format interrupt request


This Yubico thingy should register itself as an input device, but doesn't
anymore. Yes, I realize it's a distribution kernel, I'm just adding this he=
re
as an additional data point.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
