Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9D94C22D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 22:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfFSUQw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 16:16:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36524 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfFSUQw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 16:16:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so249819pfl.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TzUzV2eKQyMcYm5HLfHwiWnF51mANN0MFV6DvEYgYrM=;
        b=NSmdkrrLgsD6jcsQJDzXGra6/QKUZ+ifFJIzqKg0PuHpMEjcqxX6bUNBcWnhnpAruG
         cl7hOich11HaXxFJbkulg6adH0NTph4OPckJ/86JtO8wg2KtIlHhCGoLgxMThIOn3Nqi
         w3jzQ9uGN8WnTTxGBG6DxlPDK4Zg8B+CBjKNaW0XH5IJmcn27zr6pnyqDVaMmKakzToL
         A/uDKym23NlWOLbXCX0STYBb+b7BnTL96q2pXiTUdZdzxldZWjyFHEVvAU1LOvYSvOoS
         9blx7Nkn2k3+u0E0mVp7DHDeN8U/DxaNtYbP0CKflDA+PGT3eMO6FIM83DoBxml9wwcT
         B3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=TzUzV2eKQyMcYm5HLfHwiWnF51mANN0MFV6DvEYgYrM=;
        b=rjtEp5r+vE6axsRp1Zhi3z1eqIekH0W8UpKBLEKS4zzX3KhsLzN1thnRs6aDYa0W+j
         OZx3a6tIln9zqll4c+YRse0ChqyfeZmM3EgFG3fo+I6Ds5PsRGEOdDS2TgkFaBE7fg6A
         TRqI5l5XfrLb/WxH11BfY3lizDkskZLRW80R/f/L8P+XKGVhJj0FECEvOZ2e2TfEW7r0
         nAQe8FPQ5bCSLO7btuGjhdXLpJvz2Vht289iZrhx1YbJMimFpUHBnwchwBi6NLsaSksy
         nCFVgulBhiUs6Qx/jNwg0c9FiUHcAFKeCVstqYssDjTjnicZ2q56irJodUImdkN/Vtpo
         xGMA==
X-Gm-Message-State: APjAAAVYyJQ4TTruRd7lsf2pAcKGT/xKv56p5xIW6GjNBMZlZsO+Gfx/
        apHJDUU15O28GrrSZpjcUJE=
X-Google-Smtp-Source: APXvYqylRp2PD/Kfp3+AFeWcMvVPL3YscAv0xrMQDhTimAJtGQOEAF6N1ayfIQI/Gm0TX03kOg5EOg==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr9177306pgt.388.1560975411774;
        Wed, 19 Jun 2019 13:16:51 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id y22sm39590763pgj.38.2019.06.19.13.16.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 13:16:51 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 01B6A4650F6; Wed, 19 Jun 2019 13:16:49 -0700 (PDT)
From:   dmg@turingmachine.org
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Daniel M German <dmg@turingmachine.org>
Subject: [PATCH] usb: clean up some of the computations in adu_read
Date:   Wed, 19 Jun 2019 13:16:45 -0700
Message-Id: <20190619201645.7382-1-dmg@turingmachine.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniel M German <dmg@turingmachine.org>

Replace ?: with min to calculate the number of bytes in the secondary buffer,
including changing the data type of data_in_secondary to size_t to be
type-consistent. data_in_secondary can never be negative.

Remove some spurious calculations (copy_to_user returns zero on success),
making one variable redundant (i)

This change does not alter the functionality of the code.

Signed-off-by: Daniel M German <dmg@turingmachine.org>
---
 drivers/usb/misc/adutux.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 9465fb95d70a..cbc0e54508bf 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -343,7 +343,6 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 	struct adu_device *dev;
 	size_t bytes_read = 0;
 	size_t bytes_to_read = count;
-	int i;
 	int retval = 0;
 	int timeout = 0;
 	int should_submit = 0;
@@ -371,23 +370,22 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 	timeout = COMMAND_TIMEOUT;
 	dev_dbg(&dev->udev->dev, "%s : about to start looping\n", __func__);
 	while (bytes_to_read) {
-		int data_in_secondary = dev->secondary_tail - dev->secondary_head;
+		size_t data_in_secondary = dev->secondary_tail - dev->secondary_head;
 		dev_dbg(&dev->udev->dev,
-			"%s : while, data_in_secondary=%d, status=%d\n",
+			"%s : while, data_in_secondary=%lu, status=%d\n",
 			__func__, data_in_secondary,
 			dev->interrupt_in_urb->status);
 
 		if (data_in_secondary) {
 			/* drain secondary buffer */
-			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
-			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
-			if (i) {
+			size_t amount = min(bytes_to_read, data_in_secondary);
+			if (copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount)) {
 				retval = -EFAULT;
 				goto exit;
 			}
-			dev->secondary_head += (amount - i);
-			bytes_read += (amount - i);
-			bytes_to_read -= (amount - i);
+			dev->secondary_head += amount;
+			bytes_read += amount;
+			bytes_to_read -= amount;
 		} else {
 			/* we check the primary buffer */
 			spin_lock_irqsave (&dev->buflock, flags);
-- 
2.20.1

