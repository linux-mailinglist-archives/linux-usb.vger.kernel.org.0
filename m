Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F92A21880E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgGHMu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:28 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41120 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729171AbgGHMu0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id c11so26809309lfh.8
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hp3xiyJAieOb8cYFgJCXpGWGvgBzWdf1lRPZkYORU04=;
        b=K8MSfybsX/yCbrJIngkwrCuU9bFLYhsvYAEMiQuBgddYvbTklYABSXEPj0LXgvYmmo
         18g6OXagYfHEIN08F2xrybdFg+czyq/2WGcvGJ/S76OsbJWphZHOL1aPNyQU2m3GnJQZ
         fOqhPY6B+/WumGoxspzc2+dWUsfNt7SLanmm98/Omgm55ulZ0DHExLmsv09e9GHnk5+x
         k9VnSZwUBJFsU7clHAm8ZKEMbgnywaZ98rwCIRMpCB2UV43WgCojeOeITmeEkCW61yxE
         2CqZDCPZVNuWPyQKeF+TgtcSy3vz0AA6jC0DkhyUJ8LS5M1aEf7Mal1RCqvC023SNQV5
         ju3A==
X-Gm-Message-State: AOAM530hrZd7NFvnvoosvzz4j4SUdky2K/9I/wwJ5wWM21GyvJszsryt
        EmSO6vqt6Y+tzuqc4JCmHLuzbmbsW9U=
X-Google-Smtp-Source: ABdhPJyjqoPReKVjx6iKkgNGe7Wlwcv/jxK0h1j34HR2tv3eyq+0WK0eSWhVmLQmoZ1GiFH9HMr7Cw==
X-Received: by 2002:a19:f20a:: with SMTP id q10mr36784632lfh.89.1594212622845;
        Wed, 08 Jul 2020 05:50:22 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m14sm13400875lfp.18.2020.07.08.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00046G-Ql; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 10/10] USB: serial: drop redundant transfer-buffer casts
Date:   Wed,  8 Jul 2020 14:50:00 +0200
Message-Id: <20200708125000.15659-11-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop redundant URB transfer-buffer casts.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/aircable.c | 2 +-
 drivers/usb/serial/ftdi_sio.c | 2 +-
 drivers/usb/serial/generic.c  | 2 +-
 drivers/usb/serial/option.c   | 3 +--
 drivers/usb/serial/sierra.c   | 3 +--
 drivers/usb/serial/ssu100.c   | 2 +-
 6 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/aircable.c b/drivers/usb/serial/aircable.c
index 84d52953dd0a..a1df686c3066 100644
--- a/drivers/usb/serial/aircable.c
+++ b/drivers/usb/serial/aircable.c
@@ -117,7 +117,7 @@ static int aircable_process_packet(struct usb_serial_port *port,
 static void aircable_process_read_urb(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	char *data = (char *)urb->transfer_buffer;
+	char *data = urb->transfer_buffer;
 	int has_headers;
 	int count;
 	int len;
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index ade68405b015..871cdccf3a5f 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2584,7 +2584,7 @@ static void ftdi_process_read_urb(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
-	char *data = (char *)urb->transfer_buffer;
+	char *data = urb->transfer_buffer;
 	int i;
 	int len;
 	int count = 0;
diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index e60f74f11acc..d10aa3d2ee49 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -345,7 +345,7 @@ EXPORT_SYMBOL_GPL(usb_serial_generic_submit_read_urbs);
 void usb_serial_generic_process_read_urb(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	char *ch = (char *)urb->transfer_buffer;
+	char *ch = urb->transfer_buffer;
 	int i;
 
 	if (!urb->actual_length)
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 254a8bbeea67..8e74903352e7 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2151,8 +2151,7 @@ static void option_instat_callback(struct urb *urb)
 	dev_dbg(dev, "%s: urb %p port %p has data %p\n", __func__, urb, port, portdata);
 
 	if (status == 0) {
-		struct usb_ctrlrequest *req_pkt =
-				(struct usb_ctrlrequest *)urb->transfer_buffer;
+		struct usb_ctrlrequest *req_pkt = urb->transfer_buffer;
 
 		if (!req_pkt) {
 			dev_dbg(dev, "%s: NULL req_pkt\n", __func__);
diff --git a/drivers/usb/serial/sierra.c b/drivers/usb/serial/sierra.c
index e8b130157b57..a862aa788a19 100644
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@ -570,8 +570,7 @@ static void sierra_instat_callback(struct urb *urb)
 		urb, port, portdata);
 
 	if (status == 0) {
-		struct usb_ctrlrequest *req_pkt =
-				(struct usb_ctrlrequest *)urb->transfer_buffer;
+		struct usb_ctrlrequest *req_pkt = urb->transfer_buffer;
 
 		if (!req_pkt) {
 			dev_dbg(&port->dev, "%s: NULL req_pkt\n",
diff --git a/drivers/usb/serial/ssu100.c b/drivers/usb/serial/ssu100.c
index 01472b96bf38..7d39d35e52a1 100644
--- a/drivers/usb/serial/ssu100.c
+++ b/drivers/usb/serial/ssu100.c
@@ -495,7 +495,7 @@ static void ssu100_update_lsr(struct usb_serial_port *port, u8 lsr,
 static void ssu100_process_read_urb(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	char *packet = (char *)urb->transfer_buffer;
+	char *packet = urb->transfer_buffer;
 	char flag = TTY_NORMAL;
 	u32 len = urb->actual_length;
 	int i;
-- 
2.26.2

