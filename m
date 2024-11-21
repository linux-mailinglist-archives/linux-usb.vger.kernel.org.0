Return-Path: <linux-usb+bounces-17763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C19D45C0
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 03:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C34E8B20D29
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 02:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1082817BD3;
	Thu, 21 Nov 2024 02:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Qa5lDOIm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552923099A
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 02:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732156478; cv=none; b=bd6OqZUJB/+pnpdHD3j6JLYqAu4Hr2GVDZdtSazebyKCaQkGAJN0wEpGrh1/cnbhrjtzfLl3VFXNaC7eFll/+3w1Hx/M5A4rWUn82UDz6qNQF9JLQp2ek/8moNXAnB0Q35j2KotaT8Ero7MLed4XjIFH9aaBAhXLEYeZMofvvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732156478; c=relaxed/simple;
	bh=PM2YsP6gCG6k2POciNzVdBrhEoGSI2RI8AaPNRb+PKw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MYICunei4ukY7YkjkS05k8kYfqF96shF4Ly/HUmZSV+NvYvZcyRrioWpg+R+agjSHN+f4JhAij+Gbcd2QosRhZjljTTz3T7lTTyTmfJUJ5MoHis1qgqHzdHOX3VJjYBOfMA6RiuRshJn1upKOqPo0T/bA4X+IFmQotXDtkHpoLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Qa5lDOIm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ea1bc2a9c5so1233496a91.0
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 18:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1732156476; x=1732761276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXIvHkifeAiSPJ9eZolOwwHm/g8wfor2Tqt+2doJhfA=;
        b=Qa5lDOIm4Auy2/K9eXEMSusFUfQs2UxHyjG0kV2BM5RRlegYeZZuyQVff34X5eTpr9
         xnBCvykT1feGZfEBVrDwhuAZZ8964As9j/zDqYeUureawXYgP/ldEn4wy+g9EqIkZDSY
         5BMLOBOWqvNG6p/v3xzC79lgoiZ3Seo3YkXf949bpx7UHkW+noB7UrVlDmVbbwtq65Bw
         hGOfQ7jNO6ReCAQUGiUPi8j76lEL2X+jAgBS91tv11rej2S/389buiaz9HwGDGP1yuzI
         qrAGmZs0PboSfFi7S53LLHU4zAQZanKS2urwBWjMFoZ2JXenyuq0RqzK07NKdxKA+NXS
         zlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732156476; x=1732761276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXIvHkifeAiSPJ9eZolOwwHm/g8wfor2Tqt+2doJhfA=;
        b=Xw5SV3lK/rTimcucgha/X2c1zS52MO6IO4InHcMKbWbBPdRP2vt6k1oqwyYJDm09HQ
         OdUYDX+Bxq6hDpZJV2vABJEaNpRXYN6HGQKjSh/R41K6tqW0UAsQo5aa5vuL52v915Bi
         wmPQutD3mgrln3T5j/arFk6YS4qCXemKe5FazBfgmlsECyNiWmPmN1OVWiDG5/RwuH66
         7xp11jJ79Vr6Smg8fT8KZZmM1ZJ87SWcqcLqMUPujCC5Jab3WIGgZKpVH3bmbqbvePnh
         nygy7IXdChdWAdRv/aQi+EoB6DYsvE19niATfTjrVYUvTAJrax8e5AuFVCItS65ZYcjO
         SKYA==
X-Gm-Message-State: AOJu0YxCObqpD6pKZdEqAkTIVb7tHegxoDVuIxnXWuovZxEYxUsQGs7q
	U4jGVSPx0TFbk5VOiPuLo3BVUwSekGZz0d1FJeGm1J9RwZwDr7vNjeN86+U9WnQ=
X-Google-Smtp-Source: AGHT+IEIgvnBspSiMEh4AyVEXL00DXK2rOrSHw41en393hS6Kepq9Qpd482WyqNCuCnZiB+Tvhwzdw==
X-Received: by 2002:a17:90b:4b12:b0:2ea:3d2c:24bb with SMTP id 98e67ed59e1d1-2eaebdd02b4mr2514788a91.17.1732156475699;
        Wed, 20 Nov 2024 18:34:35 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead04d2bd9sm2027972a91.40.2024.11.20.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:34:35 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: anx7411: fix fwnode_handle reference leak
Date: Thu, 21 Nov 2024 11:34:29 +0900
Message-Id: <20241121023429.962848-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An fwnode_handle and usb_role_switch are obtained with an incremented
refcount in anx7411_typec_port_probe(), however the refcounts are not
decremented in the error path. The fwnode_handle is also not decremented
in the .remove() function. Therefore, call fwnode_handle_put() and
usb_role_switch_put() accordingly.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Call usb_role_switch_put()
- Remove the port in anx7411_port_unregister().
---
 drivers/usb/typec/anx7411.c | 47 +++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index d1e7c487ddfb..95607efb9f7e 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1021,6 +1021,16 @@ static void anx7411_port_unregister_altmodes(struct typec_altmode **adev)
 		}
 }
 
