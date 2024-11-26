Return-Path: <linux-usb+bounces-17871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B89D943D
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52084161947
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318F31D517E;
	Tue, 26 Nov 2024 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m4pWcI94"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DA1D5140
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612886; cv=none; b=UPNKXmvI6W6LZvbbXRdNDfivRoROOeRuj4RBh1nhFxaKOE9WW4C1ej+pooMxyK2cx3aWRjJcSepofV3G3M2WLW/a60oL2veB/QrUPzNq/mex2Xc+TfDU8+BkROoXNOLRwUTv8LlgBdLdOU2l45SQli65ctnqC2zZMYfwNwWQDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612886; c=relaxed/simple;
	bh=M5ukcPKgKAfKHyOFRejl++X5XYltOB0VkZUniY5CCHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YAYCI++SHjfIiG3TfrlmUa335Jo7Y5aTTf/shv6vq0kvagoVUMPaLOJizb6GJ+YbYB5DbMYNLkFm+cNe6ZlDEWWhloFzONsQlZgIDXZrgHJg2mZsi0MD8EXcEkqCBgrK9Cq0TpJGRZ17XxAbSzYPdu1OsqXkB7c4FRzb1uGFOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m4pWcI94; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315abed18aso47743595e9.2
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612883; x=1733217683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaBexvzYFyRAvmFf5CNX0T/OFU5Y8NOKhiyYn5h/HqM=;
        b=m4pWcI94uKuc0Xmc6HVPbZp8l38puM95OFw0TWlvjptLypGHVqNdKvSaiOnw5ofqqv
         DyMF3h31akudE2xSvjUhDCb92Fj2+CtEXLITUhSXzmjmngxnBp0lFFfZIOT+P09U5MLc
         /Zm5NjMO+kDT8ORny/HxNQ/nZI99yTa8jAqqc165ey2XMHJvcSkOCwr6u9P+wMAOBpHD
         XJKuFcMjLUr3JN1x8YkXT6rORWr9dCqpfQ8XFB7wPhEilDBEKrHHnN9zKN51SCYDVac5
         +cdnTMa+lmnY341dpeo69+vRvDbYIrEyd+lOoBqU95pJO9lTNjOXf1kMbz3tojCdefi4
         LrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612883; x=1733217683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaBexvzYFyRAvmFf5CNX0T/OFU5Y8NOKhiyYn5h/HqM=;
        b=a1hMYGmOLAtU6TAzAqeujAAmixVg+c9uA0z7cla7bUi7dXQBNeO9FiG9Du91ETnnNT
         +78DTmwofcw+NR3i+JR51q4fVYizCKLh7aG534foVnqlS9xhQxmAZQp52QdAm1VlCAvS
         fu4nKP/7UrWrmQT0tIji4EgsE99RVs+txQwdztxbxznQDyrHZ0zAFzcHpHI1qALyBC3K
         F7kR6J6QZ5YSf8g6El0BqfrVvc6uDw5wkDcwj5dsXQ2ZURzAmTiLppz8Ffjmj5pbEmGy
         NPpZYCHBNg7syq9WFN0a69G+A4riOtVTaK2oK5WZKnn+12yDh7rXtRHrBJyvjkO0NvYg
         2aJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFOMPMwCGlqR6BBW5rWO+nS0cMcbLez2p/mggIdozjHchlFhDQAbggyvdAG7k7jB5/605N7VGh92I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyClTeVrPJV0hh1vxfRqWZZFWIWt2RuENeS2EIxSzlQPH44u6Lg
	5+UMlECnqy+HNyloYUAVpTy0TK0VJ2/tqRJv2ynTaef+v+N+BfXzbzxtmmN4GNM=
X-Gm-Gg: ASbGncv/yLYQQyZWSCw5XKzRm2ikYM0g9mqml736x9BVGSMIHp60T7of/lwlQNznUDr
	wv0IcDTBh8YbEj4AoildKp/kr60eJN5xo8VaTAJsGTkm01UrLMQ/t/juTVtDA0GDdZDpfkqkaR0
	+8H5uu9UUZGyUv3bZLSVdFYdBly84CgcaEVPOKFspaJzjjlfIb6Od+8wb1QK4crvLzRfGL2TR6p
	yWZhRwKKgdY+zM3UpeF8fNqbO6f0T1050GduWWMI6jlIF+on9ci7ZxEqtOAHD9T0wNO4g69gmwg
	RPg=
