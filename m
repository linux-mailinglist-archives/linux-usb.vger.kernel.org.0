Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB1DA55D5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 14:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731552AbfIBMYN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 08:24:13 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49422 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729893AbfIBMYN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Sep 2019 08:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=DxTOloQGXUNFNhqK1FaukINitRR/ojl8Bp/2Ma+Gdpk=; b=hdGpEZ+0sXN/
        g44xXPMgI5xDdpg/2tasLveB3VmCEVOV7TfPUXTHQFsoCztQeazALzIWLKNLH29u0nOy6ozZnkqBV
        umTVO7ytcTDD5joGdEquyLrZ6RDi95hV1BqLNDgLX8/LkG/P2X6SCRCfzdou2VIweOIe948t9sV2W
        pmNic=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i4lNI-0003CV-Bn; Mon, 02 Sep 2019 12:24:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id DF0C42742CCB; Mon,  2 Sep 2019 13:23:59 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        JC Kuo <jckuo@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Applied "regulator: provide regulator_bulk_set_supply_names()" to the regulator tree
In-Reply-To: <20190830071740.4267-2-brgl@bgdev.pl>
X-Patchwork-Hint: ignore
Message-Id: <20190902122359.DF0C42742CCB@ypsilon.sirena.org.uk>
Date:   Mon,  2 Sep 2019 13:23:59 +0100 (BST)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patch

   regulator: provide regulator_bulk_set_supply_names()

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d0087e72710ca7d1b309bf427286da58418ea89e Mon Sep 17 00:00:00 2001
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 30 Aug 2019 09:17:37 +0200
Subject: [PATCH] regulator: provide regulator_bulk_set_supply_names()

There are many regulator consumers who - before using the regulator
bulk functions - set the supply names in regulator_bulk_data using
a for loop.

Let's provide a simple helper in the consumer API that allows users
to do the same with a single function call.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Link: https://lore.kernel.org/r/20190830071740.4267-2-brgl@bgdev.pl
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/helpers.c        | 21 +++++++++++++++++++++
 include/linux/regulator/consumer.h | 12 ++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 4986cc5064a1..ca3dc3f3bb29 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -860,3 +860,24 @@ int regulator_get_current_limit_regmap(struct regulator_dev *rdev)
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(regulator_get_current_limit_regmap);
+
+/**
+ * regulator_bulk_set_supply_names - initialize the 'supply' fields in an array
+ *                                   of regulator_bulk_data structs
+ *
+ * @consumers: array of regulator_bulk_data entries to initialize
+ * @supply_names: array of supply name strings
+ * @num_supplies: number of supply names to initialize
+ *
+ * Note: the 'consumers' array must be the size of 'num_supplies'.
+ */
+void regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
+				     const char *const *supply_names,
+				     unsigned int num_supplies)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_supplies; i++)
+		consumers[i].supply = supply_names[i];
+}
+EXPORT_SYMBOL_GPL(regulator_bulk_set_supply_names);
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 815983419375..6d2181a76987 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -281,6 +281,12 @@ void devm_regulator_unregister_notifier(struct regulator *regulator,
 void *regulator_get_drvdata(struct regulator *regulator);
 void regulator_set_drvdata(struct regulator *regulator, void *data);
 
+/* misc helpers */
+
+void regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
+				     const char *const *supply_names,
+				     unsigned int num_supplies);
+
 #else
 
 /*
@@ -580,6 +586,12 @@ static inline int regulator_list_voltage(struct regulator *regulator, unsigned s
 	return -EINVAL;
 }
 
+void regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
+				     const char *const *supply_names,
+				     unsigned int num_supplies)
+{
+}
+
 #endif
 
 static inline int regulator_set_voltage_triplet(struct regulator *regulator,
-- 
2.20.1

