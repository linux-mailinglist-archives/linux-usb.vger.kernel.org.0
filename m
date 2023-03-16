Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402E76BD066
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 14:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjCPNIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 09:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCPNII (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 09:08:08 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE44D76A4
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678972086; x=1710508086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LT4GFKX6cewdLAFvPzpboXrloqpCW/mNfEMRGb4YPWw=;
  b=QcKd0kf509iGfu/jpP+LYlxSP1K79LghU5+M/Xl51kdQAJa4GK1kMOM6
   43Q8wt4Yl+pmUii8XOrUMZohUsv39fVhPlJeIFm1VGzu0bOV/X3elqw0M
   ip94EZhYO7ZZboTfOZW0CqHL9UdZQTLhiCp1vmlCbSXcgkUqmzvRBpqIB
   +UIDlxRjEhCSmY4a3+auvwDR4zMdLwk8kkhsgcWeF3smYApndeSSRjcX4
   JzEEY6OtrhpG0UycqVDKGm2NSg8j8YrZdUch7CAurV/2xQA4OZY0uKUgY
   0KnUpBxcLzxuO9/g1gHauFqnDb418UMExax/xCDK7aZ+ywipmazIXCefF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336672767"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208,223";a="336672767"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 06:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="823240948"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208,223";a="823240948"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 16 Mar 2023 06:08:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 16 Mar 2023 15:08:03 +0200
Date:   Thu, 16 Mar 2023 15:08:03 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Message-ID: <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com>
 <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
 <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BzQSLw6XjpnQY6AO"
Content-Disposition: inline
In-Reply-To: <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--BzQSLw6XjpnQY6AO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2023 at 06:17:47PM +0200, Heikki Krogerus wrote:
> Hi Samuel,
> 
> > I asked that Samuel to share this here, but perhaps we should consider
> > it still as an RFC. I have tested this with some of my platforms, but
> > I want to test more.
> 
> Sorry about the slow progress, but this is causing commands to fail on
> some platforms. I've been trying to figure out how to fix those, but
> nothing has worked so far.
> 
> I think we have to handle this with a DMI quick in ucsi_acpi.c. I
> don't have any other ideas. I'll try a few more things, and then
> prepare a patch for that.

Unfortunately nothing seems to work... I'm attaching the DMI quirk
patch here. Can you test it?

I'm not sure if the DMI_PRODUCT_NAME is just "ZenBook" so you may
need to fix that in the patch!!

You can get the correct value by running dmidecode. This should work:

        % dmidecode -s system-product-name

thanks,

-- 
heikki

--BzQSLw6XjpnQY6AO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-ucsi-acpi-Quirk-for-ZenBook.patch"

From 6111911b5cd9da86679b0942f5df01b7c1516cae Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 16 Mar 2023 14:59:30 +0200
Subject: [PATCH] usb: typec: ucsi: acpi: Quirk for ZenBook

Interim. Still WIP.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 43 +++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 62206a6b8ea75..873e64f48b477 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 
 #include "ucsi.h"
 
@@ -23,6 +24,7 @@ struct ucsi_acpi {
 	struct completion complete;
 	unsigned long flags;
 	guid_t guid;
+	u64 cmd;
 };
 
 static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
@@ -62,6 +64,7 @@ static int ucsi_acpi_async_write(struct ucsi *ucsi, unsigned int offset,
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 
 	memcpy(ua->base + offset, val, val_len);
+	ua->cmd = *(u64*)val;
 
 	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
 }
@@ -93,6 +96,40 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_write = ucsi_acpi_async_write
 };
 
+static int
+ucsi_zenbook_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t val_len)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	if (ua->cmd & (UCSI_VERSION | UCSI_PPM_RESET)) {
+		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
+		if (ret)
+			return ret;
+	}
+
+	memcpy(val, ua->base + offset, val_len);
+	ua->cmd = 0;
+
+	return 0;
+}
+
+static const struct ucsi_operations ucsi_zenbook_ops = {
+	.read = ucsi_zenbook_read,
+	.sync_write = ucsi_acpi_sync_write,
+	.async_write = ucsi_acpi_async_write
+};
+
+static const struct dmi_system_id zenbook_dmi_id[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook"),
+		},
+	},
+	{ }
+};
+
 static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ucsi_acpi *ua = data;
@@ -114,6 +151,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 static int ucsi_acpi_probe(struct platform_device *pdev)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+	const struct ucsi_operations *ops = &ucsi_acpi_ops;
 	struct ucsi_acpi *ua;
 	struct resource *res;
 	acpi_status status;
@@ -143,7 +181,10 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	init_completion(&ua->complete);
 	ua->dev = &pdev->dev;
 
-	ua->ucsi = ucsi_create(&pdev->dev, &ucsi_acpi_ops);
+	if (dmi_check_system(zenbook_dmi_id))
+		ops = &ucsi_zenbook_ops;
+
+	ua->ucsi = ucsi_create(&pdev->dev, ops);
 	if (IS_ERR(ua->ucsi))
 		return PTR_ERR(ua->ucsi);
 
-- 
2.39.2


--BzQSLw6XjpnQY6AO--
