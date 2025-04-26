Return-Path: <linux-usb+bounces-23496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A019FA9DCE0
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 21:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0888465B06
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 19:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597C825DD17;
	Sat, 26 Apr 2025 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqdu/MAZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0F25D543
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694764; cv=none; b=jqOQv/8ha6yRWL9i8mXUkOhkArVjfzUWWve5tsDIcR+TAC5xMChxHFqV86niKIzdS+wa7yXowinpzxk6nzJmatgEV5Guh5QHCvVyqS4haXA/G19fqd1YOvKVaXxC7Ubp2boF+s5YK3rQbUCwkxRexAi0xBXLDakRMaQ1H4/A3zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694764; c=relaxed/simple;
	bh=GLHmZKA9xULyZukJ64UnLyN9bvXdYuuzb5bTD53JgFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGNU3gVlPkapz4rDsZdzdAbHfC784QUAVqTa487GhoFiAkHpASUnXkcLaWcbB2oaogphg7bRqOWPZnbRCOQj/VdWFVkMYZSVEV04kWpFm8HU6510sLe6JqkCcoDrOmZye+X5/7RUIWKBRhA2G5p6bWKZjzbgrGcRClkUcArtE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqdu/MAZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so2822827f8f.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 12:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694761; x=1746299561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPOPg/9vXA8x3Ynid9Uh66gDQtULvWZ7dXRGjcPMVwE=;
        b=cqdu/MAZ8hoixWCRoTW+/P21VFkpa7fv56k8U3L3wn5aXdh4PQtoXjOSUcZ1oszvhq
         3Nqy8lj4p2vJrIqigxZv1PwFpmSNxMrd2rtH+d72BQkfGjC1bSj4jYnwtXwocBOEEjAD
         QJMwCRkVBaI/baJgILd60U3UWiyO8iBUs2PMGfjOWMeuYolO1iO9vfWGcNfTTGR+ip0n
         lGwfqysuo8CV/vGEhLHTh/oFUjGt3kYg7RCZWJitUSW7hCDVKpaRPv9aiMHhLXVDD4AI
         1EsEFeM0z+e7/nX0ltMIEaqMmyB2kT2H2n9pjvZ7yvuUPEiOcw0vWSghmk1ru6ioCHJC
         Fy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694761; x=1746299561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPOPg/9vXA8x3Ynid9Uh66gDQtULvWZ7dXRGjcPMVwE=;
        b=LlGGDahGfqgWx68cA8GPao8QmyJdJtL1DUDM0ve5ZbMFXpyRbR3CueqpmT/gjvHz+v
         lYKdUO+SuQHpqS+b+FVnJvREbcxTnhNjVADqqz3j9IoT/IIe0A/1u2meyHIrEU7fv+IR
         jI83zUuDYt4BXHWFGvJdEWZw0uM/mbz9Q+gPlOQfPEk3ERb42U8BWPA3ri/dAb9rKMZD
         YccYPFIuw7rbQLAcOUCMndynYVRkVponFfSe6z9p3g3OVYsLafX5VFA4TuBurJXVkywa
         n1X9VDmCLzxz2nH4Gp3Ifo3ecenvTsN8yePSyhvIU7KbawGTwtsEp3/j9gkxWeYA3shu
         7fMw==
X-Forwarded-Encrypted: i=1; AJvYcCX+zA738e23kjh7tAXrVpgU8NmhKIf6F8mWRjeULj2PboIw9ODjrB8tFFLBWbPZaghaSMBtSmIvIPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsgr5EyvqV1kc/UJPVJilChmlQFjeJo4Om0463DGrr+m08YYQj
	NKKnJ0AfcLEYK9Jng9JXig9wUIH7QWXGlkJxBZa4m8mKP/MHHufebWnnies+
