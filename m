Return-Path: <linux-usb+bounces-36343-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H/nEL0Q5mlrrAEAu9opvQ
	(envelope-from <linux-usb+bounces-36343-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 13:40:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE3429FCA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 13:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A7C83055D4E
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 11:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA01D39DBF5;
	Mon, 20 Apr 2026 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCwuoSdo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA4E3876D8;
	Mon, 20 Apr 2026 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776685237; cv=none; b=ezDSZUYZJZxMfCou8zKW9vdNv660lSYDjgByNkO8MkpTn3TXlGYTM6OGqQpPh8wTMuFjkHOkejopW5zwu+PjsDZ8OuUFt+4/Q1wzNa60Wis2j5LP/TNpJE9HM0fxbNPkvosZGLKyEiVExLn0wOd4vbLLD3qn1QdfdOzPPB5aHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776685237; c=relaxed/simple;
	bh=GRag9p0jM6nDtL6dZrJgtkjUH4Bze9W1P+qqsa6qw1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wa+xMFbyNlPohQgW8uDXbp6qxH7JUcvcEJUwlY4N/90NbvK5x3PbUVaFkkdxZtOEkNlVF1bYHM4OJRqKn/VCmdgoaB+DTzx2R7Vo78/vgc00f8CCmBVxF98bNbv6+uvT0dU1iQvgqIjEOa6tHS1kKzVTDKiIpAuL2O19ObodRMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCwuoSdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7080C19425;
	Mon, 20 Apr 2026 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776685237;
	bh=GRag9p0jM6nDtL6dZrJgtkjUH4Bze9W1P+qqsa6qw1I=;
	h=From:Date:Subject:To:Cc:From;
	b=GCwuoSdokoFyFV077+Zj1vwnykdsA4aZ/5UxPBKIliQd1603Fw87nqpehPm1SDLP5
	 6qhTEgf8WsXDhZGdqsDNvPEuRsyFWvThI0lhFGL7fNQ0gv8lvkl4+4G1+nDvLSCu6P
	 CfbAmOJhqxVI/0T3LsPTCbywEh8hv61jpXKfQju7ciKHZmGzEPFKA9v07FnVgwWL0m
	 wsJV3TfDOp6fVD3mL4XV8j+vo5MJ5Uvokmzn7jgiKTZ0gT58JCPMALBepxacfSZzT3
	 3Ing9b7p25MIMO0A1XoR7yLoki11Vm0y9ITnTIVPyTgWMzm6defETPo/1tNlXZ2sTM
	 jrl7BE93bkZLg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 20 Apr 2026 13:40:28 +0200
Subject: [PATCH] usb: typec: mux: ps883x: Power the retimer off when not in
 use
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrA1MoxTTqxSREP+0s4khoyKId
 ze4/BbvnaQoAqVPc1LBLipLqni1DYW/Tz8YmavJsn1zb9msS5Zgsg5Dd0xb2hTzVKBYjfORHbu
 A6APVPhdEOZ73d7yuG57Oi5trAAAA
X-Change-ID: 20260420-topic-ps883x_unused_reset-9af0909cefac
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jack Pham <jack.pham@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776685234; l=8711;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yBYI3xThBKTxQNB3PCkCltaHR0A4vWQIy5QR9kFCmcU=;
 b=oDJB9RsQMA5TsoBlklbbVZ2rAdDxW+MelrHezV0UmZQ629Iobd39NTMCkqEyxO0uK5Xz4wJ5z
 RXJ8AgN9rs3ApsgwGsFDwpMGDDXWms05Xl6PZQAuvD6WeIXn7QOz0kw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36343-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 80BE3429FCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

When there's nothing going through the retimer, there's no reason to
keep it online. Put it in reset when possible to save power.

Also, remove the register cache-compare optimization as it makes little
sense now that the chip resets during almost all transitions and
tracking the validity of that cache becomes a headache.

Suggested-by: Jack Pham <jack.pham@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Note most of the diff happens to be there because I need to move
ps883x_(en/dis)able_vregs() around..
---
 drivers/usb/typec/mux/ps883x.c | 196 ++++++++++++++++++++++++-----------------
 1 file changed, 114 insertions(+), 82 deletions(-)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index 1256252eceed..f52443638ee2 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -61,19 +61,110 @@ struct ps883x_retimer {
 	struct mutex lock; /* protect non-concurrent retimer & switch */
 
 	enum typec_orientation orientation;
-	u8 cfg0;
-	u8 cfg1;
-	u8 cfg2;
+	bool in_reset;
 };
 
+static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
+{
+	struct device *dev = &retimer->client->dev;
+	int ret;
+
+	ret = regulator_enable(retimer->vdd33_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(retimer->vdd33_cap_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
+		goto err_vdd33_disable;
+	}
+
+	usleep_range(4000, 10000);
+
+	ret = regulator_enable(retimer->vdd_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
+		goto err_vdd33_cap_disable;
+	}
+
+	ret = regulator_enable(retimer->vddar_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
+		goto err_vdd_disable;
+	}
+
+	ret = regulator_enable(retimer->vddat_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
+		goto err_vddar_disable;
+	}
+
+	ret = regulator_enable(retimer->vddio_supply);
+	if (ret) {
+		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
+		goto err_vddat_disable;
+	}
+
+	return 0;
+
+err_vddat_disable:
+	regulator_disable(retimer->vddat_supply);
+err_vddar_disable:
+	regulator_disable(retimer->vddar_supply);
+err_vdd_disable:
+	regulator_disable(retimer->vdd_supply);
+err_vdd33_cap_disable:
+	regulator_disable(retimer->vdd33_cap_supply);
+err_vdd33_disable:
+	regulator_disable(retimer->vdd33_supply);
+
+	return ret;
+}
+
+static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
+{
+	regulator_disable(retimer->vddio_supply);
+	regulator_disable(retimer->vddat_supply);
+	regulator_disable(retimer->vddar_supply);
+	regulator_disable(retimer->vdd_supply);
+	regulator_disable(retimer->vdd33_cap_supply);
+	regulator_disable(retimer->vdd33_supply);
+}
+
+static void ps883x_reset(struct ps883x_retimer *retimer)
+{
+	if (retimer->in_reset)
+		return;
+
+	gpiod_set_value(retimer->reset_gpio, 1);
+	ps883x_disable_vregs(retimer);
+	retimer->in_reset = true;
+}
+
 static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
-			    int cfg1, int cfg2)
+			    int cfg1, int cfg2, bool reset)
 {
 	struct device *dev = &retimer->client->dev;
 	int ret;
 
-	if (retimer->cfg0 == cfg0 && retimer->cfg1 == cfg1 && retimer->cfg2 == cfg2)
+	if (reset) {
+		ps883x_reset(retimer);
+
 		return 0;
+	} else if (retimer->in_reset) {
+		ret = ps883x_enable_vregs(retimer);
+		if (ret)
+			return ret;
+
+		gpiod_set_value(retimer->reset_gpio, 0);
+
+		/* firmware initialization delay */
+		msleep(60);
+
+		retimer->in_reset = false;
+	}
 
 	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
 	if (ret) {
@@ -93,10 +184,6 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
 		return ret;
 	}
 
-	retimer->cfg0 = cfg0;
-	retimer->cfg1 = cfg1;
-	retimer->cfg2 = cfg2;
-
 	return 0;
 }
 
