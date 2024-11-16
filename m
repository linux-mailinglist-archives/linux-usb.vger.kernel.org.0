Return-Path: <linux-usb+bounces-17642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F18449CFD66
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 09:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E6D91F23B61
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFAA192D86;
	Sat, 16 Nov 2024 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="RkBOLz2U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCD418FDAF
	for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731747322; cv=none; b=h9DFjcsl38/cGLiQXcn+dDN4JAj2Iq+o5IGj3E9UTpvM31Nyu7QxrO1dRw6AhNQ/KGoLcWTuwfpUtmg7K3v0lzoPJbzYYycEC8XURlNs0EI1obb6nxRVuqurQexkcLfqyx1QFMPzFUFfrcUPLfoUN5dvidh4TcTkeAJEjNJwj04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731747322; c=relaxed/simple;
	bh=9bSkJer9TO0x5cLRPGif1lABerNmnAmgJ1nQXQT+9us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YUWQc8RIQFabJHecFNQukQt8/DZL2bQPbhJscSyc8sYCovUkQ1pPMMsOsUc3MUe5ZCyCktpOKdeajjDQChxtzpT6YsuJpVjLlixcfRA+LGEgvfZlgbyMtuWYUsuVc/djdrh1ZlUZcj6b9/NrbLmUCOMOLFXyY37t1kOjeI6lBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=RkBOLz2U; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21116b187c4so2085175ad.3
        for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 00:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731747317; x=1732352117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfGAQfgPppCq2YiD6ICG6LYvGNaSaL/5bbCHwooCkBg=;
        b=RkBOLz2UBwAQtVmOBwyNonl3H99CyUcIdiOECVBpJWpM+Irr4OBp97HrAslai2Cn0P
         jtFeAtcWbY1oh/03HF2rncx20wkTXSgafveF7i3M2zVVGuYXEJlP5G7VDo5+C71AIc+g
         v9ZIRPSW0QDtHrvP38IVvnNEmv78o6s7QPXJZ5AKBb7VuqgAaxYpMsv8VY8iCG+YZZlk
         xZ2/k3IELW6lZvkJmUOrVx5PxeKlIacGr10fjqu2S514gb/S2Al0ztY6eDkn8CqxUQAj
         swZ5FGIwjcCLNJUDsgKT6/Et+Fuw6dPMAi+alwPVx+xKk5ca5LbR7yo3nV91GRb9YHbi
         7VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731747317; x=1732352117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfGAQfgPppCq2YiD6ICG6LYvGNaSaL/5bbCHwooCkBg=;
        b=OPGrZC72IXVrlSyzEB9q4XeeYDQi/FoS9kIjuPMcD16Ny+NWk0mEATjyqSPPpAKENM
         9iFh9fmUCMD5+7Zom5JK3SMInblWH/XLMSvyIvD4G+T6cndqQOrTnsCyLyvkKuJQ9r+H
         I//4QC00xElrk2DYmGs06bo4K2FUHkWb1WTe7BrlzlTi0B+jZUkMGFyLS/qWtX6u/0xJ
         qQGL8NpwljndpKM6lvXETKck4K31u7HMo6xfLvltr1PuttoL0ligjcirbNmzkScioxwd
         UTK4kpXfQaLZVr/GKjaUAEQtvOryZMZpShRYUlgYobr9GZxiklPy6RbTgiQ2Krv4AjC8
         YNXA==
X-Gm-Message-State: AOJu0YwXVuTKCrwk4Qh6I7qbaYMtLhvNRuR7IcySNJBOdWpcsqqhHCQ5
	/tjwSPAPaxpN53Bbb9XJ9l2HDWEkM4gghwiFssLuFu4upUxOxO9KAy5zy8+R1mg=
X-Google-Smtp-Source: AGHT+IEX5SbnXmPwteCLfJBW+zv49vP3Iy7yPK8Hy6/jJp54yDb9UC9a4hQKHyJ45xNSELBqjoOAsw==
X-Received: by 2002:a17:902:c408:b0:20c:8d7f:8fec with SMTP id d9443c01a7336-211d0ed9f17mr84865095ad.56.1731747317569;
        Sat, 16 Nov 2024 00:55:17 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:2520:9500:2c80:c37:9141:9411])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211ec2d47bcsm9077385ad.142.2024.11.16.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 00:55:17 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: anx7411: fix OF node reference leaks in anx7411_typec_switch_probe()
Date: Sat, 16 Nov 2024 17:55:03 +0900
Message-Id: <20241116085503.3835860-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The refcounts of the OF nodes obtained in by of_get_child_by_name()
calls in anx7411_typec_switch_probe() are not decremented, so add
fwnode_handle_put() calls to anx7411_unregister_switch() and
anx7411_unregister_mux().

Fixes: e45d7337dc0e ("usb: typec: anx7411: Use of_get_child_by_name() instead of of_find_node_by_name()")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changed in v2:
- Add the Cc: stable@vger.kernel.org tag.
---
 drivers/usb/typec/anx7411.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index cdb7e8273823..d3c5d8f410ca 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -29,6 +29,8 @@
 #include <linux/workqueue.h>
 #include <linux/power_supply.h>
 
+#include "mux.h"
+
 #define TCPC_ADDRESS1		0x58
 #define TCPC_ADDRESS2		0x56
 #define TCPC_ADDRESS3		0x54
@@ -1094,6 +1096,7 @@ static void anx7411_unregister_mux(struct anx7411_data *ctx)
 {
 	if (ctx->typec.typec_mux) {
 		typec_mux_unregister(ctx->typec.typec_mux);
+		fwnode_handle_put(ctx->typec.typec_mux->dev.fwnode);
 		ctx->typec.typec_mux = NULL;
 	}
 }
@@ -1102,6 +1105,7 @@ static void anx7411_unregister_switch(struct anx7411_data *ctx)
 {
 	if (ctx->typec.typec_switch) {
 		typec_switch_unregister(ctx->typec.typec_switch);
+		fwnode_handle_put(ctx->typec.typec_switch->dev.fwnode);
 		ctx->typec.typec_switch = NULL;
 	}
 }
-- 
2.34.1


