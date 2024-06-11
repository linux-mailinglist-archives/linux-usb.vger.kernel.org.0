Return-Path: <linux-usb+bounces-11153-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D64904272
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 19:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 220E81F24EED
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 17:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A5C3D38E;
	Tue, 11 Jun 2024 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="117AmExp"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark2.inbox.lv (shark2.inbox.lv [194.152.32.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168F58AA7
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718127167; cv=none; b=la86aoQnm0yr9klVcCKGFopHFE++UbiSdcPRWQJZaWLJqX9H8oTkqxuOac74D91eKTg+E5kvQnLtYURycGvTDIXFlHQ+YTefG5bKJf1FfkDO8E63uIkU4b3LHOZFAeX3qpsiv7d4So/AMhKUeaH28JBqu1LepYd1bKNR2qLAJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718127167; c=relaxed/simple;
	bh=6BkzhNa2S5K6oO17t5p5HuhOrhFw3/mDCKRl9Qn6aeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+oeAwW43c5vK9eVOAlb9yvp5fGoALpFiuG2lUiFUD/E2gWuzlYWV9q7oSZz4l1czl1KO7VNs1ms3dEgUD9P3DIoPXPWbaE/OVM5wPAXmHy5ft+ICHOcjt8BzA3sVHIY3VOPi6tkXAd5bTh7BpCWDZZG0NMrGtDO6NJRCOa4+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=117AmExp; arc=none smtp.client-ip=194.152.32.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark2.inbox.lv (localhost [127.0.0.1])
	by shark2-out.inbox.lv (Postfix) with ESMTP id 4VzFrc5C81z5vQ2;
	Tue, 11 Jun 2024 20:23:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1718126624; x=1718128424;
	bh=6BkzhNa2S5K6oO17t5p5HuhOrhFw3/mDCKRl9Qn6aeM=;
	h=From:To:Cc:Subject:Date:Message-ID:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=117AmExpcPpEnmWFWmik5nT8ST50POMvMA/gJDDzNcPlyptjAfAkvnWovSq0BhYqT
	 BEhtNSWmeOV/2qm0RFu0avYaPGHzZbAPAi4uOV/e/AmLcHYD2KueBj9nd0qqLiKkq/
	 IvcYkmkOtzkyuZsIOWy6r07cc/Oa72QMAhaakACs=
Received: from shark2.inbox.lv (localhost [127.0.0.1])
	by shark2-in.inbox.lv (Postfix) with ESMTP id 4VzFrc4zfgz5vSM;
	Tue, 11 Jun 2024 20:23:44 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark2-in.inbox.lv (Postfix) with ESMTP id 4VzFrc0JBpz5vQ2;
	Tue, 11 Jun 2024 20:23:44 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry Smirnov <d.smirnov@inbox.lv>
Subject: [PATCH V3] usb: mos7840: Fix hangup after suspend
Date: Tue, 11 Jun 2024 20:23:11 +0300
Message-ID: <20240611172311.2498-1-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: AJ2EQ3gemHpAsMa6KZgOlO7m2q/TW1Igoy7z0Lwy4WxYsq+ywNMJFnPmZYmvRkK4bg==

This patch addresses a kernel hang issue with the mos7840 driver when
PC resuming from a suspend with a device connected to the serial port.

This patch introduces two new functions: mos7840_suspend() and mos7840_resume().

Tested with Delock 87414 USB 2.0 to 4x serial adapter.

Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
---
V3: Addressed review comments from previous submits

 drivers/usb/serial/mos7840.c | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 8b0308d84270..3e5f761f4925 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -1737,6 +1737,55 @@ static void mos7840_port_remove(struct usb_serial_port *port)
 	kfree(mos7840_port);
 }
 
+static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
+{
+	struct moschip_port *mos7840_port;
+	struct usb_serial_port *port;
+	int i;
+
+	dev_dbg(&serial->interface->dev, "mos7840_suspend\n");
+
+	for (i = 0; i < serial->num_ports; ++i) {
+		port = serial->port[i];
+		if (!tty_port_initialized(&port->port))
+			continue;
+
+		mos7840_port = usb_get_serial_port_data(port);
+
+		usb_kill_urb(mos7840_port->read_urb);
+		mos7840_port->read_urb_busy = false;
+	}
+	return 0;
+}
+
+static int mos7840_resume(struct usb_serial *serial)
+{
+	struct moschip_port *mos7840_port;
+	struct usb_serial_port *port;
+	int res;
+	int i;
+
+	dev_dbg(&serial->interface->dev, "mos7840_resume\n");
+
+	for (i = 0; i < serial->num_ports; ++i) {
+		port = serial->port[i];
+		if (!tty_port_initialized(&port->port))
+			continue;
+
+		mos7840_port = usb_get_serial_port_data(port);
+
+		if (port->bulk_in_size) {
+			res = usb_submit_urb(mos7840_port->read_urb, GFP_NOIO);
+			if (res) {
+				usb_kill_urb(mos7840_port->read_urb);
+				mos7840_port->read_urb_busy = false;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static struct usb_serial_driver moschip7840_4port_device = {
 	.driver = {
 		   .owner = THIS_MODULE,
@@ -1764,6 +1813,8 @@ static struct usb_serial_driver moschip7840_4port_device = {
 	.port_probe = mos7840_port_probe,
 	.port_remove = mos7840_port_remove,
 	.read_bulk_callback = mos7840_bulk_in_callback,
+	.suspend = mos7840_suspend,
+	.resume = mos7840_resume,
 };
 
 static struct usb_serial_driver * const serial_drivers[] = {

base-commit: c3f38fa61af77b49866b006939479069cd451173
-- 
2.45.1


