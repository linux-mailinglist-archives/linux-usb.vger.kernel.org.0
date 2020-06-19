Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3A22007E9
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 13:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgFSLd6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 07:33:58 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:51574 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727814AbgFSLdu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 07:33:50 -0400
Date:   Fri, 19 Jun 2020 11:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1592565984;
        bh=9P+Li2yelqHWQvsyWirHt1c2G2j+OOWUtGPzErBIbWY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Hql0VCReu0GAgXpiKINNOFagwvpru6TSd00bLVtCu/Y3xFFEm0/JC+ilRX0AVNcqC
         tqzUSAiuZ4hNqPnpDyNKgfXLH/dHbFzaKRCie4O4tBg8q8jf2XxSFzrVd152cXdT3h
         lx6z88ErlGCG7SJy+DO/FFVrxt3wplgcaIdJodEw=
To:     linux-usb@vger.kernel.org
From:   Rob Gill <rrobgill@protonmail.com>
Cc:     Rob Gill <rrobgill@protonmail.com>
Reply-To: Rob Gill <rrobgill@protonmail.com>
Subject: RE: [PATCH] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200619112607.21763-1-rrobgill@protonmail.com>
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
index fbe96ef1a..579ab41c6 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1180,3 +1180,4 @@ EXPORT_SYMBOL_GPL(gether_disconnect);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Brownell");
+MODULE_DESCRIPTION("Ethernet-over-USB link layer utilities for Gadget stac=
k");
diff --git a/drivers/usb/misc/isight_firmware.c b/drivers/usb/misc/isight_f=
irmware.c
index 4d30095d6..607c90c22 100644
--- a/drivers/usb/misc/isight_firmware.c
+++ b/drivers/usb/misc/isight_firmware.c
@@ -129,3 +129,4 @@ module_usb_driver(isight_firmware_driver);
=20
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
+MODULE_DESCRIPTION("USB isight camera firmware");
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


Apologies for previous mangled emails.


