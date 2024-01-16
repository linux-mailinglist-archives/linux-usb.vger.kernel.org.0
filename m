Return-Path: <linux-usb+bounces-5112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A444C82F067
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 15:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E53A285B7F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 14:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B8F1BF21;
	Tue, 16 Jan 2024 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ST+tFi/j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCCA1BDF0
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2ccaf8667f9so80295541fa.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 06:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705414720; x=1706019520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cakF87CadgCIOgMCOG5EwBp6+8GtSy9HpPwc++zV4Aw=;
        b=ST+tFi/j4TY+OOWbSSHf3Mm7LvUHvrs8FSG1j+qlmzn7q0VLhdc9BYHrhApvA+acHb
         dZjXNDDS2ARz2XAnauAN1cslh6Xy8zfFH4QrPfXC8MbwMVuXIsKJWJOVRrU9eqV38C52
         C8apA1q+bc8lXq0qdC2ipZx5qoJ8so1qW5BtdlobgxgMRV52eyayEonCQRWeIvjNnydx
         KnJkjNlYhpDGIiBzW9sky3uvl8zwMrbZKHbhicch6sEu5u4c9mYX1HLS+XHdu9Vr3pkV
         RzrPdPPKfipNwnCXRxftZmuUE/JQSAz+hNRZxZ+FwISftV9hAPBUzUdoBsq36UEfWRbm
         tu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705414720; x=1706019520;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cakF87CadgCIOgMCOG5EwBp6+8GtSy9HpPwc++zV4Aw=;
        b=AORi7XeR8Usnl67DWjgj7UajZcipsS/Efo6f5YYw746VJehd6OeJhOJ8klp4UcIyMc
         0HpIn+P6VRn5BW6omJwLHUXNSim1bsHG0tqZCQfI2klGGFjtwMMfqD1IJUQnIozNVxlc
         XGYhzkzwuttSrDduDVDoy6dHELBkUD0gEfE5mpWM8ePdk35cAzactJRNEuD4XqZYd8pN
         dhht4wooDsirmigzNuafPEeQWxm6wgeXBuuChJ/0nuXpnf52Bz0C6X2ZxzXHsOUta/RD
         2JpVNFcW5r32YTWI4kqaPlW3Y6rUogJhjCE6fi55O/O8a5qwkXYgqlsV20DreYcdjL64
         jU8A==
X-Gm-Message-State: AOJu0Yw8MqKiyc6pVHzqCO2E0Nx/yOrXYKlurUdLHnIX1HI9pQTi2qHk
	J9Zva0jKApbQQZYNiyaIcq9akM4JC6O6IJf3Hg==
X-Google-Smtp-Source: AGHT+IHCvq//e0n+7yiArRVI/iVOEbDs4vwkpKIx4neEAk9pynG5pMexDdUPZmZ3F37zts1U7xT8AZQIzEo=
X-Received: from khtsai-large-gcloudtop.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:289])
 (user=khtsai job=sendgmr) by 2002:a2e:bb86:0:b0:2cd:b310:f5a6 with SMTP id
 y6-20020a2ebb86000000b002cdb310f5a6mr8054lje.5.1705414720418; Tue, 16 Jan
 2024 06:18:40 -0800 (PST)
Date: Tue, 16 Jan 2024 22:16:17 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240116141801.396398-1-khtsai@google.com>
Subject: [PATCH] usb: gadget: u_serial: Add null pointer checks after RX/TX submission
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, quic_prashk@quicinc.com, jirislaby@kernel.org, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in
gs_start_io") adds null pointer checks to gs_start_io(), but it doesn't
fully fix the potential null pointer dereference issue. While
gserial_connect() calls gs_start_io() with port_lock held, gs_start_rx()
and gs_start_tx() release the lock during endpoint request submission.
This creates a window where gs_close() could set port->port_tty to NULL,
leading to a dereference when the lock is reacquired.

This patch adds a null pointer check for port->port_tty after RX/TX
submission, and removes the initial null pointer check in gs_start_io()
since the caller must hold port_lock and guarantee non-null values for
port_usb and port_tty.

Fixes: ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in gs_start_io")
Cc: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Explanation:
    CPU1:                            CPU2:
    gserial_connect() // lock
                                     gs_close() // await lock
    gs_start_rx()     // unlock
    usb_ep_queue()
                                     gs_close() // lock, reset port_tty and unlock
    gs_start_rx()     // lock
    tty_wakeup()      // dereference

Stack traces:
[   51.494375][  T278] ttyGS1: shutdown
[   51.494817][  T269] android_work: sent uevent USB_STATE=DISCONNECTED
[   52.115792][ T1508] usb: [dm_bind] generic ttyGS1: super speed IN/ep1in OUT/ep1out
[   52.516288][ T1026] android_work: sent uevent USB_STATE=CONNECTED
[   52.551667][ T1533] gserial_connect: start ttyGS1
[   52.565634][ T1533] [khtsai] enter gs_start_io, ttyGS1, port->port.tty=0000000046bd4060
[   52.565671][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
[   52.591552][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
[   52.619901][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
[   52.638659][ T1325] [khtsai] gs_close, lock port ttyGS1
[   52.656842][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) ...
[   52.683005][ T1325] [khtsai] gs_close, clear ttyGS1
[   52.683007][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) done!
[   52.708643][ T1325] [khtsai] gs_close, unlock port ttyGS1
[   52.747592][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
[   52.747616][ T1533] [khtsai] gs_start_io, ttyGS1, going to call tty_wakeup(), port->port.tty=0000000000000000
[   52.747629][ T1533] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001f8
---
 drivers/usb/gadget/function/u_serial.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index a92eb6d90976..2f1890c8f473 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -539,20 +539,16 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
 static int gs_start_io(struct gs_port *port)
 {
 	struct list_head	*head = &port->read_pool;
-	struct usb_ep		*ep;
+	struct usb_ep		*ep = port->port_usb->out;
 	int			status;
 	unsigned		started;

-	if (!port->port_usb || !port->port.tty)
-		return -EIO;
-
 	/* Allocate RX and TX I/O buffers.  We can't easily do this much
 	 * earlier (with GFP_KERNEL) because the requests are coupled to
 	 * endpoints, as are the packet sizes we'll be using.  Different
 	 * configurations may use different endpoints with a given port;
 	 * and high speed vs full speed changes packet sizes too.
 	 */
-	ep = port->port_usb->out;
 	status = gs_alloc_requests(ep, head, gs_read_complete,
 		&port->read_allocated);
 	if (status)
@@ -569,12 +565,22 @@ static int gs_start_io(struct gs_port *port)
 	port->n_read = 0;
 	started = gs_start_rx(port);

+	/*
+	 * The TTY may be set to NULL by gs_close() after gs_start_rx() or
+	 * gs_start_tx() release locks for endpoint request submission.
+	 */
+	if (!port->port.tty)
+		goto out;
+
 	if (started) {
 		gs_start_tx(port);
 		/* Unblock any pending writes into our circular buffer, in case
 		 * we didn't in gs_start_tx() */
+		if (!port->port.tty)
+			goto out;
 		tty_wakeup(port->port.tty);
 	} else {
+out:
 		gs_free_requests(ep, head, &port->read_allocated);
 		gs_free_requests(port->port_usb->in, &port->write_pool,
 			&port->write_allocated);
--
2.43.0.275.g3460e3d667-goog


