Return-Path: <linux-usb+bounces-35608-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF9ZBOzbxmkoPQUAu9opvQ
	(envelope-from <linux-usb+bounces-35608-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 20:35:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9834A37D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 20:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 822933026674
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B0337C118;
	Fri, 27 Mar 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXwjAzVB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41A29B789
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639462; cv=none; b=iAe6B/N9zsqz8HPhUxfWGx8zFemSUY4h07/O40g1cY15e6Y9BU6xVMpvl1Z7PngH1HRdw91+LgudALzsRHIBb9L9sQSFp+TtkWtaSpNZAKSc5eBjjrvXP6wTrBjkmyJvSg1BUa17J6rGHoueqG/r8elz9AZKaBidJSIEqxQdvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639462; c=relaxed/simple;
	bh=rluKZ4GNgHw5m1UevyUUuL0azCAMdHmPw2X6TkYJiKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SEN/em8lOIJKvIwl78dNrYDYO+IlS7ls+4NKD9cb0A70dFmcNHiJWMRQI6mzfXNR5h3rHDpLDdYBxSzF2R4S84muEhbzwjZAaKa4AUrGZ81J3QtavoDjJnafA+FLXuSED+Za+duxaYofuTw0/GUvUmO8wMAgocDFdEomSWsxLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXwjAzVB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b871dd06eso1452605f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774639458; x=1775244258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bFbXTjy4NMbpj8pvI5YlNDL7NdTaJ2uAwsFcgGj2Y3A=;
        b=cXwjAzVBBFnI1hzS9QareltxaMVVXhvIlDFlfX3Y/RbrRoXzr4wjMGf7SlHU4ONaCb
         euG4sIOnECMSeQaMlwbpZUHbho80OGD/DC3iz5FfShMsjPgXSjnucLffxuAA0KHFD8sM
         ojzpmmASL7+s2K9p+yhkse5RFT4PTA9IBqQImfuXUSK3vnlSwl5uQdNm1PAbHFxS7J6N
         jJI4HMkEySWUjEZYnWhDuSOiZHxKbw9/0dJO2hxcbg5gKteVoW+WHSmMr7N2Eoq2dEUq
         79hgEeK6cYlPb6uFPGT2JGeI8SWBL6LYOPWnTbUxMBhdqTCcacazWsfjno7bSNRRKUFz
         /j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639458; x=1775244258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFbXTjy4NMbpj8pvI5YlNDL7NdTaJ2uAwsFcgGj2Y3A=;
        b=WtsiucwYgFz8yyBXVyC2herMwDkNa3vcZ1XrzKa2V3lC0s5TJfqHT4yQSZ6FCyPY5j
         aA1VadVzUZpe+jzIA+ZLt+FlB4f9HaxRoSwG3JG6YWSwsGCs03ZkUQYMazJYm4QEuojZ
         ANVoN/wFm6Q3Zm7/73W9K1hhMIfX9dYRYIbmojoQD3MBC0xOTMjCA7nF18tJQITJSDam
         XH1XhFbQvy1hhZR05FKrXNQMwvtGnLjbDmSGLTwqRus1wVsnS+wr4aU0kMCWG3DFP20R
         xrIWGHJ/3EZ079fyI7HygtgKvqo0cXNSJjb/dtqMkVLMD67ETm+1rvsnEeFRs0sDNZzc
         61FQ==
X-Gm-Message-State: AOJu0YyzYiJ+l4CvT6bushfDq4Qrn/umVJ4JIOVN+KwbcYU6ctdVIrS7
	NfQs1LtijzpnKo5ETFsnH7tEIBEhPx9TlOw7ilJknCCjevTHn6XiNeB+
X-Gm-Gg: ATEYQzx+uwA4o8K/cOpRQtiowpO0s5g9WgMG+hoh5ExaU9vcCEuyjR/Uwy/Rfe7uTYO
	ve0/zudGRKzsXzEzvHh/28KYb0PAe6UcG+HYtRixZ4UxRs6pqyW8xRJiTLIndpqxpJMr3p6ywsa
	0wFILmG9OdAmKWmi1L1IN4ATXo5Aa6yFTjW9BgsZ7Okdc/19/VwdnkdRwmnR3m+MzynNQfTxj3Q
	vViy0oWtqAma26+nXHEA+VQQ71xhTqhQgvYhWd42hMMOpeavsxedpOBaMIR2R6pCmxMwm2AjcIp
	LmWiLQy/qhI7LEvdTgNWA1pYHIhZL+GSBYgtnk7I4neON3F72p5f27axt/ZZhfktz5s3+YRtofd
	5cnjsapULWypvOqOmdxB5dDlv75sxu8c28GHAG5nml1FAs6aGFRRfz7ZzEHuKO/vYEhOgb15ZIx
	wkechu+Luqr/+aUt4OEt2oQ8BxQ247hTrUjevLdcpdKfO7w9g4fF7vIEjEhiSoMjUwZPQjPEg6R
	phYdm0VHuEVRvA=
X-Received: by 2002:a05:6000:3105:b0:439:c799:dbfa with SMTP id ffacd0b85a97d-43b9e9d97d5mr5819506f8f.9.1774639458215;
        Fri, 27 Mar 2026 12:24:18 -0700 (PDT)
Received: from toolbox ([2a00:1e:8743:9700:a5c1:58f4:f0a9:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm171956f8f.23.2026.03.27.12.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:24:17 -0700 (PDT)
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Michael Zimmermann <sigmaepsilon92@gmail.com>
Subject: [PATCH] usb: gadget: f_hid: don't call cdev_init while cdev in use
Date: Fri, 27 Mar 2026 20:22:09 +0100
Message-ID: <20260327192209.59945-1-sigmaepsilon92@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-35608-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31E9834A37D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When calling unbind, then bind again, cdev_init reinitialized the cdev,
even though there may still be references to it. That's the case when
the /dev/hidg* device is still opened. This obviously unsafe behavior
like oopes.

This fixes this by using cdev_alloc to put the cdev on the heap. That
way, we can simply allocate a new one in hidg_bind.

Closes: https://lore.kernel.org/linux-usb/CAN9vWDKZn0Ts5JyV2_xcAmbnBEi0znMLg_USMFrShRryXrgWGQ@mail.gmail.com/T/#m2cb0dba3633b67b2a679c98499508267d1508881
Signed-off-by: Michael Zimmermann <sigmaepsilon92@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 8812ebf33d14..66be2e1282c1 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -106,7 +106,7 @@ struct f_hidg {
 	struct list_head		report_list;
 
 	struct device			dev;
-	struct cdev			cdev;
+	struct cdev			*cdev;
 	struct usb_function		func;
 
 	struct usb_ep			*in_ep;
@@ -749,8 +749,9 @@ static int f_hidg_release(struct inode *inode, struct file *fd)
 
 static int f_hidg_open(struct inode *inode, struct file *fd)
 {
+	struct kobject *parent = inode->i_cdev->kobj.parent;
 	struct f_hidg *hidg =
-		container_of(inode->i_cdev, struct f_hidg, cdev);
+		container_of(parent, struct f_hidg, dev.kobj);
 
 	fd->private_data = hidg;
 
@@ -1285,8 +1286,12 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	}
 
 	/* create char device */
-	cdev_init(&hidg->cdev, &f_hidg_fops);
-	status = cdev_device_add(&hidg->cdev, &hidg->dev);
+	hidg->cdev = cdev_alloc();
+	if (!hidg->cdev)
+		goto fail_free_all;
+	hidg->cdev->ops = &f_hidg_fops;
+
+	status = cdev_device_add(hidg->cdev, &hidg->dev);
 	if (status)
 		goto fail_free_all;
 
@@ -1588,7 +1593,7 @@ static void hidg_unbind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct f_hidg *hidg = func_to_hidg(f);
 
-	cdev_device_del(&hidg->cdev, &hidg->dev);
+	cdev_device_del(hidg->cdev, &hidg->dev);
 	destroy_workqueue(hidg->workqueue);
 	usb_free_all_descriptors(f);
 }
-- 
2.53.0


