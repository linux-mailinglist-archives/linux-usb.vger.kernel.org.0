Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E10460A33
	for <lists+linux-usb@lfdr.de>; Sun, 28 Nov 2021 22:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359221AbhK1VRX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Nov 2021 16:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbhK1VPW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Nov 2021 16:15:22 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94F2C061746
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:12:05 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id p8so17120455ljo.5
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=kmfPwsbUGrNn5XihRluHHAtMBmv/yPW9STxQZDyCqng=;
        b=mCfbyPfNRzLOmVSDxYpvyepY5/m6gP/ztUwAXZGt1FGEO/iMb6POva7bSuLYkqV72m
         lvFvYgFEtCb9hBzOd5pIVBNsRx8lV7tZ7x1mI+5HUVo9D+NlU3/34s+DiGiH93Z/Njw0
         ndZv7A17szfZawPiF0pdPBHuFmlnzJZMHknO8I3JSWYZ466EeRw6GsPJkyeeGR2CB60Y
         mVj6kFDOOifDjReOk3HIxfAHKj/b5vbVZyJ/ZPC/Qgrq0feDLV9EwLLWugm+iwCS3Yji
         EqVBo6k+7FIS98tS1ZtmgXp64bTBhV1j88JQ1kA5I54Ay4hg4YjmnvZjU+fttVHEMoTD
         GOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=kmfPwsbUGrNn5XihRluHHAtMBmv/yPW9STxQZDyCqng=;
        b=OkFer/JmLuPGf8zssN2/FM8XELuPQjBp31nSgC5isWDMnYL9lots793KUaTvLqPeFA
         G5CgUwffn0iiJYf0CcsMLwyVJiEnoqtTUWLxZ0n/r3oRsNUYneFTbkO/fP9bqgIHvBaT
         KVIXrevBoQX6A83pAXmpcyYWp68gEwLNxTIjSwWWbpDTsiAq1seD8P+SeQ4yIU8U2ttz
         v8hW7IeXiraPINAdFsWhOepUpubgI3uiNpGd8PGM90jCPPOXy/lvR3bhhSbRaip5iEt6
         x5WiZ2zPsSlAIT/15pTBYhWMAdlutoebT5isfvg9CRFgWaVQNVkb4nQ4e2y/51R4gXL/
         rTGA==
X-Gm-Message-State: AOAM531hqg9cnRp+xKV0ohajJVq6sEKQ5tPNM+RzJYWkk4bNBRW6TLi3
        flUU11zVTaYoplnoYmllyNg=
X-Google-Smtp-Source: ABdhPJzUKBW31aeWoYxOwfRsCM46tG8j0HBbyZB1jJJ95Ci8WOR3mO6B69TqupgEtI7eZE4iIXbI9Q==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr44363902ljg.120.1638133924099;
        Sun, 28 Nov 2021 13:12:04 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id q13sm1097228lfe.121.2021.11.28.13.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:12:03 -0800 (PST)
Date:   Sun, 28 Nov 2021 22:12:02 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/5] tools/usbip: update protocol documentation
Message-ID: <20211128211202.GA37076@dell-precision-T3610>
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
v2: Update paragraph according to review comments

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

