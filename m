Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7E0C3588
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 15:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388385AbfJANXx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 09:23:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37674 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388370AbfJANXu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 09:23:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so15528518wro.4
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2019 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=enYbMbNI4tFIk7gfYa1OWesJ4PjjLcPO1FzeNFaXSzM=;
        b=vTcmolbxld2vrR7GBYi0Xsk8M5+fVtDX3QP4tJzqLjwwbcqblsuf7qGLNAs9OwaRT4
         fjS7a9OpIzlT/xfqgaDRyjf4V5Rit2/DWdoXokRzMW6dW4zsANFi49wKrnVssomj5g9R
         nFysWpuZglqOsPWLlpJQvoJ243yFYclKXNMEw/ip1V2XbLgMUencpALJ5fcTinL2uWAe
         ORXbD6zInbcK0k/JSvsshpClya/bFVAGR9cdsHcIvdaTPPcJkDw4gdHUfCYlnTzblJlj
         3/yYxsTVd791qJ1nxdZ0+xCdNhd7LrRJVUi+mSxGEpJ7dNJIf4PtfzN/E/y4WRJo9q/I
         ygDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=enYbMbNI4tFIk7gfYa1OWesJ4PjjLcPO1FzeNFaXSzM=;
        b=unB7mk0Gyf7GOOJ+M62B4wETlR26+e4Cd2Acp5CE3aadeC6k6Xmb7Sybuqlv7z4Rbr
         IccgvVLCCX7REWzKJbG1ZfliALnDBXPniIelkPbxXdSpofMJmpJ3z8lyGxxFFhhJ7DcX
         KZxavwUlkm7RX467NXh7LpcgNUrbgdDubvPJAYFdO+AzMwa4DDruBhauSW75I0TPm7Ui
         Gh3m5obeWmrdG7tdFmM+mYJTblg+1pmOdMJOL8EFwUHsUxGd3YG2mUMxfWOZ8oFbGJHw
         cooF2sIeOxj4cig6BuxhfMUeMRc3NWJdfsSvCHHRvsuVX00613lZhnUgFaTC8jaOhmil
         szSg==
X-Gm-Message-State: APjAAAVQWX8kCYztGJGgb7DHEysC8E8CWouYddppxslk1BnjDVr9hpHr
        skX+GaCkQd6m4RIq8sbGy9yTkw==
X-Google-Smtp-Source: APXvYqzXbDDpewlYhp+7ocQHLaIU5HkjVp7oImNZRVgIZgzhGcBONIajVjr8GuK3dQUIsg/AA4n5Kw==
X-Received: by 2002:adf:d08b:: with SMTP id y11mr18624076wrh.50.1569936227104;
        Tue, 01 Oct 2019 06:23:47 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o22sm41847990wra.96.2019.10.01.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:23:46 -0700 (PDT)
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
Subject: [PATCH 3/3] usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
Date:   Tue,  1 Oct 2019 15:23:33 +0200
Message-Id: <20191001132333.20146-4-brgl@bgdev.pl>
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
 drivers/usb/host/xhci-tegra.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 2ff7c911fbd0..a3c4c9287f9e 100644
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
2.23.0

