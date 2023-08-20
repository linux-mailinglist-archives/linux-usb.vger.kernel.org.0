Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265B8782023
	for <lists+linux-usb@lfdr.de>; Sun, 20 Aug 2023 23:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjHTVNi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Aug 2023 17:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbjHTVNc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Aug 2023 17:13:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD228A75
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 14:10:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E052060F16
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 21:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 497CDC433C8
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692565851;
        bh=ljI0ls58xKCW536gE6UwkNw5cTsYhqKlgyiCovUPnpw=;
        h=From:To:Subject:Date:From;
        b=CPTFb881GLvbiyYWRP81ZjWhiywIumBAAFEXvJVL/9x8YDGPNCSOn4JUSvMfomthY
         VunIFGo5vyYmV1NqeH6cwwAThLM0WJlNTAaIKQ6aM6JXvGgaadToektswO1LIx69Qn
         mLsJNZXjH78DFGXWSn7dR6wtYxlXC2DhoVtFM5Mjb+DrCI8X8hB6eunP2146Czt+6/
         F8S69p1mfzM+GylYxGAQGzUlgg0tRstjVKKFzs/mli9WOnIC8iTtU/t4MNWcc67r/t
         ubu9u67CWU5nbGBbvrk8zvnoOAUMHLTtCzV5TJEWn2ygRxBig1fJMDlUpdFWA5WyHf
         LRVDi2S73ltPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 26C9AC4332E; Sun, 20 Aug 2023 21:10:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217811] New: usbhid driver misses right-click event for Rapoo
 wireless mouse
Date:   Sun, 20 Aug 2023 21:10:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.byrecki@techniline.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217811-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217811

            Bug ID: 217811
           Summary: usbhid driver misses right-click event for Rapoo
                    wireless mouse
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: michal.byrecki@techniline.com
        Regression: No

Driver improperly creates event for wireless mouse (missing right click eve=
nt).
The driver is only recognizing the left and mid-clicks, but remains dead ca=
lm
on the right one. The mouse itself is ok.

Linux crystal 5.13.0zeta #9 SMP Wed Jan 25 15:49:37 CET 2023 x86_64 GNU/Lin=
ux

Below is the output I've got using evtester. I've clicked consecutively lef=
t,
mid and right buttons of the mouse. The first two clicks generated events,w=
hile
the right one does not.


Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0x24ae product 0x2010 version 0x110
Input device name: "RAPOO Rapoo 2.4G Wireless Device"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 272 (BTN_LEFT)
    Event code 273 (BTN_RIGHT)
    Event code 274 (BTN_MIDDLE)
    Event code 275 (BTN_SIDE)
    Event code 276 (BTN_EXTRA)
  Event type 2 (EV_REL)
    Event code 0 (REL_X)
    Event code 1 (REL_Y)
    Event code 8 (REL_WHEEL)
    Event code 11 (REL_WHEEL_HI_RES)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)


Event: time 1692563194.319720, -------------- SYN_REPORT ------------
Event: time 1692563194.407719, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90=
001
Event: time 1692563194.407719, type 1 (EV_KEY), code 272 (BTN_LEFT), value 0
Event: time 1692563194.407719, -------------- SYN_REPORT ------------
Event: time 1692563199.591686, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90=
003
Event: time 1692563199.591686, type 1 (EV_KEY), code 274 (BTN_MIDDLE), valu=
e 1

Below is the lsusb output:

Bus 001 Device 056: ID 24ae:2010 Shenzhen Rapoo Technology Co., Ltd. Rapoo =
2.4G
Wireless Device
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0=20
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0        64
  idVendor           0x24ae Shenzhen Rapoo Technology Co., Ltd.
  idProduct          0x2010=20
  bcdDevice            1.10
  iManufacturer           1 RAPOO
  iProduct                2 Rapoo 2.4G Wireless Device
  iSerial                 0=20
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0054
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      64
         Report Descriptors:=20
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      94
         Report Descriptors:=20
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              10
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      64
         Report Descriptors:=20
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval              10
Device Status:     0x0002
  (Bus Powered)
  Remote Wakeup Enabled

and for the Device 56 the following driver is in use:
lsusb -d 24ae:2010 -t |grep 56
            |__ Port 1: Dev 56, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
            |__ Port 1: Dev 56, If 2, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
            |__ Port 1: Dev 56, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
