Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5611375107
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 10:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbhEFIpZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 04:45:25 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:11186 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhEFIpY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 04:45:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620290665; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OSSFolI3ZLxWHYBKv9VISVvFMBqEXt3p3KIoMvV1tV7s/eLWmXTSY8JlKMNBzxXE5s
    5j/LYeTAOfit/U4J6HEdO9ORwSwAdNi9ebsbErm4j9TxuxGrnr+VzUa17jKkmHfLud74
    n3r6m9UBeSIsEVofScooqP2WuNDkfGUkshgTcCBXrKEddWxh1UI//lOK0x/GI5b1ZPTS
    V1620ttlzcOzytkCKXdjrQSz+fdRSETBtbUGCZ3NI/devMIUq/K4YuSAw4aS3V0BETwh
    mrC43Vl5eEueH6X0R3wQM8TJrKBEsg5+DeIsTTRNlvzzMxMjQh2+jMWKX8WNHxvEA9a+
    RROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620290665;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=GjiB7m76GBNifv/eWbGc/HRR4WKStKO4zHCi9i9pQQs=;
    b=nXDwbXmFKJ6PsKQzlD3DlM2eQeS4a/fJmtzJgoEi77buoXdr9NJW+FYDmMt7jxQbXS
    j0vN98JrSu7Y5teyWNANDemOb6IsZQ97aEGqvsBeOpVHQSeUbVzGoTNEMv6ScD/Fo7ZA
    DzNbOzZY+6Yxq31U8JLfUTnTfT3s02epgRecqZ4GGSnYARhBOZ3LcbNI7SjRKHN1GZg8
    vR7MddQA21xlcTilex2yRiOgC8nyioIf2iYCSBkeF7QRmrlYi7ydUjxKLXJ9itBOkMhA
    XQ7cmP8iGObdMd9H4eWixie+RCaoCq4vAK0UEF3dVRiGAphcXILqJt2KnhMOBWDbD2lM
    C91w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620290665;
    s=strato-dkim-0002; d=woltersonline.net;
    h=Message-Id:Subject:Cc:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=GjiB7m76GBNifv/eWbGc/HRR4WKStKO4zHCi9i9pQQs=;
    b=rdz+C87M0u7DzLRHCDUB/EsHVlE9xfsxGInGzj4juPBnwo42aV5hSb9sK4tD+jPIHG
    mrdxZbtHUYQ2YHoA654JBTaUcaYYVtmyzvN/ViKBdYiLKGPHyzxxNJGb7PP/Uey1jUiB
    Rt1Ahcm4mr8UhwrgMDuES/JYlSmQtjSnIy+5tWBMYzSrOnM7IFC9tvju9wmO8Cs8Ik/8
    o8svynsEc2etUPbLt7qs9KmpewLsfPq7EH+PyWi22HQb50WhqbtMJhzo2Bkgnf/kSNzt
    4XvCqBdMfWWP5gkX8vqrawo6Nm4KscdhSfRRskRBuJ+t+vahHMohjnoF9+y+aa1PIOHA
    TGpw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":PmMGcFK8W+iThef0QhYq5H6NV6kE4K87ZlTeLyeqymu1mQeG9z7rBMC2G76s35j7/KPYpAPwS/9Bm81svZu3ta56r/F5SfH125qLX2lZ53lqvQ=="
X-RZG-CLASS-ID: mo00
Received: from robert-dx30d
    by smtp.strato.de (RZmta 47.25.6 AUTH)
    with ESMTPSA id Y08733x468iP3X8
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 6 May 2021 10:44:25 +0200 (CEST)
Date:   Thu, 6 May 2021 10:44:25 +0200
From:   Robert Wolters <robert@woltersonline.net>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Set custom baud-rate for SCS P4 Dragon
Message-Id: <20210506104425.96371fb3f743800896605ae4@woltersonline.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Why: FTDI USB serial speed issue with SCS P4 Dragon short-wave modems,
a custom baud-rate is required

Solution: set special baud-rate by setting a custom divisor on 38400B

Signed-off-by: Robert Wolters <robert@woltersonline.net>

--- ftdi_sio.c 2021-04-21 13:01:00.000000000 +0200
+++ ftdi_sio.c 2021-04-26 18:53:00.819175707 +0200
@@ -97,6 +97,7 @@
 static int ftdi_8u2232c_probe(struct usb_serial *serial);
 static void ftdi_USB_UIRT_setup(struct ftdi_private *priv);
 static void ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
+static void ftdi_SCS_DR7X00_setup(struct ftdi_private *priv);

 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
	.probe  = ftdi_jtag_probe,
@@ -122,6 +123,10 @@
	.probe  = ftdi_8u2232c_probe,
 };

+static const struct ftdi_sio_quirk ftdi_SCS_DR7X00_quirk = {
+	.port_probe = ftdi_SCS_DR7X00_setup,
+};
+
 /*
  * The 8U232AM has the same API as the sio except for:
  * - it can support MUCH higher baudrates; up to:
@@ -157,8 +162,12 @@
	{ USB_DEVICE(FTDI_VID, FTDI_EV3CON_PID) },
	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_0_PID) },
	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_1_PID) },
-	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) },
-	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },
+	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) ,
+		.driver_info = (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },
+	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) ,
+		.driver_info = (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },
	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_4_PID) },
	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_5_PID) },
	{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_6_PID) },
@@ -2296,6 +2305,15 @@
	priv->force_rtscts = 1;
 }

+/* Setup for the SCS P4dragon DR-7X00 devices, which require
+ *hardwired baud-rate of 829440 (38400 gets mapped to 829440) */
+static void ftdi_SCS_DR7X00_setup(struct ftdi_private *priv)
+{
+	priv->flags |= ASYNC_SPD_CUST;
+	priv->custom_divisor = 29;
+	priv->force_baud = 38400;
+}
+
 /*
  * Module parameter to control latency timer for NDI FTDI-based USB devices.
  * If this value is not set in /etc/modprobe.d/ its value will be set