@@ -107,6 +194,7 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
 	int cfg0 = CONN_STATUS_0_CONNECTION_PRESENT;
 	int cfg1 = 0x00;
 	int cfg2 = 0x00;
+	bool reset = false;
 
 	if (retimer->orientation == TYPEC_ORIENTATION_REVERSE)
 		cfg0 |= CONN_STATUS_0_ORIENTATION_REVERSED;
@@ -148,9 +236,13 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
 		}
 	} else {
 		switch (state->mode) {
+		/* SAFE can be transient or point to an actual disconnect */
 		case TYPEC_STATE_SAFE:
+			reset = retimer->orientation == TYPEC_ORIENTATION_NONE;
+			break;
 		/* USB2 pins don't even go through this chip */
 		case TYPEC_MODE_USB2:
+			reset = true;
 			break;
 		case TYPEC_STATE_USB:
 		case TYPEC_MODE_USB3:
@@ -171,7 +263,7 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
 		}
 	}
 
-	return ps883x_configure(retimer, cfg0, cfg1, cfg2);
+	return ps883x_configure(retimer, cfg0, cfg1, cfg2, reset);
 }
 
 static int ps883x_sw_set(struct typec_switch_dev *sw,
@@ -184,11 +276,19 @@ static int ps883x_sw_set(struct typec_switch_dev *sw,
 	if (ret)
 		return ret;
 
-	mutex_lock(&retimer->lock);
+	guard(mutex)(&retimer->lock);
 
 	if (retimer->orientation != orientation) {
 		retimer->orientation = orientation;
 
+		/*
+		 * Orientation notifications usually come prior to mode switch
+		 * events. If the retimer is already in reset, we still want to
+		 * cache the new orientation value for the subsequent ps883x_set().
+		 */
+		if (retimer->in_reset)
+			return 0;
+
 		ret = regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
 					 CONN_STATUS_0_ORIENTATION_REVERSED,
 					 orientation == TYPEC_ORIENTATION_REVERSE);
@@ -196,8 +296,6 @@ static int ps883x_sw_set(struct typec_switch_dev *sw,
 			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret);
 	}
 
-	mutex_unlock(&retimer->lock);
-
 	return ret;
 }
 
