Return-Path: <linux-usb+bounces-3270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E677F6897
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 22:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B991C20A8A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 21:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEFD14F72;
	Thu, 23 Nov 2023 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="12xy3unQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D41101
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 13:00:27 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab9eso1716816a12.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1700773226; x=1701378026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+ZZ000ihgmWR5QDs0SU+gziUYjstRQaQbtP0mpgHoA=;
        b=12xy3unQWJNwO+uDbXQv9ENC+jSRw4oTroeCQDgrd0t4vlKEtw+PmwbmQwfILLXUFB
         XYmL6nd2mAGJLS6ShrT5dqjWQv91NE7rSi2WA/PPYtQrJ5BAfuDhlKhDQEdS1u/MfICw
         +R63aIMj0lHrZ2w8rlH5flxH5+AJb1/VS8PWshk8FvVPP9s2kd0X4ekq5edA452tsBPo
         ZiwQyemNtbzo1VA0rosqhp1E1RAZjKqwaoXHlTuxx8C8/ib/uJlbmxpINb/LQQaj7HTR
         as4WC/GKeu7eeGVYy8EmdNaj/Y15+Rxf32+/CB7BaWlIO7A1GtQVcqCvJ3GOO423NWPq
         8tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700773226; x=1701378026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+ZZ000ihgmWR5QDs0SU+gziUYjstRQaQbtP0mpgHoA=;
        b=KMTJjBSBRbwz3W643DLN1xqgQ4+jYvN3lUCA9hIiWW5u4Pq7kzqOxbUhzrr9VKXHEt
         a5DJ148QSWXApZG5Esv0cRyZD5PKo/MDy/VxJ7AOdOg5AU9aWA0acCn3CeEDglclwSGn
         LsuMmsEfANToYXGfOLIZuAKBfhUnMHvh/ignbo/vI2C4ld6YyT9rxyL0N8qcctb28PMP
         EfHgjxEL6TBbpGcwe/AwaugAkzFs2nWITXUxIoDF+2T86uoLfRQTmjwJKER2ccoaamrs
         8YLz3spCTs4YPxfkgWfCis3/XlGp0zuM7t58qT8V0QfRbDP9UPynx5B38WTxW7ICN94j
         5ZVw==
X-Gm-Message-State: AOJu0Yxyx8Qw3n8JHM+TN1GWoGxQ3wB+8rqsJIrZX4O5569ZpiG0x+FS
	7JPJ8ulFqCvYLn06uQmx6Fyzag==
X-Google-Smtp-Source: AGHT+IFbn7rLZ0TvBTycPV+nVhI0808hmKlWQX+TttCROXtyY3Z4aeKZmKyqTOYI+t/KbFiRj18slg==
X-Received: by 2002:a50:cd58:0:b0:548:5f17:ee00 with SMTP id d24-20020a50cd58000000b005485f17ee00mr275544edj.17.1700773226153;
        Thu, 23 Nov 2023 13:00:26 -0800 (PST)
Received: from localhost.localdomain ([188.27.129.158])
        by smtp.gmail.com with ESMTPSA id l14-20020aa7d94e000000b0053e15aefb0fsm1016079eds.85.2023.11.23.13.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 13:00:25 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	rogerq@kernel.org,
	christophe.jaillet@wanadoo.fr,
	a-govindraju@ti.com,
	trix@redhat.com,
	abdelalkuor@geotab.com,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH] USB: typec: tps6598x: use device 'type' field to identify devices
Date: Thu, 23 Nov 2023 23:00:21 +0200
Message-ID: <20231123210021.463122-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the {of_}device_is_compatible function(s) is not too expensive.
But since the driver already needs to match for the 'struct tipd_data'
device parameters (via device_get_match_data()), we can add a simple 'type'
field.

