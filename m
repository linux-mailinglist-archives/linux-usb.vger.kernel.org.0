Return-Path: <linux-usb+bounces-10844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39EF8FBF83
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 01:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55FE1C227DA
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 23:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81EF14D28E;
	Tue,  4 Jun 2024 23:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="Ry9Wx1oM"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark1.inbox.lv (shark1.inbox.lv [194.152.32.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B71474CE
	for <linux-usb@vger.kernel.org>; Tue,  4 Jun 2024 23:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542138; cv=none; b=Hyxq4Yn5SvNImaS0hnoSE3i1RB3GNDvR2etSdTsUPzpOBxr9KB40dm+BPGTSCN87bN0ebyHuH1AAZFFam1KuGp2kn5C+rhVx5Z/1rTiOMJ4MNjKMAtOg8xHeB0dhew9E8+z8Es60yNLxecrsqIdEFHSRcqHGKWcsWzpkFb1v+HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542138; c=relaxed/simple;
	bh=y43KE4deWgOUbxFuMM5XH6p2OiEEoXDDQdu3PWFy0Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rC7LUv1viALrUCieGT1/WSrfV0G/wOPRL2K4WvvE4ZawtSgYmJSg1O3eIRDjMgp14BSW0CsJunQBy6KNKa8hZRx6pOqxh++E3Vi96IPOx5frKFaw9woymRjeK1aScOUUD2eIaEM4MuyXF4T9YV1ims9qGY5frQAhKEey+6baYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=Ry9Wx1oM; arc=none smtp.client-ip=194.152.32.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id 4Vv5Xd5swKz2d6MZ;
	Wed,  5 Jun 2024 01:55:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1717541729; x=1717543529;
	bh=y43KE4deWgOUbxFuMM5XH6p2OiEEoXDDQdu3PWFy0Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=Ry9Wx1oM/gefStYsb3v78dE8igVnEXGs0c5rFOala9d+PeAoM0tq9GYRfYEZLoSWM
	 Z0e0HZ9TWhJUaYgHACn8fUOmzs2bbOQxC7FooW7buBda2Et8zCuqH0Bma2+Z7H1vvn
	 xKcb5eyG/YVALJATq9HM0JD0A/Xl/eqKHPXanMIU=
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 4Vv5Xd5GxDz2d6MW;
	Wed,  5 Jun 2024 01:55:29 +0300 (EEST)
From: Dmitry <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry <dimonija@gmail.com>
Subject: [PATCH 1/1] usb: serial: Fix mos7840 resume from standby
Date: Wed,  5 Jun 2024 01:55:07 +0300
Message-ID: <20240604225507.6801-2-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604225507.6801-1-d.smirnov@inbox.lv>
References: <20240604225507.6801-1-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: AJ2EQ3gemHpAsMa6KZgflO6YoMrKNlcrvjnzx6Mx63pHt7fd0a14cnPmZYmvRkK4bg==

From: Dmitry <dimonija@gmail.com>

---
 drivers/usb/serial/mos7840.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 8b0308d84270..7443d2f018b4 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -770,6 +770,7 @@ static void mos7840_close(struct usb_serial_port *port)
 		if (mos7840_port->write_urb_pool[j]) {
 			kfree(mos7840_port->write_urb_pool[j]->transfer_buffer);
 			usb_free_urb(mos7840_port->write_urb_pool[j]);
+			mos7840_port->write_urb_pool[j] = NULL;
 		}
 	}
 
@@ -1737,6 +1738,37 @@ static void mos7840_port_remove(struct usb_serial_port *port)
 	kfree(mos7840_port);
 }
 
+static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
+{
+    dev_dbg(&serial->interface->dev, "mos7840_suspend\n");
+
+    return 0;
+}
+
+static int mos7840_resume(struct usb_serial *serial)
+{
+	struct moschip_port *mos7840_port;
+	struct usb_serial_port *port;
+	int i;
+	dev_dbg(&serial->interface->dev, "mos7840_resume\n");
+
+	for (i = 0; i < serial->num_ports; ++i) {
+		port = serial->port[i];
+		if (!tty_port_initialized(&port->port))
+			continue;
+
+		mos7840_port = usb_get_serial_port_data(port);
+
+		if (port->bulk_in_size)
+			usb_submit_urb(mos7840_port->read_urb, GFP_NOIO);
+
+		/*if (port->bulk_out_size)
+			usb_submit_urb(mos7840_port->read_urb, GFP_ATOMIC);*/
+	}
+
+    return 0;
+}
+
 static struct usb_serial_driver moschip7840_4port_device = {
 	.driver = {
 		   .owner = THIS_MODULE,
@@ -1764,6 +1796,8 @@ static struct usb_serial_driver moschip7840_4port_device = {
 	.port_probe = mos7840_port_probe,
 	.port_remove = mos7840_port_remove,
 	.read_bulk_callback = mos7840_bulk_in_callback,
+	.suspend = mos7840_suspend,
+	.resume = mos7840_resume,
 };
 
 static struct usb_serial_driver * const serial_drivers[] = {
-- 
2.45.1


