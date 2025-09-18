Return-Path: <linux-usb+bounces-28057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293CB568F7
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 14:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1FE33BFF1A
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 12:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A43F275B12;
	Sun, 14 Sep 2025 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjtxgRmR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFE526CE0F;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757854609; cv=none; b=gYvt+Hu6VAJL/n9QxgdUqHvz4o863I/V8XJSwgvLwwUF2+zw7Ow+GaHLCq/0E2+Prj2y4vlNsyOzvZqGsNAdLICQR6O2+gY4KVZ9lADzwAR48BZBnPLJ0MVhSyd+SHD7vVNp+j7JWcfnil75AeXYzRkFXPdhbQDb7+Gda8t7GMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757854609; c=relaxed/simple;
	bh=Ja/ouRqKzMAB5q3ltXQSrR3nQhDkrwWQY9JfEOnd8P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1DP3V/J2m0dW+H6oIHwClp0aVXHUcw4RA7SLGgOTkzgQfriH3kNpDnQ+1gYNh4/PjuX5d53bTNcxo+LI+U9af3uWJYL0AIHNDC8rGfMfBvyebNLhYH7H6r817It+SChN9t7XXtMDeq9DL4lTpTswl8Eyz9d9Bxqlc5aPDibsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjtxgRmR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67FE7C113CF;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=Ja/ouRqKzMAB5q3ltXQSrR3nQhDkrwWQY9JfEOnd8P0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hjtxgRmRJxe9zKjxyWB6jscQM58Z2Romu7oY2TFxjwabNVEiH5yJUbLO51Waz5H49
	 j7RHxKGnPJ3W/482g97pqCMHpwUVOHJDbu2qhudiPHUe6NjBrxh6AxcfXPm5t0ejbS
	 RPyPKSVcrUbjtcchnQ2YTL1JgvAaaHItIAZ0q+VxOia+WxxhHPgbn3KcnASsJ+9miZ
	 R7DX/3Mo4r2PDe9YMlXyCNxB+2RDF5vBqMYMCJUhbxu7JD0WTgzew5jGjlTctuxO88
	 Ljz27Daka2PcR5hAEwZd6bdGqZm36JxgOOTbPFDq+HNSrv7fgfZmW4Mso/4/N4qxB/
	 GEGhsQnNsFz0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611D6CAC598;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:11 +0000
Subject: [PATCH 06/11] usb: typec: tipd: Read USB4, Thunderbolt and
 DisplayPort status for cd321x
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-6-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Ja/ouRqKzMAB5q3ltXQSrR3nQhDkrwWQY9JfEOnd8P0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3fUcdXnfq/Y1Rdx/3hLsOCddX+5s7Dzt5VJr/+7UZ
 7uwsWR9RykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiNTcYGebG3LwexRLsqLns
 nZ1r60I21Rd5BocYHwf8atWMeK/csYDhN8tb1mPyh39deJBm/fLmpM8OIVW3GRnE2hfkx+oq1Hu
 wcAMA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

CD321x supports various alternate modes and stores information once
these are entered into separate status registers. Read those when they
are active when reading TPS_DATA_STATUS to prepare supporting these.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 80 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 51b0f3be8b66a743ddc3ea96c1b25f597a1e8f6c..afd11b3e1ae596c7f3283e4336aaa57874c9378d 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -35,14 +35,18 @@
 #define TPS_REG_INT_MASK2		0x17
 #define TPS_REG_INT_CLEAR1		0x18
 #define TPS_REG_INT_CLEAR2		0x19
-#define TPS_REG_SYSTEM_POWER_STATE	0x20
 #define TPS_REG_STATUS			0x1a
+#define TPS_REG_SYSTEM_POWER_STATE	0x20
+#define TPS_REG_USB4_STATUS		0x24
 #define TPS_REG_SYSTEM_CONF		0x28
 #define TPS_REG_CTRL_CONF		0x29
 #define TPS_REG_BOOT_STATUS		0x2D
 #define TPS_REG_POWER_STATUS		0x3f
 #define TPS_REG_PD_STATUS		0x40
 #define TPS_REG_RX_IDENTITY_SOP		0x48
+#define TPS_REG_CF_VID_STATUS		0x5e
+#define TPS_REG_DP_SID_STATUS		0x58
+#define TPS_REG_INTEL_VID_STATUS	0x59
 #define TPS_REG_DATA_STATUS		0x5f
 #define TPS_REG_SLEEP_CONF		0x70
 
@@ -85,6 +89,31 @@ struct tps6598x_rx_identity_reg {
 	struct usb_pd_identity identity;
 } __packed;
 
