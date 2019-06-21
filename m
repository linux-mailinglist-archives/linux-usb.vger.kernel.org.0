Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771ED4E0B3
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 08:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfFUG73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 02:59:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33600 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfFUG73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jun 2019 02:59:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id x15so3104325pfq.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2019 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ucUcfv53/WcmZogRTg5xvfG/NXEStjvU0kyYWgdaR8=;
        b=IISC8uAteJT5lFOtSp9mSihiYNHAMqen5CJwuwLuKQlj1wHLSpjf/QOzr5QCqQbJY4
         bGDBp7g5qzQba7wewz35J/e+hVPYiuWV4VkRHKrod+bEL82eDqfbl0Li75YJ2NdHTR1U
         6GVBSrOuv6p4BA+a1gIkt4wtu4KB7GgtxNKFkISKnH9JtKAV8L+4XG7yZ7RXaee5klRo
         uKCJMXFbbmkI4P2JaHzSN3GqgYiF7X+XMiGB53PQqcf9MbSnjOsIFO+kROcP7cyA1fqC
         pUr45H04iBvEmSyhcdtl9da9Hi4dpANTlmZMvCHc19qPJgszW8DL7pziacfBbxMx7ABI
         lgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=3ucUcfv53/WcmZogRTg5xvfG/NXEStjvU0kyYWgdaR8=;
        b=LMGBjdc298P0gSSSb3//+4qRqIhLYAYBHZ3nC/JYZPJUEZVBffuUT1TfCH5BwCvBMJ
         h19W4ZZhcJB1lYUCEIqki2J6vL5z1nUTqlCh4/WeTvUSARN4PnkzMrtuI7ohBQXChtip
         oOuLHbC8F9w7XvmBQE3m2A0je40lJyYoWMX53ts2rE7XK3t2lmQvfqwue2BwfYGRx7S7
         JAoKBkgpK+1PMlwRLIBP6NJHWZYP7+AAIhQbXtdFE5t6I2jLFVYl0MblauEUo6Ixkch5
         FnyfapOzwH2hGqk258PtFTiUrLa4DYa/xY6uGe47wNl5qdyC5huIatT6hkTnixZIiwFl
         VG3A==
X-Gm-Message-State: APjAAAWf/ePBgiZc0Kp/tlPiSE+18p0GrCugkAq0pXWznTNqvIJjNvP+
        6cfNIiGHdetvxzfEAHE169U=
X-Google-Smtp-Source: APXvYqxpmMNYLYKFDMbNvxFgCiIW2KhS3y0MY/faQZu7W36Nxl86+LoxJpO9zZWEgflPnXYneWP+yA==
X-Received: by 2002:a17:90a:5887:: with SMTP id j7mr4472577pji.136.1561100368480;
        Thu, 20 Jun 2019 23:59:28 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id w14sm1594618pfn.47.2019.06.20.23.59.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 23:59:27 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 97FF846B1B2; Thu, 20 Jun 2019 23:59:26 -0700 (PDT)
From:   dmg@turingmachine.org
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Daniel M German <dmg@turingmachine.org>
Subject: [PATCH] usb: clean up some of the computations in adu_read
Date:   Thu, 20 Jun 2019 23:59:21 -0700
Message-Id: <20190621065921.5199-1-dmg@turingmachine.org>
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
index 9465fb95d70a..344d523b0502 100644
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
+			"%s : while, data_in_secondary=%zu, status=%d\n",
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

