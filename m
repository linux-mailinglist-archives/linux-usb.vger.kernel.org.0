Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78BD4A30A6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 09:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbfH3HR5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 03:17:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44000 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbfH3HR4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Aug 2019 03:17:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id y8so5834214wrn.10
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2019 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87c9Esbfhh1R2CT+KoDKwWm3ER/ccLkcscNPwZrMjvE=;
        b=R7HX5N+qO9vul75lMvB80HkCVNqQlDuX+3sQTg4/wUtSilf0t0cU3lXyFVXSdxCA9B
         HYhU0DvmZFYIPgpH+LmEDudVksUAFBfr6wXeADadDOp570/DK9axKXUwBd3vbT9v80Dk
         XGyF1ZN+bt+lsB2GFHRy4pYIlS7XZs9vCJkeaJqy4wCY2jbBwYOo31Y7LPQ90yo4yM2i
         OBQP0rbdOJ4W8S0fXp2NjaTGqsS6Ttjzc59uMLbbaK9mPms9epAedIy6UY7mj3y1lCiz
         0qQoA4T6IBazuJzmsosABPD4Z0tMcn2Lf/swKTxZQ2IARZgDkhe2sMCykSc4yetjSza2
         UBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87c9Esbfhh1R2CT+KoDKwWm3ER/ccLkcscNPwZrMjvE=;
        b=XDKJEfOdQrOCW1tTk66gf2vgFqULlRDu6/PHWl7Wl5UIZGroAbgfd/6QKRhuxWodRF
         oRfe66lZAUhqRlLXqV3MbzJs82ADds6LnZnJmiJ5p6zc8dykr5rgyCWUVcmBGBz7Pd9w
         6pT4tgbVWorkwuJF0JDnte9c9jDvViEsAETT0z/q018uZG/v10aNx3MOE6Mg1XoD9MYM
         mNN+g3TDY78ZDsX0KB3061XL3NsfYUG22nPuoxoIRXw5/c+JjJhcS93pKDNFNfmPkIE6
         kX92gDZCYSi40FZALCiHDom2W3MlSd9HWRvGdswUAPERlNChL09oTTwPVTng6JrN4VTd
         ug+A==
X-Gm-Message-State: APjAAAWY+gBDwhQ4Nea/et2/TX3OJLNMqRF/Bu6TFNT6BoRk3SRRQRE+
        jbSJSw+nC7O7KxmCIkIcSVrxrw==
X-Google-Smtp-Source: APXvYqzkzj4fi+gUVRl8oN9nzpOF8I9mEfKO8sWi5cRqKen8+QKhDkcYwUYXisXPkTCXXjklEYKC+Q==
X-Received: by 2002:a5d:63d0:: with SMTP id c16mr12188620wrw.22.1567149474440;
        Fri, 30 Aug 2019 00:17:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x6sm7637529wrt.63.2019.08.30.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 00:17:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 4/4] usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
Date:   Fri, 30 Aug 2019 09:17:40 +0200
Message-Id: <20190830071740.4267-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190830071740.4267-1-brgl@bgdev.pl>
References: <20190830071740.4267-1-brgl@bgdev.pl>
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
 drivers/usb/host/xhci-tegra.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index dafc65911fc0..9ed573bc89aa 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1128,8 +1128,9 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_powerdomains;
 	}
 
-	for (i = 0; i < tegra->soc->num_supplies; i++)
-		tegra->supplies[i].supply = tegra->soc->supply_names[i];
+	regulator_bulk_set_supply_names(tegra->supplies,
+					tegra->soc->supply_names,
+					tegra->soc->num_supplies);
 
 	err = devm_regulator_bulk_get(&pdev->dev, tegra->soc->num_supplies,
 				      tegra->supplies);
-- 
2.21.0

