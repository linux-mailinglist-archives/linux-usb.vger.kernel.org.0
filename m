Return-Path: <linux-usb+bounces-36629-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLP0D2y48GlwXgEAu9opvQ
	(envelope-from <linux-usb+bounces-36629-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 15:38:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEF48604C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 15:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 715D430F28D6
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 13:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F4043E9D5;
	Tue, 28 Apr 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9Q8pzLe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863743DA53
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382311; cv=none; b=R+IZIQ9jrL/jL1nXzkcCr7WeqBXiJmnYg7bTHnXVrF0CLQtfdV5sX8toKIiPclsaXuWWEVvqQez4LxxxLQN+fUTMB3eQoP1OXgJKtuSWhXOpyE38rZNZzZzdnpFUqLjZwcmLwWN9i9TzWXc3BZJSgUmYq+ft5wmuVFzfnjj8Mak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382311; c=relaxed/simple;
	bh=LeBUvx6Pk4t0VrcyfehygjN6ttef5Wj0cz9EoiHhwhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ucRG3VgMr69jZupDzLKmpzRwqicC/NZ38ItBtdnmd7UxfWEz/bOOiu1ZpUp1W+Bu+1lJXsPNgNWVQ2jdeOfFQvUYcLjBPpBlawrG0ErlCCqo9CZmzV175InEVr6gK/Z3rHnnvbjM6YNZWnDaNwBLu/JW2W6D7VzBe33XjzDX63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9Q8pzLe; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c76d797b180so7720751a12.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777382310; x=1777987110; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sB0vJ2DhSZYXfYX7V4bF9gYiGIMZ7ekNua2Hrw8Y3V8=;
        b=n9Q8pzLeRVTofIn5V25m0J90fTq1aQTOdKUJqMZOjrJ+nxzdw+r62LP1cHPN6IzQI2
         8rZWNuSSmzdLmAoU9qKSBR3ALw7swWgxQKnbHrtDq+4ka9GlyTAt9pRUqH1EMwyr3Vjc
         TMKAf3lsqGqn0zH9IhB0ZLzUW4zwQxVAEdvntHQtJ/ZwtTpZnmlPMlCNEmxAhvjPeJnK
         GKkNlVp1el3LmIaSqO/lz5vvEEAFG3pRXjMkuHTtGPg8/BzIGt6wd+0lMFpeDaoHng+U
         qHxgY9QVEEAyuCbomjFtPMh30cDniTxvcYrdxXIS8/G3mf0CvBaB+zR3qQkpVe5Bzv5x
         3Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382310; x=1777987110;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sB0vJ2DhSZYXfYX7V4bF9gYiGIMZ7ekNua2Hrw8Y3V8=;
        b=A1AkMc7s2X+8feZgxn3iVEWQ38dwR4NJHKWOHg0urh/7Q+J8THfv0dMofRdGJPM9/h
         38BPZXUUSDZhf6v8oVikVRPw0JDa5jP1GUZauYpRPnX7oKAkW8h+47jQXEH54qSMM+Jn
         1VHtpd1sVbFaddbo+S8zLgqhR0h33LnOZpuu+E6fvDdwXiZgpRGdvnSRc2PPFlIIxT6D
         FuN2dk9SxGSnKkXH5WJD7env9Z7gXg/8nYSz4z8GnBtX1uwg3pzzKEkBcYW2W1uGGPb7
         MWFydsCtJkuz9r14aNmAlTRFkA92loTaTNnKXbsthzUOL89OjOMk5G8s7NMHehcBGGot
         ZTtQ==
X-Gm-Message-State: AOJu0YyLG5wxf+tOb87ALbtaVWaJRd6lFaTiirwTCtvQqssjR+kcGY4j
	Pt4/bL9t2nAPjkd56HBgF23BJnBZj7atx7+zumTXSNT3rW+3qGF3j4H8GvR92gGr
X-Gm-Gg: AeBDieuZWuX8zsBxI0FvRrbnIyVGmEs3od3QZ3w8rCXSBrZzzjb24hBtQfnsOOd9amC
	2YQ3NYD3vzdiiMLAf2b43iRD23T3G2gI+T6yVq3DeHc2l32PDQL+wVny9Qt0jfKfj9JSZYuLyYj
	dqSiyxgEsKKeYFkVo6z6SkIg6MSott870E9bVoIgvl8R65sUrRM/ldFtrkCFyKsJM6szToh3FjV
	4TpcC4v5Mpy8NOq71ABQ4j3lv1C+1bpvGMZXu15PP7GKhisOUZIuTqaeHkhly6f82fcD+gxCr1+
	QoqVgJ0rVLJmPufcLFiyZUJ0Rvq+MAVmEUmWJ50iyxTlKfOEQNspUneb+nvEf40A2OWLsYBfhKC
	/erY0zlQz2MkbJksEuXhspqaPLPLBUI3pQtIJPSijtkR1c0QJBFH1yALNlLXRb2JRHoMd2BS4Ws
	jHM6rQlqI9CL4PE+MVt/Jz8+NGgewwmGUifH+5+06IPjZg5UdSt1wGDmZTbKNbv9HDT6jP0x2pM
	kYYBTcAF+e7udY1W46gUv00rTARhKk=
X-Received: by 2002:a05:6a20:e292:b0:39f:24ad:ad00 with SMTP id adf61e73a8af0-3a39bfc3032mr3445348637.7.1777382309385;
        Tue, 28 Apr 2026 06:18:29 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc29b1fd5sm3116360a12.9.2026.04.28.06.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:18:28 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 28 Apr 2026 21:18:21 +0800
Subject: [PATCH v2] usb: typec: fusb302: Fix resource leak when
 devm_drm_dp_hpd_bridge_add() fails
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-fusb-v2-1-aa3b5942cabb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJyz8GkC/13Myw7CIBCF4VdpZi2GQXrRle9huqAwbSexxYAST
 cO7i126/E9Ovg0iBaYIl2qDQIkj+7WEOlRgZ7NOJNiVBiVVI7VCMb7iICS1sqst6RMaKNdHoJH
 fO3PrS88cnz58djXhb/0DEgoU0pydazS1XT1cp8Xw/Wj9An3O+QtrQL6mmAAAAA==
X-Change-ID: 20260421-fusb-0e7085ce431a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777382304; l=2496;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=LeBUvx6Pk4t0VrcyfehygjN6ttef5Wj0cz9EoiHhwhM=;
 b=19C0Y8GzytK5wgnDOpKqwuDbdWWlmQ/nppLY5KtneqOSiRLPpmDGMUEzIO+DzJldcNM8Ut96c
 0ThkzsFNa+4AKpGdt7rrWST591pGiphGYLcHBDD7NeGNTvx91OlsnRJ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Queue-Id: D7AEF48604C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36629-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]

