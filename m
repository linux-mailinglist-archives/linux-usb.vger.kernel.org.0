Return-Path: <linux-usb+bounces-27113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B07DCB2FF08
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 17:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1F1F1CE3467
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 15:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076D7334375;
	Thu, 21 Aug 2025 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuMm542a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140B2D7818;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790804; cv=none; b=oktwWinLQcCREGeSeoCwtx/H2OM6xI87Lz88ty7YMNBonVMF0sHrrTwexAvyFM+QhSgzGs3jKUVlv58z9NvFYB2tTnkzOtLHF6NdlcVkjpLNdyZsjglVh9bVvStKmrsq0+ffr72F7atto0P8rrmoFlNpI3Drhs1DDUMcwMoKZok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790804; c=relaxed/simple;
	bh=ZU/ah4guW5/JR15Fg0P75HIjEN5tcqmapd5/VETG0AI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+AsNqw/cvwQnXxgUDpeXIl0lHcXDDBzLDRH2zaydZnxZuG0HnNQZCKVJyOK0TMZLUKnauU1jZGXitzob5eI3IZx4sVIFFuUKbIO33qV7DLigvNH4ohFQlejNrq5MsbeNBXyyCZTLA6AmFayhiGbsQ/1RBrKq1PmhgZCYyAyg80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuMm542a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0049C4AF12;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=ZU/ah4guW5/JR15Fg0P75HIjEN5tcqmapd5/VETG0AI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WuMm542aqa4sWUYaCtLS66EVjj263bxrB1iBZ0crLF9C1dqnWfp7KL/nnQXL5ZaEO
	 hdWrsS+Ex8PeaLubZkxkJictWcFXOByzJYHU4aTJ6kjawZ8fCs7SkZAQre99kT92h6
	 DCTJARt9Q3sAptmtO+lRrP9poXaQoRhI1UTcX8V2+lMSRUL1GUw/bHbXu1CbHFM+/w
	 IsnIYcSF/Qbvr7DrEfd2E/hJd9JKZV6VREK6O+fDRTPS/rW/dBMJylWAdTvsDFGSCg
	 0KTaFwUe6Ea6nwnCm3nSt9jKU9RHMy6JGm2P4GuXUUVRsaKpwP6EUu0xwEzY091Oqx
	 Zz/DPgTqn8jJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A43CA0FE7;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:04 +0000
Subject: [PATCH RFC 12/22] usb: typec: tipd: Add cd321x struct with
 separate size
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-12-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=ZU/ah4guW5/JR15Fg0P75HIjEN5tcqmapd5/VETG0AI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy2w12UnfuHZn8e//ziTqlcUJxIYeFOhQXq5++qbWv2
 fuIdpNeRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi0qUM/9PMnm3xKZtX/GXF
 eZMPDxses89mnidQuTfW6Zd8uyCbjyXDf//lk9PNzhblNnZNmRO3/O88TgOXjS+v2rqe/qY45UC
 4PgMA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

We're about to add more fields to struct tps6598x which are only relevant
for Apple's CD321x and to ensure that we don't waste memory everywhere for
those add a separate struct for cd321x and prepare to allocate more space
inside probe.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 19d713937870304e68325a441b0de63eb5db3b80..51b0f3be8b66a743ddc3ea96c1b25f597a1e8f6c 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -113,6 +113,7 @@ struct tps6598x;
 struct tipd_data {
 	irq_handler_t irq_handler;
 	u64 irq_mask1;
+	size_t tps_struct_size;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
 	void (*trace_data_status)(u32 status);
 	void (*trace_power_status)(u16 status);
@@ -148,6 +149,10 @@ struct tps6598x {
 	const struct tipd_data *data;
 };
 
+struct cd321x {
+	struct tps6598x tps;
+};
+
 static enum power_supply_property tps6598x_psy_props[] = {
 	POWER_SUPPLY_PROP_USB_TYPE,
 	POWER_SUPPLY_PROP_ONLINE,
@@ -1297,18 +1302,24 @@ tps25750_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 
 static int tps6598x_probe(struct i2c_client *client)
 {
+	const struct tipd_data *data;
 	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	u32 status;
 	u32 vid;
 	int ret;
 
-	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
+	data = i2c_get_match_data(client);
+	if (!data)
+		return -EINVAL;
+
+	tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
 	if (!tps)
 		return -ENOMEM;
 
 	mutex_init(&tps->lock);
 	tps->dev = &client->dev;
+	tps->data = data;
 
 	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(tps->reset))
@@ -1334,10 +1345,6 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		tps->i2c_protocol = true;
 
-	tps->data = i2c_get_match_data(client);
-	if (!tps->data)
-		return -EINVAL;
-
 	if (tps->data->switch_power_state) {
 		ret = tps->data->switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
 		if (ret)
@@ -1521,6 +1528,7 @@ static const struct tipd_data cd321x_data = {
 	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_PLUG_EVENT,
+	.tps_struct_size = sizeof(struct cd321x),
 	.register_port = tps6598x_register_port,
 	.trace_data_status = trace_cd321x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
@@ -1535,6 +1543,7 @@ static const struct tipd_data tps6598x_data = {
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
 		     TPS_REG_INT_PLUG_EVENT,
+	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps6598x_register_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
@@ -1549,6 +1558,7 @@ static const struct tipd_data tps25750_data = {
 	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
 		     TPS_REG_INT_PLUG_EVENT,
+	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps25750_register_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps25750_power_status,

-- 
2.34.1