+/* TPS_REG_USB4_STATUS */
+struct tps6598x_usb4_status_reg {
+	u8 mode_status;
+	__le32 eudo;
+	__le32 unknown;
+} __packed;
+
+/* TPS_REG_DP_SID_STATUS */
+struct tps6598x_dp_sid_status_reg {
+	u8 mode_status;
+	__le32 status_tx;
+	__le32 status_rx;
+	__le32 configure;
+	__le32 mode_data;
+} __packed;
+
+/* TPS_REG_INTEL_VID_STATUS */
+struct tps6598x_intel_vid_status_reg {
+	u8 mode_status;
+	__le32 attention_vdo;
+	__le16 enter_vdo;
+	__le16 device_mode;
+	__le16 cable_mode;
+} __packed;
+
 /* Standard Task return codes */
 #define TPS_TASK_TIMEOUT		1
 #define TPS_TASK_REJECTED		3
@@ -121,6 +150,7 @@ struct tipd_data {
 	int (*apply_patch)(struct tps6598x *tps);
 	int (*init)(struct tps6598x *tps);
 	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
+	bool (*read_data_status)(struct tps6598x *tps);
 	int (*reset)(struct tps6598x *tps);
 };
 
@@ -151,6 +181,10 @@ struct tps6598x {
 
 struct cd321x {
 	struct tps6598x tps;
+
+	struct tps6598x_dp_sid_status_reg dp_sid_status;
+	struct tps6598x_intel_vid_status_reg intel_vid_status;
+	struct tps6598x_usb4_status_reg usb4_status;
 };
 
 static enum power_supply_property tps6598x_psy_props[] = {
@@ -505,6 +539,41 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
 	return true;
 }
 
+static bool cd321x_read_data_status(struct tps6598x *tps)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+	int ret;
+
+	ret = tps6598x_read_data_status(tps);
+	if (ret < 0)
+		return false;
+
+	if (tps->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
+		ret = tps6598x_block_read(tps, TPS_REG_DP_SID_STATUS,
+				&cd321x->dp_sid_status, sizeof(cd321x->dp_sid_status));
+		if (ret)
+			dev_err(tps->dev, "Failed to read DP SID Status: %d\n",
+				ret);
+	}
+
+	if (tps->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
+		ret = tps6598x_block_read(tps, TPS_REG_INTEL_VID_STATUS,
+				&cd321x->intel_vid_status, sizeof(cd321x->intel_vid_status));
+		if (ret)
+			dev_err(tps->dev, "Failed to read Intel VID Status: %d\n", ret);
+	}
+
+	if (tps->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
+		ret = tps6598x_block_read(tps, TPS_REG_USB4_STATUS,
+				&cd321x->usb4_status, sizeof(cd321x->usb4_status));
+		if (ret)
+			dev_err(tps->dev,
+				"Failed to read USB4 Status: %d\n", ret);
+	}
+
+	return true;
+}
+
 static bool tps6598x_read_power_status(struct tps6598x *tps)
 {
 	u16 pwr_status;
@@ -565,7 +634,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 			goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
-		if (!tps6598x_read_data_status(tps))
+		if (!tps->data->read_data_status(tps))
 			goto err_unlock;
 
 	/* Handle plug insert or removal */
@@ -614,7 +683,7 @@ static irqreturn_t tps25750_interrupt(int irq, void *data)
 			goto err_clear_ints;
 
 	if (event[0] & TPS_REG_INT_DATA_STATUS_UPDATE)
-		if (!tps6598x_read_data_status(tps))
+		if (!tps->data->read_data_status(tps))
 			goto err_clear_ints;
 
 	/*
@@ -688,7 +757,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 			goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
-		if (!tps6598x_read_data_status(tps))
+		if (!tps->data->read_data_status(tps))
 			goto err_unlock;
 
 	/* Handle plug insert or removal */
@@ -1534,6 +1603,7 @@ static const struct tipd_data cd321x_data = {
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
 	.init = cd321x_init,
+	.read_data_status = cd321x_read_data_status,
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 };
@@ -1550,6 +1620,7 @@ static const struct tipd_data tps6598x_data = {
 	.trace_status = trace_tps6598x_status,
 	.apply_patch = tps6598x_apply_patch,
 	.init = tps6598x_init,
+	.read_data_status = tps6598x_read_data_status,
 	.reset = tps6598x_reset,
 };
 
@@ -1565,6 +1636,7 @@ static const struct tipd_data tps25750_data = {
 	.trace_status = trace_tps25750_status,
 	.apply_patch = tps25750_apply_patch,
 	.init = tps25750_init,
+	.read_data_status = tps6598x_read_data_status,
 	.reset = tps25750_reset,
 };
 

-- 
2.34.1



