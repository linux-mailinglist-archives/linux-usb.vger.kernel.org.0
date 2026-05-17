Return-Path: <linux-usb+bounces-37551-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fuKTKdHQCWqgqwQAu9opvQ
	(envelope-from <linux-usb+bounces-37551-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 16:29:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74C561AA6
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 16:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6E5B30041F0
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 14:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799C43B8BCF;
	Sun, 17 May 2026 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDEyXcLw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7C63A451F
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028171; cv=none; b=Y9b8n66VAgq/YF6yDZXfaqyK2z7khauaHWskayJPW1D7qLuWWQ4brWn81ezt9I7FoRj+zbo7n/3DifdcAAeDjQpMU8fIfExMyvrtaybP5CF0Ph4en6XDvKpxsKQka95Q+KMa1i72lQa7sIV4PXzxlUj/alOug3snHLSA+Du446o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028171; c=relaxed/simple;
	bh=/MX5myVN0aGQuXxb/u4PoxOWuLpM8OIhsF7656hciWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YS7KZtQglK+GfoCOUTjgmEDnFV+KUuVIy3upwdmR1nMS/yU/Xfsekn9GvIbaMvo86HRkaall/3Tof5g+Q+DxMZ9IDJs/vhyeuVHCnz5TqOquTaYT+x+Zgy9HxpvmFQ3+TPpZ+a/uxNnKQocwgrwYEfGwLJiBQyyEj7QML9CY+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDEyXcLw; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-479d593a0c3so1234468b6e.0
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028166; x=1779632966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NloNbUZFkitLAyQNtcSD8UMdNtD346I37DRiF/RAGuc=;
        b=tDEyXcLwzkT0QLv1MA3ZWZucGxt8l17t+oDZzcnTVOZjCaKHkBZjNOSOVFQu8hipOP
         0ECJFs5AhByFL07Rtwfo6Mq5s0oIHr7lEo0NX75TqQLxoWKW8dIFz/NZ7n026lUcu049
         L1OnC3q0ET6Vt75PKBTxY0Si4jw2IOq2RIQvg1Y/GvF5Ag2HicOZ+rur2nsJGUFMPpGI
         HaKvMNB7EJ11tsH8kDSYKRsMdR9HQqAvruMawwoWn9gyse7qmwYEezWFUNOHKSrA0EDY
         wTWeIAcKQXwGpSovsqrm4m+3UMLkWy8yP1sZcNK6RKr38l1dtpEQOOPOwLBrj3YaC7fw
         ke4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028166; x=1779632966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NloNbUZFkitLAyQNtcSD8UMdNtD346I37DRiF/RAGuc=;
        b=CNCF28GEZJ1kT1jc6PfK+53xf/lLmOEa7BwbHO03Mpjc4SZN1MJwYi0RPwNJvLjDKM
         aW9/VQ8UmCRkwpsqPcuWkIcXIB6vjyrUqVBC9M/3DQA4eX2YzYnnbnUZ9v5bQSzMCzXR
         YRqG5dqxUOlCAtrt3vW+wHnoo91h34FtiAwPkAxKbKJ0+4cD4Ke+SoORPtrFdil7ctph
         geezqG1aAlp0+cwp4gG9plGGjhvhsInPozZbBLRGBECuWHxhXUX0Lm9r54QgNyLKFAVD
         T6WVBz4Rs3H3d6hIMK62/OSNgOSWpLhGr71l3mdtAZ8VONTlidWgpoNz9hzJfQsht6+P
         KNZA==
X-Gm-Message-State: AOJu0YzNPHy7EfEO+wyLLQ3yMiZ4bsb/h2DAj0Drkj+kyueOBWFv1VBq
	uk1ur+GRcVLRoYaM3nDyVz6s3l24CNzEfjqQ8OQrQ/W+ivZuLFQWeoQEwMnQWRhA
X-Gm-Gg: Acq92OEIZmDYR5TgtQyx7AxVBurvEywr7ZImbIXfRc7UgocaGFS30Gn6MWsykILh6lN
	HIdsQRmv5JaIw/jSKFnNbTSiLT27z5qoNdvvl2mUk+WymWXNdgqxh7Iv98szKkqvEn9wuZTxTKT
	91T1f8GucQHUGGDOsQSEg8CTu1S1SlZ9FGkx+O+ara2DVdIfELWn8nb/a7D5NsfY7L3MwEdpaYK
	IdS+Z42/gc10y5MHRLV+AuVXlLhn3149yE7AeWYEKp++bj4AKAeDpC9Gq60EYtavB5tgLHrr1eV
	lyS6s+dkwW5iTGK71YpRxAnc5cWD/62eNHUedTIAGClFzZhn1IbqC/F3x1mp15HM/n9wGbpXT4d
	5i31QacceIsL96WCK2EjFnzN80QzNF3wDXO0uAAB7FKqM4SdxxQ8y/KYyMmTbPY9wl+FIOv9uZN
	2huiBPLkPh6ZWhe8Wk2+BhpBrZedrRnoJQRFDWELp4
X-Received: by 2002:a05:6808:3008:b0:479:fad9:662b with SMTP id 5614622812f47-482cba918b7mr8135487b6e.24.1779028166192;
        Sun, 17 May 2026 07:29:26 -0700 (PDT)
Received: from MacMini.lan ([172.127.162.94])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7c6b43sm5702701a34.5.2026.05.17.07.29.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 17 May 2026 07:29:25 -0700 (PDT)
From: shayderrr <darknessshayder@gmail.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	yehezkel.bernat@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: [PATCH] thunderbolt: usb4-port: fix error path and sysfs alignment
Date: Sun, 17 May 2026 09:29:23 -0500
Message-ID: <20260517142923.80585-1-darknessshayder@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7E74C561AA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37551-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[darknessshayder@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Pranav Bajjuri <darknessshayder@gmail.com>

Add missing return ERR_PTR(ret) after component_add() failure so PM
setup is not reached on error, and fix argument alignment on
offline_show(), offline_store(), and rescan_store().

Signed-off-by: Pranav Bajjuri <darknessshayder@gmail.com>
---
 drivers/thunderbolt/usb4_port.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index c32d3516e780..2282e1ad0c45 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -34,8 +34,8 @@ static void connector_unbind(struct device *dev, struct device *connector, void
 }
 
 static const struct component_ops connector_ops = {
-	.bind = connector_bind,
-	.unbind = connector_unbind,
+	.bind	= connector_bind,
+	.unbind	= connector_unbind,
 };
 
 static ssize_t link_show(struct device *dev, struct device_attribute *attr,
@@ -137,7 +137,6 @@ bool usb4_usb3_port_match(struct device *usb4_port_dev,
 	if (IS_ERR(nhi_fwnode))
 		return false;
 
-	/* Check if USB3 fwnode references same NHI where USB4 port resides */
 	if (!device_match_fwnode(&nhi->pdev->dev, nhi_fwnode))
 		return false;
 
@@ -179,7 +178,6 @@ static ssize_t offline_store(struct device *dev,
 	if (val == usb4->offline)
 		goto out_unlock;
 
-	/* Offline mode works only for ports that are not connected */
 	if (tb_port_has_remote(port)) {
 		ret = -EBUSY;
 		goto out_unlock;
@@ -230,7 +228,6 @@ static ssize_t rescan_store(struct device *dev,
 		goto out_rpm;
 	}
 
-	/* Must be in offline mode already */
 	if (!usb4->offline) {
 		ret = -EINVAL;
 		goto out_unlock;
@@ -261,16 +258,12 @@ static umode_t service_attr_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct usb4_port *usb4 = tb_to_usb4_port_device(dev);
 
-	/*
-	 * Always need some platform help to cycle the modes so that
-	 * retimers can be accessed through the sideband.
-	 */
 	return usb4->can_offline ? attr->mode : 0;
 }
 
 static const struct attribute_group service_group = {
-	.attrs = service_attrs,
-	.is_visible = service_attr_is_visible,
+	.attrs		= service_attrs,
+	.is_visible	= service_attr_is_visible,
 };
 
 static const struct attribute_group *usb4_port_device_groups[] = {
@@ -282,14 +275,13 @@ static const struct attribute_group *usb4_port_device_groups[] = {
 static void usb4_port_device_release(struct device *dev)
 {
 	struct usb4_port *usb4 = container_of(dev, struct usb4_port, dev);
-
 	kfree(usb4);
 }
 
 const struct device_type usb4_port_device_type = {
-	.name = "usb4_port",
-	.groups = usb4_port_device_groups,
-	.release = usb4_port_device_release,
+	.name		= "usb4_port",
+	.groups		= usb4_port_device_groups,
+	.release	= usb4_port_device_release,
 };
 
 /**
@@ -324,6 +316,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
 	if (ret) {
 		dev_err(&usb4->dev, "failed to add component\n");
 		device_unregister(&usb4->dev);
+		return ERR_PTR(ret);
 	}
 
 	if (!tb_is_upstream_port(port))
-- 
2.50.1 (Apple Git-155)


