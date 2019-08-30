Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E02EA30B2
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 09:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbfH3HRy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 03:17:54 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38715 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbfH3HRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Aug 2019 03:17:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id o184so6266319wme.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2019 00:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dJ3jA3jqw74ejYTjUbB0mp9lyvRd71pqTZw+q0oRxOk=;
        b=mTMAOFUkMew1v7pMgdQz/GR1Gl3qWQuKOinB8L2um2FtedkhA5Sfw9YH5Jxak6epjS
         Bu7YqjySAvwlI8nM2LT39F1wsCGPgkKopI19hmcJX4md2re7H9Hfe4ipr6Y6pQoCjcjv
         sn891n3Br8qzEM/wf8x8bZDEU0+dTrCKkIpOeLby2+tdgkykuRRweQ+QpcUe2Vv+cJjR
         aX5+uU1DJmiUVhR7zGparDrb/a7l2oD4ZKEXYEtVjIoslsr6moNuudZmwSBxB1ntQll/
         ic+8fKxMf5bTO0otFL+RTKwRecld9SFYZwUSNDDh3ByTy+sS27Sayf4hFdbsT6h+YO75
         ryyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJ3jA3jqw74ejYTjUbB0mp9lyvRd71pqTZw+q0oRxOk=;
        b=ZEGIEhO5LrZukhLU2pZ2iAodoxZ301HiZzGQ82/83ui/whheqdvEIz5hKVHnY8LtWk
         LPL4R4NcDEAZQ/ASzfd0qHwAo2N22uPUBg6V5O8d/GlWSwwdlPNL7t9ySlvuTqqOs7Ug
         BgXsUjHLQq5PTpEfdd2Wf9lbHeHOve8xTqdatDVxosnP/AM4xWetjNlFHlg987uXb/67
         lXrpd695NXixkiPZzOLRJoNGY3WBf0tj6hh+OG8Eg6a968RYsm8Yb8HLzdkhZ4oZk7oI
         iA6Tbv/SPtHgqvcraOxY2HpAMjS9Ben4ZqYWKDCOdWlSuO0Je40spE5xE2QTu4zFKx+j
         5QMw==
X-Gm-Message-State: APjAAAXVNcM0/nFHDeWCcWVn/ebCRLZYk89QRseoD9S+8a4uq/YiKLYz
        h2pRZto+e4MVJWPXyWAPIVoQZvReFwM=
X-Google-Smtp-Source: APXvYqxemBS0LBW/mvFuTE9jbX36U7PFxqQSOkXKrtTPR0X6Ija4G2zISp42Ghiz2NTitl8E9gPQQw==
X-Received: by 2002:a1c:1ac2:: with SMTP id a185mr16660285wma.96.1567149470963;
        Fri, 30 Aug 2019 00:17:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x6sm7637529wrt.63.2019.08.30.00.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 00:17:50 -0700 (PDT)
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
Subject: [PATCH 1/4] regulator: provide regulator_bulk_set_supply_names()
Date:   Fri, 30 Aug 2019 09:17:37 +0200
Message-Id: <20190830071740.4267-2-brgl@bgdev.pl>
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

There are many regulator consumers who - before using the regulator
bulk functions - set the supply names in regulator_bulk_data using
a for loop.

Let's provide a simple helper in the consumer API that allows users
to do the same with a single function call.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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
2.21.0

