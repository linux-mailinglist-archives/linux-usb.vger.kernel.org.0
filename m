Return-Path: <linux-usb+bounces-504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 347867AAB6F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 10:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 847D32853C5
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 08:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1A81DDCF;
	Fri, 22 Sep 2023 08:04:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91014F81
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 08:04:46 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BFAE44
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 01:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=QKeY3D1+RN2jWEiErP7FIt0WfM1XoXZIvIYk9D2iHHQ=; b=R5CTX7
	Cc74i2zTJPhTZQsdOeMPilA3jf6l5YB/BPNT6DjiamkKKichgIQfvpJdsnoedKbE
	jrn3ZzkBABs758k+TSlQGvnSPY1XaSI6U/U+/WB+HtbrZ7GH2S/bdT3cswVy+Mkv
	6k2Ql38LtDrlbxezTOyWSK/nAHdMmkjkx/loKRx+dhdN3H7sLv7ReV0oZ/kv2IqD
	phC8Ejx5aoFLgG/F2+O2baVF1078MLZnsyWFjF3W7FAtWbEmgwC5E0ZlF+JCjquV
	lLZUejURuSL91NjdLKERq+HLNKSwmIQRS0mnsKpIWGz/jNgIVgtCs2ZkkCM6oKKL
	u+zHtdccfllf9DRA==
Received: (qmail 1310895 invoked from network); 22 Sep 2023 10:04:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 10:04:28 +0200
X-UD-Smtp-Session: l3s3148p1@J427Du4FZsIujntX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: drop check because i2c_unregister_device() is NULL safe
Date: Fri, 22 Sep 2023 10:04:18 +0200
Message-Id: <20230922080421.35145-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922080421.35145-1-wsa+renesas@sang-engineering.com>
References: <20230922080421.35145-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

No need to check the argument of i2c_unregister_device() because the
function itself does it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only. Please apply to your tree.

 drivers/usb/typec/anx7411.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 221604f933a4..b12a07edc71b 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1550,8 +1550,7 @@ static void anx7411_i2c_remove(struct i2c_client *client)
 	if (plat->workqueue)
 		destroy_workqueue(plat->workqueue);
 
-	if (plat->spi_client)
-		i2c_unregister_device(plat->spi_client);
+	i2c_unregister_device(plat->spi_client);
 
 	if (plat->typec.role_sw)
 		usb_role_switch_put(plat->typec.role_sw);
-- 
2.30.2