If devm_drm_dp_hpd_bridge_add() fails during fusb302_probe(), the original
code returned directly without cleaning up the resources.

Move bridge registration before the IRQ is requested and route bridge
registration failures through the existing TCPM unregister and fwnode
cleanup path.

Fixes: 5d79c525405d ("usb: typec: fusb302: add DRM DP HPD bridge support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Heikki's comment.
- Link to v1: https://lore.kernel.org/r/20260421-fusb-v1-1-0a9dd64e785b@gmail.com
---
 drivers/usb/typec/tcpm/fusb302.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 889c4c29c1b8..9ab1277b7ed1 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1751,19 +1751,22 @@ static int fusb302_probe(struct i2c_client *client)
 
 	bridge_dev = devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node(chip->tcpc_dev.fwnode));
 	if (IS_ERR(bridge_dev)) {
-		ret = PTR_ERR(bridge_dev);
-		dev_err_probe(chip->dev, ret, "failed to alloc bridge\n");
-		goto destroy_workqueue;
+		ret = dev_err_probe(chip->dev, PTR_ERR(bridge_dev),
+				    "failed to alloc bridge\n");
+		goto fwnode_put;
 	}
 
 	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
 	if (IS_ERR(chip->tcpm_port)) {
-		fwnode_handle_put(chip->tcpc_dev.fwnode);
 		ret = dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
 				    "cannot register tcpm port\n");
-		goto destroy_workqueue;
+		goto fwnode_put;
 	}
 
+	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
+	if (ret)
+		goto tcpm_unregister_port;
+
 	ret = request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
 				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 				   "fsc_interrupt_int_n", chip);
@@ -1774,14 +1777,11 @@ static int fusb302_probe(struct i2c_client *client)
 	enable_irq_wake(chip->gpio_int_n_irq);
 	i2c_set_clientdata(client, chip);
 
-	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
-	if (ret)
-		return ret;
-
-	return ret;
+	return 0;
 
 tcpm_unregister_port:
 	tcpm_unregister_port(chip->tcpm_port);
+fwnode_put:
 	fwnode_handle_put(chip->tcpc_dev.fwnode);
 destroy_workqueue:
 	fusb302_debugfs_exit(chip);

---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260421-fusb-0e7085ce431a

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