+static void anx7411_port_unregister(struct typec_params *typecp)
+{
+	fwnode_handle_put(typecp->caps.fwnode);
+	anx7411_port_unregister_altmodes(typecp->port_amode);
+	if (typecp->port)
+		typec_unregister_port(typecp->port);
+	if (typecp->role_sw)
+		usb_role_switch_put(typecp->role_sw);
+}
+
 static int anx7411_usb_mux_set(struct typec_mux_dev *mux,
 			       struct typec_mux_state *state)
 {
@@ -1154,34 +1164,34 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 	ret = fwnode_property_read_string(fwnode, "power-role", &buf);
 	if (ret) {
 		dev_err(dev, "power-role not found: %d\n", ret);
-		return ret;
+		goto put_fwnode;
 	}
 
 	ret = typec_find_port_power_role(buf);
 	if (ret < 0)
-		return ret;
+		goto put_fwnode;
 	cap->type = ret;
 
 	ret = fwnode_property_read_string(fwnode, "data-role", &buf);
 	if (ret) {
 		dev_err(dev, "data-role not found: %d\n", ret);
-		return ret;
+		goto put_fwnode;
 	}
 
 	ret = typec_find_port_data_role(buf);
 	if (ret < 0)
-		return ret;
+		goto put_fwnode;
 	cap->data = ret;
 
 	ret = fwnode_property_read_string(fwnode, "try-power-role", &buf);
 	if (ret) {
 		dev_err(dev, "try-power-role not found: %d\n", ret);
-		return ret;
+		goto put_fwnode;
 	}
 
 	ret = typec_find_power_role(buf);
 	if (ret < 0)
-		return ret;
+		goto put_fwnode;
 	cap->prefer_role = ret;
 
 	/* Get source pdos */
@@ -1193,7 +1203,7 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 						     typecp->src_pdo_nr);
 		if (ret < 0) {
 			dev_err(dev, "source cap validate failed: %d\n", ret);
-			return -EINVAL;
+			goto put_fwnode;
 		}
 
 		typecp->caps_flags |= HAS_SOURCE_CAP;
@@ -1207,7 +1217,7 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 						     typecp->sink_pdo_nr);
 		if (ret < 0) {
 			dev_err(dev, "sink cap validate failed: %d\n", ret);
-			return -EINVAL;
+			goto put_fwnode;
 		}
 
 		for (i = 0; i < typecp->sink_pdo_nr; i++) {
@@ -1251,13 +1261,21 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 		ret = PTR_ERR(ctx->typec.port);
 		ctx->typec.port = NULL;
 		dev_err(dev, "Failed to register type c port %d\n", ret);
-		return ret;
+		goto put_usb_role_switch;
 	}
 
 	typec_port_register_altmodes(ctx->typec.port, NULL, ctx,
 				     ctx->typec.port_amode,
 				     MAX_ALTMODE);
 	return 0;
+
+put_usb_role_switch:
+	if (ctx->typec.role_sw)
+		usb_role_switch_put(ctx->typec.role_sw);
+put_fwnode:
+	fwnode_handle_put(fwnode);
+
+	return ret;
 }
 
 static int anx7411_typec_check_connection(struct anx7411_data *ctx)
@@ -1523,8 +1541,7 @@ static int anx7411_i2c_probe(struct i2c_client *client)
 	destroy_workqueue(plat->workqueue);
 
 free_typec_port:
-	typec_unregister_port(plat->typec.port);
-	anx7411_port_unregister_altmodes(plat->typec.port_amode);
+	anx7411_port_unregister(&plat->typec);
 
 free_typec_switch:
 	anx7411_unregister_switch(plat);
@@ -1548,17 +1565,11 @@ static void anx7411_i2c_remove(struct i2c_client *client)
 
 	i2c_unregister_device(plat->spi_client);
 
-	if (plat->typec.role_sw)
-		usb_role_switch_put(plat->typec.role_sw);
-
 	anx7411_unregister_mux(plat);
 
 	anx7411_unregister_switch(plat);
 
-	if (plat->typec.port)
-		typec_unregister_port(plat->typec.port);
-
-	anx7411_port_unregister_altmodes(plat->typec.port_amode);
+	anx7411_port_unregister(&plat->typec);
 }
 
 static const struct i2c_device_id anx7411_id[] = {
-- 
2.34.1


