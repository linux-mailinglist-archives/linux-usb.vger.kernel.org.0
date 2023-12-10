Return-Path: <linux-usb+bounces-3946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8880BC67
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 18:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD332B207F2
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 17:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC03199DD;
	Sun, 10 Dec 2023 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AxSz70YD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9AB9DFA
	for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 09:43:51 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CNj0rzutIa8POCNj0rYn7g; Sun, 10 Dec 2023 18:36:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702229780;
	bh=3nUYliN94T1NkME5cPRgstUEirYwToMnADC29sMEwME=;
	h=From:To:Cc:Subject:Date;
	b=AxSz70YDDsU/5CeRF8hPLoSXwXW4uIk3DrZLefDz3WzhukcKpENMG14i5fQe29Kqw
	 6W7/JuIKrOtz/Oig+Sp9t0NyVhktqS23nTnwh7abJEXPC7N9p+wUBCL4apv4UujF6R
	 0cX+OY778i8Zfzpas/KBixzppkGtt9IpybUBSW61xqaKm54BXy7cUHTpSpM6hyMMfT
	 ATMHF7Uy7iPGg83ZLBG2UiR9A8Sg5PK4gEHVUf9CTOnQEDwoyKmXrJjroR1tL/6w4M
	 ju7EQbA2AZQ0JeasrQsTjeMYLK3R87BDVry9c8FZ/Y5uguXvuq6uNvnW4Hg7BY9ODd
	 eS27BWJPt7DDQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Dec 2023 18:36:20 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 10 Dec 2023 18:36:15 +0100
Message-Id: <c7b99c4f52649ce6405779fbf9170edc5633fdbb.1702229697.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/typec/class.c | 8 ++++----
 drivers/usb/typec/pd.c    | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 16a670828dde..5fe01bf795b9 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -476,7 +476,7 @@ static int altmode_id_get(struct device *dev)
 	else
 		ids = &to_typec_port(dev)->mode_ids;
 
-	return ida_simple_get(ids, 0, 0, GFP_KERNEL);
+	return ida_alloc(ids, GFP_KERNEL);
 }
 
 static void altmode_id_remove(struct device *dev, int id)
@@ -490,7 +490,7 @@ static void altmode_id_remove(struct device *dev, int id)
 	else
 		ids = &to_typec_port(dev)->mode_ids;
 
-	ida_simple_remove(ids, id);
+	ida_free(ids, id);
 }
 
 static void typec_altmode_release(struct device *dev)
@@ -1798,7 +1798,7 @@ static void typec_release(struct device *dev)
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	ida_simple_remove(&typec_index_ida, port->id);
+	ida_free(&typec_index_ida, port->id);
 	ida_destroy(&port->mode_ids);
 	typec_switch_put(port->sw);
 	typec_mux_put(port->mux);
@@ -2297,7 +2297,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	if (!port)
 		return ERR_PTR(-ENOMEM);
 
-	id = ida_simple_get(&typec_index_ida, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&typec_index_ida, GFP_KERNEL);
 	if (id < 0) {
 		kfree(port);
 		return ERR_PTR(id);
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index 85d015cdbe1f..7f3d61f220f2 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -571,7 +571,7 @@ static void pd_release(struct device *dev)
 {
 	struct usb_power_delivery *pd = to_usb_power_delivery(dev);
 
-	ida_simple_remove(&pd_ida, pd->id);
+	ida_free(&pd_ida, pd->id);
 	kfree(pd);
 }
 
@@ -616,7 +616,7 @@ usb_power_delivery_register(struct device *parent, struct usb_power_delivery_des
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	ret = ida_simple_get(&pd_ida, 0, 0, GFP_KERNEL);
+	ret = ida_alloc(&pd_ida, GFP_KERNEL);
 	if (ret < 0) {
 		kfree(pd);
 		return ERR_PTR(ret);
-- 
2.34.1


