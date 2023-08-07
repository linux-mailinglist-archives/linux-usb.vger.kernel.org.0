Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2E9771AFC
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 09:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjHGHBq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 03:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjHGHBS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 03:01:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB871BCF
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 00:01:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D84F61578
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 07:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C34CEC433C7
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 07:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691391661;
        bh=wtxZj+XLSkcHtJvtaVziK74NZuSsfAWr1MFjf6yUfcQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=q+RXnYRbaQ9p2BcB1/+0OFvBzDVR/onLAS8XLMX0M1NkYEoynnRUnWbcnijddSxsL
         Q+BDVIJlwdEzxTgTRKrML2RxSzqoZJZnpPZGn3icZSYVwjYx1IgWAwTzWTpcL32uZN
         uk1DGOWsWdm3tGMkFXpqcAQyikJFrb6oDTZEE8dElfG/VxdfCc1+AgZZFRvz6LoJor
         5eNr4mkAPODfawIqZBxV73JeAYaAGo0uslc/pmgGpPfbT0/CeRjcynzjL3SiVmDRRD
         qKwmD7CBZuUQMx30xA0uCUI/teKSzzT2IgCWiqY4qlyt6Lshj9SKuzJWdMLB2CL33I
         6HYOJVHA66rUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A812DC4332E; Mon,  7 Aug 2023 07:01:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 07 Aug 2023 07:01:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ZeroBeat@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-IDTyE1kKsR@https.bugzilla.kernel.org/>
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

--- Comment #32 from Michael (ZeroBeat@gmx.de) ---
Some additional information:

I'm on kernel 6.4.8 and noticed that a WiFi device connected to an USB 3 po=
rt
doesn't work:
Bus 002 Device 003: ID 0e8d:7612 MediaTek Inc. MT7612U 802.11a/b/g/n/ac
Wireless Adapter

[ 7280.709821] usb 2-3: New USB device found, idVendor=3D0e8d, idProduct=3D=
7612,
bcdDevice=3D 1.00
[ 7280.709829] usb 2-3: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D4
[ 7280.709830] usb 2-3: Product: Wireless=20
[ 7280.709832] usb 2-3: Manufacturer: MediaTek Inc.
[ 7280.709833] usb 2-3: SerialNumber: 000000000
[ 7280.970177] usb 2-3: reset SuperSpeed USB device number 2 using xhci_hcd
[ 7280.994419] mt76x2u 2-3:1.0: ASIC revision: 76120044
[ 7281.025164] mt76x2u 2-3:1.0: ROM patch build: 20141115060606a
[ 7281.202395] mt76x2u 2-3:1.0: Firmware Version: 0.0.00
[ 7281.202404] mt76x2u 2-3:1.0: Build: 1
[ 7281.202405] mt76x2u 2-3:1.0: Build Time: 201507311614____
[ 7281.928318] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
[ 7281.928840] usbcore: registered new interface driver mt76x2u
[ 7281.942982] mt76x2u 2-3:1.0 wlp22s0f0u3: renamed from wlan0

$ sudo iw dev wlp22s0f0u3 set type monitor
[ 7475.445473] mt76x2u 2-3:1.0 wlp22s0f0u3: entered promiscuous mode

$ sudo ip link set wlp22s0f0u3 up
$ sudo iw dev wlp22s0f0u3 set channel 6
$ iw dev
phy#1
        Interface wlp22s0f0u3
                ifindex 4
                wdev 0x100000001
                addr 00:c0:ca:ad:0e:49
                type monitor
                channel 6 (2437 MHz), width: 20 MHz (no HT), center1: 2437 =
MHz
                txpower 20.00 dBm
                multicast TXQ:
                        qsz-byt qsz-pkt flows   drops   marks   overlmt has=
hcol
tx-bytes        tx-packets
                        0       0       0       0       0       0       0=
=20=20=20=20=20=20
0               0

$ tshark -i wlp22s0f0u3
Capturing on 'wlp22s0f0u3'
 ** (tshark:12534) 08:42:20.045697 [Main MESSAGE] -- Capture started.
 ** (tshark:12534) 08:42:20.045804 [Main MESSAGE] -- File:
"/tmp/wireshark_wlp22s0f0u3LO1981.pcapng"
^Ctshark:=20
0 packets captured


$ sudo ip link set wlp22s0f0u3 down
$ sudo iw dev wlp22s0f0u3 set type managed
[ 7479.304196] mt76x2u 2-3:1.0 wlp22s0f0u3: left promiscuous mode

Controller:
                description: USB controller
                product: Renoir/Cezanne USB 3.1
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.3
                bus info: pci@0000:30:00.3
                version: 00
                width: 64 bits
                clock: 33MHz
                capabilities: xhci bus_master cap_list
                configuration: driver=3Dxhci_hcd latency=3D0
                resources: irq:33 memory:fc300000-fc3fffff


Mainboard: MSI B550 A-Pro


While all USB 2 devices are working as expected on this port, none of the U=
SB 3
devices is working. I don't think that it is a driver problem, because I te=
sted
several devices manufactured by different vendors (mt76m rt2800usb).

Unfortunately I got no dmesg message like this user
https://github.com/ZerBea/hcxdumptool/issues/334#issuecomment-1667093519

I guess all this problems are related to each other.

BTW:
A long time ago, we got something similar related to XHCI):
https://bugzilla.kernel.org/show_bug.cgi?id=3D202541
but that seems to be fixed, now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
