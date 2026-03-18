Return-Path: <linux-usb+bounces-35008-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKGmDeMkumk3SAIAu9opvQ
	(envelope-from <linux-usb+bounces-35008-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:06:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C67962B5A91
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07B4E304ADA4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 04:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D79334685;
	Wed, 18 Mar 2026 04:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuHOwstJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67632EFDAF
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806797; cv=none; b=pbvgjngEIuSbS5kpd7AbLOBHcYr2QL0fNR84nHUWwLw8IoRv11Sip4lFvUx4iltxHTEHmE0nXHvqnOuJ5ZmKjcwJvS3HWGesO4vVRYj6D1KnCM6TuFzN29G+/FgF9Nd0QYcJArmpm76KPH4NT+qn2H6NSVYCcVtyPQR3v1UDJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806797; c=relaxed/simple;
	bh=joihviCtiWMQpL5e796M61ZFsjKH57najvYE93buzOo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nUUxW3KuiyvXxsvwF61rfet0CboiI4xAvkBxNL9v7uk89mleTImbBGKSjZekd+YGu1bPZz+YCxrKOFOOnm1oXaTlfiVw6KYWfLkCpFBHmBtMCa4GKsh6Ep0c+8jwawb6uVCUyHyGikaiD7pMBP5BPDQFj92dhhBcOw6Lu+gPkp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuHOwstJ; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-79a4e5caad6so2941337b3.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773806795; x=1774411595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B07xfl3qfoR+omC7Mfw1Ly0caUSy+DmcyoeX6C6S7OM=;
        b=cuHOwstJX38IgHdeVxQO6RzdinK0mXkQgprP1iTwL+0O6ZuCZe66tcy67l8mLf1HEN
         v4kbJucK5b8uPe6kaJVZ2UoqPMFTJ8GYSUBsifI5EuJ11rInXV4xC9MANBWyXeqrkRwd
         V7KgFP9GYyZnGL5AFd8oAjrsJ6IcS62sk+05Jjbg2dr+0on61D6/gOq6VGAquEb6cgcP
         9+n+8Z3Ht+YMf6H58sYmMBXyEMLq/qkZIT9lLCgm5Qifr5A2hclu4PZewwLjUclSYYyY
         L4kOtEdami/+oxPSrb2cIJqsV+bqUN43B3bJ/0sDzZoSGX2D1Z8mOSiiAGNz+LpI9ux8
         ZLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806795; x=1774411595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B07xfl3qfoR+omC7Mfw1Ly0caUSy+DmcyoeX6C6S7OM=;
        b=EevchqAJmp8giKF9rh3aW8j0FfbgDtqnpCawh+oc2uHfr49667u2e1jUEF0+TT184v
         50Lznr7RlPXYqkyBiwaKYq0tgHObyaetqjX/IK0SN7Ur3nxDMyn6s8Ko2PLRikgHShBQ
         gJJzxWsj5EsEhqSZTJV6ynVE+hobQcydn4V+1l45kJTi09AbTecO+DhpGiG7L7Dww7nP
         8zVIb2otWeOqWHtRBEc2zEXcs4J9ZNsVyxl+DdclH9yWxY2z6FJcW/zr7CDdn08jARLo
         vJiXNX4eXCbOP9os2ROUZj7Y3TFtchTIEtF4P/5YfxY9400yPZcIdODdMSDl7U5wm523
         xFXw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2hnunswtE5ekCIMw7puAD6eNBDKUdXGOmqRnjAPcKNZ2lVA4SYkRxKXuz6JwHr82RS2m9zF/ws0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmbdrx/SYcf470uUigcSDkRlJ7z7lNVFncFhrL1OTwcuEm3LUi
	2bTlteOUfLZ9e1DtifmDEemXJLQHrqqLWVVU2f/jw5w04UhgCtCDg3vZ
X-Gm-Gg: ATEYQzzGU7r6vbuzcJt2KojXUNHrisyWEM5ubHx2JeAQjOQk0sgyoQxqJcP8TGE53xw
	eSaD4oXqRxU0kvB53Fnfv+59Mle9X2Z1OOMuw1Om8gi/nxW77kMlK8UpMY8Lbv8Z5m+SEtUe0fV
	ElTAPUpcEvYbhuIwPToxHTSelYzjLeqYnrDGKgS6g86IW4MKrOdtEbIg0cb3ktdz0M/k/ZR+QJZ
	0fYh6BrNYbvtABtSJou/TQXrU6IBk97GzdwrS6bVtmmUDTC3aZdsr7hwwlNZVMnIHfdLh5cjhGg
	z6GIbK0+O7JAC3UIEFbhSKhdPyoV9VNPWu1TNqwPvM0weu+6FKOMCTaql+HsnxGh2BAyxmJCRbQ
	6c1iM2fYNM1FqOM6lS47y8VkMi8GN57cr1+8XoFRJtB4EBgLkW8mOgi+cG8MhL6I/CdBvsaDALf
	dCI4IV/SipFhvRgwgtevdPZMYJicFrXbvQdtfBRfb4/3vJsBpQwpCh/K1xQpg=
X-Received: by 2002:a05:690c:f09:b0:798:56eb:f238 with SMTP id 00721157ae682-79a71ade0b4mr19471657b3.36.1773806794849;
        Tue, 17 Mar 2026 21:06:34 -0700 (PDT)
Received: from Computer.attlocal.net ([2600:1702:6f11:2d0:7876:bdab:8062:a5f9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713fe5adsm10228307b3.19.2026.03.17.21.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:06:33 -0700 (PDT)
From: Omer Zalman <omerzalman42@gmail.com>
To: oliver@neukum.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	Omer Zalman <omerzalman42@gmail.com>
Subject: [PATCH 1/2] net: usb: cdc_ncm: convert sysfs show() callbacks to sysfs_emit()
Date: Tue, 17 Mar 2026 23:06:31 -0500
Message-Id: <20260318040632.69531-1-omerzalman42@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35008-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[omerzalman42@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C67962B5A91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

sysfs_emit() was introduced in v5.10 as the preferred replacement for
sprintf() in sysfs show() handlers. It bounds output to PAGE_SIZE and
avoids potential buffer overruns.

Convert all show() callbacks and the NCM_PARM_ATTR macro from sprintf()
to sysfs_emit().

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
---
 drivers/net/usb/cdc_ncm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 7057c6c0cfc6..6fcb4d711a64 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -204,7 +204,7 @@ static ssize_t min_tx_pkt_show(struct device *d,
 	struct usbnet *dev = netdev_priv(to_net_dev(d));
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 
-	return sprintf(buf, "%u\n", ctx->min_tx_pkt);
+	return sysfs_emit(buf, "%u\n", ctx->min_tx_pkt);
 }
 
 static ssize_t rx_max_show(struct device *d,
@@ -213,7 +213,7 @@ static ssize_t rx_max_show(struct device *d,
 	struct usbnet *dev = netdev_priv(to_net_dev(d));
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 
-	return sprintf(buf, "%u\n", ctx->rx_max);
+	return sysfs_emit(buf, "%u\n", ctx->rx_max);
 }
 
 static ssize_t tx_max_show(struct device *d,
@@ -222,7 +222,7 @@ static ssize_t tx_max_show(struct device *d,
 	struct usbnet *dev = netdev_priv(to_net_dev(d));
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 
-	return sprintf(buf, "%u\n", ctx->tx_max);
+	return sysfs_emit(buf, "%u\n", ctx->tx_max);
 }
 
 static ssize_t tx_timer_usecs_show(struct device *d,
@@ -231,7 +231,7 @@ static ssize_t tx_timer_usecs_show(struct device *d,
 	struct usbnet *dev = netdev_priv(to_net_dev(d));
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 
-	return sprintf(buf, "%u\n", ctx->timer_interval / (u32)NSEC_PER_USEC);
+	return sysfs_emit(buf, "%u\n", ctx->timer_interval / (u32)NSEC_PER_USEC);
 }
 
 static ssize_t min_tx_pkt_store(struct device *d,
@@ -313,7 +313,7 @@ static ssize_t ndp_to_end_show(struct device *d, struct device_attribute *attr,
 	struct usbnet *dev = netdev_priv(to_net_dev(d));
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 
-	return sprintf(buf, "%c\n", ctx->drvflags & CDC_NCM_FLAG_NDP_TO_END ? 'Y' : 'N');
+	return sysfs_emit(buf, "%c\n", ctx->drvflags & CDC_NCM_FLAG_NDP_TO_END ? 'Y' : 'N');
 }
 
 static ssize_t ndp_to_end_store(struct device *d,  struct device_attribute *attr, const char *buf, size_t len)
@@ -362,7 +362,7 @@ static ssize_t cdc_ncm_show_##name(struct device *d, struct device_attribute *at
 { \
 	struct usbnet *dev = netdev_priv(to_net_dev(d)); \
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0]; \
-	return sprintf(buf, format "\n", tocpu(ctx->ncm_parm.name));	\
+	return sysfs_emit(buf, format "\n", tocpu(ctx->ncm_parm.name));	\
 } \
 static DEVICE_ATTR(name, 0444, cdc_ncm_show_##name, NULL)
 
-- 
2.39.5 (Apple Git-154)