X-Gm-Gg: ASbGncu72ltFL1Z157SqtzQ2iFvi0b6c99b49N6nwQwX1WfUVOUnR/qQJLeoISVkv5V
	0YlkTg05MUN8YNIQMh41psdlOFqd3KPywfkO2GIXEVw8ZBw0VyRu/k3HSurqudohj59lcScifcI
	qTanh2cSVxeJ4DpeeU6ETsmJN28MVSK3p8btiuHGWLUdu7t1OIE1YkNH/HUN1MJTNEKqKywtAaj
	LFI+sYCkZIwffU9cXyorz4HI3WcQRjL5N6g6Lz60d9mIQbCzMCZKtNMMpgjp65qCITKy7grQGJS
	E/IVYOGBjcEz5VAZhAM05oGt5JGwuIzim/MPnO1bgmRiPxCH9li+MBt2jFcqoHXrPr/2I8tC7zX
	zLyUlMIjgqw8=
X-Google-Smtp-Source: AGHT+IH8xyVj+ZasoCTxduw/9TH1uENLeo6xXfEVIQGha7uuF2WlbqUXJJNJzGlZbS35kI056lMpfw==
X-Received: by 2002:adf:e80d:0:b0:39c:1f02:44ae with SMTP id ffacd0b85a97d-3a07aa6fc69mr2429429f8f.27.1745694761101;
        Sat, 26 Apr 2025 12:12:41 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm6473285f8f.15.2025.04.26.12.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 12:12:39 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: guido.kiener@rohde-schwarz.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/3] usb: usbtmc: Fix erroneous wait_srq ioctl return
Date: Sat, 26 Apr 2025 21:12:21 +0200
Message-ID: <20250426191222.13727-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426191222.13727-1-dpenkler@gmail.com>
References: <20250426191222.13727-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_event_interruptible_timeout returns a long
The return was being assigned to an int causing an integer overflow when
the remaining jiffies > INT_MAX resulting in random error returns.

Use a long return value,  converting to the int ioctl return only on
error.

Fixes: 739240a9f6ac ("usb: usbtmc: Add ioctl USBTMC488_IOCTL_WAIT_SRQ")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/usb/class/usbtmc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index e24277fef54a..b3ca89b0dab7 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -606,9 +606,9 @@ static int usbtmc488_ioctl_wait_srq(struct usbtmc_file_data *file_data,
 {
 	struct usbtmc_device_data *data = file_data->data;
 	struct device *dev = &data->intf->dev;
-	int rv;
 	u32 timeout;
 	unsigned long expire;
+	long wait_rv;
 
 	if (!data->iin_ep_present) {
 		dev_dbg(dev, "no interrupt endpoint present\n");
@@ -622,25 +622,24 @@ static int usbtmc488_ioctl_wait_srq(struct usbtmc_file_data *file_data,
 
 	mutex_unlock(&data->io_mutex);
 
-	rv = wait_event_interruptible_timeout(
-			data->waitq,
-			atomic_read(&file_data->srq_asserted) != 0 ||
-			atomic_read(&file_data->closing),
-			expire);
+	wait_rv = wait_event_interruptible_timeout(
+		data->waitq,
+		atomic_read(&file_data->srq_asserted) != 0 ||
+		atomic_read(&file_data->closing),
+		expire);
 
 	mutex_lock(&data->io_mutex);
 
 	/* Note! disconnect or close could be called in the meantime */
 	if (atomic_read(&file_data->closing) || data->zombie)
-		rv = -ENODEV;
+		return -ENODEV;
 
-	if (rv < 0) {
-		/* dev can be invalid now! */
-		pr_debug("%s - wait interrupted %d\n", __func__, rv);
-		return rv;
+	if (wait_rv < 0) {
+		dev_dbg(dev, "%s - wait interrupted %ld\n", __func__, wait_rv);
+		return wait_rv;
 	}
 
-	if (rv == 0) {
+	if (wait_rv == 0) {
 		dev_dbg(dev, "%s - wait timed out\n", __func__);
 		return -ETIMEDOUT;
 	}
-- 
2.49.0


