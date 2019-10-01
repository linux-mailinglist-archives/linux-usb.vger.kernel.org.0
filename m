Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34C4C3586
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388377AbfJANXw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:23:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46381 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388363AbfJANXt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:23:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so15477010wrv.13
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3UXwphbefxoaNIa3BWF+ZDcJIqlBkv2JNP3hYy5Lkdg=;
        b=Qq2uF8Z4L27uDSCEXrRA+mqw/EEYd7dJPlm3iWU9fq7yyhv2OXMdvhnqAeWCSfsyMl
         2H6I6pT6rRwrA9Qf4jNQduD6NJ6UI1eDWRsgxB0V0buAUaIsX87eFjaLgT1Eaf+62Jx4
         HgzBlQ9OnWgK37zKc7e9Ca5v3261eNGhHWdZap5De244frCEJkBY/ORUuGmdcubJBZ3R
         ohxVyEI+XnfdXiAACAnXCpFB5JDu77LF3PgzPMT/ZnAaKYLNay/eSrEQJ6qC9bCBphcJ
         BpER6vm+n6G2/0TSUg/h41avtO+8jBEg9cVPqG3plSmJW+qUHUn5KfBrZqBOdPFueBDQ
         0zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UXwphbefxoaNIa3BWF+ZDcJIqlBkv2JNP3hYy5Lkdg=;
        b=FNxGOxiIU1eXVUXfpSzssbh+ct9YuiYuwC1+Ibv23rSIyZyl/5EbAHeydJU3FtIkM6
         ugeNvjFj93W/d4welnAaK7wjoqhT7ylUWiJ5YJwUWyvPecHUS5k4qmtO2N0g6kF5FqI4
         ddlbXNhUh0qQKYNSdpaN4snrZndk7Ue+t2lW0ZWMlnCvwVFzJqjvQiU1A5C71vy8dGGS
         8o8khuoMCXTN7ytBQY1DcuKaBUC6r5iTf8Fhy/SUvGjg+Bc3U6fOwlb3zXuXE4MRRmVB
         CJOhXEMgKdN3Intjp0T5NoyW7crUUzSXDUt4KIaSpjijfAWxtpTN8Ncgw0AmGwFu1wJu
         sYcA==
X-Gm-Message-State: APjAAAUr8VFYA0oPWkheJquDQRaCeI4C+uM3P7MmJGkWKD0QWyAFdgfV
        OruxiOJBVLZOEnIQGZA+pEvA/g==
X-Google-Smtp-Source: APXvYqwPIVOEtxMwDTuDgBXmP6KdpZSgvSoDSeHMC6aZMZXAjqNPoKCPrhHyDyfQ+hRhwa9Y0StEiA==
X-Received: by 2002:adf:f801:: with SMTP id s1mr2138136wrp.293.1569936226128;
        Tue, 01 Oct 2019 06:23:46 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o22sm41847990wra.96.2019.10.01.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:23:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/3] phy: tegra: use regulator_bulk_set_supply_names()
Date:   Tue,  1 Oct 2019 15:23:32 +0200
Message-Id: <20191001132333.20146-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001132333.20146-1-brgl@bgdev.pl>
References: <20191001132333.20146-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new regulator helper instead of a for loop.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/phy/tegra/xusb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 2ea8497af82a..faf1137d1432 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -862,7 +862,6 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	struct tegra_xusb_padctl *padctl;
 	const struct of_device_id *match;
 	struct resource *res;
-	unsigned int i;
 	int err;
 
 	/* for backwards compatibility with old device trees */
@@ -907,8 +906,9 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	for (i = 0; i < padctl->soc->num_supplies; i++)
-		padctl->supplies[i].supply = padctl->soc->supply_names[i];
+	regulator_bulk_set_supply_names(padctl->supplies,
+					padctl->soc->supply_names,
+					padctl->soc->num_supplies);
 
 	err = devm_regulator_bulk_get(&pdev->dev, padctl->soc->num_supplies,
 				      padctl->supplies);
-- 
2.23.0

