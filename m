Return-Path: <linux-usb+bounces-4130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D7D8119D6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6062827D9
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78B439FC5;
	Wed, 13 Dec 2023 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EutNB+zN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD0364D4
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53F6C433CA;
	Wed, 13 Dec 2023 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485793;
	bh=Xx02t9tpORoHITkBD1x5P/vBMElFrxoGnWnTgr1OD4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EutNB+zNKO4N/VpzUrYjbCv+FL+7uqhHDzbhfhdf6kUFBBoU5zCuXwircAdOnN7N2
	 F20tPDI/AsLUekafvAm+A9k9bs97hk0Pixjq6liQaUVHRlvCPCLnvOWT16e31KTXku
	 fR/Kus4TFXB95ldUvG2CW9kh8lu9/klGDgsXea8v9vt9WiaSvSDq6t6C6yt5kO8v0p
	 7qtPahEkz8yk9Q88FAuc3o7gIUTYrDTW82I+FTRbWNJ1gD8tUSKuKeA+5xOiJIpi3Y
	 S4wEsePZQrGp4Rwj9YHpWQbbS52vKg8vIFzgXX+VdthuUy5A9xqJIAQkMRF6+jrRBo
	 vmK+bIWyD6TXg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Subject: [PATCH 08/12] usb: yurex: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:37 +0000
Message-ID: <20231213164246.1021885-9-lee@kernel.org>
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

Whilst we're at it, let's define some magic numbers to increase
readability and ease of maintenance.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/misc/yurex.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
index c640f98d20c54..5a13cddace0e6 100644
--- a/drivers/usb/misc/yurex.c
+++ b/drivers/usb/misc/yurex.c
@@ -34,6 +34,8 @@
 #define YUREX_BUF_SIZE		8
 #define YUREX_WRITE_TIMEOUT	(HZ*2)
 
+#define MAX_S64_STRLEN 20 /* {-}922337203685477580{7,8} */
+
 /* table of devices that work with this driver */
 static struct usb_device_id yurex_table[] = {
 	{ USB_DEVICE(YUREX_VENDOR_ID, YUREX_PRODUCT_ID) },
@@ -401,7 +403,7 @@ static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
 {
 	struct usb_yurex *dev;
 	int len = 0;
-	char in_buffer[20];
+	char in_buffer[MAX_S64_STRLEN];
 	unsigned long flags;
 
 	dev = file->private_data;
@@ -412,14 +414,14 @@ static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
 		return -ENODEV;
 	}
 
+	if (WARN_ON_ONCE(dev->bbu > S64_MAX || dev->bbu < S64_MIN))
+		return -EIO;
+
 	spin_lock_irqsave(&dev->lock, flags);
-	len = snprintf(in_buffer, 20, "%lld\n", dev->bbu);
+	scnprintf(in_buffer, MAX_S64_STRLEN, "%lld\n", dev->bbu);
 	spin_unlock_irqrestore(&dev->lock, flags);
 	mutex_unlock(&dev->io_mutex);
 
-	if (WARN_ON_ONCE(len >= sizeof(in_buffer)))
-		return -EIO;
-
 	return simple_read_from_buffer(buffer, count, ppos, in_buffer, len);
 }
 
-- 
2.43.0.472.g3155946c3a-goog


