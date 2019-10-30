Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022E5EA4B0
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 21:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfJ3U0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 16:26:36 -0400
Received: from mout-u-107.mailbox.org ([91.198.250.252]:59738 "EHLO
        mout-u-107.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfJ3U0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 16:26:36 -0400
X-Greylist: delayed 323 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Oct 2019 16:26:35 EDT
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-u-107.mailbox.org (Postfix) with ESMTPS id 473KbW1fLKzKnrB;
        Wed, 30 Oct 2019 21:21:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loebl.cz; s=MBO0001;
        t=1572466871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=f8bOBnoOGqZgfjifbTGsIHEw+IN0eJ6mzihqMPhq8nQ=;
        b=QT5DmvdS8aaayllfK5K3hpn7X8oVi/fbutdNJJqNfK90Xr8m+hvS8tYm4v3b4pMIkkLsrU
        De1LodaVNrnl7EmS1689H/V9iZim4hYf+xUFTsGol4PUv3WX4DgYPYXaEZ3m4FeSzn353n
        GJ2Sh7eSramVPN7XJbJ85dJ5Ll8NjecdOZkqXdAQ/256nnjJ4HAaXvHw1egLPsabnmDLt7
        dYw5GOPjcGCYmYguxLK+ixHJtiiiZZeFmYgqZrcQ2wZleoa0WWgkAIeZosZQo2ggDsB42F
        6mxkRUX4ZdCFLDyc8iTNoTlczOGCrrscnaU4p9QaqWuM+dHYw8piiysZQ62nMA==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id Dsmaop4ybAQD; Wed, 30 Oct 2019 21:21:09 +0100 (CET)
From:   =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH] usb: serial: mos7840: Add USB ID to support Moxa UPort 2210
Date:   Wed, 30 Oct 2019 20:52:53 +0100
Message-Id: <20191030195253.32579-1-pavel@loebl.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adds usb ID for MOXA UPort 2210. This device contains mos7820 but
it passes GPIO0 check implemented by driver and it's detected as
mos7840. Hence product id check is added to force mos7820 mode.
---
 drivers/usb/serial/mos7840.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index a698d46ba773..8afc165cc984 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -119,10 +119,13 @@
 /* This driver also supports
  * ATEN UC2324 device using Moschip MCS7840
  * ATEN UC2322 device using Moschip MCS7820
+ * MOXA UPort 2210 device using Moschip MCS7820
  */
 #define USB_VENDOR_ID_ATENINTL		0x0557
 #define ATENINTL_DEVICE_ID_UC2324	0x2011
 #define ATENINTL_DEVICE_ID_UC2322	0x7820
+#define MXU2_VENDOR_ID              0x110a
+#define MXU2_DEVICE_ID_2210         0x2210
 
 /* Interrupt Routine Defines    */
 
@@ -195,6 +198,7 @@ static const struct usb_device_id id_table[] = {
 	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL2_4)},
 	{USB_DEVICE(USB_VENDOR_ID_ATENINTL, ATENINTL_DEVICE_ID_UC2324)},
 	{USB_DEVICE(USB_VENDOR_ID_ATENINTL, ATENINTL_DEVICE_ID_UC2322)},
+	{USB_DEVICE(MXU2_VENDOR_ID, MXU2_DEVICE_ID_2210)},
 	{}			/* terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, id_table);
@@ -2030,6 +2034,11 @@ static int mos7840_probe(struct usb_serial *serial,
 		goto out;
 	}
 
+	if (product == MXU2_DEVICE_ID_2210) {
+		device_type = MOSCHIP_DEVICE_ID_7820;
+		goto out;
+	}
+
 	buf = kzalloc(VENDOR_READ_LENGTH, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.23.0

