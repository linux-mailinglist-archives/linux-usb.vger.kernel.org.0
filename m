Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BAE2009BE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 15:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732378AbgFSNQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 09:16:43 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:44760 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730753AbgFSNQb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 09:16:31 -0400
Date:   Fri, 19 Jun 2020 13:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1592572587;
        bh=c/l97bXcD2Wgs9Y7+QsxzeSxiyhZmvSGi38B+bSt4oQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=OGWHgirzQnjF9TWwUDRhDW7qpZgbV3/O7nGBpNmUfxkqes16ggDDV5V6uehy+li78
         iWFCh2/t+wGiB1IoeX/SF0RCZwrzaePW5U4fdO22dQg21Gi/Xvc9qphU4wH5aIhJ9S
         XFvP4xuD2hgPhVGXmSB+XGgMdK1i4cE2gdTTTwX4=
To:     linux-usb@vger.kernel.org
From:   Rob Gill <rrobgill@protonmail.com>
Cc:     Rob Gill <rrobgill@protonmail.com>
Reply-To: Rob Gill <rrobgill@protonmail.com>
Subject: Re: [PATCH] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200619131606.30088-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The user tool modinfo is used to get information on kernel modules, includi=
ng a
description where it is available.

This patch adds a brief MODULE_DESCRIPTION to the following modules in driv=
er/usb.

isight_firmware
mxuport
u_ether
uas

Signed-off-by: Rob Gill <rrobgill@protonmail.com>

** Descriptions updated after review, thankyou.
---
 drivers/usb/gadget/function/u_ether.c | 1 +
 drivers/usb/misc/isight_firmware.c    | 1 +
 drivers/usb/serial/mxuport.c          | 1 +
 drivers/usb/storage/uas.c             | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/fun=
ction/u_ether.c
index fbe96ef1a..424a3a0a4 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1180,3 +1180,4 @@ EXPORT_SYMBOL_GPL(gether_disconnect);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Brownell");
+MODULE_DESCRIPTION("Ethernet-over-USB Gadget");
diff --git a/drivers/usb/misc/isight_firmware.c b/drivers/usb/misc/isight_f=
irmware.c
index 4d30095d6..925a5682f 100644
--- a/drivers/usb/misc/isight_firmware.c
+++ b/drivers/usb/misc/isight_firmware.c
@@ -129,3 +129,4 @@ module_usb_driver(isight_firmware_driver);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
+MODULE_DESCRIPTION("USB isight camera firmware loader");
diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 2513ee902..c1d70d528 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -1323,3 +1323,4 @@ module_usb_serial_driver(serial_drivers, mxuport_idta=
ble);
 MODULE_AUTHOR("Andrew Lunn <andrew@lunn.ch>");
 MODULE_AUTHOR("<support@moxa.com>");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MOXA UPort series driver");
diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index d59207111..7f59748c4 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -1272,3 +1272,4 @@ MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(USB_STORAGE);
 MODULE_AUTHOR(
 =09"Hans de Goede <hdegoede@redhat.com>, Matthew Wilcox and Sarah Sharp");
+MODULE_DESCRIPTION("USB attached SCSI");
--=20
2.17.1


