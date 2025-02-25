Return-Path: <linux-usb+bounces-21026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A2A43CD3
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 12:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8F147A424F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 11:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B253C26773B;
	Tue, 25 Feb 2025 11:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GOLogiGy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850214658C
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481380; cv=none; b=TgyWVLYHvT2ajp00unBB7VlY5vXj8RE2ofMhdbAjog4efO1sClsgUra2e1cWVIaivGaQ41LhEDzAnTnfUvGzXZTcyltogPZROeFW0lxkTA8D5uyeaaciIM/rOv0bPCOeHq6NR4heVOmDKDZxtUTeDlZ39L7YHZIFF6D2+HHnhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481380; c=relaxed/simple;
	bh=gQc+M1MxzMAK4raon5GNtplgYSMzzyLfAB8UOS9YtMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP1w4jPurQ7NFA1nfuWU9b24AuGC94b26L/64jOXxxMs9VipbGWIBRqvWNez3q3AM2In4u4x3qYEz2is/8g6QR8h8sGEew6h5GNkn0rDLQwQP+oc8KfpfxayCdQy+MEXKgyO1t0hzPEFid1R1TDBxDTyE2/iq2XYwbtYYMcJPjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GOLogiGy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso2784489f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740481376; x=1741086176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyShyny9G2/yY7DkjMFQ2r6rzy1CSrizU536iAKhGig=;
        b=GOLogiGyWvjTaJcyC7f6K0r5ZP9Mb8CFXnYuEN/xjq2YpZhOd8sc+I2Zw9h6vSwuR0
         ZQBdgV+cGtoZe55K2jGhTsPTyFvYpiBbs3vB+wpa6f23OQ6qDHQ6kd3bPzjMg4HM/ZWP
         8F7UmYi5Ef/0VwI1ElmOMN19FY0Dj3WWHvBid2Tu7xwHaMorPxIEvHTJeZIubiJFipEp
         sXqEAxa/ymuT4dYYbuJvf8clH13U2ggpInsxz8XxcuABqvkBQiVTLnt9v5ofkSQbxA0G
         XLYrUhty4pWn5UjONMjugI2hREyDiHQ8TmSgczhn3OJKr8Z2PC3wH+z6o2KBwP/7PAGW
         /zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481376; x=1741086176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyShyny9G2/yY7DkjMFQ2r6rzy1CSrizU536iAKhGig=;
        b=RXujz249s5A8eHb6rIwfgF9OLy879M5SfJMezvQ1oJs+OdzepYFwECKompB5BcREOb
         mbe/BQD52COECM/H1UFo9qGI8liLsXfNyRr1lt2+HCX6+wv1X2PFpl8LICIrBqD4AXGE
         qJNnZNorV5IW8LG3rsh28xc6zRplQo592cL4una90cRh2Z28Z5gzCTVTGH2EoE2yGTL/
         c5w5+n8/BDWqOxnyA0HltUjqZD76GWns6hzB5g2mftMVTSSy8gIdQOTkrC0YQ70xrziw
         a1aHfEohCjaNP3bZqYG+oVay4qWHFo8B/ftPYZIc+HMTg2oFl630Ma50HFCObvqq26pd
         QpHw==
X-Forwarded-Encrypted: i=1; AJvYcCWkekmZe01VxQ5iBYiBpMxUuVvia/n27mSiPRl6SHV67hviA7Ua4jzWA1SrovPxzSBmVkn9m0QbrCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHaWg/AOenexiiNv3mpDp7avmjXpf/2kskkzeVAPerIXzQLeaO
	Zf+gyraa0tTDDospIkhOBSkYEfoJ+t83DsThqyLXqxKDv/npNr7UOZkE3NV24dI=
X-Gm-Gg: ASbGncs1cUg8WmU4ChGj8EaWwTIjxnDlW/G2zbrQJs8t1+ldRdM/orFK+kD2u4uKtIQ
	krEMDmjwxOT4Adon3BnVVP8y5uhP+hT4GcYH4Zcaw7yc5V+XM7HI407akTwuHFNbU2NXaUx2YKY
	3fD50nreOlip1CXXFLW63ZJnzfwkfDEcYudex+Z7AiR3QRxh7EGU5rE0ec7oS4HFHNxXn+77xZ0
	CiGPKBa9v6H8vIcWwYKgATIjjrFPxktr2YWmdgjMM9maHXmN/J592te+F7xobbhurz9luMEy/3J
	OLVKOgsGNTCxPY66cuJD/ociyTxZ6+90sQXMgoHtW4ks4Gba7qEUEHc=
X-Google-Smtp-Source: AGHT+IHGZ6gHlw9kSoahDWlxrbg/CLJ26q2dMB3XznLEbdWlGW9T87Nbkw4gSgN5rUEuHOYL93HXMQ==
X-Received: by 2002:a05:6000:1541:b0:38f:38eb:fcff with SMTP id ffacd0b85a97d-390cc60a682mr2129316f8f.29.1740481376531;
        Tue, 25 Feb 2025 03:02:56 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1532dccsm21972385e9.7.2025.02.25.03.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:02:56 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	laurent.pinchart@ideasonboard.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] usb: renesas_usbhs: Call clk_put()
Date: Tue, 25 Feb 2025 13:02:46 +0200
Message-ID: <20250225110248.870417-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225110248.870417-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250225110248.870417-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Clocks acquired with of_clk_get() need to be freed with clk_put(). Call
clk_put() on priv->clks[0] on error path.

Fixes: 3df0e240caba ("usb: renesas_usbhs: Add multiple clocks management")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/usb/renesas_usbhs/common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 935fc496fe94..6c7857b66a21 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -312,8 +312,10 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
 	priv->clks[1] = of_clk_get(dev_of_node(dev), 1);
 	if (PTR_ERR(priv->clks[1]) == -ENOENT)
 		priv->clks[1] = NULL;
-	else if (IS_ERR(priv->clks[1]))
+	else if (IS_ERR(priv->clks[1])) {
+		clk_put(priv->clks[0]);
 		return PTR_ERR(priv->clks[1]);
+	}
 
 	return 0;
 }
-- 
2.43.0


