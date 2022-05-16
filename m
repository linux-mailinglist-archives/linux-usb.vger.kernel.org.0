Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4195283F8
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 14:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235801AbiEPMQy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 08:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiEPMQy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 08:16:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3634A2BB20
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 05:16:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C59926117E
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 12:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32710C34115
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 12:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652703410;
        bh=s1wNz6oRaNBa3ABuXA4cR2neFwJ56ly+GDpuutrLJQQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Y7GezqL+zrMBW3hYhioBMicZuv3CX5P1qb0YAWhqP5+11xnOEwAOjkY2WyMLUHk7i
         HnS9UdSdxoubGBSOcAJx0LOd3lDS0Q5JB1DO3eWVklcBesmmI+PXsMpuewTLGI8kkO
         8CxyLpXjNv9Wf0Z1hb/5IQ3WBWTN2cGL4Va+oq8fJgmZSCJ1vyb0Ag6tJsnfzo0SOA
         l9HvI5HvvETSb/BeD2n8O/ciNO2uwXlBln33IZtH4XxP+J/cYFHakHulL3aUztT1TL
         aL73GAIGGU7cSZwkshsrgEtuos4gkeZdJwcHBuN59rd/I82tAxdrDslhY3pxIUpQC3
         H01Pe8obkkL3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1B739CC13AF; Mon, 16 May 2022 12:16:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 16 May 2022 12:16:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-PZ7ANB3lh4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #19 from Satadru Pramanik (satadru@umich.edu) ---
I'm not sure what changed, but it is working on the ubuntu mainline build of
5.18-rc7.

The aforementioned patch is not in there.

There is a dma-buf patch in 5.18-rc7, but I can't tell if that would make a
difference here.

The bcm5974 driver is definitely loaded without errors:

satadru@mbp113 ~$ lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 4: Dev 2, If 0, Class=3DMass Storage, Driver=3Dusb-storage, 50=
00M
        ID 05ac:8406 Apple, Inc. Internal Memory Card Reader
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/14p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 8: Dev 2, If 0, Class=3DHub, Driver=3Dhub/3p, 12M
        ID 0a5c:4500 Broadcom Corp. BCM2046B1 USB 2.0 Hub (part of BCM2046
Bluetooth)
        |__ Port 3: Dev 6, If 3, Class=3DApplication Specific Interface, Dr=
iver=3D,
12M
            ID 05ac:8289 Apple, Inc. Bluetooth Host Controller
        |__ Port 3: Dev 6, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
            ID 05ac:8289 Apple, Inc. Bluetooth Host Controller
        |__ Port 3: Dev 6, If 2, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
            ID 05ac:8289 Apple, Inc. Bluetooth Host Controller
        |__ Port 3: Dev 6, If 0, Class=3DVendor Specific Class, Driver=3Dbt=
usb, 12M
            ID 05ac:8289 Apple, Inc. Bluetooth Host Controller
    |__ Port 12: Dev 3, If 0, Class=3DHuman Interface Device, Driver=3Dusbh=
id, 12M
        ID 05ac:0262 Apple, Inc.=20
    |__ Port 12: Dev 3, If 1, Class=3DHuman Interface Device, Driver=3Dusbh=
id, 12M
        ID 05ac:0262 Apple, Inc.=20
    |__ Port 12: Dev 3, If 2, Class=3DHuman Interface Device, Driver=3Dbcm5=
974, 12M
        ID 05ac:0262 Apple, Inc.=20
