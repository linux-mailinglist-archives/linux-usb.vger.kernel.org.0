Return-Path: <linux-usb+bounces-17864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D19D941F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280E4282701
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE351C9B9B;
	Tue, 26 Nov 2024 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FxVeUVkd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15B19258B
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612874; cv=none; b=PBnWeSdJumusWjYpeQ1N9iEHhr+Gvkrj8V1uERjM+knopjjIj0lKPjCimitjkb7bM+YFF0JSBVSyqsiNib8ctbPOIk/8TJqVvEP0aJEQL9iQbNHA8ksZ3p7PAq3s3DCFvX0nJDLEMw1hjuivKnkOg0yVj89y4P762CBZEyls7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612874; c=relaxed/simple;
	bh=L3W0t3Ndk3P8WFZClVN2UXeegBaVgcbm+UbE0rvxIiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPKAD8imq11xigyN2fHYUh09LqDhQxWG9YTiD3aUVX1SX/OFOdipyrrp8Lnpe5k777e59WzB7bhes7JPVViMcXk6pTZWLPBAPakiz5xoFBHBI6zSmr8x00lk9PXbmf9LpiSdBS4m+pPFAEhW4+5TID8VKo0UxZN3KP5wHo/eDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FxVeUVkd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-382610c7116so2821089f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612871; x=1733217671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHg/UpXu0kAmh5cmR42CQBOhisgGmi+P1vH8bY184Vc=;
        b=FxVeUVkdWtHtY+sPUI6sqE21pehNBnfcBSO5Fe1XNeyDBtjrbLY3RCNlA9/TolWQID
         Li6rQ/qS3Qh6mPiK7z9ApvT8z9JjymMMtd+NjW2aisnUHkJu/OsDe2JbsoL+qrGxcDyk
         CucYUv9Ww06tLU/VIw/gNdOyMI5aYZoAGSBuhu8/SF4RZynySUvU4YTf7CrqB/iyiGdt
         m2DnCMY/tP4KoUn3LROhr7lKQerMxxcN/EVyGCfBSGZUa1bGP329cqKM9Ijwy9eIK3Fy
         eP2rPHYrwecpEiSyGDpz6s7hEvgSOjXqhNKs51pqZBZSG+PIxckU5X50yuAjDBkpJuVm
         ue2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612871; x=1733217671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHg/UpXu0kAmh5cmR42CQBOhisgGmi+P1vH8bY184Vc=;
        b=BojNn1JxzPMYgPV7rbzuv6lITs7zU4og1OswPFaCGVGs4puwXp1h5+RbLcgQHnPC3A
         amlxMMLSdcZSpslkcIAaQvxMGDul9OIk+pDe6NdwqZif9kzyCsRwm5EPjHwjjfGx6gEj
         CWDXc0KaqaCOcAyDAOoYdXFk9I6gM2lTVPCO8qtlYIVxgN+hz3MDMHFhBJTbYwnHelhE
         P8s0CBT9LGy1ZkUxVkheTc1LHo4p5Ok96qMvHyvWiIU0UXDMHE2OBfInZdeBcDTSL4TJ
         a9lj7sRi3BixB07hT+fmUjIzxFH+dFs1KbS/DHUNzs2oeLFYj5oRaozO43ZdwtkxGDxa
         LQKA==
X-Forwarded-Encrypted: i=1; AJvYcCVRpr1dB+XCVW3Yp7pi89rXTxFaY2BJ1X5Q7e2XHYa7bIyqzuRwV0PL06NBNxoe5gnqMBFJzQDVmpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBNcnTm5fxa4tRm2gnGY5vPW6CzM68/eWTyARa5N7pY3v2hHx
	EDf0CHkITSWHgvi0rJXiNAViNVn2WJirgOiYdp++gt8HZ1us6z+/87d1HP39QZE=
X-Gm-Gg: ASbGncsBHRWogDVkuBkPenXmoSlBDStFAcj0b5ge0Sh6gMF5JfOkQsrSe6Y1z3SqKJg
	r7vhqi4eXviWTu4MVqyWda1NcvqqnMRTDHQ32p9zpKbILR/JiWMPmyjbfXTQsYsvRmi2k9den/V
	GLsfYDiIenfRs0zpG7NWpnO06wAkPGtbOb8ryeC2AlToCKUTQIYgJL+h6hsR1HcFGN437t+SPRR
	hk8SNHeR7OHmlFs3jEd5kYvTzXlfmLCMFghIAw055cf6roaS7nJDbbspaWDf57xZyhkPT5hyXD8
	A/k=
X-Google-Smtp-Source: AGHT+IHWio7klIaUm9lWwgg66sT0uRqFvChifk0YrFUVIwja8OlGoGemJIscbif1ZB71H5mZ9kHl7w==
X-Received: by 2002:a5d:5849:0:b0:382:4ce5:f8a4 with SMTP id ffacd0b85a97d-38260be54f9mr11141729f8f.53.1732612870798;
        Tue, 26 Nov 2024 01:21:10 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:10 -0800 (PST)
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
Subject: [PATCH v2 03/15] soc: renesas: rz-sysc: Enable SYSC driver for RZ/G3S
Date: Tue, 26 Nov 2024 11:20:38 +0200
Message-Id: <20241126092050.1825607-4-claudiu.beznea.uj@bp.renesas.com>
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

Enable SYSC driver for RZ/G3S. This is necessary for USB support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 0686c3ad9e27..c8065f25ee53 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,7 @@ config ARCH_R9A07G054
 config ARCH_R9A08G045
 	bool "ARM64 Platform support for RZ/G3S"
 	select ARCH_RZG2L
+	select SYSC_R9A08G045
 	help
 	  This enables support for the Renesas RZ/G3S SoC variants.
 
-- 
2.39.2


