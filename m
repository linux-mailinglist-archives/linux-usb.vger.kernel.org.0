Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34825464139
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 23:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhK3W05 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 17:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbhK3W0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 17:26:55 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636A6C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:23:35 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b40so57589128lfv.10
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=KA8aYl2ckC3zUcyPU2Py5WxF6dGmk94ESXDy31RIzVo=;
        b=aG9+K2xr5tGaPEiSHq42qt3g1MRSE2R5GSD6OCoYtZkR6j1ReT+Cp7+4H6MxG7uwY9
         F4UTDfKlX5uzk+GWLxJUuaGb6Iey86vDk1JwGTCOwhGS9bn/kQRKQbzsT7zDdoC+YRTx
         uQy3REXPRDSEBw509X14+t2HfxuTuULaEoUGpx6upnwDqRyFUBTeAW0GbAR/r6zHzAHf
         GrYtnqYPcDOUBzXFEu+vhAJn/3U4HwRuIk2BpCtF0D2rgXe+8u3OolGcqq/u8hYN7HKP
         tTTboePfFJXZUyYnMa++yrbwsBZS7pz3q7vf1Nu9eYkXASgyP96m4+tnE5MR7K3k9xrk
         JDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=KA8aYl2ckC3zUcyPU2Py5WxF6dGmk94ESXDy31RIzVo=;
        b=WvzL6PowWM7pmDfWQh8c5/qLhp95IT1/AS0JY0UJRD/cORTW3Qn6CVG8SNO6vLQLLs
         5Xhnxy0vhKRTw6jrn4D+L6fy3SUSYS3TXC1QDGuV7vpCu6AJfO1xFGJ0YvfzJP0KuQVN
         p9uREasaljq+LxrhkeJ8flwoSNI8h0LXXeQSYrHmyveANY5Vf3YhqzF6/lAVDeit1ToL
         p3MeDS75DIXbqDTIff1whT2XhC9wMVXQwGVV5+Rx28/202s9F0hE71VTfb2u32xkWpPc
         3oBJG5BJnrzXlyUY20uyyLC5J2iYXHy0/6/Fl8doe9lVIIU5QeOUzWBBSNH0orkE1+wx
         y7UQ==
X-Gm-Message-State: AOAM530fDqc6YBPvzKjnQ7rlSg4IeAa03hvCc5qGgL0Z6JrPskWgKgvw
        ArFBJCb4w4pM7d4xRI1JQCTwQveucHY=
X-Google-Smtp-Source: ABdhPJyS5OkEl1EEOcRrTUbxKpD6MZZ2/FMcMB2pSokGSAPsZ3pIZAx6iStRGl6XiKk33/HRfxLNZA==
X-Received: by 2002:a19:f241:: with SMTP id d1mr1901586lfk.131.1638311013665;
        Tue, 30 Nov 2021 14:23:33 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id m10sm1687495lji.11.2021.11.30.14.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:23:33 -0800 (PST)
Date:   Tue, 30 Nov 2021 23:23:31 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v3 1/5] tools/usbip: update protocol documentation
Message-ID: <20211130222331.GA16471@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch contains usbip protocol documentation updates. It's needed to
reflect the implementation changes in following subsequent patches:
- tools/usbip: add usb event monitor into libusbip
- tools/usbip: export USB devices on a given bus persistently
- tools/usbip: import USB devices on a given bus persistently

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v1: New patch added in series.
v2: Update paragraph according to review comments
v3: Improve patch description

 Documentation/usb/usbip_protocol.rst | 61 ++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index 0b8541fda4d8..2d540fcc4b21 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
 USB devices and the clients import them. The device driver for the exported
 USB device runs on the client machine.

+The server may choose to export any of its available USB devices based on their
+busid. These devices will remain exported until they are unplugged or unexported.
+Optionally, it is possible to persistently export the devices on a given bus by
+monitor when they are plugged in.
+
 The client may ask for the list of the exported USB devices. To get the list the
 client opens a TCP/IP connection to the server, and sends an OP_REQ_DEVLIST
 packet on top of the TCP/IP connection (so the actual OP_REQ_DEVLIST may be sent
@@ -31,12 +36,7 @@ TCP/IP connection is closed.

 Once the client knows the list of exported USB devices it may decide to use one
 of them. First the client opens a TCP/IP connection to the server and
-sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT. If the
-import was successful the TCP/IP connection remains open and will be used
-to transfer the URB traffic between the client and the server. The client may
-send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
-USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
-server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
+sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT.

 ::

@@ -50,6 +50,47 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
           |                  OP_REP_IMPORT                  |
           | <---------------------------------------------- |
           |                                                 |
+
+The client may also request to poll for devices to become exported on a given
+busid, instead of immediately receive an error. If no device becomes exported
+within the chosen time, the server replies with timeout. The TCP/IP connection
+remains open and subsequent poll requests can be sent.
+
+::
+
+ virtual host controller                                 usb host
+      "client"                                           "server"
+  (imports USB devices)                             (exports USB devices)
+          |                                                 |
+          |                  OP_REQ_IMPORT                  |
+          | ----------------------------------------------> |
+          |                        .                        |
+          |                        :                        |
+          |                                                 |
+          |                  OP_REP_IMPORT                  |
+          | <---------------------------------------------- |
+          |                                                 |
+          |                  OP_REQ_IMPORT                  |
+          | ----------------------------------------------> |
+          |                        .                        |
+          |                        :                        |
+          |                                                 |
+          |                  OP_REP_IMPORT                  |
+          | <---------------------------------------------- |
+          |                        .                        |
+          |                        :                        |
+
+If the import was successful the TCP/IP connection remains open and will be used
+to transfer the URB traffic between the client and the server. The client may
+send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
+USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
+server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
+
+::
+
+ virtual host controller                                 usb host
+      "client"                                           "server"
+  (imports USB devices)                             (exports USB devices)
           |                                                 |
           |            USBIP_CMD_SUBMIT(seqnum = n)         |
           | ----------------------------------------------> |
@@ -132,8 +173,8 @@ byte (MSB) is stored at the lowest address.
 Protocol Version
 ================

-The documented USBIP version is v1.1.1. The binary representation of this
-version in message headers is 0x0111.
+The documented USBIP version is v1.1.2. The binary representation of this
+version in message headers is 0x0112.

 This is defined in tools/usb/usbip/configure.ac

@@ -243,6 +284,10 @@ OP_REQ_IMPORT:
 |           |        |            | A string closed with zero, the unused bytes       |
 |           |        |            | shall be filled with zeros.                       |
 +-----------+--------+------------+---------------------------------------------------+
+| 40        | 4      |            | poll timeout: instead of returning immediately if |
+|           |        |            | device is not available, wait until usb device    |
+|           |        |            | becomes exported or a timeout occurs.             |
++-----------+--------+------------+---------------------------------------------------+

 OP_REP_IMPORT:
 	Reply to import (attach) a remote USB device.
--
2.25.1

