Return-Path: <linux-usb+bounces-28058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C2B568F9
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 14:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE3A83BFC0D
	for <lists+linux-usb@lfdr.de>; Sun, 14 Sep 2025 12:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9B8275B1F;
	Sun, 14 Sep 2025 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwTO3DfC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FCA26C3A4;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757854608; cv=none; b=qdhAPql/gXhOSuBodHs/57nTf7Lep2VSn8iiLJrMqigDbMlRUpZFXLGbQLnrzIZy4vWqR33RFdmQz1H/iZ0OtDXohoe7U99Zbjser3DCETLTOqXb15PN+yjjYi1Zohv7NOyjb2sGCUN8bN5gWY9ES5PqvJdQv2/dpzxhdLn8yfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757854608; c=relaxed/simple;
	bh=90KthqrDnapyUT4Ni6YoQa7BmryV8lEQlLoxgEjdzu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=asikKM1hhJHR43g4BbTSrlTmxPGq8ppEdOOtSaQW4HUIhI0wrA0lhT9/cp5IIIHkk8tjXX67EJkgd5f8IjgbOr0a7P6z2sY+GH15hRAqliS9HXzkFJ3VLhxWlH9jJA/maeGqOyAj0N3eJoJFuwUBLlfLgr/Zz9qz4inV+5AXWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwTO3DfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7510EC4CEFE;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=90KthqrDnapyUT4Ni6YoQa7BmryV8lEQlLoxgEjdzu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rwTO3DfCaxpC9VK08AgOrbIS8Pl4wFV+d98fL1mLuHuT/TXiHYBbqBBTc9vpb5Zh6
	 4tSc4MlJnywdR+uCDXioK4uReXGsSWDTVcdE73ic+ByfWANguj9o2n2ZBpUS19DtRk
	 CNUXij8mT9mA1FYtpZe3PWHIeJKzIi69tXuZa/eFEYYCCQy0N28lvYDT0aepTaAIX3
	 9crOsloafIHDsrV/1fZZFMaSM2Ns3OOnAL6wBIf2Qqnx+dhDHfYy+mZZPl/Taw++qo
	 HMLxvU3lrSmXFiiHMGEXlhh/9J1hPV26BiKWrvmkVwHRfDbfzTpVdpoR7ZgFFqznqw
	 i3Xf06tbX1D5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC37CAC587;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:12 +0000
Subject: [PATCH 07/11] usb: typec: tipd: Register DisplayPort and
 Thunderbolt altmodes for cd321x
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-7-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5651; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=90KthqrDnapyUT4Ni6YoQa7BmryV8lEQlLoxgEjdzu4=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3Y0a6/95ej9KOTEl/se0C+FfHj7OsuI7V6cmu3vPh
 SlTmoxyOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATMV3PyPB70wbpPsNKvVqm
 3Ts4vya92FFivvZEoUq26FnvL2knFKwZ/unEGt2O6ri8/M+yraUv/m7qtil5PeucjMmL8jUev21
 197EDAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Ports equipped with a CD321x are only found on Apple Silicon machines
and always support DisplayPort, Thunderbolt and USB4. Register these
port modes unconditionally.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 85 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index afd11b3e1ae596c7f3283e4336aaa57874c9378d..c7cf936e5a61a331271c05b68ff1b77b89c0f643 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -16,6 +16,8 @@
 #include <linux/interrupt.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
 #include <linux/usb/role.h>
 #include <linux/workqueue.h>
 #include <linux/firmware.h>
@@ -144,6 +146,7 @@ struct tipd_data {
 	u64 irq_mask1;
 	size_t tps_struct_size;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
+	void (*unregister_port)(struct tps6598x *tps);
 	void (*trace_data_status)(u32 status);
 	void (*trace_power_status)(u16 status);
 	void (*trace_status)(u32 status);
@@ -185,6 +188,9 @@ struct cd321x {
 	struct tps6598x_dp_sid_status_reg dp_sid_status;
 	struct tps6598x_intel_vid_status_reg intel_vid_status;
 	struct tps6598x_usb4_status_reg usb4_status;
+
+	struct typec_altmode *port_altmode_dp;
+	struct typec_altmode *port_altmode_tbt;
 };
 
 static enum power_supply_property tps6598x_psy_props[] = {
@@ -964,6 +970,76 @@ tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 	return 0;
 }
 
+static int cd321x_register_port_altmodes(struct cd321x *cd321x)
+{
+	struct typec_altmode_desc desc;
+	struct typec_altmode *amode;
+
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D));
+	desc.vdo |= DP_CAP_DFP_D;
+	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	cd321x->port_altmode_dp = amode;
+
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_TBT_SID;
+	desc.mode = TYPEC_ANY_MODE;
+	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
+	if (IS_ERR(amode)) {
+		typec_unregister_altmode(cd321x->port_altmode_dp);
+		cd321x->port_altmode_dp = NULL;
+		return PTR_ERR(amode);
+	}
+	cd321x->port_altmode_tbt = amode;
+
+	return 0;
+}
+
+static int
+cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+	int ret;
+
+	ret = tps6598x_register_port(tps, fwnode);
+	if (ret)
+		return ret;
+
+	ret = cd321x_register_port_altmodes(cd321x);
+	if (ret)
+		goto err_unregister_port;
+
+	typec_set_mode(tps->port, TYPEC_STATE_SAFE);
+
+	return 0;
+
+err_unregister_port:
+	typec_unregister_port(tps->port);
+	return ret;
+}
+
+static void
+tps6598x_unregister_port(struct tps6598x *tps)
+{
+	typec_unregister_port(tps->port);
+}
+
+static void
+cd321x_unregister_port(struct tps6598x *tps)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+
+	typec_unregister_altmode(cd321x->port_altmode_dp);
+	cd321x->port_altmode_dp = NULL;
+	typec_unregister_altmode(cd321x->port_altmode_tbt);
+	cd321x->port_altmode_tbt = NULL;
+	typec_unregister_port(tps->port);
+}
+
 static int tps_request_firmware(struct tps6598x *tps, const struct firmware **fw,
 				const char **firmware_name)
 {
@@ -1505,7 +1581,7 @@ static int tps6598x_probe(struct i2c_client *client)
 err_disconnect:
 	tps6598x_disconnect(tps, 0);
 err_unregister_port:
-	typec_unregister_port(tps->port);
+	tps->data->unregister_port(tps);
 err_role_put:
 	usb_role_switch_put(tps->role_sw);
 err_fwnode_put:
@@ -1529,7 +1605,7 @@ static void tps6598x_remove(struct i2c_client *client)
 		devm_free_irq(tps->dev, client->irq, tps);
 
 	tps6598x_disconnect(tps, 0);
-	typec_unregister_port(tps->port);
+	tps->data->unregister_port(tps);
 	usb_role_switch_put(tps->role_sw);
 
 	/* Reset PD controller to remove any applied patch */
@@ -1598,7 +1674,8 @@ static const struct tipd_data cd321x_data = {
 		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct cd321x),
-	.register_port = tps6598x_register_port,
+	.register_port = cd321x_register_port,
+	.unregister_port = cd321x_unregister_port,
 	.trace_data_status = trace_cd321x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1615,6 +1692,7 @@ static const struct tipd_data tps6598x_data = {
 		     TPS_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps6598x_register_port,
+	.unregister_port = tps6598x_unregister_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1631,6 +1709,7 @@ static const struct tipd_data tps25750_data = {
 		     TPS_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps25750_register_port,
+	.unregister_port = tps6598x_unregister_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps25750_power_status,
 	.trace_status = trace_tps25750_status,

-- 
2.34.1



