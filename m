Return-Path: <linux-usb+bounces-10912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA498FD43F
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 19:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F0A2857F6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 17:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646BB13A88A;
	Wed,  5 Jun 2024 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="b3c32LE+"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark1.inbox.lv (shark1.inbox.lv [194.152.32.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9D621
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717609453; cv=none; b=Za5se9n8LrRFKXtJZiFGoAa3PgHGTkbfqHkFzNF1EfeJc/4ahS4goehLOHM4liafF4hEXuFaU32zBxxX47tmP2FXRvY0O5ekQXb4xroORPTK/N+hWQ035Zdv5y3G63LryWUyJMDcWIyajVg9jnVyjTRvGNi2mWecdi3a2DJ+w6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717609453; c=relaxed/simple;
	bh=GJn/xA6s1+S1gr4PC0gOF49LsFKmnQcWpi3zDjUFMiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgDDvxs2aMpNBokOTw8c8TVC+xlyP5cqk25Ekwn4U3PE72L9sY9WbgDPwXH/skJZAHX1UVU/bovXrAqSdc3luhxMfK31KaIqWW9vJRClzIT0Bt8oTGdP8hSqJVYbHdUXdUl9BQ91BS/XYS/PGgs+e58rgsoJG+AamrbwpBegAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=b3c32LE+; arc=none smtp.client-ip=194.152.32.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id 4VvZZx2Jthz2d6LK;
	Wed,  5 Jun 2024 20:44:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1717609449; x=1717611249;
	bh=GJn/xA6s1+S1gr4PC0gOF49LsFKmnQcWpi3zDjUFMiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=b3c32LE+eCdkW2TvEzLgygjcyLDf41ibQZWSiEMcv6sVwrQILXSHqCBbG6H6Qf29j
	 BZZnH+q11zua1hd1M0m9guRMRjEccj/Tc0+K9/j90Wh6kQsD9YlEM7wZCdHKVgQ1w5
	 qt+bU4Hg7Y+adlLEedwG+RbOszCV6G7GW5dfZF/4=
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 4VvZZx1mNYz2d6L9;
	Wed,  5 Jun 2024 20:44:09 +0300 (EEST)
From: Dmitry <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry <d.smirnov@inbox.lv>
Subject: [PATCH] usb: serial: Fix mos7840 hangup when resuming from standby
Date: Wed,  5 Jun 2024 20:44:01 +0300
Message-ID: <20240605174401.3193-1-d.smirnov@inbox.lv>
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
X-ESPOL: EZeEAiZdmGUky828N/0M6uvn2N+6SFshtTn7yqFDmn8l0K+jx9N0cWyUGILnHwa7bg==

---
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


