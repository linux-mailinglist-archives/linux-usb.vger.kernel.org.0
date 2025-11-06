Return-Path: <linux-usb+bounces-30152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D89FC3BD2D
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 15:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DCB250414E
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48C93446AA;
	Thu,  6 Nov 2025 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nwrEISv/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ECD343D92
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439794; cv=none; b=OtAMXHrX5TuHeSCUx22ccaXgmLkR7LhwrOQKI/VScRQgDXOCk8d8UsoIrJYDRWOJv06X80ENmIAWqAnLTlwMuof+IAlp05LE9xzmZ6wqieQAyRcahXhDGSGUAPHBEKuqELG6q3BbcbMn/yXfXEQtJlOB6ZYq7WIBt6MO86kGukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439794; c=relaxed/simple;
	bh=GHnwtPsZXjN+kRDiAE0fB8kcSglMVgvTqZiFQJxM6fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctJCUG/Cc9hQqghIb3NsDCWuOeAD7BPROmwMlQMqw6nW28JhjO009avSfmmYkoo9HorxGZ0HSjoN5xT3dPTDbTIDdijRq0imPsWsCralLmezqO/qJ61hjBVt5As3ouVDXCJWkpQ/xXr7acD+Ndescasi7uUO+6h0zZwsoti1pm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nwrEISv/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so5456115e9.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439791; x=1763044591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLJObSZguYooG//hSzVwf4p86h8hNnf76dlK6vZI5T8=;
        b=nwrEISv/qstiqS+MzcCkNyZhwaMcLN13d60xJ++6uifS47yJesiKJ37D2UcQPAzL5u
         lb6IMIswLfHMsWxyWb416B1pnyCOw7hk3yYkW5FGy5DTFeQIgouCdhDLYYisUH/fgJP/
         e4b3+FHrMlQKoTVUrA7EakUHj/28mb7X51wwAI/CTzGcxX2UvbzEOrToC4SmXw9punPH
         b5rgBtfRwKFNklMihpvkSCiDrK7imrr59RI27iAlgEf7wE3+MJpsgm9VVG3SD3Pj62Ll
         nY9ArsG1Xwi8WZfZlOstoCiTDbtHnfzLkcGX+tMXfC+Fw7UA3/CU6r5YVMnQRYcV+Xjg
         TH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439791; x=1763044591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLJObSZguYooG//hSzVwf4p86h8hNnf76dlK6vZI5T8=;
        b=Yfy2C9wr5X4glq6u+QUFViv1iL5V3OMKlir6eNsvZSG9NF1SEtwarCPZO8YkzXk1p1
         mZ2hf2XO36DwRoOmFKVdMuku9RBdxMDtSvuXkjIbDMjdpHkyVNLsBKUrLk8GEv3ghc4n
         87OakRREz5Mbmi+D6plad1iE2nsSIKjOUBnu+kSh0zhbvKQRYb8cid3hKnkR5403qb23
         8hTmOZ/rqKGiCP5rMRPR8nAnmZR3r5EpqGgd/WfPXMPd6vWoWOUI1oxd1fYkcJ8fbDmE
         Usns03aeoL43B8KbY/962f35mv+MUJXQF4znEiTb0dWe1jjS7iCVTDvkJp4suLFut+t0
         Qu5A==
X-Forwarded-Encrypted: i=1; AJvYcCVBMMuw0+aLbIO7Q+41CVoylGSKfOnQ5CP0XB8UObmsS2hH49qSAol7r7uksX5DS7xtGOGTjDTC4mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+UoCjLVCL5Q8PV9v9eHxYG/AemmzhCdttYpoBbbWcy+SmWxl
	TYt97y3JJ+Wr9JHBeT77a2INhT501Tt70VN2oNafu+BQcP368wCTjaFhxgKGHyMT3KY=
X-Gm-Gg: ASbGncs78IrRbbj4s4ULXyLcpvNsiaSoyxH8kYVuc4CKRfKX0bb/5PkfUV/4vCrt4zn
	J6rQT5+CEs1Rgdr+pZOWqGjV18txk5wS14h0iRAKs8WO+V7GJP98+R9iDmuJMLYBg7byAa4j5oK
	70uhNETW1E+x5lqqATh6PG6NFYKV+EKTjVT8gHO1U/G0PSYu7DefwtnpS3/HlqEdYzlgjCyArFd
	jQEzHPQ03fYWGxk2R6wNFG3Uk0xcW42WXrP0FJdOvjZ6KKynlFM8NyH3E3eAnQp78Kt+VdF8uTS
	CctzqKPfzVOtdJVid80o252fpzWJAHWx7Bb88rvvbs6frRPNZJVZBo3Dy0R2huQh+/JybtcGzH8
	DzkuxJag822ZJ8gM3ssT+UCmUaUR/tRWVRUBUGZohWgVAyAH41hJpcN2EDWphpoxOOmFkw+Qg7y
	g7Fu9psYMn8Tx5BvLNSgysmGE44armJczZC3tORsGw
X-Google-Smtp-Source: AGHT+IFv33x2P872TieHOJvR5x8J1BT/j4Lv/kS9+Tc1cAVcKxr+2HllDBXtSXFFGFzhCzx5Kr1b6w==
X-Received: by 2002:a05:600c:348f:b0:476:a25f:6a4d with SMTP id 5b1f17b1804b1-4775cd9c069mr60508955e9.1.1762439790728;
        Thu, 06 Nov 2025 06:36:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm112185495e9.15.2025.11.06.06.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:36:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	geert+renesas@glider.be
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/4] usb: host: Do not check priv->clks[clk]
Date: Thu,  6 Nov 2025 16:36:22 +0200
Message-ID: <20251106143625.3050119-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to check the entries in priv->clks[] array before passing
it to clk_disable_unprepare() as the clk_disable_unprepare() already
check if it receives a NULL or error pointer as argument. Remove this
check. This makes the code simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/host/ehci-platform.c | 3 +--
 drivers/usb/host/ohci-platform.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index bcd1c9073515..57d5a7ddac5f 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -112,8 +112,7 @@ static void ehci_platform_power_off(struct platform_device *dev)
 	int clk;
 
 	for (clk = EHCI_MAX_CLKS - 1; clk >= 0; clk--)
-		if (priv->clks[clk])
-			clk_disable_unprepare(priv->clks[clk]);
+		clk_disable_unprepare(priv->clks[clk]);
 }
 
 static struct hc_driver __read_mostly ehci_platform_hc_driver;
diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index f47ae12cde6a..af26f1449bc2 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -69,8 +69,7 @@ static void ohci_platform_power_off(struct platform_device *dev)
 	int clk;
 
 	for (clk = OHCI_MAX_CLKS - 1; clk >= 0; clk--)
-		if (priv->clks[clk])
-			clk_disable_unprepare(priv->clks[clk]);
+		clk_disable_unprepare(priv->clks[clk]);
 }
 
 static struct hc_driver __read_mostly ohci_platform_hc_driver;
-- 
2.43.0


