Return-Path: <linux-usb+bounces-28162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2594B59B87
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 17:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7058A1C00203
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 15:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7B0352FC4;
	Tue, 16 Sep 2025 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixts7/yQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46234A332
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034988; cv=none; b=Vy9fch3C45DVsenqqeWKn1HFVfucW5Ur2dN6u6z6z8eAmtbJmrSjBOhbvmbUi2Jw1Ta5GwOjZOeR2eJq3rIP/ZmWTq8PRWQMCORrKY/2hJycpHVk/pAhfzKageWOukOWoq/jI4FIj2NkjaMbR3I0uIls0aLtEIHssF7PCptwqF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034988; c=relaxed/simple;
	bh=A/pVmo2VMMUD2z+HUZj4DpziB5TxDDr6gmH3385sgqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kd1z2qZi2CEQlxnQSKwk7ChMuWDwD1k+ajygsZngYEc23zf1s1nPpx3vfC0BCgb7+N2Di3vqDqw/PKSBa6OMVCB+zxHxhCvSQ4GY2/l8ivrMnV4sx2lCagz9iTlhfJF5iil9lkDKcX/H4H4hlXVbHHV5lNG2eyod31EdAFwQ55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixts7/yQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so2239674f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034982; x=1758639782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/k7vhUf1voL8kqIJSX9PkvL+7B3TmZ2+++u1y1uP1Q=;
        b=Ixts7/yQY5gf8B9y9C6Zf6BHoYLLlWuB48hHKmNVehxpj7geI3FWHqvNJyz0A26UWY
         FbvXxvYsISIGLgIPexfICQ4NvzMJbo1Xa/j7ij76W4wDFKWWzhIowhNxiarVvfTT5Ml9
         GKh5pJgDIwFN8B7UFAI4u48lLApSKl76YQBkI+DuChCLTMkVWm1yOOR4AaCHYWnjBbXW
         WuPjyJ8DJyfrkBZDo/Si8yt8A570eQK1hjlBnXblDLEuyggkhCR7ajeltN6p9Pb6r1Xo
         zAN5NTaJX7VV/L2TQaIOE6SbsNy5Vth2MWzYhp69SfifXzv6W3cZ4cHxp3Za5fhHWGhw
         SeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034982; x=1758639782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/k7vhUf1voL8kqIJSX9PkvL+7B3TmZ2+++u1y1uP1Q=;
        b=xO7zZ3kVw70qWChARnLoMktsgCX8dJ7pOKNcExbo8hVoWh+54eVQ0C7t7TrbKHECxb
         h0Pagqls+qkpggOpJVhj6fXmsiZMKnMgvBQa0Tv4v0vWqVi09HjeAKEi2Awn22WFxPR6
         rS+cdoXLAH6P2HgYBwi+gBPaplI1a+YWSKAlRJ2zkE3HPu3dBYU+O5Wo1XsaO544blkQ
         5KFSBtwzcZWPPCpm4kceaCisOoIMkBz07PCA/gh+d6aANoNOq8uT7BB6VT3a8Gbt8cmz
         oHCU18Yueouy0ZrdFybGzdhYWGfiR4DbRo+sZtfo7XUEMNaroXjT3q9CQdItQDc8IvmZ
         KoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvR9Vff/Tym7v+cNQNrv/HnTYE6OH4i9ZSkW+s7SbLycJTfOdgw2BP/E0difsQfzZ6SmD/2ciaBi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw993sMIP+9a/fbz5kBVfbwUZSfAKY46GIEcs0yLhfm9fvwwtTk
	bMUdEGnkm5cdrpWgcTp2yJzdOLCyWtjoy2Kpr1nj3KfeAazYrrHwnBJ9
X-Gm-Gg: ASbGnctsF5I3cz4ngJw4pHTcmP4gd7tm3wWtW3222+KLIzEWYGdRblGYqpKvwGKrRMA
	LCyLXyN6Bexl82SsIUL/feGN248tY+Qcwt4LrP6/B/FrwvNACr0vC33thjJI6uxNjSQkTvjHrMT
	S2XX4PqIo6dAx60CHn3zHcniwH5pCezBodvqPRU1gwdcsQwvbGY4qeubu92XqgXGzQ9mwY5gexz
	4xeUACVSE85eGJ4CjyUlEJWuCNmduFuHnw7dCMe6I6O5odXI4uNrhrRwLvIbW4+ZygaWc/2JCRJ
	JgTTos0PL3kzyajatHVBVumlCiKKSfki23E3F4DhAllnp0okz427h+fq90cgdvKqUw+25l+ht03
	G68oj2iwFe69PqCIWCtR2JFDldSf84l/UR2nSzj1juWtL5BF2Gc45seJ/dXx0HBzjN+O26+Yto/
	D3Tg==
X-Google-Smtp-Source: AGHT+IGrfbQPvbjSEiLxQt7eaONhgRJwkDjXjoj1pqSn2g2OiHYXCnZlBuCibXYoLvrggR6sX6Hh/g==
X-Received: by 2002:a05:6000:2903:b0:3e0:152a:87b4 with SMTP id ffacd0b85a97d-3e7659db0ecmr14198255f8f.35.1758034982264;
        Tue, 16 Sep 2025 08:03:02 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 5/9] usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
Date: Tue, 16 Sep 2025 16:02:41 +0100
Message-ID: <20250916150255.4231-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some SoCs (eg Renesas RZ/G3E SoC) have special sequence after
xhci_resume, add .post_resume_quick for it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/usb/host/xhci-plat.c | 14 ++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3a56d8f94519..9e58431f486b 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -75,6 +75,16 @@ static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
 	return priv->resume_quirk(hcd);
 }
 
+static int xhci_priv_post_resume_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (!priv->post_resume_quirk)
+		return 0;
+
+	return priv->post_resume_quirk(hcd);
+}
+
 static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
@@ -529,6 +539,10 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
+	ret = xhci_priv_post_resume_quirk(hcd);
+	if (ret)
+		goto disable_clks;
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 2b32a93d2b76..00751d851831 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -21,6 +21,7 @@ struct xhci_plat_priv {
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	int (*post_resume_quirk)(struct usb_hcd *);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-- 
2.43.0


