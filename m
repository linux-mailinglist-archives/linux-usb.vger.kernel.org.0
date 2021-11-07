Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1AE44745A
	for <lists+linux-usb@lfdr.de>; Sun,  7 Nov 2021 18:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbhKGRSC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Nov 2021 12:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbhKGRSA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Nov 2021 12:18:00 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E1FC061570
        for <linux-usb@vger.kernel.org>; Sun,  7 Nov 2021 09:15:17 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 1so24894262ljv.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Nov 2021 09:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=2OBAC+Yu9086afngG26r0vwDWIpKcsYPuIT5Qiv7QnQ=;
        b=mcq/+Nk7E2uagj97Uo1U0hKAZK38nyCIvRyF9qwMJpodFGFC9PLUFqZZOTKL+34GFa
         3JIV6cv9OG1+yf28Li1Gb+JpRXQIJos9POr3kSrUdWBFUG1/lNZAcU5O5Jz9pAo22D+F
         dOidv9esVUzYQkUQYeZ/azXu5bqG1ektVHmysjmpwsItqrPvz9tEBLuPJ2OWIouK1ND2
         A8G+MCBMUebdwL6VYEiYXo8/LLiL8Y1icNQo+37LAUamdDO4wPo6zXXmMIAoTSo6t6xB
         Y+RbNKcGt8BMEEHP51AaihMw+1jXR2yGuuUcR75a0PYE8UaucZNY+cY4hdU9CkaFU1gn
         25+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=2OBAC+Yu9086afngG26r0vwDWIpKcsYPuIT5Qiv7QnQ=;
        b=E3n/Yg9zSE4YyPgeYK4N9EnPaNMt/6vNvIp0lB49Iqx4hhjQ13ByLrRx3V3hH8s+iF
         UPvMeIg+/rHV7RmzTVq1uWv1Y9PulWcKQ2RTukp0PpLuWOnmMT9ZhjQJg09StRZnwGIU
         6zJaKLLvMUH0aRqp40m5orBitwSJRvcM5CgLwfLSlAwUgFKC+SFAE3L4BWtt0LcnCusH
         WD//Lz27jTWXzHuxx+rGE7W0qS7AtFaLxWkNVacDR9G+QRGWiFx9fQCSR0PE9JodFMpZ
         siWIdEzzOAPNcul2+2I1DPl+IY6Y9FFwJ+km9Lip2yGYJGNDVqdmhI86+cDASs5VhQKp
         iBUw==
X-Gm-Message-State: AOAM530NP+vpWfNHW6EDuQ6+QGovvEsX3BDCA/Iddgb/rCOpVPOb5lWZ
        rjmbBY18kOgaEPIEXY3xBCa9i/sgsQQ=
X-Google-Smtp-Source: ABdhPJx+8j7NrZ5+fhGzjKsK6JtDOaw4nfxMC25JwzNkNRiX8HSXsLH01tSFUGwfACoTdGV1fTk/uQ==
X-Received: by 2002:a05:651c:2103:: with SMTP id a3mr61511240ljq.435.1636305316075;
        Sun, 07 Nov 2021 09:15:16 -0800 (PST)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id e5sm1531122lfs.52.2021.11.07.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:15:15 -0800 (PST)
Date:   Sun, 7 Nov 2021 18:15:14 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v1 1/4] tools/usbip: update documentation
Message-ID: <20211107171514.GA14492@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch contains usbip protocol documentation updates for
the implementation changes in subsequent patches.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v1: New patch added in series.

 Documentation/usb/usbip_protocol.rst | 61 ++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index 0b8541fda4d8..1afe6d297efc 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
 USB devices and the clients import them. The device driver for the exported
 USB device runs on the client machine.
 
+Initially the server may choose to export any of its available USB devices,
+based on the busid. The device will remain exported until it's unplugged or
+unbound from the usbip driver. It is also possible to persistently export
+devices on a given bus by monitor when they are plugged in.
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

