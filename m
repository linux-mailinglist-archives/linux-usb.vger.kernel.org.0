Return-Path: <linux-usb+bounces-17764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFA9D45CC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 03:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 285992844C5
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 02:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994E123099A;
	Thu, 21 Nov 2024 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="E3m6zsTI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD7E136358
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 02:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732156769; cv=none; b=M2waasWYksLhN8yFqAFi0kDJeosyyu+nL49GIEXn6Cy36gVucS46BFSGxbYROV/X3qYxmtKdkSqNXGonQ//f0P7P9dgTQ+WdJIyNGbMaNlm4Vxhk8YLGAWrIz5AmvmX6FbcNiP9B9QPqj0RGNcAwmCvwRhd1bX8T81EdaopKhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732156769; c=relaxed/simple;
	bh=2H7mtQzYp0TLoyfuYgyWe2slyZ2FdqNj/Q1Q7UJc4vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aNSL25W44DEEHEhW9KW3LnjCfN+9UgBTi51JOA59gn3ed8QTwdphY/ymTl20l3t73pkW4u4PUz98FqUUQxUZN6ClqhS1jp5UAgvK7AAQvs+uf79AE/mqKw2zV/jNwl/1yDhKepXQJCKt9jRyYTTCa3TCi45WMG2sPzKccan9LZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=E3m6zsTI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so461056a12.0
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 18:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1732156765; x=1732761565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMEAUur1BpykWlac5weiHbatFHF9XI1zWsCYMdjHiJ4=;
        b=E3m6zsTIpMqDYghLB5yQBpcbwpGXP5NPDVGnuffn+glOpVji5f3GwlQwyzjn2issgK
         Tboa79tWlASEJhdvsGeq7XE1SSkzJoGn8UvbnZZZJSSWEJWUR7I9CSgb8jfaXGXPImJu
         Qo5AMJjHyYIs/1oJsa1TNMSI4iRzIR9gBCO4mGzyC/v41qVCgIgkxgZ32PY+9OejAfAH
         mYQIu77P6FD+bVy+xRLA9HXV+28bwcLPAVwwbl8Lw2LYApVyaFxOHMfGq/9QdBGGdv1+
         wNJFHs7bf0iBOFVfVUTCt8nktyGAkxRb62nQ/1h8aM8Co7612w0BNB4Pl4Qh0q1j8+df
         /IcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732156765; x=1732761565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMEAUur1BpykWlac5weiHbatFHF9XI1zWsCYMdjHiJ4=;
        b=o119RwqIWf8yVuYqqvIq7P8tUrGMNh9GQg2zYIjCkveBI1iMZdidxKTQufQOVUHTa/
         NxTr2CzeIv1LrVbDfBP25B1afc3PA54rlw4IJtrgy4buxHO4m0P+W03out5FP050lMUV
         5LKNTew0X6sXBq7a8YX2aCgItoYd07WqSwL9L5JgmKQAC3i0/yIiTNQ495lClOgqptpo
         RPscxm2ICyUtOwBvV3DrcOCXXvJKdkt/x5b+dixM7gNxfP/svQScytOn3JswISQ6kZab
         +IhKY0Qtqrzg6MP5c6JSWnNtPjPd3WAxmXoyF/DT7nS9GLiDF4ONEuezbL14h6RWG+0Q
         TPKA==
X-Gm-Message-State: AOJu0YzK9wLCH+A232R01CGkcN+nV/xWvxUGx3x9AHibNZRbSIMVtQ76
	oRtjPvKymtqvfIMAwUwC05NRcrbBuvrquVXIsXXcRf70PlrRU768+AkVxNHtgD4=
X-Gm-Gg: ASbGnctzMKsKDTOI/VsBsdsvXVlPT6c4nx8mnHf6rCdUPjzcRly9T5N157KOhczsdk/
	v+NFngGoNMVoFk726gIP2LWMn9aueO84rAxqr0CC50BbRCRJgbtAt4ZexnwND5J4mR4mHP5PCg5
	mpIbshono7B6cUiqbscXEa1zNy5NWAYQEXTLrBllwKSmMEGzHUo6qujf9k7r2IY2dJuNxlfdk/q
	zMJJNgSjekXFqs1/VJOQLAEtO4iQBlc58N0c6loobCsrDs3BtjR746KAX/8kkspON0i4a/T9g==
