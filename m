Return-Path: <linux-usb+bounces-11052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D23901895
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 01:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF8BC1C20A21
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 23:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2667544C8F;
	Sun,  9 Jun 2024 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="g93hKHg2"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark1.inbox.lv (shark1.inbox.lv [194.152.32.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFAA208AD
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717974062; cv=none; b=EbQn3oaheamhO7p4cV2Ay/fhNiU7INFQrncshWlG0RvqW19nlEwImr+S2caFcf6hqAlSNjQyyeK9lKREVrlazpJCMPnAyea3IzQHh7DRjQbCg8JUVgBuUOooRGh5lOXZTERu5FWI5d8kz4iVsvcOMxpNQ5I02+v9YrAUjLPPYvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717974062; c=relaxed/simple;
	bh=Ix3neKdGrLymLxKdnn5URp23JMl+qKf74DUlokJocsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjLtsKi/HZn05U8cuOtBUZCIq/7f4JMMCEDODofNNn/9iwdtVl3A9kq93IbKKivyASqSBpp1d8ro4gOxjMlL5ZvxGAtvs9fupXUqps3Kw6sEm4xiGyidDF4FAddrIvNz6RKV2ISPTkcL+aFwNT84JURLve+3wRffmXsy5TJlwfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=g93hKHg2; arc=none smtp.client-ip=194.152.32.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id 4Vy9QX44Jhz2d6Hk;
	Mon, 10 Jun 2024 02:00:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1717974052; x=1717975852;
	bh=Ix3neKdGrLymLxKdnn5URp23JMl+qKf74DUlokJocsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=g93hKHg2xFH0sS0EPuqELUXYqmZtsuXUl/6TF7AanBFE+QrY0sr+7A6U3tf5nuGgX
	 N12aqcXmj77FHIZOMER3/uzitipsyuGd3/bVex0pfiWv78rYHfi9S517D9+xDCy4cf
	 NX9ugtjSheHj+rNZFPJ3ZHOEDeU/gDZpTzsbxfu0=
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 4Vy9QX3Vh2z2d6Gg;
	Mon, 10 Jun 2024 02:00:52 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry Smirnov <d.smirnov@inbox.lv>
Subject: [PATCH V2 1/1] usb: mos7840: Fix hangup after resume
Date: Mon, 10 Jun 2024 01:58:50 +0300
Message-ID: <20240609225850.3900-2-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240609225850.3900-1-d.smirnov@inbox.lv>
References: <20240609225850.3900-1-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: EZeEAiZdmGUky828N+YY6uLlxdewUFIluSXmt9094XFHv7rfstx9bm6RB/ecFH7fbg==

Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
---
V1 -> V2: Addressed review comments

 drivers/usb/serial/mos7840.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 8b0308d84270..30c5b09a4409 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -1737,6 +1737,54 @@ static void mos7840_port_remove(struct usb_serial_port *port)
 	kfree(mos7840_port);
 }
 
+static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
+{
+	struct moschip_port *mos7840_port;
+	struct usb_serial_port *port;
+	int i;
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
+
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
@@ -1764,6 +1812,8 @@ static struct usb_serial_driver moschip7840_4port_device = {
 	.port_probe = mos7840_port_probe,
 	.port_remove = mos7840_port_remove,
 	.read_bulk_callback = mos7840_bulk_in_callback,
+	.suspend = mos7840_suspend,
+	.resume = mos7840_resume,
 };
 
 static struct usb_serial_driver * const serial_drivers[] = {
-- 
2.45.1


