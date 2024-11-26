Return-Path: <linux-usb+bounces-17870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458639D9439
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58089163B4B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13791D514A;
	Tue, 26 Nov 2024 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SjlqGnr3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9654B1D434D
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612884; cv=none; b=WDU7tRs7cvIj056iJ6jfL2lFG1/UCDu6wvDtre+D6PRa1IcJUuzlmkGzMGxOLKbTBQDAg6KoJs1Pd5zd8vgs2onaYd9iv1YjBRMQBwm5EV/NVJt7Iy5P3LPYy2b5iiX1yGkNBLlI2yD58/WHO20co3SvoOvIuSMa7l7fVWs0OVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612884; c=relaxed/simple;
	bh=NXJDF4MBu7FpvuqDy7MLLxA2AvI4Q3ZGL1Xa7NwdgKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcSImQHO6F0dmUwRCTk84hdGzdpjmm4FIxnlVqRIZLEQ2rpbyQMMu8C9MGNvABWkBE3wvfwqdGvP/mHL8xH0Td2kLz15wUBdW0Us0aX/V/jJdd8exKc+hsyU7LcY1nQBY1YhCMYkjUhMLpn7yLZ6w70fNmsykt8JMa49nTLsMH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SjlqGnr3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a736518eso3700045e9.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612881; x=1733217681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TAeC3TsRl4RzsqjkZc75Uu8T1ZZEFzes6iwcvWtBHs=;
        b=SjlqGnr3vxTaeYiHtkkkYEthgTSp6H25zo0JMQD+O9Tp/AWV/TQ26hYLGG7neB1jiB
         IiiRtylHgMFMjsYbJDb61/XIk7+EoAUEmfF+gL1Z4Kiz0uVLCW274MbPm5Yn2p8Ah9tx
         QW900dl64UXQtfu4Mo8xTP9b4ThMkbXz/uqL94SdXn/qGlpWEKQ7wZsS2QSAh2NpzNfF
         n9t+0/feM2u1YOpk/g632ZAnIwLOlbSu8i6IZraCIf37b26YzslofdyC7zRCGVGqCOaK
         BgRyXZRUIlQm+HUanifsJBNpSeP7TLHASNH09gygRzwXXTXBq7yXN6+PqA2Ehxv8PEom
         WqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612881; x=1733217681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TAeC3TsRl4RzsqjkZc75Uu8T1ZZEFzes6iwcvWtBHs=;
        b=ltbDwgMxg+SiFchAbHlcYMVJrbiZryO/VcC8hoopm/fvgwroeag9tp8rbSnlulkGv3
         z2Y/CL3E8o9smFKlQPiZ6x+naU++vOysWaH5n0CYl9VKDqtYHIwqCnz10DqKzwjMi8ZU
         uBYKPslnJ//UJiKAIACkNvVGFP6/huBZ9W/8MvG7cMQCJeES5eQJ3pKOqGw0y6AMQCzA
         v1ME9+c0tQWGyiOJfHmKtw84CWQHJCIZTh/hYggdNECGjTlFkMjUgk2CuO1duBRGxDnk
         qc93EPBKTdRW5dl/qCAYL5BofXYBy+g7WYlXNsH10UWWxvrI1JCpJRG94Fc5/0q0AsTA
         zgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXaAqdURy8DcXSqkzpi6zc/lUiAlHqa8I87QVBobzrlnxL1NuzMco15V3PHLyYnX4YJnby8ackI/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbGqZtvsESZA7/MQ7sTw+RTmNwPS4Ryf8dwA+X01P5y6uztvD
	e0XlsDEJYaT4RRj/rg1If6zFwMI76evhvsY/M2XvQmsoi5tXGuDwKv72nLS5FQA=
X-Gm-Gg: ASbGncs5Lpup+v+9YFljbY02qAun5mwH5c3gryBfFtI/ykY5XaRxsqnFeymXbMVyGOj
	WBaz8bJWa1BeYKJHBXsjreuoTbEjvYW3PjA6NVaFT2/oZgfkVxk4iBM4/flOCWEtZ/eIQBoUp9j
	a8qMs5bvZn8Flw5us9fX6y55z64hRB8T+F+SLPUt25wKX7uTqkkvdrAmeo3FrMzg+QNtPEVgcfR
	vyE/I/p+Vo1NFFJ7Onxsc7ZWiikjW+5J0XbCuQbgMYqotP+UpK/DD0oxCL9dKoau/Br2Ux/vkxS
	EH8=
X-Google-Smtp-Source: AGHT+IFQeadsuQ2/OEFHNB2hCpcL0kFnKhATIbhwU87IinDBEjK+aOIArcqyehdnhZrcXQg6gOKtyA==
X-Received: by 2002:a05:600c:1c25:b0:434:a5c2:53c1 with SMTP id 5b1f17b1804b1-434a5c2564dmr15857425e9.23.1732612881055;
        Tue, 26 Nov 2024 01:21:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:20 -0800 (PST)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 09/15] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Tue, 26 Nov 2024 11:20:44 +0200
Message-Id: <20241126092050.1825607-10-claudiu.beznea.uj@bp.renesas.com>
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

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an error occurs after the reset_control_deassert(),
reset_control_assert() must be called, as already done in the remove
function.

Use devm_add_action_or_reset() to add the missing call and simplify the
.remove() function accordingly.

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
[claudiu.beznea: removed "struct reset_control *rstc = data;" from
 rcar_gen3_reset_assert()]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new; re-spinned the Christophe's work at
  https://lore.kernel.org/all/TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR01MB11332.jpnprd01.prod.outlook.com/


 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 775f4f973a6c..59f74aa993ac 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -668,6 +668,11 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
 	return candidate;
 }
 
+static void rcar_gen3_reset_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
@@ -686,6 +691,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	if (ret)
 		goto rpm_put;
 
+	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
+				       channel->rstc);
+	if (ret)
+		goto rpm_put;
+
 	val = readl(channel->base + USB2_AHB_BUS_CTR);
 	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
 	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
@@ -815,7 +825,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
-	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
 };
 
-- 
2.39.2


