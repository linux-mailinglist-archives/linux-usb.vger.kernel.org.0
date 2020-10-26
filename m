Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64199298A9E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 11:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770549AbgJZKoV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 06:44:21 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40323 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1770474AbgJZKoU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 06:44:20 -0400
Received: by mail-lf1-f67.google.com with SMTP id a9so11089989lfc.7
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2020 03:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5nQGBEo6WnGmY70V9OEGPXD9lZtlK7VXKW0lBEZmms=;
        b=azg2CM3AmOXeB2O4h9sBVIjhBrwuy9UcUoc6fDWL/Eeh1xq2FyJ3iqhalgYMRbaIaT
         5fkCBcBw8sRU9O+T72lSCuomsMtHfJWcReH2UdhtWflZf8nbvd8hXtzcZXaie1zaKLQi
         CGTdEYkH2zxZvn/br1HZyPb5wiUfMNHfl5X3CrewOGrs2DS/NoweddI6HLQS09yHxLAu
         hcPvDLJLoOBVrrcp9lHooBgv86TR75GJwQZoAHqYzx6Eg2ciFtyKg3zMEY3/lleh1azl
         q4f6aWkh2l9q/tPEBsiAsKrtwcwMjUrjY9f3y0vBw3udxt10795vAvf8nFusSBHGN/hd
         bXhg==
X-Gm-Message-State: AOAM530nveb5M2Ozay7yaiTMTDZAlvhRbZIes5tk5UZ7PsBejqFaRtvy
        AgEXtK+HLUWZQjSO4+ixpDRSWWPxHoaMWQ==
X-Google-Smtp-Source: ABdhPJxOART8R5yfBVg8yCst13dMFwcsnlfd61pcvwaMX+EI4mCuiyeOhhMWZ9M0FatIat1Se4n2ig==
X-Received: by 2002:a19:740d:: with SMTP id v13mr4356835lfe.3.1603709058508;
        Mon, 26 Oct 2020 03:44:18 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v17sm1134904ljj.19.2020.10.26.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 03:44:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kWzzD-0007jR-Sz; Mon, 26 Oct 2020 11:44:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: remove write wait queue
Date:   Mon, 26 Oct 2020 11:44:21 +0100
Message-Id: <20201026104421.29680-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The digi_acceleport driver is the only driver still using the port
write wake queue so move it to that driver's port data.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 12 ++++++------
 include/linux/usb/serial.h           |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 0d606fa9fdca..7ae8f9813296 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -197,6 +197,7 @@ struct digi_port {
 	int dp_throttle_restart;
 	wait_queue_head_t dp_flush_wait;
 	wait_queue_head_t dp_close_wait;	/* wait queue for close */
+	wait_queue_head_t write_wait;
 	struct usb_serial_port *dp_port;
 };
 
@@ -381,7 +382,7 @@ static int digi_write_oob_command(struct usb_serial_port *port,
 	while (count > 0) {
 		while (oob_priv->dp_write_urb_in_use) {
 			cond_wait_interruptible_timeout_irqrestore(
-				&oob_port->write_wait, DIGI_RETRY_TIMEOUT,
+				&oob_priv->write_wait, DIGI_RETRY_TIMEOUT,
 				&oob_priv->dp_port_lock, flags);
 			if (interruptible && signal_pending(current))
 				return -EINTR;
@@ -444,7 +445,7 @@ static int digi_write_inb_command(struct usb_serial_port *port,
 		while (priv->dp_write_urb_in_use &&
 		       time_before(jiffies, timeout)) {
 			cond_wait_interruptible_timeout_irqrestore(
-				&port->write_wait, DIGI_RETRY_TIMEOUT,
+				&priv->write_wait, DIGI_RETRY_TIMEOUT,
 				&priv->dp_port_lock, flags);
 			if (signal_pending(current))
 				return -EINTR;
@@ -523,7 +524,7 @@ static int digi_set_modem_signals(struct usb_serial_port *port,
 	while (oob_priv->dp_write_urb_in_use) {
 		spin_unlock(&port_priv->dp_port_lock);
 		cond_wait_interruptible_timeout_irqrestore(
-			&oob_port->write_wait, DIGI_RETRY_TIMEOUT,
+			&oob_priv->write_wait, DIGI_RETRY_TIMEOUT,
 			&oob_priv->dp_port_lock, flags);
 		if (interruptible && signal_pending(current))
 			return -EINTR;
@@ -984,7 +985,7 @@ static void digi_write_bulk_callback(struct urb *urb)
 		dev_dbg(&port->dev, "digi_write_bulk_callback: oob callback\n");
 		spin_lock_irqsave(&priv->dp_port_lock, flags);
 		priv->dp_write_urb_in_use = 0;
-		wake_up_interruptible(&port->write_wait);
+		wake_up_interruptible(&priv->write_wait);
 		spin_unlock_irqrestore(&priv->dp_port_lock, flags);
 		return;
 	}
@@ -1217,10 +1218,9 @@ static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
 	init_waitqueue_head(&priv->dp_transmit_idle_wait);
 	init_waitqueue_head(&priv->dp_flush_wait);
 	init_waitqueue_head(&priv->dp_close_wait);
+	init_waitqueue_head(&priv->write_wait);
 	priv->dp_port = port;
 
-	init_waitqueue_head(&port->write_wait);
-
 	usb_set_serial_port_data(port, priv);
 
 	return 0;
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 8e67eff9039f..1c09b922f8b0 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -62,7 +62,6 @@
  * @bulk_out_endpointAddress: endpoint address for the bulk out pipe for this
  *	port.
  * @flags: usb serial port flags
- * @write_wait: a wait_queue_head_t used by the port.
  * @work: work queue entry for the line discipline waking up.
  * @dev: pointer to the serial device
  *
@@ -108,7 +107,6 @@ struct usb_serial_port {
 	int			tx_bytes;
 
 	unsigned long		flags;
-	wait_queue_head_t	write_wait;
 	struct work_struct	work;
 	unsigned long		sysrq; /* sysrq timeout */
 	struct device		dev;
-- 
2.26.2

