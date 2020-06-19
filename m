Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96A3200A31
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 15:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731341AbgFSNbz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 09:31:55 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:22888 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgFSNbz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 09:31:55 -0400
Date:   Fri, 19 Jun 2020 13:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1592573513;
        bh=4naruE0d5RhQtF/wuSLLsAMYxzpKtUCAr30N0GuXjSI=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=It9Az94lB5sGzqhaGybPmtL9TxrU24sI8xO4Yo8JKhuKhRsRhDfG0thhJ9BKiXGft
         QLX1C1zs7nDKW3wgrxHEx7UBe0CFpMy0eGtPFRLnk0SKoAOoI3cTDXAsI3QEg8t3jq
         MPW8cZFG/tMfPaUVPqum+GBh17HLyhxNdvRmMSPE=
To:     linux-usb@vger.kernel.org
From:   Rob Gill <rrobgill@protonmail.com>
Cc:     Rob Gill <rrobgill@protonmail.com>
Reply-To: Rob Gill <rrobgill@protonmail.com>
Subject: [PATCH v3] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200619133141.31890-1-rrobgill@protonmail.com>
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



** Descriptions updated after review, thankyou.


