Return-Path: <linux-usb+bounces-17641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF19CFD64
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 09:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAF951F231AF
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 08:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADA4192B62;
	Sat, 16 Nov 2024 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="W8yOUEL4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB6524C
	for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731747096; cv=none; b=PrffbSLrZBZBUvv4sJQLO4GQE/+ukdXoB7iAPmvTvifCVqvHERGUTfX8bj5tQwf0gC0cM17GokMxxxAa7JdX5i/zta9v+/uC3XLCJipEOeCjc2lKBm2i3UG+xppmRbghYbEn2mhlZS10GFIZ9l9Ne0oCIEELhT9//8HhS2p+6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731747096; c=relaxed/simple;
	bh=f6mHnkDPvOKbkgTDa/SxzETiajleiUT+YIc+lsKI6jI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V6FtqKe0NXxUVj/dZrH9rsVHDAlbrQZ2zfGNpXJm/VWeYmt06IlhYPKFK8Hwer9N01j7jz0tnRS0VihA+EuattXAnM6nVWPMoU8wDsL0fppXDjJLwQjRxyZWhEJdlgw1gSeZ54oHsVcpZOtL4FmYa6/HEN8nv8mKQhvqz+heK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=W8yOUEL4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ea0f91d381so301530a91.1
        for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731747092; x=1732351892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=El+mIE1puynndiHCyRWzcjoNn60mpCRnTuzxZYTOXRU=;
        b=W8yOUEL4wIDiyBJ9QBzQlA5Zc/r32nOcABKKclOUXFqHQKi0FWWTdJPtL+/epKSgG6
         q2i3KgKppnUOyuNfiyWgu+cGPM7AhESU1L7KREvoX/ax14kLrFaMv/9Guxrx5h1Edd7w
         rNcV/dobJ/RFHdQOAlskd++yoNx8RJeWEAPcL1eT5BMBlZSS3NN0KiIfvldBBZkSWB61
         cBg5NgqtqyNfLW+DauR6FcSjffBZ4iYsCtrVmx14Pj5qierm8UetK0ouMoY3o4TNcR6m
         sNtIzNvRpPfiDj4/hBiGGKc7xcj6hcvfs0IbWipIyEXHW4DfU+uaHrv11wusV3e8WgZc
         PATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731747092; x=1732351892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El+mIE1puynndiHCyRWzcjoNn60mpCRnTuzxZYTOXRU=;
        b=NJaCY36r3t8FODLcpnH/JWPup+zsFf9Q8Hd3j+AsHGi0DOYxLpwltBkmHlBsw9ZF+d
         baM1FufOyuGy4nG/2kx6qt5FVH22/z6ZTt2cSGJGbrFz6LQx0MmaXNegVW5PSnqEAKvU
         yAqO6t39QHbuH8dx/4KTB7r9nnCZ5HQJlRwUzRu64V9xGf2bbORh0/HoaDarFOT8nc7C
         QX1JphItEa+jNGMTr3m+K5qURET8aJX5T74CWNoXUGM6JnF5jEbMrRoYBQG3a2OqSa+/
         ua3mTLcMubQnTsXMddfPLwWXakr8NCgrlLx2iVKzsuqgAqX+I4vZUK065llaX1dNWluJ
         p27w==
X-Gm-Message-State: AOJu0YxmfQTy3Z7vzvKmrNGcLLoA4P8ukWLoaOSN5L95VPBrkXbN82sU
	qvdR5Li8J48qLefWOt8q1fsSAoRWUUvC3gtyYFFg0DbsE2KxkahVWPL8eAQJURM=
X-Google-Smtp-Source: AGHT+IHc63oodTjpxWpthwwhNXH88hivRIVdpBQX07Hchw+AjfD5u+lb06nqQJ1kDu8r0VMR3t7opg==
X-Received: by 2002:a17:90b:4c07:b0:2e2:d7db:41fa with SMTP id 98e67ed59e1d1-2ea15596d00mr7683908a91.33.1731747092280;
        Sat, 16 Nov 2024 00:51:32 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f45fa4sm23863285ad.185.2024.11.16.00.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 00:51:31 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: anx7411: fix fwnode_handle reference leak
Date: Sat, 16 Nov 2024 17:51:24 +0900
Message-Id: <20241116085124.3832328-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An fwnode_handle is obtained with an incremented refcount in
anx7411_typec_port_probe(), however the refcount is not decremented in
the error path or in the .remove() function. Therefore call
fwnode_handle_put() accordingly.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/usb/typec/anx7411.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 7e61c3ac8777..d3c5d8f410ca 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1023,6 +1023,12 @@ static void anx7411_port_unregister_altmodes(struct typec_altmode **adev)
 		}
 }
 
+static void anx7411_port_unregister(struct typec_params *typecp)
+{
+	fwnode_handle_put(typecp->caps.fwnode);
+	anx7411_port_unregister_altmodes(typecp->port_amode);
+}
+
 static int anx7411_usb_mux_set(struct typec_mux_dev *mux,
 			       struct typec_mux_state *state)
 {
@@ -1158,34 +1164,34 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
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
@@ -1197,7 +1203,7 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 						     typecp->src_pdo_nr);
 		if (ret < 0) {
 			dev_err(dev, "source cap validate failed: %d\n", ret);
-			return -EINVAL;
+			goto put_fwnode;
 		}
 
 		typecp->caps_flags |= HAS_SOURCE_CAP;
@@ -1211,7 +1217,7 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 						     typecp->sink_pdo_nr);
 		if (ret < 0) {
 			dev_err(dev, "sink cap validate failed: %d\n", ret);
-			return -EINVAL;
+			goto put_fwnode;
 		}
 
 		for (i = 0; i < typecp->sink_pdo_nr; i++) {
@@ -1255,13 +1261,18 @@ static int anx7411_typec_port_probe(struct anx7411_data *ctx,
 		ret = PTR_ERR(ctx->typec.port);
 		ctx->typec.port = NULL;
 		dev_err(dev, "Failed to register type c port %d\n", ret);
-		return ret;
+		goto put_fwnode;
 	}
 
 	typec_port_register_altmodes(ctx->typec.port, NULL, ctx,
 				     ctx->typec.port_amode,
 				     MAX_ALTMODE);
 	return 0;
+
+put_fwnode:
+	fwnode_handle_put(fwnode);
+
+	return ret;
 }
 
 static int anx7411_typec_check_connection(struct anx7411_data *ctx)
@@ -1528,7 +1539,7 @@ static int anx7411_i2c_probe(struct i2c_client *client)
 
 free_typec_port:
 	typec_unregister_port(plat->typec.port);
-	anx7411_port_unregister_altmodes(plat->typec.port_amode);
+	anx7411_port_unregister(&plat->typec);
 
 free_typec_switch:
 	anx7411_unregister_switch(plat);
@@ -1562,7 +1573,7 @@ static void anx7411_i2c_remove(struct i2c_client *client)
 	if (plat->typec.port)
 		typec_unregister_port(plat->typec.port);
 
-	anx7411_port_unregister_altmodes(plat->typec.port_amode);
+	anx7411_port_unregister(&plat->typec);
 }
 
 static const struct i2c_device_id anx7411_id[] = {
-- 
2.34.1


