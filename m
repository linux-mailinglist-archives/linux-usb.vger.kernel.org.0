Return-Path: <linux-usb+bounces-37458-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOR8HCu1BmqKnAIAu9opvQ
	(envelope-from <linux-usb+bounces-37458-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:54:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B6549C95
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 481813087A32
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4460E376BCC;
	Fri, 15 May 2026 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffp7H76O"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F736405F;
	Fri, 15 May 2026 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824257; cv=none; b=k/40flXrfj/UqbZKHKbsZ42awPmoDlp8PMU3fE5mQP0Pg9G+y2nGI7jVQvJ1mkCRjwUOBz9+YiS9MJNyq19dVccS5gaYiUIIbhIdigkcHqz5J7Ue/s03Ud4IbxW1HoU3CxAtEQgklw3KoecBd1RQyR/0l7vCb0X8EUr4+z3MMHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824257; c=relaxed/simple;
	bh=lbXRCb+6WgnhUMlP2gJtywCmwUB9hvTGhwgtFvJ9Hi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+SNje1SaXvKbSkjYFhVAMsOjtuFJgV3N/h0JXek1KP7D8FDN+hX1UD7wa1t7pSkLieeRiPxo6PeDYX3yjPqEcQJeVCvjsK/aBwqC+Y8saF0snUAOawUU0GmYVUBDN4aMdNc0w9/CawZAHgyTBXD8ixJR74TA8Popzuuqd9XYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffp7H76O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C696C2BCC7;
	Fri, 15 May 2026 05:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778824257;
	bh=lbXRCb+6WgnhUMlP2gJtywCmwUB9hvTGhwgtFvJ9Hi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ffp7H76ODBCb2WaErbPAghtSz7YTm8jZSjYDSF4yhMEKvJZ5zh9bq/Ue4ZrvxG+fG
	 zYUvQfnM93QMnBKFsC0n06sQfGIX6y09NkL7JTiSOACnMTylOOqytM/c/5hsP5EUMB
	 b8pmROoKQtDXv03UJhRXtUjQWw2wcoma7HcqzS4/HysGryZ2MKOo4WaOJTSozGz6My
	 7Zg0kA2IkheEr+Xxgx3FN78Od3wFz1rRZOKzbsjgL2YQCC+YCJoyLbCIaVoas4mTj0
	 bnzB/gvie4iUU9EUVnkdKFniTI6ODLim7MeKebTepGtK8e1xe734yQ254Nkb6q4nnc
	 bP4yVXHFYYmCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1C1CD343F;
	Fri, 15 May 2026 05:50:57 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Fri, 15 May 2026 05:48:39 +0000
Subject: [PATCH 1/3] power: Add power_supply_get_battery_all() to fetch
 battery psy handles
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-batt-status-v1-1-fed6b7d8cea7@google.com>
References: <20260515-batt-status-v1-0-fed6b7d8cea7@google.com>
In-Reply-To: <20260515-batt-status-v1-0-fed6b7d8cea7@google.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, RD Babiera <rdbabiera@google.com>, 
 Kyle Tso <kyletso@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778824256; l=5048;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=dFElzGvQasU7y5gAnjIepqrRB4ceeHil0GBlXrTuj7Q=;
 b=vQGrPaC36jMAjEK6RXyLkLAdq4BlXijz8krNqyDCGC+gu4Rg5eY9Kzj390Xv25deDtaiKrGo4
 85xONKnKRd5BYcU0x+khDqfGLGToG3x6jR4l5p4wQ2C/6MRWs2HU4D2
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com
X-Rspamd-Queue-Id: 352B6549C95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37458-lists,linux-usb=lfdr.de,amitsd.google.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Amit Sunil Dhamne <amitsd@google.com>

Add power_supply_get_battery_all() to allow drivers to obtain a list of
registered battery type power supply references in the system.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 drivers/power/supply/power_supply_core.c | 122 +++++++++++++++++++++++++++++++
 include/linux/power_supply.h             |   9 +++
 2 files changed, 131 insertions(+)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index a446d3d086fc..697645426fb1 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -482,6 +482,128 @@ struct power_supply *power_supply_get_by_name(const char *name)
 }
 EXPORT_SYMBOL_GPL(power_supply_get_by_name);
 