X-Google-Smtp-Source: AGHT+IGx29P8JteJsbR7aMf1tNqIx4rHFyFlQRbqnmSPeJkN3FtdMhddq6elNPOMjEa7BoKccqaeCw==
X-Received: by 2002:a05:6000:1f8c:b0:382:4378:462a with SMTP id ffacd0b85a97d-38260b759c0mr13201703f8f.24.1732612882831;
        Tue, 26 Nov 2024 01:21:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 10/15] phy: renesas: rcar-gen3-usb2: Add support for PWRRDY
Date: Tue, 26 Nov 2024 11:20:45 +0200
Message-Id: <20241126092050.1825607-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S SoC, the USB PHY has an input signal called PWRRDY.
This signal is managed by the system controller and must be de-asserted
after powering on the area where USB PHY resides and asserted before
powering it off.

The connection b/w the system controller and the USB PHY is implemented
through the renesas,sysc-signal device tree property. This property
specifies the register offset and the bitmask required to control the
signal. The system controller exports the syscon regmap, and the read/write
access to the memory area of the PWRRDY signal is reference-counted, as the
same system controller signal is connected to both RZ/G3S USB PHYs.

Add support for the PWRRDY signal control.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new


 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 59f74aa993ac..84459755adf5 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -12,12 +12,14 @@
 #include <linux/extcon-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/string.h>
@@ -111,6 +113,12 @@ struct rcar_gen3_phy {
 	bool powered;
 };
 
+struct rcar_gen3_pwrrdy {
+	struct regmap *regmap;
+	u32 offset;
+	u32 mask;
+};
+
 struct rcar_gen3_chan {
 	void __iomem *base;
 	struct device *dev;	/* platform_device's device */
@@ -118,6 +126,7 @@ struct rcar_gen3_chan {
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
 	struct reset_control *rstc;
+	struct rcar_gen3_pwrrdy *pwrrdy;
 	struct work_struct work;
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
@@ -133,6 +142,7 @@ struct rcar_gen3_phy_drv_data {
 	const struct phy_ops *phy_usb2_ops;
 	bool no_adp_ctrl;
 	bool init_bus;
+	bool pwrrdy;
 };
 
 /*
@@ -587,6 +597,7 @@ static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
 	.init_bus = true,
+	.pwrrdy = true,
 };
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
@@ -707,6 +718,55 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return ret;
 }
 
+static void rcar_gen3_phy_usb2_set_pwrrdy(struct rcar_gen3_chan *channel, bool power_on)
+{
+	struct rcar_gen3_pwrrdy *pwrrdy = channel->pwrrdy;
+
+	/* N/A on this platform. */
+	if (!pwrrdy)
+		return;
+
+	regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, !power_on);
+}
+
+static void rcar_gen3_phy_usb2_pwrrdy_off(void *data)
+{
+	rcar_gen3_phy_usb2_set_pwrrdy(data, false);
+}
+
+static int rcar_gen3_phy_usb2_init_pwrrdy(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct rcar_gen3_pwrrdy *pwrrdy;
+	struct of_phandle_args args;
+	int ret;
+
+	pwrrdy = devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
+	if (!pwrrdy)
+		return -ENOMEM;
+
+	ret = of_parse_phandle_with_args(dev->of_node, "renesas,sysc-signal",
+					 "#renesas,sysc-signal-cells", 0, &args);
+	if (ret)
+		return ret;
+
+	pwrrdy->regmap = syscon_node_to_regmap(args.np);
+	pwrrdy->offset = args.args[0];
+	pwrrdy->mask = args.args[1];
+
+	of_node_put(args.np);
+
+	if (IS_ERR(pwrrdy->regmap))
+		return PTR_ERR(pwrrdy->regmap);
+
+	channel->pwrrdy = pwrrdy;
+
+	/* Power it ON. */
+	rcar_gen3_phy_usb2_set_pwrrdy(channel, true);
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_pwrrdy_off, channel);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	const struct rcar_gen3_phy_drv_data *phy_data;
@@ -763,6 +823,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
+	if (phy_data->pwrrdy) {
+		ret = rcar_gen3_phy_usb2_init_pwrrdy(channel);
+		if (ret)
+			goto error;
+	}
+
 	if (phy_data->init_bus) {
 		ret = rcar_gen3_phy_usb2_init_bus(channel);
 		if (ret)
-- 
2.39.2


