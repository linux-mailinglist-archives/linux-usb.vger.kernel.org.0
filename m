Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF5E796E92
	for <lists+linux-usb@lfdr.de>; Thu,  7 Sep 2023 03:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjIGBfo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 21:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjIGBfn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 21:35:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A351998
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 18:35:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27D97C433C8
        for <linux-usb@vger.kernel.org>; Thu,  7 Sep 2023 01:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694050539;
        bh=4hRtGshgxnT8dJoZceTiqMQ85sb6zPPanrbKBZfqObo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mXyZwCfouSpwarnXNYqxxdWTmrhx70rxxvtH73BJuUnXWA37W5OkmyK83BD3OPTVS
         jpRCKo+JTuVTHcHS2jcTGGPYACg6kBsWSN//JzOy2veRA1NDSDnWZETVhonP2+IUR3
         Ac1gMZkqmhtd1Df3fl1Hy8ABRBBz6mIiOUaG/6tmADRc4Bo11oYDFilSHDCS1ng8NK
         ZlqXw73c4IMuwGBHpYyzjIizIq2o17sogl9lCpakyWwYIRcN6VUl7fwRiLK7MYQ7XN
         02cR5M1afFlTpvxo3SABej+V0sVTUMehsFUDfnyTag/yFrC1XKs0UWqQLi+jiaNoeM
         uUQAFqESFm0ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EFD29C4332E; Thu,  7 Sep 2023 01:35:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Thu, 07 Sep 2023 01:35:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-jc4bLHYPuR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #14 from pawlick3r@proton.me ---
(In reply to Alan Stern from comment #13)
> There is a significant difference between the two reports: the bulk endpo=
int
> numbers.  The Windows output shows it using endpoint 3 for bulk OUT where=
as
> Linux uses endpoint 1.  That's got to be the reason why the Bulk Reset Me=
dia
> and Bulk Get Redundancy Data commands are failing.
>=20
> Let's see what "lsusb -v" shows for this device.  I expect it will list b=
oth
> endpoints, and the Windows driver uses one but the Linux driver uses the
> other.

Here is the lsusb -v output for this device and there are in fact two diffe=
rent
endpoints.=20

Bus 001 Device 006: ID 0584:0008 RATOC System, Inc. Fujifilm MemoryCard
ReaderWriter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x0584 RATOC System, Inc.
  idProduct          0x0008 Fujifilm MemoryCard ReaderWriter
  bcdDevice            1.02
  iManufacturer           1 YAMAICHI ELECTRONICS Co.,Ltd.
  iProduct                2 USB SmartMedia Adapter
  iSerial                 0=20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               80mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
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
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
