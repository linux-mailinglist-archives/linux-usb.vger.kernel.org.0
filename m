Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC35290C26
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 21:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393087AbgJPTR3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 15:17:29 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43049 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393083AbgJPTR3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 15:17:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 001ABDE5
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 15:17:28 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Fri, 16 Oct 2020 15:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=rTIvIM2SHx2GuRLlYfaPEk7oL3HteZ8FW4IjQAOqeqM=; b=S18xRu0K
        70am7cAsSzEbsQVMijxFyeS/JQ0wQX67ZrJOwNBiatl7IbMqfU5RdVanp7CUnjNS
        zmbs28RzEmGHnBS6ONhMEmQTCiqsLEG+aXRPui4un6Yc4PQHgFfOvAj+La/K7T7V
        Uq+73X49BQVozYSwmTGMV+djBlpLoi/KAhIWgGj0OoNfO3D8TxIgwRBAID97ts9w
        rwy7IZy1yt314Fyyeabwyd0I4edRmDeVM0ah3DnlW/b485Ufg0RtOYThAkCbFT3S
        tOT5Gumqs7mdTB3L6Kgewt8md5wGd5VxKtyEIwUZar9BaWBjf1dUyEXyuk/6Hx2l
        3COvcRrS8ox1MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=rTIvIM2SHx2GuRLlYfaPEk7oL3Hte
        Z8FW4IjQAOqeqM=; b=r7Gjt8NS937miZybuTWV+ltLRgNqJROBOn9vuj1itf5NW
        T+dB4PRzuc0hMymplHHJFRv4qM2TyGDpkm2hB1MJNgscacnh/mI/y3xVongjeJRW
        gJXIrBzpoW3qZ1oml22s7AyV+0iGKSgGlEjQMFlX9A+I61HUYvUAWWL/ThLhzBsp
        XlC1iuZCm1R1JAOg0NWz1U77X9c++ygtl493xHNfrPehj84br59ck/LHlQ57fefD
        dTBut7j79cAZ0L8pOt2XnwU9GSARUuR6+qeWJ7C+qBRD3NaDSOBdKzeB14VOv2bP
        8gQ43JiQVpOaUJ4AWE9voBGCuAl0GoATCEBpA2UVA==
X-ME-Sender: <xms:yPGJXy4h6nR0s4xiUHARJyvZF_rYM8utUW-GNnmGy8peTDqsogy8ag>
    <xme:yPGJX76Q3ePukCidPYX7_-RhxNMzE44E60pLTpnaxCBhBiZZSXBHZ2q2HijSP9Ick
    OkqTcvw0x8gKftIepU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieehgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeukeehieeuueegvedvjefhieeugfdvkedvuddvgedugfehfe
    evtdegtedvheduteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:yPGJXxet6T9SzSGEcOBeuokRVd6qvEwjRK83IWauib-4xTd813qadA>
    <xmx:yPGJX_LIGPCtfTHIOISIiWfbigld1DS0r-wCXuTDQ4kXDl0OHu1Pcw>
    <xmx:yPGJX2K_ctazz9gM_Qz6_f5IATm0We357_NKcONrKeFA0-ZD06RKHA>
    <xmx:yPGJX7VDwGaQTSVtcamOE0QXGbjGn349ZNWE-ZqJlASBJaDSEh2IYQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 268CF660069; Fri, 16 Oct 2020 15:17:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-489-gf39678d-fm-20201011.001-gf39678d0
Mime-Version: 1.0
Message-Id: <bb91d3ca-389e-4a95-ae40-9b474a13d88d@www.fastmail.com>
Date:   Fri, 16 Oct 2020 14:17:12 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: NDIS (not RNDIS) driver/force RNDIS to bind?
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Is there a way to force the RNDIS driver to bind to this? If that fails, I can
try doing some troubleshooting on my own.

Make of the device may be before RNDIS was "standardized" so I'm not
sure what to expect.

# lsusb -d 0894:0010 -vv

Bus 001 Device 022: ID 0894:0010 TSI Incorporated Remote NDIS Network Device
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        16
  idVendor           0x0894 TSI Incorporated
  idProduct          0x0010 Remote NDIS Network Device
  bcdDevice            0.00
  iManufacturer           1 TSI Inc.
  iProduct                2 NDIS Device
  iSerial                 3 00004855
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x003e
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower                2mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol    255 Vendor Specific (MSFT RNDIS?)
      iInterface              0 
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      CDC ACM:
        bmCapabilities       0x00
      INVALID CDC (ACM):  05 24 02 00 01
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
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
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered
