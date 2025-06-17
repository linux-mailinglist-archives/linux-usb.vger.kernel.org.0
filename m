Return-Path: <linux-usb+bounces-24819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59342ADC136
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 07:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE023173F27
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 05:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A57B23ED5E;
	Tue, 17 Jun 2025 05:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QtriyEwb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A60523B63E
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136932; cv=none; b=pLe8ZkG70+XKLywkadaPmUbF7kp+M+oe0CCK4zto33dU2nUcs2JYEZflN68unNMRNDOls+gWliG+dULgVC6gID77rQtuEsVwhc6gAI3jbADoa2Lm1/Eq0j8IYb5F0THp7Prbf/mybg59Tvw9o8CwdxQB/O2MarE4OigVEjg2Gk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136932; c=relaxed/simple;
	bh=+7dQxfUhGAy4SS1ZpusUklS9/5+phcCn7k7KJyX8YGk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t3As310OA4hWt2gppKqbHGZUv+JOZ2GLN8ihQ1+Np7G3hV3soZZUkhHw3WDRrH4BOfixhQ2D9yX2Hz640R3+1HxzSVuAc7CWpdhJJ/fWV4ux2o0TbaEy8INPg5F9DjtPzc2tbHcJ3LtDR+mgRbER/oa8TA54d7PRm4N7v6AMjCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QtriyEwb; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-32b4a06b780so11682701fa.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 22:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750136928; x=1750741728; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i4dXhN7ywt5V6z7FHvJ0Inv2dYG936KTwLKv+c4EnAc=;
        b=QtriyEwboByUju6vVYF/5SO9P9TVo30yx270KgBvhSwB4IrkQNlaLH/aQqhuBa9UyA
         n7FkFTpgdrLLWEwGnZLPjtofqNHcUAKEa4GikOlYxi7jFlvF67Rpvvil1kIoL8Y897VN
         4KkzMwnU0rcu2TE+h3mX1WRP1OaLXMguKc++S9wWuqC4OYvhcOAFJYm7Wfa5bWNo54Fv
         Pjs9znkUitRXmbVHfyGDiEeWC/9Bk82eyzJxYUQwPUOqCoe1dmyMRzN4SKWEPvlGo7Bm
         8dkrYcbOkvD61RIneuLbrV98CFapRgaFcXevo3SG0ds3dZwi3+aLHNKd5pbgGAgX6fb/
         jYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136928; x=1750741728;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4dXhN7ywt5V6z7FHvJ0Inv2dYG936KTwLKv+c4EnAc=;
        b=evXC4UiFHN53ERA+rEbQx6dMQAIT1aY0dg0RAcRlbMILNZdYLm7YjVnv4jlEyVeCFM
         9m1RZoqRNp19wHCqBpNPVxyA2cDCurId3etSnqOA3u43WDf3/Ktaj8cl6s/nTdQy+nRU
         tWT2MyYRzUw1G7aEAcduhyhzNgCsuALaKcjS4GPwVadMxsYYS4yjZFgeQx5UNJiyveii
         /x1Ad2NrK3Cq/arbOobJKXwbJD+SMHd54taExUIabhbO0EmWzDwSg7h3BfgeYP6T+540
         CKFcqycvRUne8jESY+9/4DpBhTMFwkfp6n3RG5Og81QEPI+oyYhW3yAj1QGnlPtbpw+O
         Dc7w==
X-Gm-Message-State: AOJu0Yzsqj3TLT9HEZ58p0gJ1K7ymHkjgGEHRY4/dGAaJY3YnIMeaHGf
	y16BlAXn1jVrMD/FgjfE3X+w61CPke16j/0XmIWqbjbBSVgZeTuciRIyv/4w0sjPyaKOL0L5C0I
	1SQk7XQ==
X-Google-Smtp-Source: AGHT+IH4I8plCvioKdZPJMsYCNlKjSMJlVrKTpGxX4/Kq8vkc4UpNbDk8MhbJk4PV7yT/LvA0ujCcpLOmy4=
X-Received: from ljbq21.prod.google.com ([2002:a2e:a015:0:b0:32b:3deb:7b97])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:b20:b0:32a:847c:a1c0
 with SMTP id 38308e7fff4ca-32b4a0c5893mr29872581fa.6.1750136928270; Mon, 16
 Jun 2025 22:08:48 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:07:11 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250617050844.1848232-1-khtsai@google.com>
Subject: [PATCH v2 1/2] Revert "usb: gadget: u_serial: Add null pointer check
 in gs_start_io"
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, prashanth.k@oss.qualcomm.com, 
	khtsai@google.com, hulianqin@vivo.com, krzysztof.kozlowski@linaro.org, 
	mwalle@kernel.org, jirislaby@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This reverts commit ffd603f214237e250271162a5b325c6199a65382.

Commit ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in
gs_start_io") adds null pointer checks at the beginning of the
gs_start_io() function to prevent a null pointer dereference. However,
these checks are redundant because the function's comment already
requires callers to hold the port_lock and ensure port.tty and port_usb
are not null. All existing callers already follow these rules.

The true cause of the null pointer dereference is a race condition. When
gs_start_io() calls either gs_start_rx() or gs_start_tx(), the port_lock
is temporarily released for usb_ep_queue(). This allows port.tty and
port_usb to be cleared.

Fixes: ffd603f21423 ("usb: gadget: u_serial: Add null pointer check in gs_start_io")
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
v2:
- Remove Cc: stable

---
 drivers/usb/gadget/function/u_serial.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index ab544f6824be..c043bdc30d8a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -544,20 +544,16 @@ static int gs_alloc_requests(struct usb_ep *ep, struct list_head *head,
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
--
2.50.0.rc2.692.g299adb8693-goog