+static int __power_supply_get_num_battery(struct power_supply *epsy, void *data)
+{
+	int *count = data;
+
+	if (epsy->desc->type == POWER_SUPPLY_TYPE_BATTERY)
+		(*count)++;
+
+	return 0;
+}
+
+static int power_supply_get_num_battery(struct device *dev)
+{
+	int ret, count = 0;
+
+	ret = power_supply_for_each_psy(&count, __power_supply_get_num_battery);
+
+	dev_dbg(dev, "%s: count: %d ret %d\n", __func__, count, ret);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+struct psy_get_supplies_data {
+	int cnt;
+	int size;
+	struct power_supply **psys;
+};
+
+static int __power_supply_populate_battery_array(struct power_supply *epsy,
+						 void *_data)
+{
+	struct psy_get_supplies_data *data = _data;
+
+	if (epsy->desc->type == POWER_SUPPLY_TYPE_BATTERY) {
+		if (data->size <= data->cnt)
+			return -EOVERFLOW;
+
+		get_device(&epsy->dev);
+		data->psys[data->cnt] = epsy;
+		atomic_inc(&epsy->use_cnt);
+		data->cnt++;
+	}
+
+	return 0;
+}
+
+static int power_supply_populate_battery_array(struct device *dev, int size,
+					       struct power_supply **batteries)
+{
+	int ret, i;
+
+	struct psy_get_supplies_data data = {
+		.cnt = 0,
+		.size = size,
+		.psys = batteries,
+	};
+
+	ret = power_supply_for_each_psy(&data, __power_supply_populate_battery_array);
+
+	dev_dbg(dev, "%s Found %d batteries with array size %d ret %d\n",
+		__func__, data.cnt, data.size, ret);
+
+	if (ret < 0) {
+		for (i = 0; i < data.cnt; i++)
+			power_supply_put(batteries[i]);
+		return ret;
+	}
+
+	return data.cnt;
+}
+
+/**
+ * power_supply_get_battery_all() - Searches for all battery type power supplies
+ *				    and returns their references.
+ * @dev: Pointer to device requesting the power supply refs.
+ * @psys: Pointer to an array of power supply refs that will be filled by this
+ *	  function.
+ *
+ * This function helps drivers get handles to all battery type power supplies.
+ * If acquiring a ref to a power supply results in error, then the search for
+ * battery type power supplies will abort and the acquired power supplies will
+ * be "put".
+ *
+ * Return: Indicates the number of battery type power supplies returned on
+ * success or the negative error code on failure.
+ *
+ * It's the responsibility of the caller to invoke power_supply_put() on the
+ * individual psy refs and free the array returned by this function using kfree().
+ */
+int __must_check power_supply_get_battery_all(struct device *dev,
+					      struct power_supply ***psys)
+{
+	int ret;
+
+	if (!psys)
+		return -EINVAL;
+
+	ret = power_supply_get_num_battery(dev);
+	if (ret < 0)
+		return ret;
+
+	if (!ret) {
+		*psys = NULL;
+		return 0;
+	}
+
+	*psys = kzalloc_objs(**psys, ret);
+	if (!*psys)
+		return -ENOMEM;
+
+	ret = power_supply_populate_battery_array(dev, ret, *psys);
+	if (ret <= 0) {
+		kfree(*psys);
+		*psys = NULL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(power_supply_get_battery_all);
+
 /**
  * power_supply_put() - Drop reference obtained with power_supply_get_by_name
  * @psy: Reference to put
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 7a5e4c3242a0..2467530a5740 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -806,11 +806,20 @@ extern int power_supply_reg_notifier(struct notifier_block *nb);
 extern void power_supply_unreg_notifier(struct notifier_block *nb);
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 extern struct power_supply *power_supply_get_by_name(const char *name);
+extern int __must_check power_supply_get_battery_all(struct device *dev,
+						     struct power_supply ***psys);
 extern void power_supply_put(struct power_supply *psy);
 #else
 static inline void power_supply_put(struct power_supply *psy) {}
 static inline struct power_supply *power_supply_get_by_name(const char *name)
 { return NULL; }
+static inline int __must_check power_supply_get_battery_all(struct device *dev,
+							    struct power_supply ***psys)
+{
+	if (psys)
+		*psys = NULL;
+	return 0;
+}
 #endif
 extern struct power_supply *power_supply_get_by_reference(struct fwnode_handle *fwnode,
 							  const char *property);

-- 
2.54.0.563.g4f69b47b94-goog



