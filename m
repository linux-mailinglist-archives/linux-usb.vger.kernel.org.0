Return-Path: <linux-usb+bounces-17638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33BB9CFD33
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 09:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF42C288D2A
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2024 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E1C1917F1;
	Sat, 16 Nov 2024 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="lqlY7W21"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C4B64A
	for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731744587; cv=none; b=HOaLezAd76tg4T2LLb89GFTwa8s6Ey5w6qgR9pk0DnPLXbUza0aRAZd/eDSfSU9JlRj3auOKHgfBAZY8KxlP4yJmO8d5/dAukxK4lfvDAid3urrdzQo5plq8W9Lx3mmPttlwZn8/pQ2B7f4XdGEJr448Ybo22JNNAbYYKNSbfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731744587; c=relaxed/simple;
	bh=oYQT922NFL2wvEOAit1za9mgeNMDO1SIqu6PQ6ssNT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UzFlllo3SqmlGmIYJ3mpd8Ady7w3Y+Y1okV9SFgtRFbGrcyxoWifDWpscbuUxE6qTqSH/XnS28HpMt+uiEc/dNwJo+GoiKosWKViQXfKkWmPb7wqgihKmw5pMkgZ5B31GhkB/AguofCj5UAQXNoISg7HvI/zX2m6eMOmH9Xumnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=lqlY7W21; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso239187b3a.3
        for <linux-usb@vger.kernel.org>; Sat, 16 Nov 2024 00:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731744583; x=1732349383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZNghN2NOlAq/8+IdB9pBF3GNvy2ref8quaEsptkYVw=;
        b=lqlY7W21+PD8eV01jqbIy7VkQESyOGn5m4tVuVClfR8VcTrpYUH9lkBE4i+cg9H7tD
         jolUBLtkcXFIqq/H5UmPpjKKyFaWz2pGPETsnJWQ0mecdzeKPZaGnpfC9R9/WXXAK6UO
         zAXJDJw/0HXLVSxg++SehEFAJPnTcRNyauJ9eBTROteZITb1laSSUWnB9n9VJrmH5tTL
         yLuhbyYmQWZhy/elaEGdeQ6zqzCAadouyXZATkVygQrcXSI1MT2nsH2bMzw3rcz68t/p
         f7Ld2Eqmx7rPEK/hVrNGjmCnIYhK47fhCrfXR8lPLZ2+qzvAf17CaBuraXQ+Yth2hGvX
         BmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731744583; x=1732349383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZNghN2NOlAq/8+IdB9pBF3GNvy2ref8quaEsptkYVw=;
        b=cRo34zKAV1sk/Zg3RN8zJrjbMps6gbuxQBU+4F44TuUpHwpa9C0HWzl9bDUK2wIpbG
         FwOnewKg1JeKY8BHBxxfiwoqfDBlVDEiv7NQfoOwG/OapQgs+gxopFrjH5O+8QV8lCHq
         852TWuZ0cGKZBAyjb6dHTaearmdKc/XqjizlYzO58km3LF2xYUrle+tPBzNiVS7kHcE2
         WlA/tMbgcyDJI2cVOioWu3m5Rd5K7ZutAmAlBDIXVuE0OrkHfSIA0EWq/UdsrhTwDpKY
         CXvleoGwIooTn30VdP7UtMl5M3mWWJepdyAfFLxzr8o5anTXbXcT6gwv+eIDm8Q/vIDV
         UfcA==
X-Gm-Message-State: AOJu0YxaEtAdN1SQUeenQxFpdvgf6xTS9Tz2f9mizdE6Dg1LfLClo7ts
	ADIFSacAcqPJaZXxwRNNYONZaicBiB4WJ+FPlEIW7x7V889+QcmkdqF5SprqYx73rr57L+aiki+
	l
X-Google-Smtp-Source: AGHT+IG49Zm7MaPqVoSG6fs7tRcYUOumE+OpJpNHDJ8egWo9bF2hFmKFg3k5xzB2D4n3Hie0i/rhzQ==
X-Received: by 2002:a05:6a00:2309:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-72476e7b88emr8040608b3a.22.1731744583266;
        Sat, 16 Nov 2024 00:09:43 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:2520:9500:2c80:c37:9141:9411])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247712086asm2575303b3a.46.2024.11.16.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 00:09:42 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] usb: typec: fix OF node reference leaks in anx7411_typec_switch_probe()
Date: Sat, 16 Nov 2024 17:09:38 +0900
Message-Id: <20241116080938.3798365-1-joe@pf.is.s.u-tokyo.ac.jp>
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
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/usb/typec/anx7411.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index d1e7c487ddfb..7e61c3ac8777 100644
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
@@ -1088,6 +1090,7 @@ static void anx7411_unregister_mux(struct anx7411_data *ctx)
 {
 	if (ctx->typec.typec_mux) {
 		typec_mux_unregister(ctx->typec.typec_mux);
+		fwnode_handle_put(ctx->typec.typec_mux->dev.fwnode);
 		ctx->typec.typec_mux = NULL;
 	}
 }
@@ -1096,6 +1099,7 @@ static void anx7411_unregister_switch(struct anx7411_data *ctx)
 {
 	if (ctx->typec.typec_switch) {
 		typec_switch_unregister(ctx->typec.typec_switch);
+		fwnode_handle_put(ctx->typec.typec_switch->dev.fwnode);
 		ctx->typec.typec_switch = NULL;
 	}
 }
-- 
2.34.1


