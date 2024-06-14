Return-Path: <linux-usb+bounces-11340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F86909437
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jun 2024 00:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D9EB21A9D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 22:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AE0184122;
	Fri, 14 Jun 2024 22:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="ekGEdWPc"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark3.inbox.lv (shark3.inbox.lv [194.152.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1C62F50
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405196; cv=none; b=CVIhFiuTOR1eTm6kCgHdwsdeccgyc5QB8FNiUmMux/pnbtTeFBRZ/1RmCt7XcvKuGKgFbKHpthyC/GzAAveEVrnLnJio6712kwqIzJfSnpMqyl1DGb/GmfW8w944YxpSXwJn8CKq/e9qjYZtVu1E9NJBcxIVryWU1bxn7ve4ULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405196; c=relaxed/simple;
	bh=1cMBg1kVM/fQRmYnr56GCHmoZH/jPvuwhj4spL6IdbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMfUiLCA4OC4/taSUb2SrL6tIrzsCZAEHw7Xbsio4afhcsd2q1V/4me2PnX07X/7InGppJCImsKa8qi6lQymx+YJFlEU5ZvhS6FQYS382UPRErdM+thAGA/AeeASFNFCiMmmnHcSv/pXoH5GalSV6KPm/oaOnHCHpuav6D11Vpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=ekGEdWPc; arc=none smtp.client-ip=194.152.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id 4W1DsY1n2QzMkxv;
	Sat, 15 Jun 2024 01:46:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1718405185; x=1718406985;
	bh=1cMBg1kVM/fQRmYnr56GCHmoZH/jPvuwhj4spL6IdbU=;
	h=From:To:Cc:Subject:Date:Message-ID:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=ekGEdWPci2tBDgJ8aUUr0AXwdma5hyHNCTEyCb0zDiU42WJqGIIc5q6UQoNF6I2hf
	 ORXCoECkDK4NZgmoEncCD3x9U9K7eFxsKg1ShtGzZ4ec4FvNjbQfY92M9frNzpS9ow
	 IkFR635ezbNS/cidJJbMKBDz/eP48u3WC4XtsOCQ=
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4W1DsY1j38zMkxx;
	Sat, 15 Jun 2024 01:46:25 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4W1DsX4V87zMkxv;
	Sat, 15 Jun 2024 01:46:24 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry Smirnov <d.smirnov@inbox.lv>
Subject: [PATCH V4] usb: serial: Fix mos7840 hangup on resume
Date: Sat, 15 Jun 2024 01:45:56 +0300
Message-ID: <20240614224556.23215-1-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: AJ2EQ3gemHpAsMa6KZgOlO7m2qXNWxp8/Sbmvc49lRRFz9PMu91reWaLGobnBwO9bg==

This patch addresses a kernel hang issue with the mos7840 driver when
PC resuming from a suspend with a device connected to the serial port.

This patch introduces two new functions: mos7840_suspend() and mos7840_resume().

Tested with Delock 87414 USB 2.0 to 4x serial adapter.

Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
---
V4: Removed debug prints
V3: Code cleanup
V2: Reworked mos7840_suspend() based on comments from reviewer
V1: Initial version

 drivers/usb/serial/mos7840.c | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 8b0308d84270..2f4b2c8f4a48 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -1737,6 +1737,52 @@ static void mos7840_port_remove(struct usb_serial_port *port)
 	kfree(mos7840_port);
 }
 
+static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
+{
+	struct moschip_port *mos7840_port;
+	struct usb_serial_port *port;
+	int i;
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
+
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
@@ -1764,6 +1810,8 @@ static struct usb_serial_driver moschip7840_4port_device = {
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


