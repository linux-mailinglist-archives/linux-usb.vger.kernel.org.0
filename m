Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E2B36005
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 17:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbfFEPOi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 11:14:38 -0400
Received: from foss.arm.com ([217.140.101.70]:33426 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728458AbfFEPOh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 11:14:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F2AB374;
        Wed,  5 Jun 2019 08:14:36 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DD463F246;
        Wed,  5 Jun 2019 08:14:34 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, "David S. Miller" <davem@davemloft.net>,
        Doug Ledford <dledford@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-usb@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH 05/13] drivers: Add generic helper to match by fwnode
Date:   Wed,  5 Jun 2019 16:13:42 +0100
Message-Id: <1559747630-28065-6-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
References: <1559747630-28065-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a helper to match the firmware node handle of a device. This
will be used later for generic look up by fwnode helpers.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Doug Ledford <dledford@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-usb@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/base/core.c    | 6 ++++++
 include/linux/device.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 9211908..efcdb96 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3334,3 +3334,9 @@ int device_match_of_node(struct device *dev, const void *np)
 	return dev->of_node == np;
 }
 EXPORT_SYMBOL_GPL(device_match_of_node);
+
+int device_match_fwnode(struct device *dev, const void *fwnode)
+{
+	return dev_fwnode(dev) == fwnode;
+}
+EXPORT_SYMBOL_GPL(device_match_fwnode);
diff --git a/include/linux/device.h b/include/linux/device.h
index 7093085..08aa087 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -164,6 +164,7 @@ struct device *subsys_dev_iter_next(struct subsys_dev_iter *iter);
 void subsys_dev_iter_exit(struct subsys_dev_iter *iter);
 
 int device_match_of_node(struct device *dev, const void *np);
+int device_match_fwnode(struct device *dev, const void *fwnode);
 
 int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
 		     int (*fn)(struct device *dev, void *data));
-- 
2.7.4