satadru@mbp113 ~$ modinfo bcm5974
filename:=20=20=20=20=20=20
/lib/modules/5.18.0-051800rc7-generic/kernel/drivers/input/mouse/bcm5974.ko
license:        GPL
description:    Apple USB BCM5974 multitouch driver
author:         Henrik Rydberg
srcversion:     0BB7AB5EB48AF28F1C4CD31
alias:          usb:v05ACp0274d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0273d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0272d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0292d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0291d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0290d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp025Bd*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp025Ad*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0259d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0264d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0263d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0262d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0254d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0253d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0252d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp024Ed*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp024Dd*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp024Cd*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp024Bd*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp024Ad*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0249d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0247d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0246d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0245d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0244d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0243d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0242d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0241d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0240d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp023Fd*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0238d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0237d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0236d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0232d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0231d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0230d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0225d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0224d*dc*dsc*dp*ic03isc*ip02in*
alias:          usb:v05ACp0223d*dc*dsc*dp*ic03isc*ip02in*
depends:=20=20=20=20=20=20=20=20
retpoline:      Y
intree:         Y
name:           bcm5974
vermagic:       5.18.0-051800rc7-generic SMP preempt mod_unload modversions=
=20
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        16:26:F9:99:B7:74:1B:1E:3D:8C:FA:BD:74:AD:55:7A:E7:0C:0C:4A
sig_hashalgo:   sha512
signature:      02:8D:46:9D:9B:6C:A3:D9:E5:A2:CD:30:02:E3:DA:1A:DD:E8:89:89:
                2B:A3:94:E2:DE:2F:FF:0A:D4:3F:78:AE:28:D2:59:5A:4C:9D:E2:4F:
                82:28:97:49:0B:12:9B:6C:DB:AC:25:F0:3B:11:8C:9D:8C:23:19:B0:
                DC:64:DC:00:01:2A:61:19:59:8F:D6:DA:2A:33:BC:0B:E3:81:76:2F:
                42:C0:F6:9C:8C:95:29:F9:1B:66:83:F5:5D:05:CF:81:F9:F8:06:5A:
                EB:53:1D:8F:50:6F:38:47:A9:AA:43:A9:A4:F5:27:B4:EC:5F:C4:3A:
                E9:2D:BD:45:99:92:55:88:80:42:37:1A:A0:EB:AE:27:AD:73:AD:78:
                B7:6C:C6:C6:6C:51:8C:81:40:C2:16:26:BC:61:D5:36:90:C5:AD:C1:
                AF:77:48:61:16:3B:49:61:DD:2C:EA:A3:5E:F1:47:0F:41:5A:AC:8C:
                4B:6F:60:74:23:38:5D:8A:6E:74:27:B3:A5:FA:09:E5:6E:3E:CD:42:
                66:5E:2F:53:47:96:33:4E:70:2C:23:D9:E1:52:39:5D:52:11:BF:51:
                E2:67:89:29:0D:8A:04:8D:B4:51:DD:38:BE:D1:B7:8B:55:32:B8:18:
                FB:E1:C2:50:A6:58:99:EC:31:F1:99:70:B6:D9:C3:96:48:04:01:06:
                E0:7A:99:B4:D4:B6:70:46:32:BE:38:0C:54:CA:99:DB:04:55:58:DD:
                3D:F6:A9:65:19:AF:7C:82:DC:99:8C:BC:AB:41:3A:11:97:9D:36:97:
                ED:2D:DC:C0:37:3F:8F:7B:84:08:81:B4:96:0E:88:D5:58:BB:F8:D4:
                06:B9:92:F6:80:88:A8:28:E5:A6:04:59:C6:CD:1B:B8:E0:52:17:80:
                0D:93:D4:6D:70:98:67:1B:96:79:5B:46:3D:62:DD:98:DE:DF:5A:37:
                6F:69:C4:9E:11:97:93:96:D4:4B:97:F4:FA:75:08:EB:F0:43:9E:44:
                9A:CE:C4:35:D3:91:74:B0:95:F9:81:BA:AD:FC:BF:70:7E:87:5F:D4:
                F8:20:56:89:BD:BE:0B:B0:C3:71:A5:31:AD:0E:B2:58:27:A3:42:6D:
                93:04:DC:D9:FA:91:AE:C3:05:2C:64:E1:47:1F:C0:2E:24:9E:E3:3C:
                76:1B:A0:D4:F4:1E:30:E8:0E:0A:B6:BB:79:E0:4B:88:20:27:DA:06:
                84:DB:AF:21:A1:9D:F3:07:DD:BF:99:4A:DC:8D:06:BD:6C:37:C9:05:
                D8:1A:52:53:31:E5:AC:92:1E:D9:1C:1A:60:2F:8E:55:8A:1F:A2:A2:
                A4:3B:46:B5:26:A7:E6:8C:BE:FC:E5:4F
parm:           debug:Activate debugging output (int)
satadru@mbp113 ~$ sudo dmesg | grep bcm5974
[    6.167200] input: bcm5974 as
/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.2/input/input9
[    6.182558] usbcore: registered new interface driver bcm5974
satadru@mbp113 ~$

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