@@ -222,75 +320,6 @@ static int ps883x_retimer_set(struct typec_retimer *rtmr,
 	return typec_mux_set(retimer->typec_mux, &mux_state);
 }
 
-static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
-{
-	struct device *dev = &retimer->client->dev;
-	int ret;
-
-	ret = regulator_enable(retimer->vdd33_supply);
-	if (ret) {
-		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
-		return ret;
-	}
-
-	ret = regulator_enable(retimer->vdd33_cap_supply);
-	if (ret) {
-		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
-		goto err_vdd33_disable;
-	}
-
-	usleep_range(4000, 10000);
-
-	ret = regulator_enable(retimer->vdd_supply);
-	if (ret) {
-		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
-		goto err_vdd33_cap_disable;
-	}
-
-	ret = regulator_enable(retimer->vddar_supply);
-	if (ret) {
-		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
-		goto err_vdd_disable;
-	}
-
-	ret = regulator_enable(retimer->vddat_supply);
-	if (ret) {
-		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
-		goto err_vddar_disable;
-	}
-
-	ret = regulator_enable(retimer->vddio_supply);
-	if (ret) {
-		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
-		goto err_vddat_disable;
-	}
-
-	return 0;
-
-err_vddat_disable:
-	regulator_disable(retimer->vddat_supply);
-err_vddar_disable:
-	regulator_disable(retimer->vddar_supply);
-err_vdd_disable:
-	regulator_disable(retimer->vdd_supply);
-err_vdd33_cap_disable:
-	regulator_disable(retimer->vdd33_cap_supply);
-err_vdd33_disable:
-	regulator_disable(retimer->vdd33_supply);
-
-	return ret;
-}
-
-static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
-{
-	regulator_disable(retimer->vddio_supply);
-	regulator_disable(retimer->vddat_supply);
-	regulator_disable(retimer->vddar_supply);
-	regulator_disable(retimer->vdd_supply);
-	regulator_disable(retimer->vdd33_cap_supply);
-	regulator_disable(retimer->vdd33_supply);
-}
-
 static int ps883x_get_vregs(struct ps883x_retimer *retimer)
 {
 	struct device *dev = &retimer->client->dev;
@@ -422,6 +451,9 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 		}
 	}
 
+	/* Keep the retimer in reset until a Type-C notification comes */
+	ps883x_reset(retimer);
+
 	sw_desc.drvdata = retimer;
 	sw_desc.fwnode = dev_fwnode(dev);
 	sw_desc.set = ps883x_sw_set;

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260420-topic-ps883x_unused_reset-9af0909cefac

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


