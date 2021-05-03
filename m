Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1013720F0
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 21:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhECTwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 15:52:01 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:28597 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhECTwA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 15:52:00 -0400
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 May 2021 15:52:00 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1620071104; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AO3e/iyBsU9q0grnkse0inZaEvE4YPB7LSSjvYnrcCmd/t3O1MPbygWselK7yg/iaD
    PB7nMvXIXxUsjlb68J7/iCC+f6vS5WSfIL6FcTO9R1aPcQ+N4loJCE8CyOIBstQ1H8Mu
    YF3NIJRw8HA2eIJAUbqtxyjUgiAw8ANfNOdl0FPKzykVlmPmsALxF/Vp/rzvJLXB48yC
    868/WIPHiiASMTXGqmTS7cSlqWwvhcwg3SsJ3BU5rZmx024KflMmaDvUrRXohH9jf1YB
    QGFuwoBiXTzrv2LA/61dhX2UBQ5dQNCJ0T/Z77Q/RDP+9gq++p4i1HCSDDE570iZB+wo
    ErDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620071104;
    s=strato-dkim-0002; d=strato.com;
    h=Date:Message-ID:Cc:To:Subject:From:Cc:Date:From:Subject:Sender;
    bh=02XrD1wBcNqKWTE8sgdDN73vkh/mTjzRVvyzGnaRemM=;
    b=Jt1cPjjPP6uRZTBQSLYwKnwpWDzut0O1yHpv/ny1aQLRq7GGNH9OQrnd5xkK6oN/OW
    AiaEFJuXDzEPvdyOBIsVSwh0dw1LY+UPyET6HG3BmoonuGOjeqc6bjX5mEz4XxQ+mXK/
    v4vcIiqvS35usPtLV/eUESjfIORCVP/R57Xe3w/S22mUXfu70kQVGpm48E2PS+sydnFC
    +m/dHW2k8nIIAmIG7jLw9M7SUbN6bsDPYZ17nqgYOs2UX4wEx1nqzo6g+YbN6JBamAiJ
    DaBFARNniNx3K/bcyrPspwPmPE1SoZgRTdwcJpIWwI+p3oedMbsG6VIYJX1/slXxPhSt
    JHvA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620071104;
    s=strato-dkim-0002; d=woltersonline.net;
    h=Date:Message-ID:Cc:To:Subject:From:Cc:Date:From:Subject:Sender;
    bh=02XrD1wBcNqKWTE8sgdDN73vkh/mTjzRVvyzGnaRemM=;
    b=KAk4mhj8gqwjY6W5O9IVxdSfn7vLCqrANFvd8tLctXPIB6Bm9uxFJb8QKs0fdpI8dn
    /sYZB6s2kgmzk7pjVYaMWfczCFezTecEXw/ablVpLisu9H4y5Az3RPBrA6pSJg+pVBBY
    sIHPZOoEcaT681L4LSTT3HUebBzB1/bkHmojEx0eTJJbjIDgtfOT4NqU2jtb32CYbpEp
    ASiEeYUo2zvO8jtcze/fDzzD6GEJKTJAr8suEOlRMD2vB0TkQoJpW7HkAHRtrMQNv7ac
    neJmGRl0OFJc3Bw/UYz8lkW+5bvLU3MUKFbkbG9rZiTxEDzdlytDaI2t2YSb+FaGu/Vm
    Gntg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":PmMGcFK8W+iThef0QhYq5H6NV6kE4K87ZlTeLyeqymu1mQeG9z7rBMC2G76s35j7/KPYpAPwS/9Bm81huZu14CGGU5EdABpoMyiq+2e2RPUS/g=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c9:8f3f:9c9f:5ff8:a7e2:3f7c:6f69]
    by smtp.strato.de (RZmta 47.25.5 AUTH)
    with ESMTPSA id w064ebx43Jj40WZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 3 May 2021 21:45:04 +0200 (CEST)
From:   Robert Wolters <robert@woltersonline.net>
Subject: CR for ftdi_sio.c, SCS P4 Dragon
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org
Message-ID: <b7ec696f-c5ca-30e6-0769-4c6e925e8367@woltersonline.net>
Date:   Mon, 3 May 2021 21:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------E98C902A3C0B0221C3D860E0"
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------E98C902A3C0B0221C3D860E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Johan,

I'd like to submit a small change request for the ftdi_sio.c Kernel module.

Problem: setting a special Baud-rate for the SCS P4 Dragon series 
(Pactor 4) of short-wave modems.

Solution: as implemented in the patch file attached. This change has 
been tested on several Debian-based machines, and works okay. Which is 
not a surprise, as only the Baud-rate is set, using a specific divisor, 
in a same manner as is already done for other devices currently 
supported by ftdi_sio.

I'm also submitting this change request on behalf of SCS GmbH & Co KG of 
Hanau in Germany.

Many thanks in advance. Looking forward to any feedback and/or comments.

Regards,
Robert Wolters (DM4RW)

Südstrasse 4b
82131 Stockdorf (nr Munich)
Germany


--------------E98C902A3C0B0221C3D860E0
Content-Type: text/x-patch; charset=UTF-8;
 name="ftdi_sio.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ftdi_sio.c.patch"

--- ftdi_sio.c  2021-04-21 13:01:00.000000000 +0200
+++ ftdi_sio_new.c      2021-04-26 18:53:00.819175707 +0200
@@ -97,6 +97,7 @@
 static int   ftdi_8u2232c_probe(struct usb_serial *serial);
 static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
 static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
+static void  ftdi_SCS_DR7X00_setup(struct ftdi_private *priv);
 
 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
        .probe  = ftdi_jtag_probe,
@@ -122,6 +123,10 @@
        .probe  = ftdi_8u2232c_probe,
 };
 
+static const struct ftdi_sio_quirk ftdi_SCS_DR7X00_quirk = {
+       .port_probe = ftdi_SCS_DR7X00_setup,
+};
+
 /*
  * The 8U232AM has the same API as the sio except for:
  * - it can support MUCH higher baudrates; up to:
@@ -157,8 +162,12 @@
        { USB_DEVICE(FTDI_VID, FTDI_EV3CON_PID) },
        { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_0_PID) },
        { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_1_PID) },
-       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) },
-       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },
+/*     { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) },
+       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },*/
+       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) ,
+               .driver_info = (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },
+       { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) ,
+               .driver_info = (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },
        { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_4_PID) },
        { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_5_PID) },
        { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_6_PID) },
@@ -2296,6 +2305,15 @@
        priv->force_rtscts = 1;
 }
 
+/* Setup for the SCS P4dragon DR-7X00 devices, which require hardwired
+ * baudrate of 829440 (38400 gets mapped to 829440) */
+static void ftdi_SCS_DR7X00_setup(struct ftdi_private *priv)
+{
+       priv->flags |= ASYNC_SPD_CUST;
+       priv->custom_divisor = 29;
+       priv->force_baud = 38400;
+}
+
 /*
  * Module parameter to control latency timer for NDI FTDI-based USB devices.
  * If this value is not set in /etc/modprobe.d/ its value will be set

--------------E98C902A3C0B0221C3D860E0--