This adds a minor optimization in certain operations, where we the check
for TPS25750 (or Apple CD321X) is a bit faster.

Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 drivers/usb/typec/tipd/core.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index fbd23de5c5cb..69d3e11bb30c 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -105,7 +105,14 @@ static const char *const modes[] = {
 
 struct tps6598x;
 
+enum tipd_type {
+	TIPD_TYPE_TI_TPS6598X,
+	TIPD_TYPE_APPLE_CD321X,
+	TIPD_TYPE_TI_TPS25750X,
+};
+
 struct tipd_data {
+	enum tipd_type type;
 	irq_handler_t irq_handler;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
 	void (*trace_power_status)(u16 status);
@@ -1195,7 +1202,6 @@ tps25750_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 
 static int tps6598x_probe(struct i2c_client *client)
 {
-	struct device_node *np = client->dev.of_node;
 	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	u32 status;
@@ -1211,11 +1217,19 @@ static int tps6598x_probe(struct i2c_client *client)
 	mutex_init(&tps->lock);
 	tps->dev = &client->dev;
 
+	if (dev_fwnode(tps->dev))
+		tps->data = device_get_match_data(tps->dev);
+	else
+		tps->data = i2c_get_match_data(client);
+
+	if (!tps->data)
+		return -EINVAL;
+
 	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
 	if (IS_ERR(tps->regmap))
 		return PTR_ERR(tps->regmap);
 
-	is_tps25750 = device_is_compatible(tps->dev, "ti,tps25750");
+	is_tps25750 = (tps->data->type == TIPD_TYPE_TI_TPS25750X);
 	if (!is_tps25750) {
 		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
 		if (ret < 0 || !vid)
@@ -1229,7 +1243,7 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		tps->i2c_protocol = true;
 
-	if (np && of_device_is_compatible(np, "apple,cd321x")) {
+	if (tps->data->type == TIPD_TYPE_APPLE_CD321X) {
 		/* Switch CD321X chips to the correct system power state */
 		ret = cd321x_switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
 		if (ret)
@@ -1247,13 +1261,6 @@ static int tps6598x_probe(struct i2c_client *client)
 			TPS_REG_INT_PLUG_EVENT;
 	}
 
-	if (dev_fwnode(tps->dev))
-		tps->data = device_get_match_data(tps->dev);
-	else
-		tps->data = i2c_get_match_data(client);
-	if (!tps->data)
-		return -EINVAL;
-
 	/* Make sure the controller has application firmware running */
 	ret = tps6598x_check_mode(tps);
 	if (ret < 0)
@@ -1366,7 +1373,7 @@ static void tps6598x_remove(struct i2c_client *client)
 	usb_role_switch_put(tps->role_sw);
 
 	/* Reset PD controller to remove any applied patch */
-	if (device_is_compatible(tps->dev, "ti,tps25750"))
+	if (tps->data->type == TIPD_TYPE_TI_TPS25750X)
 		tps6598x_exec_cmd_tmo(tps, "GAID", 0, NULL, 0, NULL, 2000, 0);
 }
 
@@ -1396,7 +1403,7 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	if (device_is_compatible(tps->dev, "ti,tps25750") && ret == TPS_MODE_PTCH) {
+	if (tps->data->type == TIPD_TYPE_TI_TPS25750X && ret == TPS_MODE_PTCH) {
 		ret = tps25750_init(tps);
 		if (ret)
 			return ret;
@@ -1419,6 +1426,7 @@ static const struct dev_pm_ops tps6598x_pm_ops = {
 };
 
 static const struct tipd_data cd321x_data = {
+	.type = TIPD_TYPE_APPLE_CD321X,
 	.irq_handler = cd321x_interrupt,
 	.register_port = tps6598x_register_port,
 	.trace_power_status = trace_tps6598x_power_status,
@@ -1426,6 +1434,7 @@ static const struct tipd_data cd321x_data = {
 };
 
 static const struct tipd_data tps6598x_data = {
+	.type = TIPD_TYPE_TI_TPS6598X,
 	.irq_handler = tps6598x_interrupt,
 	.register_port = tps6598x_register_port,
 	.trace_power_status = trace_tps6598x_power_status,
@@ -1433,6 +1442,7 @@ static const struct tipd_data tps6598x_data = {
 };
 
 static const struct tipd_data tps25750_data = {
+	.type = TIPD_TYPE_TI_TPS25750X,
 	.irq_handler = tps25750_interrupt,
 	.register_port = tps25750_register_port,
 	.trace_power_status = trace_tps25750_power_status,
-- 
2.42.1


