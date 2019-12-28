Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 020E012BEF6
	for <lists+linux-usb@lfdr.de>; Sat, 28 Dec 2019 21:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfL1UgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Dec 2019 15:36:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35470 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfL1UgN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Dec 2019 15:36:13 -0500
Received: by mail-lj1-f193.google.com with SMTP id j1so22496176lja.2;
        Sat, 28 Dec 2019 12:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XW8RgGVVIP4dukOwxE16x7rwDX1UPUz1QFCOuKL8Ll8=;
        b=avxtaP65WqU/Ncao/kDgxhHm46B1YIepBA5ThIdFwiPrFAPl0+5hP5wwwUyEypGYAT
         RxdRGwYbF5CnAJov6J8URcYzSqGHOEeAryT/thSQ/lck+aPCTuv396v9XwmbXpXenRjl
         7YBPEINB/G/qucn4EtlMs6gUx2T4OcBzehXUqNOjie/nxX3JHH8PR/xnuXa7S3S0LIEK
         TdKXAprSSM7uKlq+5r0MHdZgJ2hVpTQIAYFRUS1zd5IzOZXKe8aYbpln1+TeLh5qc1iq
         xb+LkKKzBxKjQn0Wuzk0Tas7Yn7a2fxTV8DokHvmgZuX1geCRJGuDNYSnXqh+5GsXkvu
         POfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XW8RgGVVIP4dukOwxE16x7rwDX1UPUz1QFCOuKL8Ll8=;
        b=Z8TYSlVEzzymRoveZtklLkUdxf4N2NO3qozFs7DE6JT2aWIZw3FffUYmIWxlkB19Do
         CHTccr2wuYeBMQGvz30FAKKvQWvwgigjEbCbcJkG5FmWdlp7oAOe11DMmkpLgfGMr42E
         OB2i4Y5IPsVj7wjBBc2dUEqDPlSxI7TV0eLShbzC8d5RrR0+TZfNL+m8mmiiemaWlPFc
         FtbewGVdes47wDgmPKMltTYjCn5w6uUBPW4bLRII4fU3EFmj5v07KG4Jqia8ZjjtURfo
         xYP6wY1kTtgDsObG05rK6j7+N3uv7OeHgjaMUPxnNfInhKNMJp37FUfbE2QGA/MW9Kep
         /1kQ==
X-Gm-Message-State: APjAAAVQo02LPJR5zIht0a2qHPHX/UFB5Qvhzwo5L2HxdusUCX+wnlTh
        d9bAIpxYbSWFcf6gC7DpjGw=
X-Google-Smtp-Source: APXvYqyDG2mcOKf/QZ7V9hXB7Li0VgdyKGT+tX39SI3AMnu9arhBg7fzgr+Z7MKF/ml0CbtIRGvFvw==
X-Received: by 2002:a2e:8698:: with SMTP id l24mr14082826lji.94.1577565370923;
        Sat, 28 Dec 2019 12:36:10 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d9sm15162614lja.73.2019.12.28.12.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 12:36:10 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/16] usb: phy: tegra: Keep CPU interrupts enabled
Date:   Sat, 28 Dec 2019 23:33:55 +0300
Message-Id: <20191228203358.23490-14-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no good reason for disabling of CPU interrupts in order to
protect the utmip_pad_count modification.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 72825d207840..b0c4f304a5ba 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -313,7 +313,6 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
 	struct tegra_utmip_config *config = phy->config;
 	void __iomem *base = phy->pad_regs;
-	unsigned long flags;
 	u32 val;
 	int err;
 
@@ -321,7 +320,7 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 	if (err)
 		return err;
 
-	spin_lock_irqsave(&utmip_pad_lock, flags);
+	spin_lock(&utmip_pad_lock);
 
 	if (utmip_pad_count++ == 0) {
 		val = readl_relaxed(base + UTMIP_BIAS_CFG0);
@@ -339,7 +338,7 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 
-	spin_unlock_irqrestore(&utmip_pad_lock, flags);
+	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
 
@@ -349,7 +348,6 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 {
 	void __iomem *base = phy->pad_regs;
-	unsigned long flags;
 	u32 val;
 	int ret;
 
@@ -357,7 +355,7 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&utmip_pad_lock, flags);
+	spin_lock(&utmip_pad_lock);
 
 	if (!utmip_pad_count) {
 		dev_err(phy->u_phy.dev, "UTMIP pad already powered off\n");
@@ -371,7 +369,7 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 ulock:
-	spin_unlock_irqrestore(&utmip_pad_lock, flags);
+	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
 
-- 
2.24.0

