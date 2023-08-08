Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F93773554
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 02:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjHHANo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 20:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjHHANn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 20:13:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58F5D9
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 17:13:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4272C62333
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 00:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9984CC433CA
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 00:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691453621;
        bh=b5xKFpWnZMtdwMwsEY5gPDPlhUUEhPp/atW0bTJUnl8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FemCfXGA2E5tu5VgWxToI/vUl96NMdbEAyzz22ZuN7vCwuKW4ALdzIHCxDGsugziY
         7atMdrbeIkd3QJ3o4QYGtHp5zot97T6Z/KhjplwJ7FwsDMmktT1jrcxBv7qz4azOj2
         CPqfCiook7XjjUQCu2CRxaYYUF+W5P4YuFAT1O0X+ngXdZztVsAbvvPp4vyN8v7qDA
         90pTi6Yp3lrHnnBHWyPQQgtosByMW8GJCs2PWLPlqwZMZSV9WP7Ey84iKBa1TWf4Vg
         GW7pNciSHWI/LiC8g50yrM6XDe1MSuGhBhQbvzOUcOVyHK6nen6IGGR7tFIWq3hdJC
         fmyZNxNmMOLOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 89F04C53BD2; Tue,  8 Aug 2023 00:13:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Tue, 08 Aug 2023 00:13:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmitri926@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217122-208809-6vo6nHqZJN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

Dmitri (dmitri926@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dmitri926@gmail.com

--- Comment #35 from Dmitri (dmitri926@gmail.com) ---
Hi Mario & Michael,

I was able to test on a physical box. I'm not seeing the "Transfer event TRB
DMA ptr not part of current TD" error in dmesg but not able to capture any
packets either.

$ uname -a
Linux sonylaptop 6.5.0-0.a.test-amd64 #1 SMP PREEMPT_DYNAMIC Debian
6.5~rc4-1~exp1a~test (2023-08-07) x86_64 GNU/Linux

[ 1189.175651] usb 3-2: new high-speed USB device number 5 using xhci_hcd
[ 1189.326329] usb 3-2: New USB device found, idVendor=3D0e8d, idProduct=3D=
7961,
bcdDevice=3D 1.00
[ 1189.326351] usb 3-2: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D8
[ 1189.326358] usb 3-2: Product: Wireless_Device
[ 1189.326363] usb 3-2: Manufacturer: MediaTek Inc.
[ 1189.326368] usb 3-2: SerialNumber: 000000000
[ 1189.332931] bluetooth hci1: firmware: direct-loading firmware
mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
[ 1189.337734] mt7921u 3-2:1.3: firmware: direct-loading firmware
mediatek/WIFI_RAM_CODE_MT7961_1.bin
[ 1195.262160] mt7921u 3-2:1.3: firmware: direct-loading firmware
mediatek/WIFI_RAM_CODE_MT7961_1.bin
[ 1195.276095] mt7921u 3-2:1.3: WM Firmware Version: ____010000, Build Time:
20230526130958
[ 1196.916463] mt7921u 3-2:1.3 wlx00c0cab3c769: renamed from wlan0

    description: Motherboard
       product: VAIO
       vendor: Sony Corporation
       physical id: 0
       version: N/A
       serial: N/A
     *-firmware
          description: BIOS
          vendor: Insyde Corp.
          physical id: 0
          version: R0220DA
          date: 11/18/2013
          size: 128KiB
          capacity: 3MiB
          capabilities: pci pnp upgrade shadowing cdboot bootselect edd
int9keyboard int10video acpi usb smartbattery biosbootspecification netboot
uefi
     *-cpu
          description: CPU
          product: Intel(R) Core(TM) i5-3337U CPU @ 1.80GHz
          vendor: Intel Corp.
          physical id: 4
          bus info: cpu@0
          version: 6.58.9
          serial: N/A
          slot: N/A
          size: 2591MHz
     *-usbhost:1
                product: xHCI Host Controller
                vendor: Linux 6.5.0-0.a.test-amd64 xhci-hcd
                physical id: 1
                bus info: usb@4
                logical name: usb4
                version: 6.05
                capabilities: usb-3.00
                configuration: driver=3Dhub slots=3D4 speed=3D5000Mbit/s

$ lsusb
Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 004: ID 0bda:5729 Realtek Semiconductor Corp. Front Camera
Bus 001 Device 003: ID 0489:e062 Foxconn / Hon Hai BCM43142A0
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 005: ID 0e8d:7961 MediaTek Inc. Wireless_Device
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

$ hcxdumptool -L

Requesting physical interface capabilities. This may take some time.
Please be patient...


available wlan devices:

phy idx hw-mac       virtual-mac  m ifname           driver (protocol)
---------------------------------------------------------------------------=
------------------
  3   6 00c0cab3c769 00c0cab3c769 * wlx00c0cab3c769  mt7921u (NETLINK)

* active monitor mode available
+ monitor mode available
- no monitor mode available


:~/work$ sudo iw dev $IFACE set type monitor
:~/work$ sudo ip link set $IFACE up
:~/work$ sudo iw dev
phy#3
        Interface wlx00c0cab3c769
                ifindex 6
                wdev 0x300000001
                addr d8:5d:fb:08:df:5c
                type monitor
                channel 6 (2437 MHz), width: 20 MHz (no HT), center1: 2437 =
MHz
                txpower 3.00 dBm
                multicast TXQ:
                        qsz-byt qsz-pkt flows   drops   marks   overlmt has=
hcol
tx-bytes        tx-packets
                        0       0       0       0       0       0       0=
=20=20=20=20=20=20
0               0



$ sudo tshark -i $IFACE
Running as user "root" and group "root". This could be dangerous.
Capturing on 'wlx00c0cab3c769'
 ** (tshark:8102) 20:10:07.839462 [Main MESSAGE] -- Capture started.
 ** (tshark:8102) 20:10:07.839571 [Main MESSAGE] -- File:
"/tmp/wireshark_wlx00c0cab3c769SOIS91.pcapng"
^Ctshark:
0 packets captured

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
