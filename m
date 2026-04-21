Return-Path: <linux-usb+bounces-36390-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC8uJr1e52lr7QEAu9opvQ
	(envelope-from <linux-usb+bounces-36390-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 13:25:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA043A166
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 13:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25CFB3035A80
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 11:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0493BED10;
	Tue, 21 Apr 2026 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfAP+QNK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC8386552
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770703; cv=none; b=N/DAGbwQusJ/+NTjqxiN4VFLJzYodYoabWRTriCcZKeAuU28EtUpG/rkj2OaGvX5frXQ2/raXvs/Nc4bZiJjD7DoYWXFM9O0QKOH5P5JbGFyKbvvmqFiOcNMXjMa0iiQNbyzrRy7NWmVSE6St9sOLANa1m+lDk90r2qtZ+TnTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770703; c=relaxed/simple;
	bh=CWxOjrPox5X0t2ux+PS1nC8+1GwG2oY37tSlwSN9J+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O5PrjYdK/GngTLj0pqCtf0ek8SmwooXe5j4eLGGU425KrrgSY/iWgkenYd6XwsuS795d3V3qNJiV7RInpheogriRXCke3e5gSTLPva1587ZOuMHBOKmed4G4OSf5+kIRlekIP/S5jMfupZufRzE5SyBOsZF9R4fsoizqlOwHFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfAP+QNK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so2752813a91.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 04:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770701; x=1777375501; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gL/ODejSIDTzofKoBStX7l4wxG/3mI8CvPRp2FsgEmc=;
        b=LfAP+QNKKo05J6xcU9RwxYKR+ZSMoyfgKG7mOc8ZlxNXMEuM2SJsKbFYIxh0DO1A5Y
         RBkUIgloWSmX4Bv8/gxI8n2i3Ac8nkZeZUAXlranQ9oCaiNWFqtC9RCP8M5VtAxhU2bC
         3hXAxPSGPx68naOykqkrX14/CMdtqYfXW4/pnP0kyupDNPPAuCtj7gWRXCfhbKVKcfSW
         oK2B035XGy+xwMivAnobLA+w8SQwuYv0LipKi2fjmgAz+7Tsa2g53FYOmTdNhy+SbXq8
         DdJ1xoY4neYKpOGA8Rx6vfbc4mE+aWISD5uS/m76vJWppotPwK5gJyI3poK2UpAtTYGu
         VPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770701; x=1777375501;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gL/ODejSIDTzofKoBStX7l4wxG/3mI8CvPRp2FsgEmc=;
        b=NRXjdYaLCW3MBdA5SDjGX7zd9PCjER1GvisW5NSa0cATmQwaL6e32sB3+XWCgM9eTQ
         Hcj/H2oJYgcgo190oYZKQTCPW9FASBVUUZodH4Vb3U1dSA+pU03GkDNvBNGgbxBfCe/j
         ihjlbVHZSKrqdBTCmH+a1jKEVvbO3xujnYuwDtcERaYb9NSjkXiZ6DDa5iyFTOcMz8vN
         85zHifcpeJlQFUEy8EZbh0AP7JVtJnIebvTrH9FVcV8DoxxiA3cv2ghrKHQDbf7DZGl6
         A0eJZ5gPvWcFXXfp/evvUlqoJt3LVCWTB0XOVAXLyj59IhZ4KT86O9cvNvWhycX36Y6E
         5Dxg==
X-Gm-Message-State: AOJu0YzJz+05kTQVIuLbneurjrfqZpLIXCvU6xWDs1zBY+6x+6q6WQDp
	5UtDCVWjnunanfqwLR5bx4RKLb+tjMWnfAekPNqAuYrOR3K7JmehCeZE
X-Gm-Gg: AeBDievm2RtysVKXLwtZt9+ras9tlQtdq9b5Lj6fkqP24eZ8v9rYebOMGd01G0CCLPs
	4RB4GDhj6CY12SOvT6tz34vy4ztObguOdCSdd6AJscQnYDR6kzUb7quX9yFm9nCl/Z7J6/YoMec
	PCV5vacnly9vrIFA92tRO1mcMKFYnO4Butr2KhZDM49LUiud1aoB8jzuh0WdDNUYDiLye8zFgo1
	BQBxbyfjwa2IAkJHJz7grYTy1+ZSN2QfT3ptUHO6bUd3WoKShd+QQwKTy3v22HYCMCjdhhK9ICl
	kh6G+jgzZYf15LLezu4SED+3ErRXmMhHvxL56HyZVu4TrHKylnoFmppyUtuKKKXOffnUCjEJptZ
	iVtzi+asyhfFywYIJiVQ5GPf8Y6QXGwFa/QkMiPusuzcOhr2cCzeEba4IVvuJEafFplFyT/Uv5i
	Q0UREP1SDYdCB6SPminrw5fIx3Wv/CEZ5YWGdos/Lqsz3UTZzWYoIHUtVOGDCrxOyF9trShVSb+
	wfJZrId3KJJlkAY90H6Kt9HP8edkhg=
X-Received: by 2002:a17:90b:4ecc:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-361404b9802mr17074367a91.26.1776770700393;
        Tue, 21 Apr 2026 04:25:00 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb4b4b5sm7272732a91.3.2026.04.21.04.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:24:59 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 21 Apr 2026 19:24:56 +0800
Subject: [PATCH] usb: typec: fusb302: Fix resource leak when
 devm_drm_dp_hpd_bridge_add() fails
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-fusb-v1-1-0a9dd64e785b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIde52kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyND3bTS4iRdg1RzAwvT5FQTY8NEJaDSgqLUtMwKsDHRsbW1AJ4D4vZ
 WAAAA
X-Change-ID: 20260421-fusb-0e7085ce431a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776770697; l=1362;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=CWxOjrPox5X0t2ux+PS1nC8+1GwG2oY37tSlwSN9J+c=;
 b=2sp2DginR8fnX2lA64kpvRPbJuaRWXNTfJ0OPuQQ/Fk0sehX3v+rwF+2jcDwspgNEkHis+egI
 zBnn6SSyFy0COOBLqEZEtjXrfKASfEXQ9igRQ/x39PopRvBnil7nL+Q
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36390-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89DA043A166
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If devm_drm_dp_hpd_bridge_add() fails during fusb302_probe(), the original
code returned directly without cleaning up the resources.

Route the failure through the existing unwind path so probe cleans up the
same resources that are released in remove().

Fixes: 5d79c525405d ("usb: typec: fusb302: add DRM DP HPD bridge support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 889c4c29c1b8..5b631422c128 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1776,10 +1776,15 @@ static int fusb302_probe(struct i2c_client *client)
 
 	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
 	if (ret)
-		return ret;
+		goto free_irq;
 
-	return ret;
+	return 0;
 
+free_irq:
+	disable_irq_wake(chip->gpio_int_n_irq);
+	free_irq(chip->gpio_int_n_irq, chip);
+	cancel_work_sync(&chip->irq_work);
+	cancel_delayed_work_sync(&chip->bc_lvl_handler);
 tcpm_unregister_port:
 	tcpm_unregister_port(chip->tcpm_port);
 	fwnode_handle_put(chip->tcpc_dev.fwnode);

---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260421-fusb-0e7085ce431a

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


