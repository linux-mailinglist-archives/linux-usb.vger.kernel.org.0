Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7AE58099D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 04:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbiGZCtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 22:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbiGZCtT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 22:49:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0FD29C92
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 19:49:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30006614D7
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 02:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C7F1C341C6
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658803756;
        bh=ekoHP0EYxs6aQL038n0jJV4w1EBhdPVns1Th1lo4of0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iGEXK8msn+tlG/pp33RN4Pl5vXOQNxnfDOqSAvELy371YBzxPn7OFIskL5IB+igBN
         Bkg9APfbNGxWA8aq3NcYCteHhfw+iXTxW1J4hSoBipKFlTzqCxH7vBO5fqCOK4KkGs
         KYMkv94UwcYoDTry5kSv1bsxMlBiZY3zR3W1xtGXmLMladv+4dneLhB8numt4vyFV2
         DfLKYSqIjR86kyCiLQGD40NeY1Ll+JMUtwExplDMxXhWd109eJRr+Rm05xKlbMw/8t
         e/xyOYvbzFwpe98Rk5gSzH2TRB45zTGXsFrghd7flVQXetPOeNqlmUNslqZmwnfPQI
         gmt8QBaEXWKMA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6C4DFC05FD6; Tue, 26 Jul 2022 02:49:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 02:49:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-YoMV6vmk1p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #2 from audioprof2001@yahoo.com ---
Detected but No HDD:

$ lsusb -v

Bus 002 Device 009: ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA 3Gb/s
bridge
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x174c ASMedia Technology Inc.
  idProduct          0x5106 ASM1051 SATA 3Gb/s bridge
  bcdDevice            1.00
  iManufacturer           2 Thermaltake
  iProduct                3 BlacX
  iSerial                 1 000000000002
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002c
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15

-------------

Detected with HDD:

$ lsusb -v

Bus 002 Device 010: ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA 3Gb/s
bridge
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x174c ASMedia Technology Inc.
  idProduct          0x5106 ASM1051 SATA 3Gb/s bridge
  bcdDevice            1.00
  iManufacturer           2 Thermaltake
  iProduct                3 BlacX
  iSerial                 1 000000000002
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002c
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