X-Google-Smtp-Source: AGHT+IHI5jcjo/SbYG3H3PQ9jXV+M8eqBfpICerWU4nqBvnHNPBnXqddR0amd9ZDq9cLAwlUHwyAZA==
X-Received: by 2002:a05:6a20:a110:b0:1db:f02d:dd49 with SMTP id adf61e73a8af0-1ddb10dfb56mr7310382637.40.1732156765193;
        Wed, 20 Nov 2024 18:39:25 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:2973:c72c:77ad:fd3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef8d94bsm2390701b3a.114.2024.11.20.18.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:39:24 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: typec: anx7411: fix OF node reference leaks in anx7411_typec_switch_probe()
Date: Thu, 21 Nov 2024 11:39:14 +0900
Message-Id: <20241121023914.1194333-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The refcounts of the OF nodes obtained in by of_get_child_by_name()
calls in anx7411_typec_switch_probe() are not decremented. Add
additional device_node fields to anx7411_data, and call of_node_put() on
them in the error path and in the unregister functions.

Fixes: e45d7337dc0e ("usb: typec: anx7411: Use of_get_child_by_name() instead of of_find_node_by_name()")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v3:
- Add new fields to anx7411_data.
- Remove an unnecessary include.
---
 drivers/usb/typec/anx7411.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 95607efb9f7e..e714b04399fa 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -290,6 +290,8 @@ struct anx7411_data {
 	struct power_supply *psy;
 	struct power_supply_desc psy_desc;
 	struct device *dev;
+	struct device_node *switch_node;
+	struct device_node *mux_node;
 };
 
 static u8 snk_identity[] = {
@@ -1099,6 +1101,7 @@ static void anx7411_unregister_mux(struct anx7411_data *ctx)
 	if (ctx->typec.typec_mux) {
 		typec_mux_unregister(ctx->typec.typec_mux);
 		ctx->typec.typec_mux = NULL;
+		of_node_put(ctx->mux_node);
 	}
 }
 
@@ -1107,6 +1110,7 @@ static void anx7411_unregister_switch(struct anx7411_data *ctx)
 	if (ctx->typec.typec_switch) {
 		typec_switch_unregister(ctx->typec.typec_switch);
 		ctx->typec.typec_switch = NULL;
+		of_node_put(ctx->switch_node);
 	}
 }
 
@@ -1114,28 +1118,29 @@ static int anx7411_typec_switch_probe(struct anx7411_data *ctx,
 				      struct device *dev)
 {
 	int ret;
-	struct device_node *node;
 
-	node = of_get_child_by_name(dev->of_node, "orientation_switch");
-	if (!node)
+	ctx->switch_node = of_get_child_by_name(dev->of_node, "orientation_switch");
+	if (!ctx->switch_node)
 		return 0;
 
-	ret = anx7411_register_switch(ctx, dev, &node->fwnode);
+	ret = anx7411_register_switch(ctx, dev, &ctx->switch_node->fwnode);
 	if (ret) {
 		dev_err(dev, "failed register switch");
+		of_node_put(ctx->switch_node);
 		return ret;
 	}
 
-	node = of_get_child_by_name(dev->of_node, "mode_switch");
-	if (!node) {
+	ctx->mux_node = of_get_child_by_name(dev->of_node, "mode_switch");
+	if (!ctx->mux_node) {
 		dev_err(dev, "no typec mux exist");
 		ret = -ENODEV;
 		goto unregister_switch;
 	}
 
-	ret = anx7411_register_mux(ctx, dev, &node->fwnode);
+	ret = anx7411_register_mux(ctx, dev, &ctx->mux_node->fwnode);
 	if (ret) {
 		dev_err(dev, "failed register mode switch");
+		of_node_put(ctx->mux_node);
 		ret = -ENODEV;
 		goto unregister_switch;
 	}
-- 
2.34.1


