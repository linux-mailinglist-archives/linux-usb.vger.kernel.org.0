Return-Path: <linux-usb+bounces-4127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922F8119CF
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A43A1C21177
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D713A28B;
	Wed, 13 Dec 2023 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syOCzR1p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D550D2FC42
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5E0C433C8;
	Wed, 13 Dec 2023 16:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485787;
	bh=9MqdC0Lzr8nJH/eweGgenOuSKTiqYwlElEoxJCh++2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=syOCzR1pFzH6D78Dms52k+7u8KamuzCVKnFQiO5Xo26CVrAFAO2+yMZ+w38Uo7IH3
	 Nl8bBxSJkTZ7cXOnuEhB0qQRuqJCUwul3a+s68hHqAVWntZ7ty0z2vPUgkM8YzyX/p
	 3+segpEX4C+XG5uJNn6EVnR2s4jWMjGl2mUPfLLr61dUw1idHZcHnCML4f1sW8Z9MB
	 +jRGViIAwsHHD4PQs297yiEESHK7GKem8ZDn6hs6Fnyw79k02glVgxON0VgLIFlUSq
	 En4wZ6/hxapsnOQOnlVhNfEvp6/7D+9nlZrxzfEbApLtlKdHCkAIgW8pDA69nX2za0
	 +hEiemazLugsw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/12] usb: gadget: udc: atmel: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:34 +0000
Message-ID: <20231213164246.1021885-6-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Cristian Birsan <cristian.birsan@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 02b1bef5e22e2..b76885d78e8a7 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -94,7 +94,7 @@ static ssize_t queue_dbg_read(struct file *file, char __user *buf,
 
 	inode_lock(file_inode(file));
 	list_for_each_entry_safe(req, tmp_req, queue, queue) {
-		len = snprintf(tmpbuf, sizeof(tmpbuf),
+		len = scnprintf(tmpbuf, sizeof(tmpbuf),
 				"%8p %08x %c%c%c %5d %c%c%c\n",
 				req->req.buf, req->req.length,
 				req->req.no_interrupt ? 'i' : 'I',
@@ -104,7 +104,6 @@ static ssize_t queue_dbg_read(struct file *file, char __user *buf,
 				req->submitted ? 'F' : 'f',
 				req->using_dma ? 'D' : 'd',
 				req->last_transaction ? 'L' : 'l');
-		len = min(len, sizeof(tmpbuf));
 		if (len > nbytes)
 			break;
 
-- 
2.43.0.472.g3155946c3a-goog


