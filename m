Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6605130B98
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 02:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgAFBe5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jan 2020 20:34:57 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37072 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbgAFBe5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jan 2020 20:34:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id o13so37885713ljg.4;
        Sun, 05 Jan 2020 17:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxHWs7smKY9c542URAYmUJXKzRbv59ZDpizKO+V3yf8=;
        b=VRVHx06Vdq1FmBBvykANKRrOTaBaWpW0ceu68mFMZkSaW1MKOTvYtijA7Jfcv9Z+Vy
         VHT7+Vw39+kILzZ8Fl+IvaGkRY6UErngMeqmXa+LqWSFfgHsydPqgDANeomLVUXGZvol
         e9QJqSSUqFaPaVEjIVmHlxTfkP6vA2i3MMCutwpsQ021++LZYYEf9ZwVqIgagdCh/SHy
         +jbHCuUtUhOpv2fyAskwH2eAA2MUlOIW4SlztlFxrBEVovI1Y8smatUy1guroTVGidAA
         V1omcibhTwdMuBCnzQjPxgfVk2VbsJ2r1nEK7raM4Q6vfCvi622d+IwlIfq14xfxmnvc
         OHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxHWs7smKY9c542URAYmUJXKzRbv59ZDpizKO+V3yf8=;
        b=hADt+o4AVd1zzQp6Yk5ccuuFWQmpRgiFvgPF1waGCjwmPaDEggjWWu4W3vJc5fdCK6
         OelO4rbVgHG8uc8+D+FhjVL4Rtski+4HxyAMfT0BnEkFj9muUp+IiwfTYBeI6DIjXPkt
         R+lrfIF1Fj27VdB/JBK4u9ux8rXcne79RKZipsJJRBreg7oXg/5FF8wuBa2em9jAAxU0
         xpmERg8stGTda0kIsHktiKYbnXBpUr3uLmFKtvJ11uxJA20TlxA/1gI6KThDXhnqztv8
         cWxVsb4TLf7YQzY8+8728pnvP5v2+GeJ73KytY7Tekb3YSBFbIuSeFD+KvbWwYPj0L8R
         QEyg==
X-Gm-Message-State: APjAAAWx2X4GlDkP38H5GNHCXTZzKSh36H6de0vbhkG4oTpJr4IPt01z
        5++3XuVIIc6S/rgUSf6WUyA=
X-Google-Smtp-Source: APXvYqwdZzmJbOI48HJEEBGpaUjSh004D0logSjpYIG20UUxtX7jJxIu81U4ZvA/91YgmezcYMor4g==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr57560697ljl.134.1578274494896;
        Sun, 05 Jan 2020 17:34:54 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id h10sm28235739ljc.39.2020.01.05.17.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:34:54 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Felipe Balbi <balbi@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/20] usb: phy: tegra: Keep CPU interrupts enabled
Date:   Mon,  6 Jan 2020 04:34:12 +0300
Message-Id: <20200106013416.9604-17-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
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
index 1b9667b0aa11..037e8eee737d 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -310,7 +310,6 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
 	struct tegra_utmip_config *config = phy->config;
 	void __iomem *base = phy->pad_regs;
-	unsigned long flags;
 	u32 val;
 	int err;
 
@@ -318,7 +317,7 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 	if (err)
 		return err;
 
-	spin_lock_irqsave(&utmip_pad_lock, flags);
+	spin_lock(&utmip_pad_lock);
 
 	if (utmip_pad_count++ == 0) {
 		val = readl_relaxed(base + UTMIP_BIAS_CFG0);
@@ -336,7 +335,7 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 
-	spin_unlock_irqrestore(&utmip_pad_lock, flags);
+	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
 
@@ -346,7 +345,6 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 {
 	void __iomem *base = phy->pad_regs;
-	unsigned long flags;
 	u32 val;
 	int ret;
 
@@ -354,7 +352,7 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&utmip_pad_lock, flags);
+	spin_lock(&utmip_pad_lock);
 
 	if (!utmip_pad_count) {
 		dev_err(phy->u_phy.dev, "UTMIP pad already powered off\n");
@@ -368,7 +366,7 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 ulock:
-	spin_unlock_irqrestore(&utmip_pad_lock, flags);
+	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
 
-- 
2.24.0

